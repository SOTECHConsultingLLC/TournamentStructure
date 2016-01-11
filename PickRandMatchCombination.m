%% SOTECH CONSULTING LLC
%
% Title: Pick Match Combination
% Author: Fluvio L Lobo Fenoglietto
% Date: 01/05/2016
%
% Description:
%
%
%

function [pick, Y] = PickRandMatchCombination(X)
    
    Y = X;
    PickSize = size(X);

    if PickSize(1,1) > 1 && PickSize(1,2) == 2
        
        pick = datasample(X,1);

    elseif PickSize(1,1) == 1 && PickSize(1,2) == 2
        
        % this section of the conditional acts when the array of
        % combinations only has two elements remaining to pick from.
        
        pick = X;
        
    end    

end % end of function