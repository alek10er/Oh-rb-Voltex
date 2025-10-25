local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/alek10er/Oh-rb-Voltex/main/Oh%20loading.lua"))()

print("🟢 M9kuuvs sistem live")

-- Ссылка на Библиотеку
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/alek10er/Oh-rb-Voltex/main/Main%20Ui.lua"))()

-- Создать окно UI
local Window = Library.CreateLib("Voltex software |INK Game|", "RJTheme2")

local Tab = Window:NewTab("Main")

-- Подсекция
local Section = Tab:NewSection("Main")

-- Слайдер скорости
Section:NewSlider("Speed Hack", "You can change the speed", 500, 16, function(s) -- 500 (Макс. значение) | 16 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

--Слайдер прыжков

-- Слайдер для высоты прыжка
Section:NewSlider("Jump Power", "You can change jump height", 200, 50, function(s) -- 200 (Макс. значение) | 50 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
