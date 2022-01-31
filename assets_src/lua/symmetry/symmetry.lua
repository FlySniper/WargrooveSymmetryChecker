local Wargroove = require "wargroove/wargroove"

local Symmetry = {}

function Symmetry.checkVertical(pos, mapSize)
    local posTerrainName = Wargroove.getTerrainNameAt(pos)
    local mirroredX = (mapSize.x - pos.x - 1) % mapSize.x
    local mirroredPos = {x = mirroredX, y = pos.y}
    local mirroredTerrainName = Wargroove.getTerrainNameAt(mirroredPos)
    return posTerrainName == mirroredTerrainName
end

function Symmetry.checkHorizontal(pos, mapSize)
    local posTerrainName = Wargroove.getTerrainNameAt(pos)
    local mirroredY = (mapSize.y - pos.y - 1) % mapSize.y
    local mirroredPos = {x = pos.x, y = mirroredY}
    local mirroredTerrainName = Wargroove.getTerrainNameAt(mirroredPos)
    return posTerrainName == mirroredTerrainName
end

function Symmetry.checkRotational(pos, mapSize)
    local posTerrainName = Wargroove.getTerrainNameAt(pos)
    local mirroredX = (mapSize.x - pos.x - 1) % mapSize.x
    local mirroredY = (mapSize.y - pos.y - 1) % mapSize.y
    local mirroredPos = {x = mirroredX, y = mirroredY}
    local mirroredTerrainName = Wargroove.getTerrainNameAt(mirroredPos)
    return posTerrainName == mirroredTerrainName
end

return Symmetry