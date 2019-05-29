require 'keybow-pager/keybow'

operations = {}

function operations.back()
    keybow.set_modifier(keybow.LEFT_META, '[')
end

function operations.forward()
    keybow.set_modifier(keybow.LEFT_META, ']')
end
