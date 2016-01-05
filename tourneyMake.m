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

% **Need update for multiple groups
% **Need update for uneven teams

clear all;
clc;

Nteams = 6;
Nweeks = 3;

TeamNumList = 1:1:Nteams;

Schedule = zeros(Nteams/2,2,Nweeks);

for h = 1:Nweeks
    
    data0 = TeamNumList;
    
    if h == 1 % only for the first week

        for i = 1:Nteams/2

            for j = 1:2 % number of teams per game (only works with two)

                pick = datasample(data0,1); % first pick, first round

                index0 = find(data0 == pick);
                data0(index0) = [];

                Schedule(i,j,h) = pick;

            end % end of for-loop

        end % end of for-loop
        
    elseif h > 1
        
        for i = 1:Nteams/2
        
            pick = datasample(data0,1);
            index0 = find(data0 == pick);
            data0(index0) = [];

            Schedule(i,1,h) = pick;
            
            % now find the previous matches
            % index1 = zeros(h-1,2);
            data1 = data0;
            for k = 1:h-1

                [index1(k,1), index1(k,2)] = find(Schedule(:,:,k) == pick);

                if index1(k,2) == 1

                    index2 = 2;

                elseif index1(k,2) == 2

                    index2 = 1;

                end

                index3 = find(data1 == Schedule(index1(k,1),index2,k));
                data1(index3) = [];

            end % end of "k" for-loop
            
            pick = datasample(data1,1);
            Schedule(i,2,h) = pick;

            index0 = find(data0 == pick);
            data0(index0) = []; 

        end

    end
    
end % end of for-loop

    
 Schedule