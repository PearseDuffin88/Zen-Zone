-- Yoga and Meditation Studio:

-- File: yogamedstudio.lua

-- Variables
local yogaClasses = {}
local medClasses = {}
local classMax = 10
local enrollments = 0

-- Functions
-- Function to list available yoga classes
function listYogaClasses()
    print("\nYoga Classes:")
    for i, v in ipairs(yogaClasses) do 
        print("  " .. v.name)
    end
end

-- Function to add a new yoga class
function addYogaClass(name)
    table.insert(yogaClasses, {name = name})
    print("\nNew Yoga Class Added - " .. name)
end

-- Function to list available meditation classes
function listMedClasses()
    print("\nMeditation Classes:")
    for i, v in ipairs(medClasses) do 
        print("  " .. v.name)
    end
end

-- Function to add a new meditation class
function addMedClass(name)
    table.insert(medClasses, {name = name})
    print("\nNew Meditation Class Added - " .. name)
end

-- Function to enroll in a class
function enrollClass(name)
    -- check if class exists
    local found = false
    for i, v in ipairs(yogaClasses) do 
        if v.name == name then
            found = true
            break
        end
    end
    if found == false then
        print("\nClass not found")
        return
    end

    if enrollments >= classMax then
        print("\nClass is full.")
        return
    end

    enrollments = enrollments + 1
    print("\nEnrolled in class - " .. name)
end

-- Main Program
print("\nWelcome to the Yoga and Meditation Studio!")

while true do
    io.write("\nOptions:\n")
    io.write("\n  [1] - List yoga classes")
    io.write("\n  [2] - Add yoga class")
    io.write("\n  [3] - List meditation classes")
    io.write("\n  [4] - Add meditation class")
    io.write("\n  [5] - Enroll in class")
    io.write("\n  [6] - Exit\n")

    io.write("\nChoose an option: ")
    local option = io.read()

    if option == "1" then
        listYogaClasses()
    elseif option == "2" then
        io.write("\nEnter class name: ")
        local className = io.read()
        addYogaClass(className)
    elseif option == "3" then
        listMedClasses()
    elseif option == "4" then
        io.write("\nEnter class name: ")
        local className = io.read()
        addMedClass(className)
    elseif option == "5" then
        io.write("\nEnter class name: ")
        local className = io.read()
        enrollClass(className)
    elseif option == "6" then
        break
    end
end

print("\nGoodbye!")