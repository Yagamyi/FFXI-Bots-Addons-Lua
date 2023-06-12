_addon.name     = "interactbruh"
_addon.author   = "Elidyr"
_addon.version  = "0.20200504"
_addon.command  = "ibruh"

-- Put your accounts here.
local accounts
local res      = require("resources")
local files    = require("files")
local packets  = require("packets")
                 require("chat")
                 require("logger")
                 require("pack")
                 require("lists")
                 require("tables")
                
local poke = function(target)
    local target = target or false
    
    if target then
        local inject = ("iIHHHHfff"):pack(0x01a, target.id, target.index, 0, 0, 0, 0, 0, 0)
        windower.packets.inject_outgoing(0x01a, inject)        
    end

end

local deliver = function(target)
    local player = windower.ffxi.get_player()
    local accounts = accounts or false
    local target = target or false
    
    if accounts and target and #accounts > 0 then
        local delivery = ""
        local delay    = 0.1
        
        for i,v in ipairs(accounts) do
            
            if i == 1 and v ~= player.name then
                delivery = (delivery .. string.format("interact %s %s %s", target.id, v, delay))
                delay = delay + 0.5
                
            elseif v ~= player.name then
                delivery = (delivery .. string.format("|interact %s %s %s", target.id, v, delay))
                delay = delay + 0.5
                
            end
        
        end
        return delivery
        
    end
    return false
    
end

windower.register_event("ipc message", function(message)
    local message = message or false
    local player  = windower.ffxi.get_player()
    
    if message then
        local orders = message:split("|")
        local index  = false
        
        for i,v in ipairs(orders) do
            
            if v:match(player.name) then
                orders = v:split(" ")
                break
            end
            
        end
        
        if orders and orders[1] and orders[2] and orders[3] and orders[4] then
            local target = windower.ffxi.get_mob_by_id(orders[2]) or false
            
            if player and target and player.name == orders[3] and target.distance:sqrt() < 6 then
                windower.send_command(string.format("wait %s; ibruh interact %s", orders[4], orders[2]))
            end
            
        end
        
    end
    
end)

windower.register_event("addon command", function(...)
        
    local a = T{...}
    local c = a[1]:lower() or false
    
    if c == "bigpoke" then
        local target = windower.ffxi.get_mob_by_target("t") or false
        
        if target and target.distance:sqrt() < 6 then
            poke(target)
            windower.send_ipc_message(deliver(target))
            
        end
        
    elseif c == "interact" then
        local id = a[2] or false
        
        if id then
            local target = windower.ffxi.get_mob_by_id(id) or false

            if target and target.distance:sqrt() < 6 then
                poke(target)
            
            end
        
        end
    
    elseif (c == "reload" or c == "r") then
        windower.send_command("lua r interactbruh")
    
    end
    
end)

windower.register_event("login", function(name)
    local f = files.new("accounts.lua")
    local found = false
    
    if not f:exists() then
        f:write("return " .. T({}):tovstring())
        accounts = require("accounts")
    
    elseif f:exists() then
        accounts = require("accounts")
    
    end

    for i,v in ipairs(accounts) do
        
        if v == name then
            found = true
        end
        
    end
    
    if found == false then
        table.insert(accounts, name)
        f:write("return " .. T(accounts):tovstring())
    end
    
end)

windower.register_event("load", function()
    local f = files.new("accounts.lua")
    local found = false
    
    if windower.ffxi.get_player() then
        local player = windower.ffxi.get_player()
        
        if not f:exists() then
            f:write("return " .. T({}):tovstring())
            accounts = require("accounts")
        
        elseif f:exists() then
            accounts = require("accounts")
        
        end
    
        for i,v in ipairs(accounts) do
            
            if v == player.name then
                found = true
            end
            
        end
        
        if found == false then
            table.insert(accounts, player.name)
            f:write("return " .. T(accounts):tovstring())
        end
        
    end
    
end)