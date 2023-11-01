-- menu.lua
local composer = require("composer")
local scene = composer.newScene()

local x, y = display.contentCenterX, display.contentCenterY

function scene:create(event)
    local sceneGroup = self.view

    local menuBackground = display.newImageRect(sceneGroup, "imagens/bg.jpg", 320 * 2.2, 480 * 2.2)
    menuBackground.x = display.contentCenterX
    menuBackground.y = display.contentCenterY

    local menuGroup = display.newGroup()

    local menuTitle = display.newText(menuGroup, "CONHECENDO AS ODS", display.contentCenterX, display.contentCenterY -350, native.systemFontBold, 38)
    menuTitle:setFillColor(0, 0.2, 1)

    -- Função para iniciar o jogo
    local function startGame()
        local opcoesTela2 = {       
            time = 1000,
        }
        composer.gotoScene("tela2", opcoesTela2)
    end

    -- Função para sair do jogo
    local function exitGame()
        native.requestExit()
    end

    local buttonWidth = 200
    local buttonHeight = 40
    local cornerRadius = 10

    local startButton = display.newRoundedRect(menuGroup, display.contentCenterX, display.contentCenterY - 50, buttonWidth, buttonHeight, cornerRadius)
    startButton:setFillColor(0, 0, 1, 0.6) -- Azul com transparência
    startButton:addEventListener("tap", startGame)

    local startButtonText = display.newText(menuGroup, "Iniciar Jogo", startButton.x, startButton.y, native.systemFontBold, 24)
    startButtonText:setFillColor(1) -- Cor do texto

    local exitButton = display.newRoundedRect(menuGroup, display.contentCenterX, display.contentCenterY + 50, buttonWidth, buttonHeight, cornerRadius)
    exitButton:setFillColor(0, 0, 1, 0.6) -- Azul com transparência
    exitButton:addEventListener("tap", exitGame)

    local exitButtonText = display.newText(menuGroup, "Sair", exitButton.x, exitButton.y, native.systemFontBold, 24)
    exitButtonText:setFillColor(1) -- Cor do texto

    -- Inicialização do jogo (exibir menu inicial)
    sceneGroup:insert(menuGroup)  -- Adiciona o grupo ao sceneGroup

    -- Função para ocultar a cena
    local function hideMenu()
        menuGroup.isVisible = false
    end

    -- Chama a função hideMenu quando a cena for escondida
    self:addEventListener("hide", hideMenu)
end

scene:addEventListener("create", scene)

return scene
