@variable = "hola"
sin_arroba = "sin arroba"

def method_variable
  @variable = "doblehola"
  sin_arroba = "con arroba"
end

method_variable
puts @variable
puts sin_arroba
