-- LocalScript в StarterPlayerScripts
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModernLoadingGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true

-- Основной контейнер - компактный
local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(0, 400, 0, 300)
mainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
mainContainer.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
mainContainer.BackgroundTransparency = 0.4  -- Почти прозрачный
mainContainer.BorderSizePixel = 0
mainContainer.ZIndex = 1
mainContainer.ClipsDescendants = true

-- Закругление углов
local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, 20)
containerCorner.Parent = mainContainer

-- Стильная обводка
local containerStroke = Instance.new("UIStroke")
containerStroke.Color = Color3.fromRGB(80, 120, 200)
containerStroke.Thickness = 2
containerStroke.Transparency = 0.7
containerStroke.Parent = mainContainer

-- Легкая тень для объема
local containerShadow = Instance.new("UIStroke")
containerShadow.Color = Color3.fromRGB(0, 0, 0)
containerShadow.Thickness = 4
containerShadow.Transparency = 0.9
containerShadow.Parent = mainContainer

-- Центральный круг с анимацией
local centerCircle = Instance.new("Frame")
centerCircle.Size = UDim2.new(0, 120, 0, 120)
centerCircle.Position = UDim2.new(0.5, 0, 0.35, 0)
centerCircle.AnchorPoint = Vector2.new(0.5, 0.5)
centerCircle.BackgroundTransparency = 1
centerCircle.BorderSizePixel = 0
centerCircle.ZIndex = 2

local circleStroke = Instance.new("UIStroke")
circleStroke.Color = Color3.fromRGB(100, 150, 255)
circleStroke.Thickness = 2
circleStroke.Transparency = 0.6
circleStroke.Parent = centerCircle

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = centerCircle

-- Анимированные частицы вокруг круга
local particles = {}
for i = 1, 8 do  -- Меньше частиц для компактности
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, 6, 0, 6)
    particle.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    particle.BorderSizePixel = 0
    particle.ZIndex = 3
    particle.BackgroundTransparency = 0.6
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.CornerRadius = UDim.new(1, 0)
    particleCorner.Parent = particle
    
    table.insert(particles, particle)
end

-- Главный текст M9kuuvs
local logoLabel = Instance.new("TextLabel")
logoLabel.Size = UDim2.new(0.8, 0, 0, 50)
logoLabel.Position = UDim2.new(0.5, 0, 0.35, 0)
logoLabel.AnchorPoint = Vector2.new(0.5, 0.5)
logoLabel.BackgroundTransparency = 1
logoLabel.Text = "Voltex"
logoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
logoLabel.TextScaled = true
logoLabel.Font = Enum.Font.GothamBlack
logoLabel.TextSize = 36
logoLabel.ZIndex = 4
logoLabel.TextTransparency = 0

-- Свечение текста
local textGlow = Instance.new("UIStroke")
textGlow.Color = Color3.fromRGB(100, 200, 255)
textGlow.Thickness = 1.5
textGlow.Transparency = 0.8
textGlow.Parent = logoLabel

-- Подзаголовок
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(0.8, 0, 0, 20)
subtitle.Position = UDim2.new(0.5, 0, 0.45, 0)
subtitle.AnchorPoint = Vector2.new(0.5, 0.5)
subtitle.BackgroundTransparency = 1
subtitle.Text = "SOFTWARE SYSTEMS"
subtitle.TextColor3 = Color3.fromRGB(180, 200, 220)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 12
subtitle.ZIndex = 4
subtitle.TextTransparency = 1

-- Прогресс бар
local progressContainer = Instance.new("Frame")
progressContainer.Size = UDim2.new(0, 250, 0, 3)
progressContainer.Position = UDim2.new(0.5, 0, 0.65, 0)
progressContainer.AnchorPoint = Vector2.new(0.5, 0.5)
progressContainer.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
progressContainer.BackgroundTransparency = 0.7
progressContainer.BorderSizePixel = 0
progressContainer.ZIndex = 3

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 4

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(1, 0)
progressCorner.Parent = progressContainer

local progressCorner2 = Instance.new("UICorner")
progressCorner2.CornerRadius = UDim.new(1, 0)
progressCorner2.Parent = progressBar

