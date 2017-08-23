require 'minitest'
require 'minitest/autorun'
require 'matrix'

def col_rotate(matrix,n)
  Matrix.rows(matrix.to_a.map{|col| col.rotate(n)})
end

def row_rotate(matrix,n)
  Matrix.rows(matrix.to_a.rotate(n))
end

def neighbor_count(m)
  [1,0,-1].product([1,0,-1]).map{|i,j|col_rotate(row_rotate(m,i),j)}.reduce(:+)-m
end

def next_gen(m)
  flat_m = m.to_a.flatten
  nc = neighbor_count(m).to_a.flatten
  Matrix.rows(nc.each_with_index.map{|e,i| (e == 3 || e == 2 && flat_m[i] == 1) ? 1 : 0}.each_slice(9).to_a)
end

def pp(matrix)
  matrix.to_a.each {|row| puts row.map{|e| e == 0 ? " " : "◼"}.join}
  puts ""
  nil
end


Class.new(MiniTest::Test) do
  glider = Matrix[[0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 1, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 1, 0, 0, 0],
                  [0, 0, 0, 1, 1, 1, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0]]
  glider_nc = Matrix[[0, 0, 0, 0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 1, 1, 1, 0, 0, 0],
                     [0, 0, 0, 1, 1, 2, 1, 0, 0],
                     [0, 0, 1, 3, 5, 3, 2, 0, 0],
                     [0, 0, 1, 1, 3, 2, 2, 0, 0],
                     [0, 0, 1, 2, 3, 2, 1, 0, 0],
                     [0, 0, 0, 0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0, 0, 0, 0]]
  next_gen = Matrix[[0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 1, 0, 1, 0, 0, 0],
                    [0, 0, 0, 0, 1, 1, 0, 0, 0],
                    [0, 0, 0, 0, 1, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0]]

  define_method(:test_neighbor_count) do
    assert_equal(glider_nc, neighbor_count(glider))
  end

  define_method(:test_next_gen) do
    assert_equal(next_gen, next_gen(glider))
  end
end

glider = Matrix[[0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 1, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 1, 0, 0, 0],
                [0, 0, 0, 1, 1, 1, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0]]

=begin
loop do
  sleep 0.2
  pp glider
  glider = next_gen(glider)
end
=end

