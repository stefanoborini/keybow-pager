require 'keybow-pager/keybow'
require 'keybow-pager/colors'

pages = {}
-- Support four pages of commands. 
-- Desktop (for basic desktop/browsing)
pages.DESKTOP = 0
pages.CODING = 1
pages.UNUSED_2 = 2
pages.UNUSED_3 = 3

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
end


