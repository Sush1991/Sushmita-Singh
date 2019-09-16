#objective function 
  o=c(420,360,300,420,360,300,420,360,300)
  
#define Constraints
  c=matrix(c(1,1,1,0,0,0,0,0,0,
             20,15,12,0,0,0,0,0,0,
             0,0,0,1,1,1,0,0,0,
             0,0,0,20,15,12,0,0,0,
             0,0,0,0,0,0,1,1,1,
             20,15,12,0,0,0,0,0,0,
             1,0,0,1,0,0,1,0,0,
             0,1,0,0,1,0,0,1,0,
             0,0,1,0,0,1,0,0,1,
             0.0013,0.0013,0.0013,-0.0011,-0.0011,-0.0011,0,0,0,
             0.0013,0.0013,0.0013,0,0,0,-0.0022,-0.0022,-0.0022),ncol = 9,byrow = T)
    
#direction to provide sign 
d=c("<=","<=","<=","<=","<=","<=","<=","<=","<=","=","=")
      
#provide RHS values
r=c(750,13000,900,12000,450,5000,900,1200,750,0,0)
        
# Call lpSolve to solve the program and store the result in "sol"
sol=lpSolve::lp("max",o,c,d,r,compute.sens = T)
          
# Get Solution
sol$solution
