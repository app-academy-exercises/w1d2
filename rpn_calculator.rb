class RPNCalculator
  attr_accessor :operations
  
  def operations
    @operations ||= [0]
  end
  
  def push (number)
    operations.push(number)
  end
  
  def plus 
    num = numbers
    operations.push(num[1] + num[0])
  end
  
  def minus
    num = numbers
    operations.push(num[1] - num[0])
  end
  
  def divide
    num = numbers
    operations.push(num[1] / num[0])
  end
  
  def times
    num = numbers
    operations.push(num[1] * num[0])
  end
  
  def numbers
    num1 = operations.pop
    num2 = operations.pop
    if num1.nil? || num2.nil?
      raise "calculator is empty"
    end
  
    num_array = [num1.to_f, num2.to_f]
  end
  
  def tokens string
    string.split(/\s+/).map { |token|
      if "+-/*".include? token
        token.to_sym
      else
        token.to_f
      end
    }
  end
  
  def evaluate string
    tokens(string).each { |token|    
      if token == :+
        plus
      elsif token == :-
        minus
      elsif token == :/
        divide
      elsif token == :*
        times
      elsif 
        push(token)
      end
    }
    value
  end
  
  def value
    operations.last
  end
  
end