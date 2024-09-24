puts "Welcome to cli based TODO List Application using ruby"

$todos = [
{ id:1, task: "new task" },
{ id:2, task: "do chores" }
]

def add_item(text)
	# generate a new unique id
	id = $todos.empty? ? 1 : $todos.last[:id] + 1

	# create a new hash for the item
	new_item = { id:id, task: text }

	# add the new item to the todos array
	$todos << new_item
	puts "Item added successfully!"
	puts $todos.inspect
end

def modify_item(index)
    item = $todos.find { |todo| todo[:id] == index }

    if item
        puts "Enter new task (press Enter to skip)"
        new_task = gets.chomp
        item[:task] = new_task unless new_task.empty?
    else
        puts "Item not found! Please try again."
    end

    puts $todos.inspect
end

def command
    puts "Tell which function to perform"
    puts "1. add a new item"
    puts "2. delete an item"
    puts "3. display all items"
    puts "4. modify an item"
end

loop do
    command
    input = gets.chomp.to_i
    if input==1
	    puts "enter the name of the item"
	    item = gets.chomp
	    add_item(item)
    elsif input==2
	    puts "enter the index of the item"
	    ind = gets.chomp.to_i
	    $todos.delete_at(ind)
    	puts $todos.inspect
    elsif input==3
	    puts $todos.inspect
    elsif input==4
        puts "enter the index of the item you want to edit"
        index = gets.chomp.to_i
        modify_item(index)
    else
	    puts "Wrong input"
    end
    puts "Do you want to continue? (yes/no)"
    ch = gets.chomp.downcase
    break if ch!="yes"
end
