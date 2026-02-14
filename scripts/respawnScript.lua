-- Script inside ServerScriptService
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        local leaderstats = player:WaitForChild("leaderstats")
        local stageStat = leaderstats:WaitForChild("Stage")

        local stagePart = workspace:WaitForChild("Stages"):FindFirstChild(tostring(stageStat.Value))
        if not stagePart then return end

        local HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
        HumanoidRootPart.CFrame = stagePart.CFrame + Vector3.new(0, 3, 0)
    end)
end)