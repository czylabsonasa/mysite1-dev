# This file was generated, do not modify it. # hide
#hideall
list=include("_assets/index/create_vectors_1.list")
Desc=String[]
Hint=String[]
Sol=String[]
for ex in list
   push!(Desc,"1. $(ex.desc)")
   push!(Hint,"1. $(ex.hint)")
   push!(Sol,"1. $(ex.sol)")
end
#println(join(Desc,'\n'))
println("# create vectors 1 - desc\n"*join(Desc,'\n'))
println("# create vectors 1 - hint\n"*join(Hint,'\n'))
println("# create vectors 1 - sol\n"*join(Sol,'\n'))
#println(db)
#println("hahó")