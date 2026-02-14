-- Script inside ServerScriptService
game.Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder", player)
    leaderstats.Name = "leaderstats"

    local Stage = Instance.new("IntValue", leaderstats)
    Stage.Name = "Stage"
    Stage.Value = 1

    local tempStage = Instance.new("IntValue", player)
    tempStage.Name = "tempStage"
    tempStage.Value = Stage.Value
end)