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

Nteams = 10;
Nweeks = 2;


TeamNumList = 1:1:Nteams;

Schedule = zeros(Nteams/2,2,Nweeks);

for h = 1:Nweeks
    
    data = TeamNumList;

    for i = 1:Nteams/2
        
        for j = 1:2

            Schedule(i,j,h) = datasample(data,1);

            index = find(data == Schedule(i,j,h));
            data(index) = [];
            
        end

    end % end of for-loop
    
end % end of for-loop