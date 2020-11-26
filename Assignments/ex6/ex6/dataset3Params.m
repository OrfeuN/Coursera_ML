function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
% =========================================================================
values = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
error_min = 0;
run_count = 0;

C_final = 0;
sigma_final = 0;

for i = 1:length(values)
  C = values(i);
  for j = 1:length(values)
      sigma = values(j);
      model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
      predictions = svmPredict(model, Xval);
      error = mean(double(predictions ~= yval));
      if run_count == 0
        error_min = error;
      endif
      if error <= error_min
        error_min = error;
        C_final = C;
        sigma_final = sigma;
      endif
      % fprintf('C: %f, sigma: %f, error: %f', C, sigma, error);
      run_count += 1;
  endfor
endfor

fprintf('C_final: %f, sigma_final: %f, error_min: %f', C_final, sigma_final, error_min);

C = C_final;
sigma = sigma_final;

end
