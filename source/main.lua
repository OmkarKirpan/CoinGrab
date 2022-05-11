import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics

local playerSprite = nil

local playerSpeed = 4

function initialize()
	local playerImage = gfx.image.new('images/player')
	playerSprite = gfx.sprite.new(playerImage)
	playerSprite:moveTo(200, 120)
	playerSprite:add()

	local backgroundImage = gfx.image.new('images/background')
	gfx.sprite.setBackgroundDrawingCallback(
		function(x, y, width, height)
		gfx.setClipRect(x, y, width, height)
		backgroundImage:draw(0, 0)
		gfx.clearClipRect()
	end
	)
end

initialize()

function playdate.update()
	if playdate.buttonIsPressed(playdate.kButtonUp) then
		playerSprite:moveBy(0, -playerSpeed)
	end
	if playdate.buttonIsPressed(playdate.kButtonRight) then
		playerSprite:moveBy(playerSpeed, 0)
	end
	if playdate.buttonIsPressed(playdate.kButtonDown) then
		playerSprite:moveBy(0, playerSpeed)
	end
	if playdate.buttonIsPressed(playdate.kButtonLeft) then
		playerSprite:moveBy(-playerSpeed, 0)
	end

	gfx.sprite.update()
end
