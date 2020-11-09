% -- Losses

% executes perceptron 20 times
for i = 1:20
    [w_normalized, u(i)] = perceptron(input_6, output_6);
    wi{i,1} = w_normalized;
end

[D,n] = size(input_6);
one = ones(D,1);
% adds colomn of one to x
x = [one input_6];
t = output_6; 

% logistic loss
logistic = [zeros(20,1)];
for j = 1:20
    for i = 1:D
        logistic_i = log(1 + exp(-t(i) * dot(wi{j,1}, x(i,:))));
        logistic(j) = logistic(j) + logistic_i;
    end
    % average
    logistic(j) = logistic(j)/D;
end

% binary loss
binary = [zeros(20,1)];

for j = 1:20
    for i = 1:D
        if t(i) * dot(wi{j,1}, x(i,:)) <= 0
            binary_i = 1;
        else
            binary_i = 0;
        end
        binary(j) = binary(j) + binary_i;
    end
    % average
    binary(j) = binary(j)/D;
end

% hinge loss
hinge = [zeros(20,1)];
for j = 1:20
    for i = 1:D
        hinge_i = max(0,1 - t(i) * dot(wi{j,1}, x(i,:)));
        hinge(j) = hinge(j) + hinge_i;
    end
    % average
    hinge(j) = hinge(j)/D;
end

[minimum_binary, run_binary] = min(binary);
[minimum_hinge, run_hinge] = min(hinge);
[minimum_logistic, run_logistic] = min(logistic);
binary_min = [minimum_binary run_binary]
hinge_min = [minimum_hinge run_hinge]
logistic_min = [minimum_logistic run_logistic]

x_axis = 1:1:20;
plot(x_axis, binary);
hold on
plot(x_axis, hinge);
plot(x_axis, logistic);
grid;
legend('Binary Loss', 'Hinge Loss', 'Logistic Loss')
ylabel('Losses'); 
xlabel('i'); 
title('Empirical binary  loss,  hinge loss  and  logistic loss');
axis([1 20 -0.05 0.4]);
print -depsc allLosses