-- Текст статуса
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(0.8, 0, 0, 20)
statusText.Position = UDim2.new(0.5, 0, 0.72, 0)
statusText.AnchorPoint = Vector2.new(0.5, 0.5)
statusText.BackgroundTransparency = 1
statusText.Text = "Initializing..."
statusText.TextColor3 = Color3.fromRGB(200, 220, 255)
statusText.TextScaled = true
statusText.Font = Enum.Font.Gotham
statusText.TextSize = 14
statusText.ZIndex = 4
statusText.TextTransparency = 1

-- Процент загрузки
local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(0, 80, 0, 30)
percentText.Position = UDim2.new(0.5, 0, 0.8, 0)
percentText.AnchorPoint = Vector2.new(0.5, 0.5)
percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Color3.fromRGB(255, 255, 255)
percentText.TextScaled = true
percentText.Font = Enum.Font.GothamBold
percentText.TextSize = 18
percentText.ZIndex = 4
percentText.TextTransparency = 1

-- Собираем интерфейс
progressBar.Parent = progressContainer

for i, particle in ipairs(particles) do
    particle.Parent = centerCircle
end

centerCircle.Parent = mainContainer
progressContainer.Parent = mainContainer
statusText.Parent = mainContainer
percentText.Parent = mainContainer
subtitle.Parent = mainContainer
logoLabel.Parent = mainContainer

mainContainer.Parent = screenGui
screenGui.Parent = playerGui

-- Сообщения загрузки
local loadingMessages = {
    "Initializing modules...",
    "Loading assets...",
    "Optimizing...",
    "Verifying...",
    "Final setup...",
    "Ready!"
}

