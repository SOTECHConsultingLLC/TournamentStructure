%% SOTECH CONSULTING LLC
%
% Title: Remove Previous Team From Week Matches
% Author: Fluvio L Lobo Fenoglietto
% Date: 01/10/2016
%
% Description:
% 
%

function [Z] = RemovePrevPickFromMatchCombinations(pick,X)

    Y = X;

    SizeOfX = size(X);
    N_combinations = SizeOfX(1,1);

    for j = 1:N_combinations

        if X(j,1) == pick(1) && X(j,2) == pick(2)

            Y(j,:) = [0, 0];

        end

    end

    indeces = find(Y(:,1) ~= 0);

    Z = zeros(length(indeces),2);

    for j = 1:length(indeces)

        Z(j,:) = Y(indeces(j),:);

    end  

end % end of function