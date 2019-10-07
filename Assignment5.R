## create IP object
library(lpSolveAPI)
ap <- make.lp(nrow = 9, ncol = 12) # nrow is the number of nodes, ncol is the numnber of arcs

# create names for nodes and arcs
arc.names <- c("x12", "x13", "x35", "x25", "x24", "x47", "x46" ,"x58" , "x57" , "x69"
               , " x79" , "x89")
node.names <- c("node1", "node2", "node3", "node4", "node5", "node6" ,"node7" ,"node8" , "node9")

# rename the IP object
rownames(ap) <- node.names
colnames(ap) <- arc.names

## obj function
time <- c(5, 3, 3, 2, 4, 4, 1, 2, 6, 5, 4, 7)
set.objfn(ap, -1*time)  # default is min

## set constraints LHS
set.row(ap, 1, c(1, 1), indices = c(1, 2) )     
set.row(ap, 2, c(1, -1, -1), indices = c(1, 4, 5))     
set.row(ap, 3, c(1, -1), indices = c(2, 3))  
set.row(ap, 4, c(1, -1, -1), indices = c(5, 7, 6))     
set.row(ap, 5, c(1, 1, -1, -1), indices = c(4, 3,9,8))         
set.row(ap, 6, c(1, -1), indices = c(7,10)) 
set.row(ap, 7, c(1, 1, -1), indices = c(9, 6, 11))
set.row(ap, 8, c(1,-1), indices = c(8 , 12))
set.row(ap, 9, c(1,1,1), indices = c(10,11,12))# node 6 (finish node)

## set constraints type
set.constr.type(ap, rep("="), 9)

## set constraint RHS
rhs <- c(1, rep(0, 7), 1)
set.rhs(ap, rhs)

## set all variables type to be binary
set.type(ap, 1:9, "binary")

## solve the IP problem
solve(ap)
get.objective(ap)
get.variables(ap)
cbind(arc.names, get.variables(ap))