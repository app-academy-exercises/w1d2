def super_print(string, options = {})
  defaults = { :times => 1, :upcase => false, :reverse => false }

  defaults.merge!(options)

  if defaults[:upcase]
    string.upcase!
  end

  if defaults[:reverse]
    string.reverse!
  end

  string * defaults[:times]
end

p super_print("Hello")                                    #=> "Hello"
p super_print("Hello", :times => 3)                       #=> "Hello" 3x
p super_print("Hello", :upcase => true)                   #=> "HELLO"
p super_print("Hello", :upcase => true, :reverse => true) #=> "OLLEH"