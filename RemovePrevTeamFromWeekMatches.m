%% SOTECH CONSULTING LLC
%
% Title: Remove Previous Team From Week Matches
% Author: Fluvio L Lobo Fenoglietto
% Date: 01/05/2016
%
% Description:
% This function removes the teams listed on the previous match, from the
% following (remainder) matches.
%

function [Z] = RemovePrevTeamFromWeekMatches(pick,X)

    Y = X;

    SizeOfX = size(X);
    N_combinations = SizeOfX(1,1);
    N_teams_per_match = SizeOfX(1,2);
    pickLen = length(pick);

    for j = 1:N_combinations

        for k = 1:N_teams_per_match

            for l = 1:pickLen

                if X(j,k) == pick(l)

                    Y(j,:) = [0, 0];

                end

            end

        end

    end

    indeces = find(Y(:,1) ~= 0);

    Z = zeros(length(indeces),2);

    for j = 1:length(indeces)

        Z(j,:) = Y(indeces(j),:);

    end

end % end of function