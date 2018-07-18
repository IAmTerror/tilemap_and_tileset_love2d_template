local TILE_SCALE_FACTOR = 2
local MAP_WIDTH = 30
local MAP_HEIGHT = 18
local TILE_WIDTH = 16 * TILE_SCALE_FACTOR
local TILE_HEIGHT = 16 * TILE_SCALE_FACTOR

local Game = {}

Game.Map = {}
Game.Map =  {
  {30,30,30,495,29,256,29,256,29,4,5,6,29,4,5,6,29,4,5,6,29,256,29,256,29,392,30,30,30,30},
  {30,494,30,495,29,256,29,256,29,34,35,36,29,34,35,36,29,34,35,36,29,256,29,256,29,392,30,494,30,30},
  {494,30,494,495,29,256,29,256,29,64,65,66,29,64,65,66,29,64,65,66,29,256,29,256,29,392,494,30,30,494},
  {30,494,30,470,471,256,29,258,229,29,29,29,29,29,29,29,29,29,29,29,228,259,29,256,29,392,30,494,494,30},
  {494,494,494,30,398,256,29,29,258,249,250,250,249,250,250,249,250,250,249,250,259,29,29,256,29,392,494,494,30,494},
  {30,494,30,494,398,258,229,85,29,29,29,29,29,29,29,29,29,29,29,29,29,29,228,259,29,493,30,30,494,30},
  {494,30,30,30,30,465,256,29,29,29,29,29,29,29,29,29,29,29,29,29,29,85,256,29,29,493,30,494,30,494},
  {494,30,30,30,30,495,258,250,250,250,249,250,250,249,250,250,249,250,250,249,250,250,259,29,29,493,30,30,30,494},
  {30,524,524,30,30,495,29,233,29,29,56,29,29,56,29,29,56,29,29,56,29,29,233,29,29,493,30,524,524,30},
  {30,182,29,523,30,398,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,362,500,525,29,182,392},
  {30,29,29,29,392,398,29,29,233,295,321,321,321,321,321,321,321,321,321,297,29,29,29,29,392,398,29,29,185,392},
  {30,465,185,183,319,319,321,297,233,292,233,29,29,29,29,233,29,29,29,292,233,233,295,321,319,319,183,29,29,392},
  {30,470,305,305,30,398,29,292,29,292,29,182,182,182,29,182,182,182,233,292,29,29,292,29,392,470,464,464,464,30},
  {494,30,30,30,30,398,183,292,578,183,295,321,321,321,321,321,321,321,297,183,584,29,292,183,392,30,30,30,30,30},
  {485,485,485,30,30,428,29,292,321,578,572,29,29,29,29,29,29,29,572,584,321,296,357,29,392,30,494,30,485,485},
  {29,581,29,392,398,29,29,292,29,29,29,29,572,29,574,29,572,29,29,29,29,292,29,29,392,494,30,428,29,586},
  {29,29,29,427,428,578,578,578,578,572,572,295,321,321,321,321,321,297,572,572,584,584,584,584,392,30,398,585,585,29},
  {577,321,579,321,579,321,321,321,321,321,321,357,573,29,571,29,573,355,321,321,321,321,321,321,319,319,319,321,321,583}
}


Game.tileset = nil
Game.TileTextures = {}

function Game.SetTiles()
  local l,c

  for l=1,MAP_HEIGHT do
    for c=1,MAP_WIDTH do
      local id = Game.Map[l][c]
      local texQuad = Game.TileTextures[id]
      if texQuad ~= nil then
        love.graphics.draw(Game.tileset, texQuad, (c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT, 0,TILE_SCALE_FACTOR,TILE_SCALE_FACTOR)
      end
    end      
  end
end


function Game.GetTileId()
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  local col = math.floor(x / TILE_WIDTH) + 1
  local lin = math.floor(y / TILE_HEIGHT) + 1
  if col > 0 and col <= MAP_WIDTH and lin > 0 and lin <= MAP_HEIGHT then
    local id = Game.Map[lin][col]
    love.graphics.print("ID"..tostring(id),1,1)
  else
    love.graphics.print("Out of bounds",1,1)
  end     
end

function Game.Load()
  print("Game:Loading textures...")
  Game.tileset = love.graphics.newImage("images/aw2_plains_tileset.png")
  local nbColumns = Game.tileset:getWidth() / (TILE_WIDTH / TILE_SCALE_FACTOR)
  local nbLines = Game.tileset:getHeight() / (TILE_HEIGHT / TILE_SCALE_FACTOR)

  Game.TileTextures[0] = nil

  local l,c
  local id = 1
  for l=1,nbLines do
    for c=1,nbColumns do
      Game.TileTextures[id] = love.graphics.newQuad(
        (c-1) * TILE_WIDTH / TILE_SCALE_FACTOR,
        (l-1) * TILE_HEIGHT / TILE_SCALE_FACTOR,
        TILE_WIDTH,
        TILE_HEIGHT,
        Game.tileset:getWidth(),
        Game.tileset:getHeight()
      )
      id = id + 1
    end
  end

  print("Game:Finished loading textures")
end

function Game.Draw()

  Game.SetTiles()

  Game.GetTileId()

end

return Game