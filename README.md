# Projectile-Motion-Solver

## Matlab project
 The goal of this project is firing a projectile  so that it lands on a specific target. we put into consideration the drag force as a function of the velocity^2 and not as a linear relationship. and we also take into consideration the x and y wind forces the project take into consideration a barrier at diffrent X position and diffrent hight and according to that the code adjust itself to find the optimal theta and velocity to reach the end positon of the projectile
 
## Equations
xacceleration= (-dragcofficent/mass)*sqrt( (vx^2) + (vy^2) )*vx;
yacceleration= -9.81-(dragcofficent/mass)*sqrt( (vx^2) + (vy^2) )*vy;

## Limitations 
we only take into account 1 barrier at a time
