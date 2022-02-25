class Memo < Post

  # метод read_from_console спрашивает у пользователя текст заметки
  # до слова "end" и записывает их в массив @text
  def read_from_console
    puts 'Новая заметка (все, что пишите до строчки "end"):'

    line = nil

    # Пока пользователь не введет слово «end», цикл и считывает в массив @text.
    until line == 'end'
      line = STDIN.gets.chomp
      @text << line
    end

    # Удаление слова "end" из конца массива @text
    @text.pop
  end

  # Метод to_string должен вернуть все строки, которые мы хотим записать в
  # файл при записи нашей заметки
  def to_strings
    # Сгенерируем строку с датой создания заметки
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r"

    # Возвращаем массив @text с добавление в начало даты создания заметки.
    @text.unshift(time_string)
  end
end
