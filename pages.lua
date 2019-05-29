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
    nil,                     nil,                        nil, operations.text_bigger,
    operations.browser_back, operations.browser_forward, nil, operations.text_smaller
}

pages.operations[pages.CODING] = {
    operations.git_pull, operations.git_commit, operations.git_tree, nil,
    operations.pycharm_back, operations.pycharm_to_declaration, nil, nil
}

pages.operations[pages.UNUSED_2] = {
    nil, nil, nil, nil,
    nil, nil, nil, nil
}

pages.operations[pages.UNUSED_3] = {
    nil, nil, nil, nil,
    nil, nil, nil, nil
}

pages.button_map = {
    button.ACTION_A0, button.ACTION_A1, button.ACTION_A2, button.ACTION_A3,
    button.ACTION_B0, button.ACTION_B1, button.ACTION_B2, button.ACTION_B3
}

-- the current page. Default at startup is desktop.
pages.page = pages.DESKTOP

function pages.set_page(page_)
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
            button.set_color(pages.button_map[i], color.BLUE)
        else
            button.set_color(pages.button_map[i], color.NONE)
        end
    end
end

function pages.get_operation_for_action_button(button_id)
    for i = 1, 8, 1
    do
        if (pages.button_map[i] == button_id) then
            return pages.operations[pages.page][i]
        end
    end
    return nil
end

function pages.run_operation(button_id)
    operation = pages.get_operation_for_action_button(button_id)
    if (operation ~= nil) then
        operation()
    end
end
    
