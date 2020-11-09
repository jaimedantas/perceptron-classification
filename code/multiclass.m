% -- Multiclass with perceptron
x = irisnum(:,1:end-1);  
t = irisnum(:,end);

x_1 = x(1:50, :);
x_2 = x(51:100, :);
x_3 = x(101:150, :);
t_1 = t(1:50);
t_2 = t(51:100);
t_3 = t(101:150);

% defines the output for each class
t_class_1 = [ones(50,1); -1*ones(100,1)];                 % Iris Setosa               
t_class_2 = [-1*ones(50,1); ones(50,1); -1*ones(50,1)];   % Iris Versicolour
t_class_3 = [-1*ones(100,1); ones(50,1)];                 % Iris Virginica

% -- Losses class 1

% executes perceptron 20 times
for i = 1:20
    [w_normalized, u(i)] = perceptron(x, t_class_1);
    wi{i,1} = w_normalized;
end
size(wi{1,1})
[D,n] = size(x);
one = ones(D,1);
% adds colomn of one to x
x = [one x];
t = t_class_1; 

% logistic loss
logistic = [zeros(20,1)];
for j = 1:20
    for i = 1:D
        k(i) = t(i) * dot(wi{j,1}, x(i,:));
        logistic_i(i) = log(1 + exp(-t(i) * dot(wi{j,1}, x(i,:))));
        logistic(j) = logistic(j) + logistic_i(i);
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
    % average
    hinge(j) = hinge(j)/D;
end

[minimum_binary_1, run_binary_1] = min(binary);
[minimum_hinge_1, run_hinge_1] = min(hinge);
[minimum_logistic_1, run_logistic_1] = min(logistic);
binary_min_1 = [minimum_binary_1 run_binary_1]
hinge_min_1 = [minimum_hinge_1 run_hinge_1]
logistic_min_1 = [minimum_logistic_1 run_logistic_1]



% plot
figure
x_axis = 1:1:20;
l = plot(x_axis, logistic);
hold on
b = plot(x_axis, binary);
h = plot(x_axis, hinge);
grid;

legend( 'Logistic Loss', 'Binary Loss', 'Hinge Loss')
ylabel('Losses'); 
xlabel('i'); 
title('Empirical binary  loss,  hinge loss  and  logistic  loss for several vectors w - CLASS 1 Iris Setosa');
print -depsc datasetIris201
hold off

% -- Losses class 2

% executes perceptron 20 times
x = irisnum(:,1:end-1);  
for i = 1:20
    [w_normalized, u(i)] = perceptron(x, t_class_2);
    wi{i,1} = w_normalized;
end
size(wi{1,1})
[D,n] = size(x);
one = ones(D,1);
% adds colomn of one to x
x = [one x];
t = t_class_2; 

% logistic loss
logistic = [zeros(20,1)];
for j = 1:20
    for i = 1:D
        k(i) = t(i) * dot(wi{j,1}, x(i,:));
        logistic_i(i) = log(1 + exp(-t(i) * dot(wi{j,1}, x(i,:))));
        logistic(j) = logistic(j) + logistic_i(i);
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
    % average
    hinge(j) = hinge(j)/D;
end

[minimum_binary_2, run_binary_2] = min(binary);
[minimum_hinge_2, run_hinge_2] = min(hinge);
[minimum_logistic_2, run_logistic_2] = min(logistic);
binary_min_2 = [minimum_binary_2 run_binary_2]
hinge_min_2 = [minimum_hinge_2 run_hinge_2]
logistic_min_2 = [minimum_logistic_2 run_logistic_2]


% plot
figure
x_axis = 1:1:20;
l = plot(x_axis, logistic);
hold on
b = plot(x_axis, binary);
h = plot(x_axis, hinge);
grid;

legend( 'Logistic Loss', 'Binary Loss', 'Hinge Loss')
ylabel('Losses'); 
xlabel('i'); 
title('Empirical binary  loss,  hinge loss  and  logistic  loss for several vectors w - CLASS 2 Iris Versicolour');
print -depsc datasetIris202
hold off

% -- Losses class 3

% executes perceptron 20 times
x = irisnum(:,1:end-1);  
for i = 1:20
    [w_normalized, u(i)] = perceptron(x, t_class_3);
    wi{i,1} = w_normalized;
end
size(wi{1,1})
[D,n] = size(x);
one = ones(D,1);
% adds colomn of one to x
x = [one x];
t = t_class_3; 

% logistic loss
logistic = [zeros(20,1)];
for j = 1:20
    for i = 1:D
        k(i) = t(i) * dot(wi{j,1}, x(i,:));
        logistic_i(i) = log(1 + exp(-t(i) * dot(wi{j,1}, x(i,:))));
        logistic(j) = logistic(j) + logistic_i(i);
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
    % average
    hinge(j) = hinge(j)/D;
end

[minimum_binary_3, run_binary_3] = min(binary);
[minimum_hinge_3, run_hinge_3] = min(hinge);
[minimum_logistic_3, run_logistic_3] = min(logistic);
binary_min_3 = [minimum_binary_3 run_binary_3]
hinge_min_3 = [minimum_hinge_3 run_hinge_3]
logistic_min_3 = [minimum_logistic_3 run_logistic_3]


% plot
figure
x_axis = 1:1:20;
l = plot(x_axis, logistic);
hold on
b = plot(x_axis, binary);
h = plot(x_axis, hinge);
grid;

legend( 'Logistic Loss', 'Binary Loss', 'Hinge Loss')
ylabel('Losses'); 
xlabel('i'); 
title('Empirical binary  loss,  hinge loss  and  logistic  loss for several vectors w - CLASS 3 Iris Virginica');
print -depsc datasetIris203
hold off