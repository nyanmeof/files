function alert(t1, t2)
    pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Nyan",
    Text = t1 or "",
    Duration = t2 or 5
})
    end)
end
alert('Loading')
for _, v in pairs((getconnections or get_signal_cons)(game.Players.LocalPlayer.Idled)) do
    if v.Disable then
        v:Disable()
    elseif v.Disconnect then
        v:Disconnect()
    end
end
task.wait(2)
alert('Loaded')
