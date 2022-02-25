class Link < Post
  def initialize
    super

    @url = '' #адрес ссылки
  end

  # метод read_from_console спрашивает у пользователя адрес ссылки и её описание,
  #  которые мы записываем соответственно в переменны экземпляра @url и @text.
  def read_from_console
    puts 'Адрес ссылки (url):'
    @url = STDIN.gets.chomp

    puts 'Что за ссылка?'
    @text = STDIN.gets.chomp
  end

  # Метод to_string для ссылки возвращает массив из трех строк: адрес ссылки,
  # описание ссылки и строка с датой создания ссылки.
  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r"

    [@url, @text, time_string]
  end
end