-- Анимация частиц
local function animateParticles()
    for i, particle in ipairs(particles) do
        local angle = (i / #particles) * math.pi * 2
        local radius = 70  -- Меньший радиус для компактности
        local speed = 2 + math.sin(tick() * 0.5 + i) * 0.5
        
        local x = math.cos(angle + tick() * speed) * radius
        local y = math.sin(angle + tick() * speed) * radius
        
        particle.Position = UDim2.new(0.5, x, 0.5, y)
        
        -- Пульсация прозрачности
        local pulse = math.sin(tick() * 3 + i) * 0.3 + 0.7
        particle.BackgroundTransparency = 1 - pulse * 0.4
    end
end

-- Красивая анимация загрузки
local function startLoading()
    -- Начальное состояние - компактное
    mainContainer.Size = UDim2.new(0, 0, 0, 0)
    mainContainer.BackgroundTransparency = 1
    containerStroke.Transparency = 1
    containerShadow.Transparency = 1

    -- Анимация появления контейнера с фоном
    local containerTween = TweenService:Create(mainContainer, TweenInfo.new(1.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 400, 0, 300),
        BackgroundTransparency = 0.9
    })
    
    local strokeTween = TweenService:Create(containerStroke, TweenInfo.new(1), {
        Transparency = 0.3
    })
    
    local shadowTween = TweenService:Create(containerShadow, TweenInfo.new(1), {
        Transparency = 0.8
    })
    
    containerTween:Play()
    strokeTween:Play()
    shadowTween:Play()
    
    -- Анимация круга
    circleStroke.Transparency = 1
    centerCircle.Size = UDim2.new(0, 0, 0, 0)
    
    local circleSizeTween = TweenService:Create(centerCircle, TweenInfo.new(1, Enum.EasingStyle.Quint), {
        Size = UDim2.new(0, 120, 0, 120)
    })
    
    local circleStrokeTween = TweenService:Create(circleStroke, TweenInfo.new(0.8), {
        Transparency = 0.4
    })
    
    circleSizeTween:Play()
    circleStrokeTween:Play()
    
    wait(0.4)
    
    -- Появление текста
    logoLabel.TextTransparency = 1
    local textTween = TweenService:Create(logoLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {
        TextTransparency = 0
    })
    textTween:Play()
    
    wait(0.2)
    
    -- Появление подзаголовка
    local subtitleTween = TweenService:Create(subtitle, TweenInfo.new(0.5), {
        TextTransparency = 0.4
    })
    subtitleTween:Play()
    
    wait(0.2)
    
    -- Появление прогресс бара и текста
    progressContainer.BackgroundTransparency = 1
    statusText.TextTransparency = 1
    percentText.TextTransparency = 1
    
    local progressTween = TweenService:Create(progressContainer, TweenInfo.new(0.4), {
        BackgroundTransparency = 0.7
    })
    
    local statusTween = TweenService:Create(statusText, TweenInfo.new(0.4), {
        TextTransparency = 0
    })
    
    local percentTween = TweenService:Create(percentText, TweenInfo.new(0.4), {
        TextTransparency = 0
    })
    
    progressTween:Play()
    statusTween:Play()
    percentTween:Play()
    
    -- Симуляция загрузки
    local progress = 0
    local startTime = tick()
    local duration = 6 -- 6 секунд
    
    local connection
    connection = RunService.Heartbeat:Connect(function()
        animateParticles()
        
        -- Анимация пульсации круга
        local pulse = math.sin(tick() * 2) * 0.03 + 1
        centerCircle.Size = UDim2.new(0, 120 * pulse, 0, 120 * pulse)
        
        -- Мерцание текста
        local glowPulse = math.sin(tick() * 3) * 0.1 + 0.9
        textGlow.Transparency = 1 - glowPulse * 0.2
        
        -- Легкая пульсация фона
        local bgPulse = math.sin(tick() * 1.5) * 0.02 + 0.9
        mainContainer.BackgroundTransparency = bgPulse
    end)
    
    while progress < 100 do
        local elapsed = tick() - startTime
        progress = math.min((elapsed / duration) * 100, 100)
        
        -- Плавное обновление прогресс бара
        local targetWidth = (progress / 100) * progressContainer.AbsoluteSize.X
        progressBar.Size = UDim2.new(0, targetWidth, 1, 0)
        
        -- Обновление процентов
        percentText.Text = math.floor(progress) .. "%"
        
        -- Динамический цвет прогресс бара
        local hue = progress / 400
        progressBar.BackgroundColor3 = Color3.fromHSV(hue, 0.9, 1)
        
        -- Смена статусов
        local messageIndex = math.floor(progress / (100 / #loadingMessages)) + 1
        if messageIndex <= #loadingMessages and statusText.Text ~= loadingMessages[messageIndex] then
            local fadeOut = TweenService:Create(statusText, TweenInfo.new(0.15), {
                TextTransparency = 1
            })
            fadeOut:Play()
            fadeOut.Completed:Wait()
            
            statusText.Text = loadingMessages[messageIndex]
            
            local fadeIn = TweenService:Create(statusText, TweenInfo.new(0.15), {
                TextTransparency = 0
            })
            fadeIn:Play()
        end
        
        wait()
    end
    
    -- Финальная анимация успеха
    statusText.Text = "Launching..."
    statusText.TextColor3 = Color3.fromRGB(100, 255, 150)
    
    local successTween = TweenService:Create(progressBar, TweenInfo.new(0.4), {
        BackgroundColor3 = Color3.fromRGB(100, 255, 150)
    })
    successTween:Play()
    
    -- Усиление свечения обводки
    local finalGlow = TweenService:Create(containerStroke, TweenInfo.new(0.5), {
        Color = Color3.fromRGB(100, 255, 150),
        Thickness = 3,
        Transparency = 0.2
    })
    finalGlow:Play()
    
    wait(0.8)
    
    -- Отключаем анимацию
    connection:Disconnect()
    
    -- Плавное исчезновение
    local fadeSequence = {
        TweenService:Create(logoLabel, TweenInfo.new(0.3), {TextTransparency = 1}),
        TweenService:Create(subtitle, TweenInfo.new(0.3), {TextTransparency = 1}),
        TweenService:Create(statusText, TweenInfo.new(0.3), {TextTransparency = 1}),
        TweenService:Create(percentText, TweenInfo.new(0.3), {TextTransparency = 1}),
        TweenService:Create(progressContainer, TweenInfo.new(0.3), {BackgroundTransparency = 1}),
        TweenService:Create(containerStroke, TweenInfo.new(0.4), {Transparency = 1}),
        TweenService:Create(containerShadow, TweenInfo.new(0.4), {Transparency = 1})
    }
    
    for _, tween in ipairs(fadeSequence) do
        tween:Play()
    end
    
    wait(0.4)
    
    -- Финальное исчезновение контейнера
    local containerDisappear = TweenService:Create(mainContainer, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    })
    containerDisappear:Play()
    
    wait(1)
    
    -- Очистка
    screenGui:Destroy()
end

-- Запускаем загрузку
wait(0.5)
startLoading()

print("Script start")
--Запуск чит меню полный доступ
