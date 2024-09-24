puts "Welcome to cli based TODO List Application using ruby"

$todos = [
{ id:1, task: "new task" }
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

puts "Tell which function to perform"
puts "1. add a new item"
puts "2. delete an item"
puts "3. display all items"

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
else
	puts "Wrong input"
end
