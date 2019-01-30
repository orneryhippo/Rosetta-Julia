
function make(str, test = (_) -> true)
  collect( filter(test, permutations(split(str))) )
end
 
men = make("danish english german norwegian swedish",
           x -> "norwegian" == x[1])
 
drinks = make("beer coffee milk tea water", x -> "milk" == x[3])
 
colors = make("blue green red white yellow",
              x -> 1 == findfirst(x, "white") - findfirst(x, "green"))
 
pets = make("birds cats dog horse zebra")
 
smokes = make("blend blue-master dunhill pall-mall prince")
 
function eq(x, xs, y, ys)
  findfirst(xs, x) == findfirst(ys, y)
end
 
function adj(x, xs, y, ys)
  1 == abs(findfirst(xs, x) - findfirst(ys, y))
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
                println("Zebra is owned by ", m[findfirst(p,"zebra")])
                println("Houses:")
                for line = mapslices(xs -> join( map(s->rpad(s,12), xs)),
                                     [p m c d s], 2)
                  println(line)
                end
              end
            end
          end
        end
      end 
    end
  end
end
 
