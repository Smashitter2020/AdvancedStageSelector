-- Script inside ServerScriptService
local Stages = workspace:WaitForChild("Stages")

for _, stagePart in ipairs(Stages:GetChildren()) do
    if stagePart:IsA("BasePart") then
        stagePart.Touched:Connect(function(hit)
            local character = hit.Parent
            local player = character and game.Players:GetPlayerFromCharacter(character)
            if not player then return end

            local stageNumber = tonumber(string.match(stagePart.Name, "%d+"))
            if not stageNumber then return end

            local leaderstats = player:FindFirstChild("leaderstats")
            local tempStage = player:FindFirstChild("tempStage")
            if not (leaderstats and tempStage) then return end

            local stageStat = leaderstats:FindFirstChild("Stage")
            if not stageStat then return end

            if stageStat.Value ~= stageNumber and stageStat.Value < stageNumber then
                stageStat.Value = stageNumber
                tempStage.Value = stageNumber
            end
        end)
    end
end