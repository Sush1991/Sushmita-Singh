#Transportation Problem
library(lpSolveAPI)
t<-make.lp(6,8)
lp.control(a,sense='min')
set.objfn(t,c(622,614,630,1,641,645,649,1))  # Objective function with 8 decision variables
add.constraint(t,c(1,1,1,1),"<=",100,indices = c(1,2,3,4)) # 6 Constraints
add.constraint(t,c(1,1,1,1),"<=",120,indices = c(5,6,7,8))
add.constraint(t,c(1,1),"=",80,indices = c(1,5))
add.constraint(t,c(1,1),"=",60,indices = c(2,6))
add.constraint(t,c(1,1),"=",70,indices = c(3,7))
add.constraint(t,c(1,1),"=",10,indices = c(4,8))
          
          
solve(t)
get.objective(t)
get.constraints(t)
get.variables(t)
          
          
          
          
          