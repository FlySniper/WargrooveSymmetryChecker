local Events = require "initialized/events"
local Wargroove = require "wargroove/wargroove"
local Symmetry = require "symmetry/symmetry"

local Actions = {}

function Actions.init()
  Events.addToActionsList(Actions)
end

function Actions.populate(dst)
    dst["symmetry_check"] = Actions.symmetryCheck
end

function Actions.symmetryCheck(context)
    local mapSize = Wargroove.getMapSize()
    local verticalErrors = {}
    local verticalErrorCount = 0
    local horizontalErrors = {}
    local horizontalErrorCount = 0
    local rotationalErrors = {}
    local rotationalErrorCount = 0

    for x=0, mapSize.x - 1 do
        for y=0, mapSize.y - 1 do
            local pos = {x = x, y = y}
            if not Symmetry.checkVertical(pos, mapSize) then
                table.insert(verticalErrors, pos)
                verticalErrorCount = verticalErrorCount + 1
            end
            if not Symmetry.checkHorizontal(pos, mapSize) then
                table.insert(horizontalErrors, pos)
                horizontalErrorCount = horizontalErrorCount + 1
            end
            if not Symmetry.checkRotational(pos, mapSize) then
                table.insert(rotationalErrors, pos)
                rotationalErrorCount = rotationalErrorCount + 1
            end
        end
    end
    local symmetryUsed = verticalErrors
    local symmetryCountUsed = verticalErrorCount
    if symmetryCountUsed > horizontalErrorCount then
        symmetryUsed = horizontalErrors
        symmetryCountUsed = horizontalErrorCount
    end
    if symmetryCountUsed > rotationalErrorCount then
        symmetryUsed = rotationalErrors
        symmetryCountUsed = rotationalErrorCount
    end
    for i,pos in ipairs(symmetryUsed) do
        Wargroove.spawnUnit(0, pos, "drone", true)
        Wargroove.waitFrame()
    end
    Wargroove.updateFogOfWar(nil)
end

return Actions
