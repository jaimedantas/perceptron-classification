x = input_6(:,1);  % 6pointsinputs.txt - first column
t = input_6(:,2);  % 6pointsinputs.txt - second column
x_one = [x(1), x(2), x(3)];
t_one = [t(1), t(2), t(3)];
x_minus_one = [x(4), x(5), x(6)];
t_minus_one = [t(4), t(5), t(6)];

% Graph
hold on
% +1
plot(x_one,t_one,'o', 'color','blue');
% -1
plot(x_minus_one,t_minus_one,'o', 'color','red');

% Plot x and classifier
% vector w -> you need to plot 3 times with diferentts w
w = [1;2];
w_x = 1;
w_y = 2;
plot([0,w_x],[0,w_y],'-', 'color','black');

% Code adaptad from [1] ---
% Here I convert the line 90 degrees. Then I repeat this process for the
% other side of the plane
% side A
angle=90; 
angle_rad=((angle*pi)./180); 
[THETA,R] = cart2pol([0 w_x],[0 w_y]); % converts to polar coordinates
THETA = THETA + angle_rad;
[xr,yr] = pol2cart(THETA,R); % converts back to cartesian coordinates
plot(xr,yr,'g-','Linewidth',3); 
% side B
[THETA_2,R_2] = cart2pol([w_x, 0],[ w_y, 0]); 
THETA_2 = THETA_2 + angle_rad; 
[xr_2,yr_2] = pol2cart(THETA_2,- R_2); 
plot(xr_2,yr_2,'g-', 'Linewidth',3); 
%---------------------------
axis equal;
legend('+1','-1', 'w NOT normalized', 'Classifier')
axis([-2 3 -3 2]);
title('Classification performed by the implementation of the Perceptron manually');
ylabel('t'); 
xlabel('x'); 
hold off
print -depsc epsClassifierManual