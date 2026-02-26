local gplr = game.Players.LocalPlayer
local key = getgenv().key or "sang123"

if key == "sang-123-ahihi" then
    print("success")
else
    gplr:Kick("Wrong Key!")
end
