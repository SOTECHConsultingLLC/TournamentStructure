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

for h = 1:2%Nweeks
    
    data0 = TeamNumList;
    
    if h == 1 % only for the first week

        for i = 1:Nteams/2

            for j = 1:2 % number of teams per game (only works with two)

                pick0 = datasample(data0,1); % first pick, first round

                index0 = find(data0 == pick0);
                data0(index0) = [];

                Schedule(i,j,h) = pick0;

            end % end of for-loop

        end % end of for-loop
        
    elseif h > 1
        
        for i = 1:Nteams/2
            
            data1 = data0;
            data2 = data0;
            
            % -- first column --
            
            % do not allow the same choice from the corresponding line from
            % the previous week
            index0 = find(data1 == Schedule(i,1,h-1));
            data1(index0) = [];
            
            % pick column element
            pick1 = datasample(data1,1);
            index1 = find(data1 == pick1);
            index2 = find(data2 == pick1);
            index3 = find(data0 == pick1);
            data1(index1) = [];
            data2(index2) = [];
            data0(index3) = [];
            
            % store pick
            Schedule(i,1,h) = pick1;
            
            % -- second column --
            index4 = zeros(h-1,2);
            for k = 1:h-1

                [index4(k,1), index4(k,2)] = find(Schedule(:,:,k) == pick1);

                if index4(k,2) == 1

                    index2 = 2;

                elseif index4(k,2) == 2

                    index2 = 1;

                end

                index4 = find(data2 == Schedule(index4(k,1),index2,k));
                data2(index4) = [];

            end % end of "k" for-loop
            
            pick3 = datasample(data2,1);
            Schedule(i,2,h) = pick3;

            index4 = find(data2 == pick3);
            index5 = find(data0 == pick3);
            data2(index4) = []; 
            data0(index5) = [];

        end

    end
    
end % end of for-loop

    
Schedule(:,:,1:2)