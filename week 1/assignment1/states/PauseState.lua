PauseState = Class {__includes = BaseState}

--[[
	TODO's
	TODO 1: code for random gap between the top and bottom pipe  in PipePair.lua (near 53)
	TODO 2: code for random distance between pipepair in PlayState.lua (near 55)
	TODO 3:	code for medal in score state in ScoreState.lua (near 46)
	TODO 4: code for pause the game in PauseState.lua
]]

function PauseState:enter(params)
	--taking all values from play state and saving them 
	self.bird = params.bird or Bird()
    self.pipePairs = params.pipePairs or {}
    self.timer = params.timer or 0
    self.score = params.score or 0
	sounds['pause']:play()
end

function PauseState:exit()
	sounds['pause']:play()
end

function PauseState:render()
	--rendering the pipes
    for k, pair in pairs(self.pipePairs) do
        pair:render()
    end
	
	--rendering the score
    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)
	
	--rendering the bird 
    self.bird:render()
	
	-- p in the middle
	love.graphics.setFont(flappyFont)
	love.graphics.print ('P',VIRTUAL_WIDTH/2 - 25, VIRTUAL_HEIGHT/2 - 25)
end

function PauseState:update(dt)
	--checking if user want to resume
	if love.keyboard.wasPressed('p') or love.keyboard.wasPressed('P') then
        gStateMachine:change('play',
		{
		bird = self.bird,
        pipePairs = self.pipePairs,
		timer = self.timer,
		score = self.score		
		})
	end
end