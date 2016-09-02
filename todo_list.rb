require "./todo_item.rb"

class TodoList
	attr_reader :name, :todo_items # para usar estos atributos en cualquier metodo no es necesario el @
	def initialize(name)
		@name = name
		@todo_items = []
	end

	def add_item(name)
		todo_items.push(TodoItem.new(name))
	end

	def remove_item(name)
		if indexx = find_index(name) 
			todo_items.delete_at(indexx)
			return true
		else
			return false
		end
	end

	def mark_complete(name)
		if indexx = find_index(name) 
			todo_items[indexx].mark_complete!
			return true
		else
			return false
		end

	end

	def find_index(name)
		index = 0
		found = false
		todo_items.each do |todo_item|
			if todo_item.name == name
				found = true
			end
			if found
				break
			else
				index += 1
			end
		end
		if found
			return index
		else
			return nil
		end
	end

	def print_list
		puts "#{name} List"
		puts "-"*30
		todo_items.each do |todo_item|
			puts todo_item
		end
		puts "\n"
	end

end

todo_list = TodoList.new("mercado")
todo_list.add_item("pan")
todo_list.add_item("milo")
todo_list.add_item("queso")


if todo_list.remove_item("milo")
  puts "milo fue removido de la lista"
end

if todo_list.mark_complete("pan")
  puts "pan fue marcado como completado"
end

puts todo_list.inspect
todo_list.print_list


#puts todo_items.inspect