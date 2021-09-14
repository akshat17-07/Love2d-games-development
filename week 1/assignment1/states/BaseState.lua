--[[
    BaseState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Used as the base class for all of our states, so we don't have to
    define empty methods in each of them. StateMachine requires each
    State have a set of four "interface" methods that it can reliably call,
    so by inheriting from this base state, our State classes will all have
    at least empty versions of these methods even if we don't define them
    ourselves in the actual classes.
]]

--[[
	TODO's
	TODO 1: code for random gap between the top and bottom pipe  in PipePair.lua (near 53)
	TODO 2: code for random distance between pipepair in PlayState.lua (near 55)
	TODO 3:	code for medal in score state in ScoreState.lua (near 46)
	TODO 4: code for pause the game in PauseState.lua
]]

BaseState = Class{}

function BaseState:init() end
function BaseState:enter() end
function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end