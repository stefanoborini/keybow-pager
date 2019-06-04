require 'keybow-pager/keybow'

operations = {}

function operations.browser_back()
    keybow.tap_key_with_modifiers('[', keybow.LEFT_META)
end

function operations.browser_forward()
    keybow.tap_key_with_modifiers(']', keybow.LEFT_META)
end

function operations.text_bigger()
    keybow.tap_key_with_modifiers('+', keybow.LEFT_META)
end

function operations.text_smaller()
    keybow.tap_key_with_modifiers('-', keybow.LEFT_META)
end

function operations.scroll_up()
    keybow.tap_key(keybow.UP_ARROW)
end

function operations.scroll_down()
    keybow.tap_key(keybow.DOWN_ARROW)
end

function operations.pycharm_back()
    keybow.tap_key_with_modifiers('b', keybow.LEFT_META)
end

function operations.pycharm_to_declaration()
    keybow.tap_key_with_modifiers(keybow.LEFT_ARROW, keybow.LEFT_META, keybow.LEFT_ALT)
end

function operations.git_commit_a()
    keybow.text("git commit -a")
    keybow.tap_enter()
end

function operations.git_pull()
    keybow.text("git pull")
    keybow.tap_enter()
end

function operations.git_tree()
    keybow.text("git tree")
    keybow.tap_enter()
end
