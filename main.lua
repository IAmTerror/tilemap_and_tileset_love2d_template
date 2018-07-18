--Author :
--+-+-+-+-+-+-+-+-+-+
--|I|A|m|T|e|r|r|o|r|
--+-+-+-+-+-+-+-+-+-+

-- Inspired by : https://www.gamecodeur.fr --- https://www.gamecodeur.fr/liste-ateliers/atelier-tilemap-bases-love2d/


-- CONFIG --------------------------------------------------------------------------------------------------------------

-- This line is used to display traces in the console during the execution
io.stdout:setvbuf('no')

-- This line is used to debug step by step in ZeroBrane Studio
if arg[#arg] == "-debug" then require("mobdebug").start() end

-- Prevents photoshop from filtering outlines of images when they are resized
-- Pixel art effect
love.graphics.setDefaultFilter("nearest")

local myGame = require("game")


-- LÖVE ---------------------------------------------------------------------------------------------------------------

function love.load()

  love.window.setMode(960,576)

  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  myGame.Load()

end

function love.update(dt)    

end

function love.draw()
  myGame.Draw()

end