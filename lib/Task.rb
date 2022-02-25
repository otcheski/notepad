require 'date'

class Task < Post
  def initialize
    super
    @due_date = Time.now #время, к которому задачу нужно выполнить
  end

  # метод read_from_console спрашивает у пользователя текст задачи (что нужно сделать) и дату, до
  # которой нужно успеть это сделать.
  def read_from_console
    puts 'Что надо сделать?'
    @text = STDIN.gets.chomp

    puts 'К какому числу? Укажите дату в формате ДД.ММ.ГГГГ, ' \
      'например 12.05.2003'
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  # Метод to_string должен вернуть все строки, которые мы хотим записать в
  # файл при записи нашей задачи: строку с дедлайном, описание задачи и дату
  # создания задачи.
  def to_strings
    deadline = "Крайний срок: #{@due_date.strftime('%Y.%m.%d')}"
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r"

    [deadline, @text, time_string]
  end
end
