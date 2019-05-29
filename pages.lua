require 'keybow-pager/keybow'
require 'keybow-pager/colors'
require 'keybow-pager/buttons'
require 'keybow-pager/operations'

pages = {}
-- Support four pages of commands. 
-- Desktop (for basic desktop/browsing)
pages.DESKTOP = 0
pages.CODING = 1
pages.UNUSED_2 = 2
pages.UNUSED_3 = 3


pages.operations = {}
pages.operations[pages.DESKTOP] = {
    nil, nil, nil, nil,
    operations.back, operations.forward, nil, nil
}

pages.operations[pages.CODING] = {
    nil, nil, nil, nil,
    nil, nil, nil, nil
}

pages.operations[pages.UNUSED_2] = {
    nil, operations.back, nil, operations.back,
    nil, nil, nil, nil
}

pages.operations[pages.UNUSED_3] = {
    nil, nil, nil, nil,
    nil, nil, nil, nil
}

-- the current page. Default at startup is desktop.
pages.page = pages.DESKTOP

function pages.set_page(page_)
    button_map = {
        10, 7, 4, 1,
        9, 6, 3, 0
    }
    pages.page = page_
    button.set_color(button.TAB_0, color.NONE)
    button.set_color(button.TAB_1, color.NONE)
    button.set_color(button.TAB_2, color.NONE)
    button.set_color(button.TAB_3, color.NONE)
    if (pages.page == pages.DESKTOP) then
        button.set_color(button.TAB_0, color.RED)
    elseif (pages.page == pages.CODING) then
        button.set_color(button.TAB_1, color.GREEN)
    elseif (pages.page == pages.UNUSED_2) then
        button.set_color(button.TAB_2, color.BLUE)
    elseif (pages.page == pages.UNUSED_3) then
        button.set_color(button.TAB_3, color.YELLOW)
    end
    
    for i = 1, 8, 1
    do
        if (pages.operations[pages.page][i] ~= nil) then
            button.set_color(button_map[i], color.BLUE)
        else
            button.set_color(button_map[i], color.NONE)
        end

    end
end
