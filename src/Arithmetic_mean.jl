#Arithmetic mean
#http://rosettacode.org/wiki/Averages/Arithmetic_mean

# Julia's <strike>built-in</strike> Statistics module mean function accepts AbstractArrays (vector, matrix, etc.)
julia> using Statistics
julia> mean([1,2,3])
2.0
julia> mean(1:10)
5.5
julia> mean([])
ERROR: mean of empty collection undefined: []
