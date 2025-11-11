local tabs = {
		Main = tabGroups.TabGroup1:Tab({ Name = "Main", Image = "rbxassetid://18821914323" })
	}
	
	local sections = {
		MainSection1 = tabs.Main:Section({ Side = "Left" })
	}


	sections.MainSection1:Header({
		Name = "Boosts"
	})

local optionTable = {}

for i = 0,10 do
    local formatted = "Level ".. tostring(i)
    table.insert(optionTable, formatted)
end

local Dropdown = sections.MainSection1:Dropdown({
    Name = "Speed Boost",
    Multi = false,
    Required = true,
    Options = optionTable,
    Default = 1,
    Callback = function(Value)
        local selectedNumber = tonumber(string.match(Value, "%d+"))
        
        if selectedNumber then
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
            
            if localPlayer then
                local boostsFolder = localPlayer:FindFirstChild("Boosts")
                
                if boostsFolder then
                    local fasterSprint = boostsFolder:FindFirstChild("Faster Sprint")
                    
                    if fasterSprint then
                        pcall(function()
                            fasterSprint.Value = selectedNumber
                            Window:Notify({
                                Title = "Voltex |INK GAME|",
                                Description = "Speed Boost changed to: " .. selectedNumber,
                                Lifetime = 5
                            })
                        end)
                    end
                end
            end
        end
    end,
})

local optionTable = {}

for i = 0,10 do
    local formatted = "Level ".. tostring(i)
    table.insert(optionTable, formatted)
end

local Dropdown = sections.MainSection1:Dropdown({
    Name = "Damage Boost",
    Multi = false,
    Required = true,
    Options = optionTable,
    Default = 1,
    Callback = function(Value)
        local selectedNumber = tonumber(string.match(Value, "%d+"))
        
        if selectedNumber then
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
            
            if localPlayer then
                local boostsFolder = localPlayer:FindFirstChild("Boosts")
                
                if boostsFolder then
                    local damageBoost = boostsFolder:FindFirstChild("Damage Boost")
                    
                    if damageBoost then
                        pcall(function()
                            damageBoost.Value = selectedNumber
                            Window:Notify({
                                Title = "Voltex |INK GAME|",
                                Description = "Damage Boost changed to: " .. selectedNumber,
                                Lifetime = 5
                            })
                        end)
                    end
                end
            end
        end
    end,
})

local optionTable = {}

for i = 0,10 do
    local formatted = "Level ".. tostring(i)
    table.insert(optionTable, formatted)
end

local Dropdown = sections.MainSection1:Dropdown({
    Name = "Won Boost",
    Multi = false,
    Required = true,
    Options = optionTable,
    Default = 1,
    Callback = function(Value)
        local selectedNumber = tonumber(string.match(Value, "%d+"))
        
        if selectedNumber then
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
            
            if localPlayer then
                local boostsFolder = localPlayer:FindFirstChild("Boosts")
                
                if boostsFolder then
                    local wonBoost = boostsFolder:FindFirstChild("Won Boost")
                    
                    if wonBoost then
                        pcall(function()
                            wonBoost.Value = selectedNumber
                            Window:Notify({
                                Title = "Voltex |INK GAME|",
                                Description = "Won Boost changed to: " .. selectedNumber,
                                Lifetime = 5
                            })
                        end)
                    end
                end
            end
        end
    end,
})
	
sections.MainSection1:Paragraph({
		Header = "Boosts",
		Body = "I don't recommend raising the values ​​above 5 (because in the game the only legal way to get it is 5)"
	})
