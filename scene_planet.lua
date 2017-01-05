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

local function goto_solarsystem(event)
    if(event.phase == "ended") then 
        composer.gotoScene("scene_solarsystem", "slideLeft")
    end
    return true
end


-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen




    local gameBar = display.newImage("images/game_bar.png")
    gameBar.x = 320; gameBar.y =70;

    --user.gold = display.newText( ""..user.gold, 10, 10, _FONT, 40)
    --user.gold:setFillColor(1, 1, 1 )
    --user.gold.x = 260; user.gold.y = 35;

    gold_logo = display.newImageRect( "images/gold_logo.png", 30, 30)
    gold_logo.x = 320; gold_logo.y = 35;

    gold = 0 
    goldText = display.newText(gold, 260, 35, "Helvetica")

    

    user.resource = display.newText( ""..user.resource, 10, 10, _FONT, 40)
    user.resource:setFillColor(1, 1, 1)
    user.resource.x = 492; user.resource.y = 35

    resources_logo = display.newImageRect( "images/resources_logo.png", 30, 30)
    resources_logo.x = 550; resources_logo.y = 35

   -- user.people = display.newText(""..user.people, 10, 10, _FONT, 40)
    --user.people:setFillColor(1, 1, 1)
    --user.people.x = 260; user.people.y = 105

    person_logo = display.newImageRect( "images/person_logo.png", 30, 30)
    person_logo.x = 320; person_logo.y = 105

    user.energy = display.newText( ""..user.energy, 10, 10, _FONT, 40)
    user.energy:setFillColor(1, 1, 1)
    user.energy.x = 492; user.energy.y = 105

    energy_logo = display.newImageRect("images/energy_logo.png", 30, 30)
    energy_logo.x = 550; energy_logo.y = 105;

    warningMessage = display.newText("Not Enough Gold", 0, 0, _FONT, 52)
    warningMessage.x = 300; warningMessage.y = 500;
    warningMessage.alpha = 0



    -- BUTTONS

    planet_1 = widget.newButton{
    width = 900,
    height = 1300,
    defaultFile = "images/planet_1.png",
    onEvent = onGoldTouch
    }
    planet_1.x = 330; planet_1.y = 600
    sceneGroup:insert(planet_1)

    local function onSexyTouch( event )
        if(event.phase == "ended") then 
        display.remove(action_box)
        display.remove(explorer_icon)
        display.remove(sexy_x)
        display.remove(btn_build)
        display.remove(btn_travel)
        display.remove(btn_minus_explorer)
        display.remove(btn_plus_explorer)
        display.remove(go_box)
        display.remove(transfer_box)
        display.remove(currentVillagers)
        display.remove(receive_box)
        display.remove(scrollView)
        end
    end

    local function build_Box( event )
        if(event.phase == "ended") then
        --destroy images
        display.remove(btn_build)
        display.remove(btn_minus_explorer)
        display.remove(btn_plus_explorer)
        display.remove(btn_travel)
        display.remove(explorer_icon)
        display.remove(transfer_box)
        display.remove(go_box)
        display.remove(currentVillagers)
        display.remove(receive_box)
        display.remove(sexy_x)
        

        end
    end

    function openAction_Box( event )
    action_box = display.newImage(sceneGroup, "images/action_box.png")
    action_box.x = display.contentCenterX; action_box.y = display.contentCenterY

        --display scroll view
        local widget = require( "widget" )

    -- ScrollView listener

    local function scrollListener( event )

    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then print( "Reached bottom limit" )
        elseif ( event.direction == "down" ) then print( "Reached top limit" )
        elseif ( event.direction == "left" ) then print( "Reached right limit" )
        elseif ( event.direction == "right" ) then print( "Reached left limit" )
        end
    end

    return true
    end

    -- Create the widget
    scrollView = widget.newScrollView(
        {
            top = 215,
            left = 65,
            width = 515,
            height = 390,
            backgroundColor = { 0.56, 0.56, 0.56 },
            scrollWidth = 0,
            scrollHeight = 800,
            listener = scrollListener
        }
    )
    sceneGroup:insert(scrollView)

    -- Create a image and insert it into the scroll view
    
    explorer_icon = display.newImageRect(sceneGroup, "images/explorer_ico.png", 160, 160)
    explorer_icon.x = display.contentCenterX - 185; explorer_icon.y = display.contentCenterY + 45
    scrollView:insert(explorer_icon)

    transfer_box = display.newImage(sceneGroup, "images/variable_holder.png")
    transfer_box.x = display.contentCenterX - 90; transfer_box.y = display.contentCenterY + 50
    scrollView:insert(transfer_box)

    currentVillagers = display.newText(sceneGroup, "15", 0, 0, "SF Automaton", 40)
    currentVillagers.x = display.contentCenterX - 90; currentVillagers.y = display.contentCenterY + 50
    currentVillagers:setFillColor(0, 0, 0)
    scrollView:insert(currentVillagers)

    receive_box = display.newImage(sceneGroup, "images/variable_holder.png")
    receive_box.x = display.contentCenterX + 100; receive_box.y = display.contentCenterY + 50
    scrollView:insert(receive_box)

    go_box = display.newImage(sceneGroup, "images/transfer_villagers.png")
    go_box.x = display.contentCenterX + 190; go_box.y = display.contentCenterY + 50
    scrollView:insert(go_box)

    sexy_x = widget.newButton{
    defaultFile = "images/sexy_x.png",
    overFile = "images/sexy_x_overfile.png",
    onEvent = onSexyTouch
    }
    sexy_x.x = display.contentCenterX + 235; sexy_x.y = display.contentCenterY - 240
    sceneGroup:insert(sexy_x)
    scrollView:insert(sexy_x)   

    btn_minus_explorer = widget.newButton{
    defaultFile = "images/btn_minus.png",
    overFile = "images/btn_minus_overfile.png",
    onEvent = onSexyTouch
    }
    btn_minus_explorer.x = display.contentCenterX + 5; btn_minus_explorer.y = display.contentCenterY + 80
    sceneGroup:insert(btn_minus_explorer)
    btn_minus_explorer.width = 78; 
    btn_minus_explorer.height = 42
    scrollView:insert(btn_minus_explorer)


    btn_plus_explorer = widget.newButton{
    defaultFile = "images/btn_plus.png",
    overFile = "images/btn_plus_overfile.png",
    onEvent = onSexyTouch
    }
    btn_plus_explorer.x = display.contentCenterX + 5; btn_plus_explorer.y = display.contentCenterY + 20 
    sceneGroup:insert(btn_plus_explorer)
    btn_plus_explorer.width = 78; 
    btn_plus_explorer.height = 42
    scrollView:insert(btn_plus_explorer)


    btn_travel = widget.newButton{
    defaultFile = "images/btn_travel.png",
    overFile = "images/btn_travel_overfile.png",
    onEvent = onSexyTouch
    }
    btn_travel.x = display.contentCenterX + 100; btn_travel.y = display.contentCenterY - 50
    sceneGroup:insert(btn_travel)
    scrollView:insert(btn_travel)


    btn_build = widget.newButton{
    defaultFile = "images/btn_build.png",
    overFile = "images/btn_build_overfile.png",
    onEvent = build_Box
    }
    btn_build.x = display.contentCenterX + 100; btn_build.y = display.contentCenterY - 150
    sceneGroup:insert(btn_build)
    scrollView:insert(btn_build)

    

    end
 
    area_circle = display.newImageRect(sceneGroup, "images/area_circle.png", 100, 100 )
    area_circle.x = 300; area_circle.y = 500
    transition.to( area_circle, { rotation=-365, time=5000, iterations =0 } )
 
    area_circle:addEventListener ( "tap", openAction_Box )


    -- Navigation Buttons

    right_arrow = widget.newButton{
    width = 100,
    height = 100,
    defaultFile = "images/right_arrow.png",
    overFile = "images/right_arrow_overfile.png",
    onEvent = onRightArrowTouch
    }
    right_arrow.x = 570; right_arrow.y = 1050;
    sceneGroup:insert(right_arrow)

    left_arrow = widget.newButton{
    width = 100,
    height = 100,
    defaultFile = "images/left_arrow.png",
    overFile = "images/left_arrow_overfile.png",
    onEvent = goto_solarsystem
    }
    left_arrow.x = 80; left_arrow.y = 1050;
    sceneGroup:insert(left_arrow)





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
