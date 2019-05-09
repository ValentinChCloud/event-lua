


local event = {}
event.handler = {}


--- Clear the list of subscriber for an event.
-- @param event_name string, name of the event, or how you want to call it
-- @return false if the handler for the event doesn't exist
-- @return true sucess

-- TODO : What I should do with the listener? Should they know?
function event:clear(event_name)
  assert(type(type_event) == "string","The event name must be a string "..type(event_name))
  
  if self.handler[event_name] == nil then
    print("WARNING, there is not handler of the event",event_name,"to clear")
    return false
  end
  
  self.handler[event_name] = nil
  return true
end



--- Create the new, event. Init the table for the correct handler
-- @param event_name string, name of the event, or how you want to call it
-- @return true
function event:new_event(event_name)
  assert(type(type_event) == "string","The event name must be a string "..type(event_name))
  if self.handler[event_name] == nil then
    self.handler[event_name] = {}
    return true
  end
  print("You're are creating the event", event_name)
  return true
end


--- Publish an event, and call all the object subcribed to it
--- To be more simple, the function call by the event, must have the same name
-- @param event_name string, name of the event
-- @return true
function event:publish(event_name, ...)
  -- If the event list doesn't exists
  if self.handler[type_event] == nil then
    self:new_event(type_event)
    return true
  end
  
  for i=1, #self.handler[event_name] do
    -- I don't know if it's good idea. In this format your functions must be call with "self:"
    self.handler[event_name][i][event_name](self,...)
  end
  return true
end

--- Remove an event
-- @param event_name string, name of the event, or how you want to call it
-- @return true
function event:remove_event(event_name)
  self.handler[event_name] = nil
  return true
end


--- Subscribe to the channel nammed by the event. If the channel doesn't exist yet, it's created.
-- @param event_name string, name of the event
-- @param object table, the object to be called, it must posses a function with the same name of the event
-- @return true
function event:subscribe(event_name, object )
  assert(type(object) == "table")
  assert(object[event_name]," Your object must have a function called "..event_name
  if self.handler[event_name] == nil then
    self:new_event(event_name)
  end
  table.insert(self.handler[event_name], object)
  return true
end

--- Unsubscribe to the channel nammed by the event. If the channel doesn't exist, raise a log.
-- @param event_name string, name of the event
-- @param object table, the object to be called, it must posses a function with the same name of the event
-- @return false if the handler of the event doesn't exists, or if you are already not subscribe
-- @return true 
function event:unsubscribe(event_name, object)
  if self.handler[event_name] == nil then
    print("WARNING, unscribe an event, that doesn't exist")
    return false
  end

  for i=1, #self.handler[event_name] do
    if self.handler[event_name][i] == object then
      print("OBJECT REMOVED")
      table.remove(self.handler[event_name], i)
      return true
    end
  end
  print ("WARNING, you are trying to unsubscribe to a list, you'are not subcribed"
  return false
end 

return event