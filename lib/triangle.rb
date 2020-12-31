class Triangle
  attr_accessor :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    is_triangle
    if side_1 == side_2 && side_2 == side_3
      :equilateral
    elsif side_1 == side_2 || side_2 == side_3 || side_3 == side_1
      :isosceles
    else
      :scalene
    end
  end

  def is_triangle
    triangle = [(side_1 + side_2 > side_3), (side_1 + side_3 > side_2), (side_2 + side_3 > side_1)]
    [side_1, side_2, side_3].each { |side| triangle << false if side <= 0 }
    raise TriangleError if triangle.include?(false)
    end
  end
  class TriangleError < StandardError
end