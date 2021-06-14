class Post
  # Статический метод post_types класса Post, возвращает всех известных ему детей класса
  # Post в виде массива классов. Метод self.post_types использован для простоты, адекватно поставленной задаче

  def self.post_types
    [Memo, Task, Link]
  end


  # Метод create класса Post динамически (в зависимости от параметра) создает
  # объект нужного класса (Memo, Task или Link) из набора возможных детей,
  # получая список с помощью метода post_types, объявленного выше.
  def self.create(type_index)
    post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = []
  end

  def read_from_console
    # Этот метод должен быть реализован у каждого ребенка
  end

  def to_strings
    # Этот метод должен быть реализован у каждого ребенка
  end

  def save
    file = File.new(file_path, 'w:UTF-8') # открываем файл на запись

    to_strings.each { |string| file.puts(string) }

    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)

    file_time = @created_at.strftime('%Y-%m-%d_%H-%M-%S')

    "#{current_path}/#{self.class.name}_#{file_time}.txt"
  end
end
