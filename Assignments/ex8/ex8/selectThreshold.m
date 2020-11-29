function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    predictions = (pval < epsilon);
    
    #comparison = [predictions yval];
    
    #idx_pos_pred = find(comparison(:, 1) == 1);
    #pos_preds = comparison(idx_pos_pred, :);
    
    #idx_neg_pred = find(comparison(:, 1) == 0);
    #neg_preds = comparison(idx_neg_pred, :);
    
    ## true positives where first column of pos_preds matches the second column
    #tp = sum(pos_preds(pos_preds(:, 2) == 1));
    #fp = sum(pos_preds(pos_preds(:, 2) == 0));
    
    
    ## true negatives where first column of neg_preds matches the second column
    ##tn = length(neg_preds(neg_preds(:, 2) == 0));
    #fn = sum(neg_preds(neg_preds(:, 2) == 1));
    
    # hint in the notes
    tp = sum((predictions == 1) & (yval == 1));
    fp = sum((predictions == 1) & (yval == 0));
    fn = sum((predictions == 0) & (yval == 1));
    
    if tp + fp > 0 && tp + fn > 0
      prec = tp/ (tp + fp);
      rec = tp/(tp + fn);
      
      F1 = 2 * prec * rec/ (prec + rec);
    endif
    
    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
