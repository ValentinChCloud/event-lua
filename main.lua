-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

if arg[#arg] == "-debug" then require("mobdebug").start() end




function love.load()
  event = require("event")
  
  event:new_event("test")
  event:new_event("test")
  
  matriache = {}
  function matriache:test()
    print("test")
  end
  
  event:subscribe("test", matriache)
end


function love.update()
  
  
end


function love.draw()
  
  
end


function love.keypressed(key)
    if key =="space" then
      event:publish("test")
      event:unsubscribe("test", matriache)
    end
  
end
