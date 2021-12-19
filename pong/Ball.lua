Ball = Class{}

function Ball:init(x,y,width,height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.dy = math.random(2) == 1 and -100 or 100
    self.dx = math.random(-1250,1250)
end

function Ball:collides(paddle)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - 2
    self.y = VIRTUAL_HEIGHT / 2 - 2
    self.dy = math.random(2) == 1 and - 100 or 100
    self.dx = math.random(-1250,1250)
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Ball:render()
    love.graphics.rectangle('fill',self.x,self.y,self.width,self.height)
end