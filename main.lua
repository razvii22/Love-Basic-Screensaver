

function love.load()
  rect = {}
  rect.x = 0
  rect.y = 0
  rect.width = 100
  rect.height = 100
  rect.velx = 1
  rect.vely = 1
  rect.w1 = false
  rect.w2 = false
  rect.color = {}
  rect.color.red = 0
  rect.color.green = 0
  rect.color.blue = 0
  love.window.setFullscreen(true)
  corner  = false
end

function love.update(dt)
  rect.w1 = false
  rect.w2 = false

  if love.keyboard.isDown('escape') then
    love.event.quit()
  end

  rect.x = rect.x + rect.velx
  rect.y = rect.y + rect.vely

  if rect.x + rect.width >= love.graphics.getWidth() then
    rect.x = love.graphics.getWidth() - rect.width
    rect.velx = -rect.velx
    rect.w1 = true
    rect.color.red = math.random(0,1)
    rect.color.green = math.random(0,1)
    rect.color.blue = math.random(0,1)
  elseif rect.x <= 0 then
    rect.velx = -rect.velx
    rect.w1 = true
    rect.color.red = math.random(0,1)
    rect.color.green = math.random(0,1)
    rect.color.blue = math.random(0,1)
  end
  if rect.y + rect.height >= love.graphics.getHeight() then
    rect.y = love.graphics.getHeight() - rect.height
    rect.vely = -rect.vely
    rect.w2 = true
    rect.color.red = math.random(0,1)
    rect.color.green = math.random(0,1)
    rect.color.blue = math.random(0,1)
  elseif rect.y <= 0 then
    rect.vely = -rect.vely
    rect.w2 = true
    rect.color.red = math.random(0,1)
    rect.color.green = math.floor(math.random(0,1))
    rect.color.blue = math.random(0,1)
  end
  if rect.w1 and rect.w2 then
     corner = true
   else
     corner = false
   end
   if corner then
     love.system.openURL("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
   end
   if rect.color.blue == 0 and rect.color.green == 0 and rect.color.red == 0 then
     rect.color.red = 1
   elseif rect.color.blue == 1 and rect.color.green == 1 and rect.color.red == 1 then
     rect.color.blue = 0
   end

end

function love.draw()
  love.graphics.setColor(rect.color.red,rect.color.green,rect.color.blue,1)
  love.graphics.print(rect.color.red,1)
  love.graphics.print(rect.color.green,10)
  love.graphics.print(rect.color.blue,20)
  love.graphics.rectangle("fill", rect.x,rect.y, rect.width, rect.height)
  love.graphics.print("Wait until it hits the corner :)",love.graphics.getWidth()/2-string.len("Wait until it hits the corner :)"))

end
