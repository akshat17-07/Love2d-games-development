--[[
    TitleScreenState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The TitleScreenState is the starting screen of the game, shown on startup. It should
    display "Press Enter" and also our highest score.
]]

--[[
	TODO's
	TODO 1: code for random gap between the top and bottom pipe  in PipePair.lua (near 53)
	TODO 2: code for random distance between pipepair in PlayState.lua (near 55)
	TODO 3:	code for medal in score state in ScoreState.lua (near 46)
	TODO 4: code for pause the game in PauseState.lua
]]

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)
	--to make ground scroll	
	backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
	groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH
    
    -- transition to countdown when enter/return are pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    -- simple UI code
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Fifty Bird', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter', 0, 100, VIRTUAL_WIDTH, 'center')
end