-- Grow a Garden Script Hub
-- Made for game owners or testing purposes only

-- UI Library (use your preferred one or customize here)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Grow a Garden Hub", "Synapse")

-- Tabs
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Garden Features")

-- Unlock Candy Blossom Shop
MainSection:NewButton("Unlock Candy Blossom Shop", "Reveals hidden Candy Blossom shop", function()
    local shop = workspace:FindFirstChild("CandyBlossomShop") or game:GetService("ReplicatedStorage"):FindFirstChild("CandyBlossomShop")
    if shop then
        shop.Parent = workspace
        for _, part in ipairs(shop:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
                part.CanCollide = true
            end
        end
        print("✅ Candy Blossom Shop unlocked!")
    else
        warn("❌ Candy Blossom Shop not found.")
    end
end)

-- Instant Grow
MainSection:NewButton("Instant Grow", "Makes your plants grow instantly", function()
    for _, plant in ipairs(workspace:GetDescendants()) do
        if plant.Name == "Plant" and plant:FindFirstChild("Growth") then
            plant.Growth.Value = 100
        end
    end
    print("🌱 All plants fully grown!")
end)

-- Auto Harvest
MainSection:NewButton("Auto Harvest", "Automatically harvests all crops", function()
    for _, plant in ipairs(workspace:GetDescendants()) do
        if plant.Name == "Plant" and plant:FindFirstChild("Harvest") then
            fireclickdetector(plant.Harvest.ClickDetector)
        end
    end
    print("🌾 All plants harvested!")
end)

-- Teleport to Candy Blossom Shop
MainSection:NewButton("Teleport to Shop", "Teleport to Candy Blossom Shop", function()
    local shop = workspace:FindFirstChild("CandyBlossomShop")
    if shop then
        local char = game.Players.LocalPlayer.Character
        char:MoveTo(shop.Position or shop:FindFirstChildOfClass("BasePart").Position)
    else
        warn("❌ Shop not found to teleport.")
    end
end)
