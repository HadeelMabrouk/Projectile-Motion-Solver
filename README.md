# Projectile-Motion-Solver
#matlab project
# The goal of this project is firing a projectile  so that it lands on a specific target. we put into consideration the 
# drag force as a function of the velocity^2 and not as a linear relationship
# the project take into consideration a barrier at diffrent X position and diffrent hight and according to that
# the code adjust itself to find the optimal theta and velocity to reach the end positon of the projectile
#equations
xacceleration= (-dragcofficent/mass)*sqrt( (vx^2) + (vy^2) )*vx;
yacceleration= -9.81-(dragcofficent/mass)*sqrt( (vx^2) + (vy^2) )*vy;
#limitations 
we only take into account 1 barrier at a time
