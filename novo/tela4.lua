-- Código da tela4
local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    local background = display.newImageRect(sceneGroup, "imagens/diversidade.png", 320 * 2.2, 480 * 2.2)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local score2 = event.params.score2 or 0
    local score3 = event.params.score3 or 0

    local finalScore = score2 + score3

    local finalScoreText = display.newText(sceneGroup, "Pontuação Final: " .. finalScore, display.contentCenterX, display.contentCenterY - 50, native.systemFontBold, 24)
    finalScoreText:setFillColor(0, 0.5, 1)
    local buttonWidth = 200
    local buttonHeight = 40
    local cornerRadius = 10

    local quitButton = display.newRoundedRect(sceneGroup, display.contentCenterX, display.contentCenterY + 50, buttonWidth, buttonHeight, cornerRadius)
    quitButton:setFillColor(0, 0, 1, 0.6)

    local quitText = display.newText(sceneGroup, "Sair", quitButton.x, quitButton.y, native.systemFontBold, 24)
    quitText:setFillColor(1)

    local function gotoMenu()
        composer.gotoScene("menu", { effect = "slideRight", time = 500 })
    end

    quitButton:addEventListener("tap", gotoMenu)
end

scene:addEventListener("create", scene)

return scene
