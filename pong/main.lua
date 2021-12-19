--[[
    GD50 2018
    Pong Remake

    pong-0
    "The Day-0 Update"

    -- Main Program --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Originally programmed by Atari in 1972. Features two
    paddles, controlled by players, with the goal of getting
    the ball past your opponent's edge. First to 10 points wins.

    This version is built to more closely resemble the NES than
    the original Pong machines or the Atari 2600 in terms of
    resolution, though in widescreen (16:9) so it looks nicer on 
    modern systems.
]]

push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


--[[
    Runs when the game first starts up, only once; used to initialize the game.
]]
function love.load()


    love.graphics.setDefaultFilter('nearest','nearest')

    smallFont = love.graphics.newFont('font.ttf',8)

    love.graphics.setFont(smallFont)

    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)

    if key == 'escape' then
        love.event.quit()
    end
end



--[[
    Called after update by LÖVE2D, used to draw anything to the screen, updated or otherwise.
]]
function love.draw()

    push:apply('start')

    love.graphics.clear(40,45,52,255)

    love.graphics.printf('Hello Pong!',0,20,VIRTUAL_WIDTH,'center')

    love.graphics.rectangle('fill',10,30,5,20)

    love.graphics.rectangle('fill',VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)

    love.graphics.rectangle('fill',VIRTUAL_WIDTH/2-2,VIRTUAL_HEIGHT/2-2,4,4)

    push:apply('end')
end
