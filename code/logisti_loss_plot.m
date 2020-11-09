% -- Losses

% executes perceptron 20 times
[w, u] = perceptron(input_6, output_6);


[D,n] = size(input_6);
one = ones(D,1);
% adds colomn of one to x
x = [one input_6];
t = output_6; 

% logistic loss
logistic = 0;
for i = 1:D
    k(i) = t(i) * dot(w, x(i,:));
    logistic_i(i) = log(1 + exp(-t(i) * dot(w, x(i,:))));
    logistic = logistic + logistic_i(i);
end
figure
l = plot(k,logistic_i,'-*','linewidth',3);
hold on 



% binary loss
binary = 0;
for i = 1:D
    k(i) = t(i) * dot(w, x(i,:));
    if t(i) * dot(w, x(i,:)) <= 0
        binary_i(i) = 1;
    else
        binary_i(i) = 0;
    end
    binary = binary + binary_i(i);
end
b = plot(k,binary_i,'-x','linewidth',3);
hold on        


% hinge loss
hinge = 0;
for i = 1:D
    k(i) = t(i) * dot(w, x(i,:));
    hinge_i(i) = max(0,1 - t(i) * dot(w, x(i,:)));
    hinge = hinge + hinge_i(i);
end
h = plot(k,hinge_i,'-o','linewidth',3);

% plot
grid;
legend( 'Logistic Loss', 'Binary Loss', 'Hinge Loss')
ylabel('Losses'); 
xlabel('t<x,w>'); 
title('Empirical binary  loss,  hinge loss  and  logistic  loss for a vector w');
hold off
print -depsc loss3compT



