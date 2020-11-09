x = input_6(:,1);  % 6pointsinputs.txt - first column
t = input_6(:,2);  % 6pointsinputs.txt - second column
x_one = [x(1), x(2), x(3)];
t_one = [t(1), t(2), t(3)];
x_minus_one = [x(4), x(5), x(6)];
t_minus_one = [t(4), t(5), t(6)];

% Plot of dataset
hold on
% +1
plot(x_one,t_one,'o', 'color','blue');
% -1
plot(x_minus_one,t_minus_one,'o', 'color','red');

% Plot of w and classifier (2D only)

% vector w and number of updates -> execute this script several times
[w_normalized, u] = perceptron(input_6, output_6)
w = [w_normalized(1,2); w_normalized(1,3)];
w_x = w_normalized(1,2);
w_y = w_normalized(1,3);
plot([0,w_x/sum(w)],[0,w_y/sum(w)],'-', 'color','black');

% Code adaptad from [1] --------------
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
%---------------------------------------
axis equal;
legend('+1','-1', 'w = [0   0.7071   0.7071]', 'Classifier')
axis([-2 3 -3 2]);
title('Implementation of the Perceptron on MATLAB');
ylabel('t'); 
xlabel('x'); 
hold off
print -depsc epsClassifierWithAlgo 