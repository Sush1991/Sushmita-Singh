library(lpSolveAPI)

lprec <- make.lp(11, 9)

set.objfn(lprec,c(420, 360, 300, 420, 360, 300, 420, 360, 300))
set.row(lprec, 1, c(1, 1, 1), indices = c(1, 2, 3))
set.row(lprec, 2, c(1, 1, 1), indices = c(4, 5, 6))
set.row(lprec, 3, c(1, 1, 1), indices = c(7, 8, 9))
set.row(lprec, 4, c(20, 15, 12), indices = c(1, 2, 3))
set.row(lprec, 5, c(20, 15, 12), indices = c(4, 5, 6))
set.row(lprec, 6, c(20, 15, 12), indices = c(7, 8, 9))
set.row(lprec, 7, c(1, 1, 1), indices = c(1, 2, 3))
set.row(lprec, 8, c(1, 1, 1), indices = c(4, 5, 6))
set.row(lprec, 9, c(1, 1, 1), indices = c(7, 8, 9))
set.row(lprec, 10, c(900, 900, 900, -750, -750, -750), indices = c(1,2,3,4,5,6))
set.row(lprec, 11, c(450, 450, 450, -750, -750, -750), indices = c(1,2,3,7,8,9))

rhs <- c(750, 900, 450, 13000, 12000, 5000, 900, 1200, 750, 0, 0)

set.rhs(lprec, rhs)

set.constr.type(lprec, rep("<=", 9), constraints = 1:9)
set.constr.type(lprec, rep("=", 2), constraints = 10:11)

set.bounds(lprec, lower = rep(0, 9))

lp.colnames <- c("XL1", "XM1", "XS1", "XL2", "XM2", "XS2", "XL3", "XM3", "XS3")
lp.rownames <- c("Plant1_Capacity", "Plant2_Capacity", "Plant3_Capacity", "Plant1_Storage", "Plant2_Storage", "Plant3_Storage", "SalesForcast1", "SalesForcast2", "SalesForcast3", "Excess_Capacity1", "Excess_Capacity2")
dimnames(lprec) <- list(lp.rownames, lp.colnames)

lp.control(lprec, sense="max")

lprec

write.lp(lprec, "outputLP.lp", "lp")

solve(lprec)

get.objective(lprec)

get.variables(lprec)

get.constraints(lprec)
get.sensitivity.rhs(lprec)
get.sensitivity.obj(lprec)
cbind(get.sensitivity.rhs(lprec)$duals[1:11], get.sensitivity.rhs(lprec)$dualsfrom[1:11], 
      get.sensitivity.rhs(lprec)$dualstill[1:11])
cbind(get.sensitivity.rhs(lprec)$duals[12:20], get.sensitivity.rhs(lprec)$dualsfrom[12:20], 
      get.sensitivity.rhs(lprec)$dualstill[12:20])


