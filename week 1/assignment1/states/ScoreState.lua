--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]

--[[
	TODO's
	TODO 1: code for random gap between the top and bottom pipe  in PipePair.lua (near 53)
	TODO 2: code for random distance between pipepair in PlayState.lua (near 55)
	TODO 3:	code for medal in score state in ScoreState.lua (near 46)
	TODO 4: code for pause the game in PauseState.lua
]]

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
	--to make ground scroll	
	backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
	groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH
    
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
	if self.score > 9 then
		love.graphics.draw(gold, 250, 115)
	
	else if self.score > 4 then
		love.graphics.draw(silver, 250, 115)
	
	
	else if self.score > 2 then
		love.graphics.draw(bronze, 250 , 115)
	end
	end
	end
		
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end