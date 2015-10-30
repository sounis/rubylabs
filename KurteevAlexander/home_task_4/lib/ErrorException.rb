class ErrorException
  def eARGV(argument)
    unless argument
      raise 'Не введен номер группы'
    end
  end
  def eLIST(catalog)
    if catalog.size < 8
      raise 'Группа не найдена'
    end
  end
end
