if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем класс Post и его детей: Memo, Link, Task
require_relative 'lib/post'
require_relative 'lib/Memo'
require_relative 'lib/link'
require_relative 'lib/Task'

puts 'Привет, я твой блокнот!'
puts
puts 'Что хотите записать в блокнот?'

# Запишем в переменную choices массив типов записей, вызвав у класса Post метод post_types.
choices = Post.post_types

# хранит выбор пользователя
choice = -1

# Пока пользователь не выбрал правильно, спрашиваем
# у него число и выводим список возможных вариантов для записи.
until choice >= 0 && choice < choices.size
  
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = gets.to_i
end

# Как только выбор сделан, мы можем создаем запись нужного типа, передав выбор
# пользователя в метод create класса Post
entry = Post.create(choice)

# В переменной entry лежит один из детей класса Post, определенный переменной choice.

# Просим пользователя ввести пост
entry.read_from_console

# Сохраняем пост в файл
entry.save

puts 'Ваша запись сохранена!'
