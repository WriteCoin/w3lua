---@class handle
---@class agent:handle

local handles = {}

---@class Handle:ClassType
---@class obj_Handle:ObjectType
Handle = newClass() ---@type Handle

---@param handle handle
function Handle:new(handle)
    local object = Handle.old:new() ---@type obj_Handle

    object.handle = handle ---@type handle

    ---@return number
    function object.id()
        return GetHandleId(object.handle)
    end
    local handle = object.handle
    handles[handle] = handles[handle] and handles[handle] or object

    return object
end

---@param handle handle
---@return obj_Handle
function Handle.getObject(handle)
    local obj = handles[handle]
    if obj then
        return obj
    end
    return Handle.new(handle)
end