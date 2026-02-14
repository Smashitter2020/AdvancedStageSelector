-- Inside StarterGui
local player = game.Players.LocalPlayer
local prevButton = script.Parent:WaitForChild("prevButton") 
local nextButton = script.Parent:WaitForChild("nextButton")
local stageLabel = script.Parent:WaitForChild("stageLabel")
local Stages = workspace:WaitForChild("Stages")

local function TeleportToStage(stage)
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local stagePart = Stages:FindFirstChild(tostring(stage))
    if stagePart then
        hrp.CFrame = stagePart.CFrame + Vector3.new(0, 3, 0)
    end
end

local function updateLabel()
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local stageStat = leaderstats:FindFirstChild("Stage")
        if stageStat then
            stageLabel.Text = tostring(stageStat.Value)
        end
    end
end

updateLabel()

local debounce = false

prevButton.MouseButton1Click:Connect(function()
    if debounce then return end
    debounce = true

    local leaderstats = player:FindFirstChild("leaderstats")
    local tempStage = player:FindFirstChild("tempStage")

    if leaderstats and tempStage then
        local stageStat = leaderstats:FindFirstChild("Stage")
        if stageStat and stageStat.Value > 1 then
            stageStat.Value -= 1
            updateLabel()
            TeleportToStage(stageStat.Value)
        end
    end

    task.wait(0.1)
    debounce = false
end)

nextButton.MouseButton1Click:Connect(function()
    if debounce then return end
    debounce = true

    local leaderstats = player:FindFirstChild("leaderstats")
    local tempStage = player:FindFirstChild("tempStage")

    if leaderstats and tempStage then
        local stageStat = leaderstats:FindFirstChild("Stage")
        if stageStat and stageStat.Value < tempStage.Value then
            stageStat.Value += 1
            updateLabel()
            TeleportToStage(stageStat.Value)
        end
    end

    task.wait(0.1)
    debounce = false
end)