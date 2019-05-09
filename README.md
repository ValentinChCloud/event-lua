


Litle lib, to handle event in lua. 


# HOW TO USE

event = require("event")

-- Declare an event. This is not mandatory, because when an object whil subscribe to an event channel
-- the channel event wil be created
event:new_event("test_event")



-- Declare what ever you want. Your object must be a function with the same name of the event

matriache = {}
  function matriache:test_event(a, b, c)
    print("This is a test")
    print(a,b,c)
  end

-- Subscribe to the channel
event:subscribe("test_event", matriache)

-- Publish an event
local a = 4
local b = " I like potatoes"
local c = " But I preferer, chocolate"
event:publish("test_event",a,b,c)


-- Result
-- This is a test
-- 4	 I like potatoes	 But I preferer, chocolate


