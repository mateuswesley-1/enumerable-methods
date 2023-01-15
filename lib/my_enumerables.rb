module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    for i in 0...self.length
      yield self[i], i
    end
    
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    array_selected = []
    for item in self
     # yield pega o valor que retorna da operacao dentro do block,
     # que nesse caso sera true ou false
     if (yield item)
      array_selected << item
     end
    end
    array_selected
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?
    all_bolean = true
    for item in self
      unless (yield item)
        all_bolean = false
      end
    end
    all_bolean
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    any_bolean = false
    for item in self
      if (yield item)
        any_bolean = true
        break
      end
    end
    any_bolean
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    none_bolean = true
    for item in self
      if (yield item)
        none_bolean = false
        break
      end
    end
    none_bolean
  end

  def my_count
    return self.length unless block_given?
    counted_values = 0
    for item in self
     if (yield item)
      counted_values += 1
     end
    end
    counted_values
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    array_map = []
    for item in self
      array_map << yield(item)
    end
    array_map
  end

  def my_inject(inicial_value)
    return to_enum(:my_inject) unless block_given?
    for item in self
      inicial_value = yield(inicial_value, item)
    end
    inicial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for item in self
      yield item
    end
    self
  end
end


