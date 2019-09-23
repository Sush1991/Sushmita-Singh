library(lpSolveAPI)

lprec <- make.lp(9,11)

set.objfn(lprec,c(750,900,450,13000,12000,5000,900,1200,750,0,0))
set.row(lprec, 1, c(1, 1, 1,20,20,20,1,1,1,900,450), indices = c(1,2,3,4,5,6,7,8,9,10,11))
set.row(lprec, 2, c(1, 1, 1,15,15,15,1,1,1,900,450), indices = c(1,2,3,4,5,6,7,8,9,10,11))
set.row(lprec, 3, c(1, 1, 1,12,12,12,1,1,1,900,450), indices = c(1,2,3,4,5,6,7,8,9,10,11))
set.row(lprec, 4, c(900,450), indices = c(1,2))
set.row(lprec, 5, c(900,450), indices = c(3,4))
set.row(lprec, 6, c(900,450), indices = c(5,6))
set.row(lprec, 7, c(-750,-750), indices = c(1,2))
set.row(lprec, 8, c(-750,-750), indices = c(3,4))
set.row(lprec, 9, c(-750,-750), indices = c(5,6))


rhs <- c(420,360,300,420,360,300,420,360,300)

set.rhs(lprec, rhs)

set.constr.type(lprec, rep(">=", 7), constraints = 1:7)
set.constr.type(lprec, rep("=", 2), constraints = 8:9)

set.bounds(lprec, lower = rep(0, 9))
set.bounds(lprec, lower = c(-Inf, -Inf), columns = 8:9)
 
lp.rownames <- c("YL1", "YM1", "YS1", "YL2", "YM2", "YS2", "YL3", "YM3", "YS3")
lp.colnames <- c("Plant1_Capacity", "Plant2_Capacity", "Plant3_Capacity", "Plant1_Storage", "Plant2_Storage", "Plant3_Storage", "SalesForcast1", "SalesForcast2", "SalesForcast3", "Excess_Capacity1", "Excess_Capacity2")
dimnames(lprec) <- list(lp.rownames, lp.colnames)

lp.control(lprec, sense="min")

lprec

write.lp(lprec, "outputLP.lp", "lp")

solve(lprec)

get.objective(lprec)

get.variables(lprec)

get.constraints(lprec)
get.sensitivity.rhs(lprec)
get.sensitivity.obj(lprec)
get.dual.solution(lprec)




