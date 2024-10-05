local Signal = require(script.Parent.Signal)

local Sight = {} :: Sight
Sight.__index = Sight
-- // Constructor

export type Sight = {
    new: () -> typeof(setmetatable(Sight, {})),
    get: (self : Sight) -> (...any),
    set: (self : Sight, ...any) -> (),
    destroy: () -> (),
    _OnChanged :  Signal.ScriptSignal<any>
}

function Sight.new(... : any)
    local self = Sight 
    self._Value = ...
    self._Active = true
    self._PastValue = nil
    self._OnChanged = Signal.new()
    return setmetatable(self, {})
end

-- // Methods

function Sight:_IsActive()
    if not self._Active then
		warn("The value you tried to abstract does not exist or has been deleted")
		return false
	end
    return true
end

function Sight:get()
	self:_IsActive()
    return self._Value
end

function Sight:destroy()
    table.clear(self)
end

function Sight:set(newValue : any)
   self:_IsActive()

   assert(newValue ~= table, 'Table type is not suported')
   
   self._PastValue = self._Value
   self._Value = newValue
   self._OnChanged:Fire(self._Value)
end

return Sight