function [ xmax, maxh, xhigh ] = projectilemotion( x0, y0, v0, angle, g)
%  Projectile motion function - calculates and plots trajectory
%
%  Accepts input for initial position, initial velocity, and angle
%  and produces the horizontal range, maximum height, and position of
%  the maximum height 
%
%  x0 = Initial x value (starting distance)
%  y0 = Initial y value (starting height)
%  v0 = Initial velocity
%  angle = angle of projectile
% 
%  xmax = maximum distance
%  maxh = maximum height
%  xhigh = x coordinate of highest point 
%
%  Ex: Plot a trajectory with a starting point of 200,300 with a velocity
%  of 100 and an angle of 45 degrees.
%  projectilemotion(200,300,100,pi/4)
%
%  Ver: 1.0 by MD

anglerad = angle * (pi./180);               %% Converts angles to radians
xmax = (v0.^2)./g * sin(2*anglerad);        %% Calculates max x distance
xstep = xmax ./ 100;                        %% Calculates step, always 100 samples
           
x = x0:xstep:xmax;
y = (x * tan(anglerad) - g/(2*(v0.^2)*(cos(anglerad)).^2)*x.^2) + y0;

for n = 1:length(x)
    h = plot(x(n),y(n),'.');
    set(h,'LineWidth',2);
    xlabel('distance (meters)'); ylabel('height (meters)');
    hold on;
    pause(0.0001);
end

zoom on;
maxh = max(y)                               %% Max Height
maxpoint = find(y == max(y(:)))             %% Index of max point
xhigh = x(maxpoint)                         %% X value of max point
h = plot(x(maxpoint),y(maxpoint),'r.');
set(h,'MarkerSize',20);

end

