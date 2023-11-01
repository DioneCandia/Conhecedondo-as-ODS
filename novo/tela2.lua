-- tela2.lua
local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    local background = display.newImageRect(sceneGroup, "imagens/background.png", 320 * 2.2, 480 * 2.2)
    background.x = display.contentCenterX
    background.y = 70

    local player = display.newImageRect(sceneGroup, "imagens/YaraLivro.png", 1762/25, 2902/25)
    player.x = 420
    player.y = 250

    local player1 = display.newImageRect(sceneGroup, "imagens/índio2.png", 468/8, 1225/8)
    player1.x = 30
    player1.y = 150

    local questions = {
        {
            question = "Quantos Objetivos de \n Desenvolvimento Sustentável existem?",
            choices = { "8", "10", "17" },
            correctAnswer = 3
        },
        {
            question = "Qual dos ODS está incorreto?",
            choices = { "Educação de Qualidade", "Paz e Justiça", "Lucro e Riqueza" },
            correctAnswer = 3
        },
        {
            question = "Qual das ODS tem como \n objetivo Erradicar a Pobreza?",
            choices = { "ODS 6", "ODS 1", "ODS 12" },
            correctAnswer = 2
        },
        {
            question = "Qual ODS visa garantir a igualdade de gênero?",
            choices = { "ODS 5", "ODS 7", "ODS 9" },
            correctAnswer = 1
        },
        {
            question = "Qual é o Objetivo da quarta ODS?",
            choices = { "Energia acessível e limpa", "Educação de qualidade", "Saúde e o bem-estar" },
            correctAnswer = 2
        }
    }

    local currentQuestion = 1
    local answeredQuestions = 0
    local score = 0

    local questionText
    local choiceButtons = {}

    local function showQuestion()
        local questionData = questions[currentQuestion]

        if questionText then
            questionText:removeSelf()
            questionText = nil
        end

        for i, button in ipairs(choiceButtons) do
            button:removeSelf()
        end

        questionText = display.newText(sceneGroup, questionData.question, display.contentCenterX, display.contentCenterY - 100, native.systemFont, 20)
        questionText:setFillColor(0, 0, 0)

        choiceButtons = {}
        local yOffset = 15

        for i, choice in ipairs(questionData.choices) do
            local button = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY + yOffset, 250, 30)
            button:setFillColor(1, 0.3, 0.4)

            local buttonText = display.newText(sceneGroup, choice, button.x, button.y, native.systemFont, 18)
            buttonText:setFillColor(0, 0, 0)

            button.choice = i

            local function selectAnswer(event)
                local selectedButton = event.target
                if selectedButton.choice == questionData.correctAnswer then
                    score = score + 1
                end

                answeredQuestions = answeredQuestions + 1
                currentQuestion = currentQuestion + 1

                if answeredQuestions < 5 and currentQuestion <= #questions then
                    showQuestion()
                else
                    local options = {
                        time = 1000,
                        effect = "slideLeft",
                        params = { score2 = score }
                    }
                    composer.gotoScene("tela3", options)
                end
            end

            button:addEventListener("tap", selectAnswer)

            choiceButtons[#choiceButtons + 1] = button
            yOffset = yOffset + 50
        end
    end

    showQuestion()
end

scene:addEventListener("create", scene)

return scene



