class Checkout

  def initialize
    @prices = {
      A: 50,
      B: 30,
      C: 20,
      D: 15
    }
  end

  def checkout(string)
    return -1 if (string.is_a? Integer) ||
      (string =~ /\d/) ||
      string.upcase != string
    calculate_sum(string)
  end

  def calculate_sum(string)
    sum = 0
    string.split("").each do |item|
      sum += @prices[item.to_sym]
    end
    sum += check_discount(string)
  end

  def check_discount(string)
    discount = 0
    discount += string.count('A') / 3 * -20
    discount += string.count('B') / 2 * -15
  end

end
