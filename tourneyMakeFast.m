%% SOTECH CONSULTING LLC
%
% Title: Tournament Structure Generator
% Author: Fluvio L Lobo Fenoglietto
% Date: 01/04/2016
%
% Description:
%
%
%

clear all
clc

N_teams = 6;
N_weeks = 5;

N_teams_per_match = 2; % fixed for soccer

TeamNumList = 1:1:N_teams;

Match_Combinations = nchoosek(TeamNumList,2);
N_combinations = length(Match_Combinations);
N_matches_per_week = N_combinations/N_weeks;

Schedule = zeros(N_matches_per_week, 2, N_weeks);

flag = 0;
iter = 1;
iterMax = 100;

while flag == 0
    
    try % execute random selection protocol until criteria is met

        D0 = Match_Combinations;

        for h = 1:N_weeks

            D1 = D0;

            for i = 1:N_matches_per_week

                % -- Pick --
                [pick, D1] = PickRandMatchCombination(D1);

                % -- Eliminate Pick from Combinations --

                [D0] = RemovePrevPickFromMatchCombinations(pick,D0);

                % -- Store Pick --

                Schedule(i,:,h) = pick;

                % -- Edit Array --

                [D1] = RemovePrevTeamFromWeekMatches(pick,D1);

                Schedule(:,:,h);

            end % end of "matches" or "i" loop


        end % end of "weeks" or "h" loop
        
        flag = 1;
        
    catch
        
        flag = 0;
        
    end
    
    iter = iter + 1;
    
    if iter == iterMax
        
        flag == 2;
        
        disp('Program Failed!');
        
    end
    
end
