using Combinatorics 

function make(str, test)  ### = (_) -> true)
   filter(test, collect(permutations(split(str))))
end

function isleftof(color1, color2, hlist)
   1 == findfirst(x -> x == color1, hlist) - findfirst(x -> x == color2, hlist)
end

men = make("danish english german norwegian swedish",
           x -> "norwegian" == x[1])
 
drinks = make("beer coffee milk tea water", x -> "milk" == x[3])
 
colors = make("blue green red white yellow",
              x -> 1 == findfirst(c -> c == "white", x) - findfirst(c -> c == "green",x))
 
pets = make("birds cats dog horse zebra")
 
smokes = make("blend blue-master dunhill pall-mall prince")
 
function eq(x, xs, y, ys)
  findfirst(c -> c == x, xs) == findfirst(c -> c == y, ys)
end
 
function adj(x, xs, y, ys)
  1 == abs(findfirst(c -> c == x, xs) - findfirst(c-> c == y, ys))
end
 
for m = men, c = colors
  if eq("red",c, "english",m) && adj("norwegian",m, "blue",c)
    for d = drinks
      if eq("danish",m, "tea",d) && eq("coffee",d,"green",c)
        for s = smokes
          if eq("yellow",c,"dunhill",s) &&
             eq("blue-master",s,"beer",d) &&
             eq("german",m,"prince",s)
            for p = pets
              if eq("birds",p,"pall-mall",s) &&
                 eq("swedish",m,"dog",p) &&
                 adj("blend",s,"cats",p) &&
                 adj("horse",p,"dunhill",s)
                println("Zebra is owned by ", m[findfirst(c -> c == "zebra", p)])
                println("Houses:")
                for i in 1:5
                  println("House $i")
                  println(p[i]," ", m[i]," ", s[i]," ", c[i]," ", d[i])
                  println()       
                end
              end
            end
          end
        end
      end 
    end
  end
end
 
