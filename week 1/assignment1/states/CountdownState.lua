--[[
    Countdown State
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Counts down visually on the screen (3,2,1) so that the player knows the
    game is about to begin. Transitions to the PlayState as soon as the
    countdown is complete.
]]

--[[
	TODO's
	TODO 1: code for random gap between the top and bottom pipe  in PipePair.lua (near 53)
	TODO 2: code for random distance between pipepair in PlayState.lua (near 55)
	TODO 3:	code for medal in score state in ScoreState.lua (near 46)
	TODO 4: code for pause the game in PauseState.lua
]]

CountdownState = Class{__includes = BaseState}

-- takes 1 second to count down each time
COUNTDOWN_TIME = 0.75

function CountdownState:init()
    self.count = 3
    self.timer = 0
end

--[[
    Keeps track of how much time has passed and decreases count if the
    timer has exceeded our countdown time. If we have gone down to 0,
    we should transition to our PlayState.
]]
function CountdownState:update(dt)
	--to make ground scroll	
	backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
	groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH
    
	self.timer = self.timer + dt

    -- loop timer back to 0 (plus however far past COUNTDOWN_TIME we've gone)
    -- and decrement the counter once we've gone past the countdown time
    if self.timer > COUNTDOWN_TIME then
        self.timer = self.timer % COUNTDOWN_TIME
        self.count = self.count - 1

        -- when 0 is reached, we should enter the PlayState
        if self.count == 0 then
            gStateMachine:change('play',
			{
			bird = Bird() ,
			pipePairs = {} ,
			timer = 0 ,
			score = 0	
			})
        end
    end
end

function CountdownState:render()
    -- render count big in the middle of the screen
    love.graphics.setFont(hugeFont)
    love.graphics.printf(tostring(self.count), 0, 120, VIRTUAL_WIDTH, 'center')
end