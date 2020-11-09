x = irisnum(:,1:end-1);  
t = irisnum(:,end);
% Graph
% +1
plot3(x(1:50x,1),x(1:40,2),x(1:100,3),'o')
hold on
plot3(x(100:200,1),x(100:200,2),x(100:200,3),'o')
plot3(x(100:200,1),x(100:200,2),x(100:200,3),'o')

xlabel('x')
ylabel('y')
zlabel('z')
grid on
title('FG dataset');
legend('+1','-1')

print -depsc 3ddataset

%plot(x_one,t_one,'o', 'color','blue');
% -1
%plot(x_minus_one,t_minus_one,'o', 'color','red');