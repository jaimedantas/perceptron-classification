% -- Perceptron for x = (1,x) and w = (b,w)

function [w_normalized, updates] = perceptron(x, t)
    [D,n] = size(x);
    one = ones(D,1);
    % adds one and vector t
    x = [one x t];
    % shuffle the dataset
    random_x = x(randperm(D), :);
    
    % X and t shuffled
    x_shuffled = random_x(:,1:end-1);
    t_shuffled = random_x(:,end);
    
    % initial w with b = 0 
    w = [0 zeros(1,n)];

    index = 1;
    updates = 0; 
    while updates < 100  && index <= D
         if t_shuffled(index) * dot(x_shuffled(index,:), w) <= 0 
             % updates w
             w = w + t_shuffled(index) * x_shuffled(index,:);
             updates = updates + 1;
             % it will check all indexes again with the new w
             index = 1;
         else
             % increments the index to check the next one
             index = index + 1;
         end
    end
    % normalization (Euclidean norm)
    w_normalized = w/norm(w);
end


% [w, u] = perceptron(input_6, output_6);

