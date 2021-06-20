class Post
  # Набор известных детей класса Запись в виде массива классов
  # Метод self.post_types использован для простоты, адекватно поставленной задаче
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
    @created_at = Time.now # дата создания записи
    @text = [] # массив строк записи — пока пустой
  end

  # Вызываться в программе когда нужно считать ввод пользователя и записать его в нужные поля объекта
  def read_from_console
    # Этот метод должен быть реализован у каждого ребенка
  end

  # Возвращает состояние объекта в виде массива строк, готовых к записи в файл
  def to_strings
    # Этот метод должен быть реализован у каждого ребенка
  end

  # Записывает текущее состояние объекта в файл
  def save
    file = File.new(file_path, 'w:UTF-8') # открываем файл на запись

    to_strings.each { |string| file.puts(string) } # идем по массиву строк, полученных из метода to_strings

    file.close
  end

  # Метод, возвращающий путь к файлу, куда записывать этот объект
  def file_path
    # Сохраним в переменной current_path место, откуда запустили программу
    current_path = "Data/"

    # Получим имя файла из даты создания поста метод strftime формирует строку типа "2014-12-27_12-08-31.txt"
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

    current_path + file_name # возвращает ссылку на файл
  end
end
