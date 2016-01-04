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

Nteams = 10;
Nweeks = 1;


TeamNumList = 1:1:Nteams;

Schedule = zeros(Nteams/2,2,Nweeks);

data = TeamNumList;

for h = 1:Nweeks

    for i = 1:Nteams/2

        Schedule(i,1,,h) = datasample(data,1)

        index = find(data == Schedule(i,1,h));
        data(index) = []

    end % end of for-loop
    
end % end of for-loop