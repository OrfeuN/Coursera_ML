function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
% =============================================================

for i=1:K
  C_i_filter = find(idx == i);
  C_i = X(C_i_filter, :);
  item_count = size(C_i, 1);
  mu_i = zeros(1, n);
  if(item_count > 0)
    mu_i = sum(C_i, 1)/(item_count);
   endif
   centroids(i, :) = mu_i;
   
  #C_i_filter = find(idx == i);
  #C_i = X(C_i_filter, :);
  #centroids(i, :) = mean(C_i);
endfor
end

