% -- Losses

% executes perceptron 20 times
for i = 1:20
    [w_normalized, u(i)] = perceptron(input_fg, output_fg);
    wi{i,1} = w_normalized;
end

[D,n] = size(input_fg);
one = ones(D,1);
% adds colomn of one to x
x = [one input_fg];
t = output_fg; 

% logistic loss
logistic = [zeros(20,1)];
for j = 1:20
    for i = 1:D
        k(i) = t(i) * dot(wi{j,1}, x(i,:));
        logistic_i(i) = log(1 + exp(-t(i) * dot(wi{j,1}, x(i,:))));
        logistic(j) = logistic(j) + logistic_i(i);
    end
    if j==1
        figure
        l = scatter(k, logistic_i);
        hold on 
    end
    % average
    logistic(j) = logistic(j)/D;
end

% binary loss
binary = [zeros(20,1)];
for j = 1:20
    for i = 1:D
        k(i) = t(i) * dot(wi{j,1}, x(i,:));
        if t(i) * dot(wi{j,1}, x(i,:)) <= 0
            binary_i(i) = 1;
        else
            binary_i(i) = 0;
        end
        binary(j) = binary(j) + binary_i(i);
    end
    if j==1
        b = scatter(k, binary_i, '*');
        hold on
    end    
    % average
    binary(j) = binary(j)/D;
end

% hinge loss
hinge = [zeros(20,1)];
for j = 1:20
    for i = 1:D
        k(i) = t(i) * dot(wi{j,1}, x(i,:));
        hinge_i(i) = max(0,1 - t(i) * dot(wi{j,1}, x(i,:)));
        hinge(j) = hinge(j) + hinge_i(i);
    end
    if j==1
            h = scatter(k, hinge_i, '.');
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


% plot
grid;
legend( 'Logistic', 'Binary', 'Hinge')
ylabel('Losses'); 
xlabel('t<x,w>'); 
title('Empirical binary  loss,  hinge-loss  and  logistic  loss for a vector w');
hold off
print -depsc loss3comp


figure
x_axis = 1:1:20;
l = plot(x_axis, logistic);
hold on
b = plot(x_axis, binary);
h = plot(x_axis, hinge);
grid;

legend( 'Logistic', 'Binary', 'Hinge')
ylabel('Losses'); 
xlabel('i'); 
title('Empirical binary  loss,  hinge-loss  and  logistic  loss for several vectors w');
print -depsc allLosses20
hold off



