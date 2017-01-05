local composer = require( "composer" )

local scene = composer.newScene()

local widget = require "widget"
widget.setTheme("widget_theme_ios7")

local physics = require "physics"
physics.start()
physics.setGravity(0,0)


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- local forward references should go here

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local function goto_planet(event)
    if(event.phase == "ended") then 
        composer.gotoScene("scene_planet", "slideLeft")
    end
    return true
end

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

display.setDefault( "isAnchorClamped", false )
 
sun1 = display.newImageRect(sceneGroup, "images/sun1.png", 100, 100)
sun1.x =  display.contentCenterX ; sun1.y = display.contentCenterY;

local circle = display.newCircle (sceneGroup, 100,100,200)
circle:setFillColor(0,0,0,0) --This will set the fill color to transparent
circle.strokeWidth = 3 --This is the width of the outline of the circle
circle.x = display.contentCenterX; circle.y = display.contentCenterY
circle:setStrokeColor(1,1,1) --This is the color of the outline

local solar_ring1 = display.newImageRect(sceneGroup, "images/solar_ring.png", 350, 350)
solar_ring1.x = display.contentCenterX; solar_ring1.y = display.contentCenterY

local solar_ring2 = display.newImageRect(sceneGroup, "images/solar_ring.png", 200, 200)
solar_ring2.x = display.contentCenterX; solar_ring2.y = display.contentCenterY

local solar_ring3 = display.newImageRect(sceneGroup, "images/solar_ring.png", 500, 500)
solar_ring3.x = display.contentCenterX; solar_ring3.y = display.contentCenterY

--local planet_3_ss = display.newImage(sceneGroup, "images/planet_3_ss.png" )
--planet_3_ss.x = display.contentCenterX; planet_3_ss.y = display.contentCenterY
--planet_3_ss.anchorX = -6.0

--transition.to( planet_3_ss, { time=70000, rotation=-360, iterations=0 } ) 





planets_ss = {planet_1_ss, planet_2_ss, planet_3_ss}

    planets_ss[1] = widget.newButton {  
        defaultFile = "images/planet_1_ss.png",
    }
    sceneGroup:insert(planets_ss[1])
    planets_ss[1].anchorX = -4.0
    planets_ss[1].x = display.contentCenterX; planets_ss[1].y = display.contentCenterY
    transition.to( planets_ss[1], { time=45000, rotation=-360, iterations=0 } ) 
    planets_ss[1]:addEventListener("touch", goto_planet)
    planets_ss[1]:addEventListener("touch", display_planet)

    planets_ss[2] = widget.newButton {
        defaultFile = "images/planet_2_ss.png",
    }
    sceneGroup:insert(planets_ss[2])
    planets_ss[2].anchorX = -2.0
    planets_ss[2].x = display.contentCenterX; planets_ss[2].y = display.contentCenterY
    transition.to( planets_ss[2], { time=30000, rotation=-360, iterations=0 } ) 
    planets_ss[2]:addEventListener("touch", goto_planet)
    planets_ss[2]:addEventListener("touch", display_planet)

    planets_ss[3] = widget.newButton {
        defaultFile = "images/planet_3_ss.png",
    }
    sceneGroup:insert(planets_ss[3])
    planets_ss[3].anchorX = -6.0
    planets_ss[3].x = display.contentCenterX; planets_ss[3].y = display.contentCenterY
    transition.to( planets_ss[3], { time=60000, rotation=-360, iterations=0 } ) 
    planets_ss[3]:addEventListener("touch", goto_planet)
    planets_ss[3]:addEventListener("touch", display_planet)




    -- Background Transition

    display.setDefault("textureWrapX", "mirroredRepeat")

    local background = display.newRect(display.contentCenterX, display.contentCenterY, 2220, 1380)
    background.fill = {type = "image", filename = "images/background.png" }
    background:toBack()

    local function animateBackground()
    transition.to( background.fill, { time=60000, x=1, delta=true, onComplete=animateBackground } )
    end

    animateBackground()

end

    -- Function of Buttons 


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
