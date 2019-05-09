-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

if arg[#arg] == "-debug" then require("mobdebug").start() end




function love.load()
  event = require("event")

  event:new_event("test_event")

  matriache = {}
  function matriache:test_event(a,b,c)
    print("This is a test")
    print(a,b,c)
  end

  event:subscribe("test_event", matriache)
end


function love.update()


end


function love.draw()


end


function love.keypressed(key)
  if key =="space" then
    local a = 4
    local b = " I like potatoes"
    local c = " But I preferer, chocolate"
    event:publish("test_event",a,b,c)
    --event:unsubscribe("test", matriache)
  end

end
