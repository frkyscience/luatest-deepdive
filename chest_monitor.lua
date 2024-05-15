local function clear_monitor(monitor)
    if monitor then
        monitor.clear()
    end
end

local function center_text(monitor, text, yPos)
    local monitorWidth = monitor.getSize()
    local textWidth = #text
    local xPos = math.floor((monitorWidth - textWidth) / 2) + 1
    monitor.setCursorPos(xPos, yPos)
    monitor.write(text)
end

local function print_item_details(chest, monitor, slot)
    local item = chest.getItemDetail(slot)
    if item and item.count > 0 then
        center_text(monitor, item.displayName or item.name, slot * 2 - 1)
        
        monitor.setTextColor(colors.gray)
        center_text(monitor, tostring(item.count), slot * 2)
        monitor.setTextColor(colors.white)
    end
end

local function print_inventory_on_monitor(chest, monitor)
    clear_monitor(monitor)
    local chestSize = chest.size()
    for slot = 1, chestSize do
        print_item_details(chest, monitor, slot)
    end
end

while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("chest")
    if monitor and chest then
        print_inventory_on_monitor(chest, monitor)
    else
        print("Monitor or chest not found")
    end
    sleep(10)
end
