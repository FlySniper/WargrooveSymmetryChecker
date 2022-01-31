local Events = require "wargroove/events"
local Wargroove = require "wargroove/wargroove"

local Triggers = {}

function Triggers.getSymmetryTrigger(referenceTrigger)
    local trigger = {}
    trigger.id =  "Symmetry Check"
    trigger.recurring = "once"
    trigger.players = referenceTrigger.players
    trigger.conditions = {}
    trigger.actions = {}

    table.insert(trigger.conditions, { id = "start_of_turn", parameters = { } })
    table.insert(trigger.actions, { id = "symmetry_check", parameters = { "current" }  })
    
    return trigger
end

return Triggers