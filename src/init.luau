local Signal = require(script.Parent.Signal)

local Sight = {} :: Sight
Sight.__index = Sight
-- // Constructor

export type Sight = {
    new: () -> typeof(setmetatable(Sight, {})),
    get: (self : Sight,any?) -> (any),
    set: (self : Sight, any) -> (),
    toggleInsert : (self : Sight, ...any) -> (),
    destroy: () -> (),
    onChanged :  Signal.ScriptSignal<any>
}

function Sight.new(... : any)
    local self = Sight 
    self._Value = ...
    self._Active = true
    self._PastValue = nil
    self.onChanged = Signal.new()
    return setmetatable(self, {})
end

-- // Methods

function Sight:_find(searchValue)
    local insertedIndex = table.find(self._Value,searchValue)

    local insertedValue = self._Value[insertedIndex]

    return insertedValue
end

function Sight:get(searchValue)
    if searchValue then
        return self:_find(searchValue)
    end
    return self._Value
end

function Sight:destroy()
    table.clear(self)
end

function Sight:set(newValue : any)
   
   if typeof(self._Value) == 'table' then
        warn('Set method only suport Strings, numbers and boolean, use toggleInsert instead')
        return
   end
   self._PastValue = self._Value
   self._Value = newValue
   self.onChanged:Fire(self._Value)
end

function Sight:toggleInsert(newValue)
    assert(typeof(self._Value) == 'table', 'Insert method only support tables')
    
    local index = table.find(self._Value,newValue)
    if index then table.remove(self._Value, index) end
    
    table.insert(self._Value,newValue)
    
    local insertedValue = self:_find(newValue)
    self.onChanged:Fire(insertedValue)
end

return Sight