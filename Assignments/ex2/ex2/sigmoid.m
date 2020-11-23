function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).





% =============================================================

% cols = size(z, 2);
% rows = size(z, 1);

% for row = 1:rows
%   for col = 1: cols
%     g(row, col) = 1 /(1 + exp(-1 * z(row, col)));
%   end
% end

g = 1./(1 + exp(-z));

end
