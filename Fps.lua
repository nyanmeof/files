if getgenv().SetFpsCap and typeof(getgenv().FpsCap) == "number" then
    if setfpscap then
        setfpscap(getgenv().FpsCap)
    elseif setfps then
        setfps(getgenv().FpsCap)
    end
end
