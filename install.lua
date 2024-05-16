local chestMonitorUrl = "https://raw.githubusercontent.com/frkyscience/luatest-deepdive/main/chest_monitor.lua"

local loadingArt = [[

_                 _ _             
| | ___   __ _  __| (_)_ __   __ _ 
| |/ _ \ / _` |/ _` | | '_ \ / _` |
| | (_) | (_| | (_| | | | | | (_| |
|_|\___/ \__,_|\__,_|_|_| |_|\__, |
                             |___/ 
]]

local successArt = [[

                        ___      __
___ ___  _ __ ___  _ __ | | ___ |_| ___ 
/ __/ _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \
| (_| (_) | | | | | | |_) | |  __/ ||  __/
\___\___/|_| |_| |_| .__/|_|\___|\__\___|
                  |_|                   



]]

    print(loadingArt)
    print("Downloading chest_monitor.lua....")

local response = http.get(chestMonitorUrl)
if response then
    local content = response.readAll()
    response.close()


    local file = fs.open("chest_monitor.lua", "w")
    file.write(content)
    file.close()

    print("chest_monitor.lua download complete")

local startupScript = [[
    shell.run("chest_monitor.lua")
    ]]
    local startupFile = fs.open("startup.lua", "w")
    startupFile.write(startupScript)
    startupFile.close()
    print("startup.lua created successfully.")

    print(successArt)
    print("Installation complete. Rebooting...")
    os.reboot()
else
    print("Failed to download chest_monitor.lua. Check your URL and try again.")
end
