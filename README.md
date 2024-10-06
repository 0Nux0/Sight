# Download

You can simply install it on wally `sight = "0nux0/sight@0.1.5"`

Or by rbxm https://github.com/0Nux0/Sight/blob/main/Sight.rbxm

# Documentation
The `Sight` Library allows for value abstraction with signaling capabilities. It includes methods to create, get, set, and destroy the value.


TL;DR: Usage Summary
```
sight.new(arg) -> sight
sight:get() -> ...any
sight:set(newValue) -> void
```

## Methods
### Constructor

- `Sight.new(...: any)`
 Creates a new Sight instance.
    - Parameters: Initial value(s)
    Returns: Sight instance

### Get

- `Sight:get()`

  - Retrieves the current value.
    Returns: The current value

### Set

 - `Sight:set(newValue: any)`

    - Description: Sets a new value and fires the _OnChanged signal.

    - Parameters: newValue (note: table type is not supported)

    - Returns: void



### Destroy

- `Sight:destroy()`
    - Description: Clears all properties.
    - Returns: void



```lua
local Sight = require(game.ReplicatedStorage.Packages.sight)

local mySight = Sight.new("InitialValue")

print(mySight:get()) -- Output: "InitialValue"

mySight:set("NewValue")
print(mySight:get()) -- Output: "NewValue"

mySight:destroy()
```

