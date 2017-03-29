class CreditCheckRecheck

  def validate(number)
    number         = stringify_number(number) unless number.is_a?(String)
    reversed       = reverse_number(number)
    each_digit     = string_to_array_of_numbers(reversed)
    with_doubles   = double_even_places(each_digit)
    combined_large = collect_final_numbers(with_doubles)
    sum            = combined_large.inject(:+)
    sum % 10 == 0
  end

  def stringify_number(number)
    number.to_s
  end

  def reverse_number(text)
    text.reverse
  end

  def string_to_array_of_numbers(text)
    text.split('').map! {|t| t.to_i}
  end

  def double_even_places(numbers)
    numbers.map.with_index do |number, idx|
      if idx % 2 != 0
        number * 2
      else
        number
      end
    end
  end

  def add_large_numbers(number)
    return number if number < 10
    string = number.to_s
    digits = string.split('')
    digits.inject(0) { |sum, n| sum + n.to_i }
  end

  def collect_final_numbers(numbers)
    numbers.map do |number|
      add_large_numbers(number)
    end
  end
end
