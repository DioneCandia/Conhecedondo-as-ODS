-- tela3.lua
local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    local background = display.newImageRect(sceneGroup, "imagens/biblioteca.jpg", 320 * 2.2, 480 * 2.2)
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local player = display.newImageRect(sceneGroup, "imagens/cadeira3.png", 400, 400)
    player.x = display.contentCenterX
    player.y = display.contentCenterY + 100

    local questions = {
        {
            question = "Qual ODS tem interesse em \n Parcerias para alcançar os objetivos?",
            choices = { "ODS 12", "ODS 7", "ODS 17" },            correctAnswer = 3
        },
        {
            question = "Quantas metas tem dentro das 17 ODS?",
            choices = { "153", "17", "169" },
            correctAnswer = 3
        },
        {
            question = "A Sétima ODS nos garante?",
            choices = { "Ensino de Qualidade", "Energia acessível e limpa", "Paz e Moradia" },
            correctAnswer = 2
        },
        {
            question = "Qual é o ODS que tem como objetivo garantir \n a disponibilidade e gestão sustentável \n da água e saneamento para todos?",
            choices = { "ODS 11", "ODS 15", "ODS 6" },
            correctAnswer = 3
        },
    }

    local currentQuestion = 1
    local answeredQuestions = 0
    local score = event.params.score2  -- Obtém a pontuação da tela anterior (tela2)

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

        questionText = display.newText(sceneGroup, questionData.question, display.contentCenterX, display.contentCenterY - 150, native.systemFont, 20)
        questionText:setFillColor(1, 1, 1)

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

                if answeredQuestions < 4 and currentQuestion <= #questions then
                    showQuestion()
                else
                    local options = {
                        time = 1000,
                        effect = "slideLeft",
                        params = { score3 = score }
                    }
                    composer.gotoScene("tela4", options)
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




