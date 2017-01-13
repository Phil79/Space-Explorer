--scene_solarsystem.lua
local planet = require("planet_class")
local star = require("star_class")
local data = require("data_storage")
local galaxy_class = require("galaxy_class")
local composer = require( "composer" )

local scene = composer.newScene()



local widget = require ("widget")
widget.setTheme("widget_theme_ios7")
local physics = require ("physics")
physics.start()
physics.setGravity(0,0)



-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- local forward references should go here

local universes = data.universe
local solar_sys = data.solar_sys
local stars = data.stars
local planets = data.planets
local galaxies = data.galaxy
local params = data.params





--initialize ID local references


local star_ID = {}
--local rings = {}
local star_ss = {}


 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


function goto_solarsystem(event)
    params.sys_ID = event.target.param
    params.star_ID = event.target.param
    --update params table
   
    if(event.phase == "ended") then 
        composer.removeHidden()
        composer.gotoScene("scene_solarsystem", "fade")
    end

    return true
end



--DEFINE LOCAL REFERENCED TO DISPLAY OBJECTS
local background
local sun
local circle
local solar_ring
local button_left
local galaxy

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- view here runs when the scene is first created but has not yet appeared on screen

   
    
  

    display.setDefault( "isAnchorClamped", false )
    
    --Display the Appropriate star image/button
    
    -- sun = display.newImageRect(sceneGroup,data.stars[params.star_ID]:get_image(), 100, 100)
    -- sun.x =  display.contentCenterX ; sun.y = display.contentCenterY;

    circle = display.newCircle (sceneGroup, 100,100,300)
    circle:setFillColor(0,0,0,0) --This will set the fill color to transparent
    circle.strokeWidth = 3 --This is the width of the outline of the circle
    circle.x = display.contentCenterX; circle.y = display.contentCenterY
    circle:setStrokeColor(1,1,1) --This is the color of the outline




    --assign the max value off for loop to be the total number of planets in the current solar system
    local max = 0

    local ring_x = 200
    local ring_y = 200
    local anchor = -4.0
    local distance_x = 50
    local distance_y = 50
    local count = 1
    
    

    --returns integer representing starting index of corresponding systems to current galaxy
    max = data.galaxy[params.gal_ID]:get_snum()
    local start = data.galaxy[params.gal_ID]:get_start()
    local stop = start + max - 1

    --for each star/system in the current galaxy: create a ring, and a corresponding revolving star image/button
    for i = start,stop do
     

        star_ID[count] = i

        -- --create rings
        -- rings[count] = display.newImageRect(sceneGroup, "Images/solar_ring.png", ring_x, ring_y)
        -- solar_ring = rings[count]
        -- solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        -- solar_ring.x = display.contentCenterX; solar_ring.y = display.contentCenterY
        


        --create  star images
        star_ss[count] = widget.newButton{
            defaultFile = data.stars[i]:get_ssimage()
        }

        sceneGroup:insert(star_ss[count])
        star_ss[count].anchorX = anchor

        --these conditional statements used to limit range of speed of planet revolution
        if anchor >= -2.0 then
            anchor = -6.0

        else
            anchor = anchor + 1
        end

        --display revolving planet images, on the event that a planet button is touched, 
        --call the appropriate planet even handler

        --local radius = ring_x/2
        --create_rotation(planet_ss[count], radius,display.contentCenterX, display.contentCenterY)
        star_ss[count].x = display.contentCenterX + distance_x; star_ss[count].y = display.contentCenterY + distance_y
        --create_rotation(planet_ss[count], radius,display.contentCenterX, display.contentCenterY)
        transition.to( star_ss[count], { time=40000, rotation=-360, iterations=0 } ) 

            
        star_ss[count]:addEventListener("touch", goto_solarsystem)
        star_ss[count].param = i 
        --print(planet_ss[count].param, "\n")

        --INCREMENT NECESSARY VALUES 
        -- ring_x = ring_x + 100
        -- ring_y = ring_x
        distance_x = distance_x + 30
        distance_y = distance_y + 30
        count = count + 1
       
        
    end 



    -- Background Transition

    display.setDefault("textureWrapX", "mirroredRepeat")

    -- background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, 2220, 1380)
    -- background.fill = {type = "image", filename = data.galaxy[params.gal_ID]:get_image()}
    new_gal = display.newImageRect(sceneGroup, data.galaxy[params.gal_ID]:get_image() , 1068, 663)
    new_gal.x = display.contentCenterX; new_gal.y = display.contentCenterY
    new_gal:toBack()

    background = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, 2220, 1380)
    background.fill = {type = "image", filename = "Images/background.png" }
    background:toBack()

    local function animateBackground()
    transition.to( background.fill, { time=60000, x=1, delta=true, onComplete=animateBackground } )
    end

    animateBackground()

    

end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        transition.cancel()
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
