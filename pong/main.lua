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

PADDLE_SPEED = 200


--[[
    Runs when the game first starts up, only once; used to initialize the game.
]]
function love.load()

    love.graphics.setDefaultFilter('nearest','nearest')
    

    smallFont = love.graphics.newFont('font.ttf',8)

    scoreFont = love.graphics.newFont('font.ttf',32)

    love.graphics.setFont(smallFont)

    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })


    player1Score = 0
    player2Score = 0

    player1Y = 30
    player2Y = VIRTUAL_HEIGHT - 50

end

function love.update(dt)

    if love.keyboard.isDown('w') then
        player1Y = player1Y + -PADDLE_SPEED * dt

    elseif love.keyboard.isDown('s') then
            player1Y = player1Y + PADDLE_SPEED * dt
    end
    
    if love.keyboard.isDown('up') then

        player2Y = player2Y + -PADDLE_SPEED * dt

    elseif love.keyboard.isDown('down')then
            player2Y = player2Y + PADDLE_SPEED * dt
    end
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

    love.graphics.setFont(smallFont)
    love.graphics.printf('Hello Pong!',0,20,VIRTUAL_WIDTH,'center')

    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH/2-50,VIRTUAL_HEIGHT/3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH/2+30,VIRTUAL_HEIGHT/3)

    love.graphics.rectangle('fill',10,player1Y,5,20)

    love.graphics.rectangle('fill',VIRTUAL_WIDTH - 10, player2Y, 5, 20)

    love.graphics.rectangle('fill',VIRTUAL_WIDTH/2-2,VIRTUAL_HEIGHT/2-2,4,4)

    push:apply('end')
end
