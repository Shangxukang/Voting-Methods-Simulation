clear,clc;
n_point = 7; % 7 points for defining 6 parties.
n_parties = 6;
P_raw = linspace(-1,1,n_point);  
P = (P_raw(1:end-1) + P_raw(2:end)) / 2; % underlying parties position
n_voters = 2000;% number of voters
n_simulation = 200;
sigma = 0.35;

% find the underlying winner using pairwise voting
%winner_probabilities_best = pairwise_voting(n_parties,n_voters,n_simulation,P);
% CONCLUSION here is that 3 and 4 are best choice.

%find the actual winner using Borda Count
%winner_probabilities_borda = bordacount(n_parties,n_voters,n_simulation,P,sigma)

%find the actual winner using Approval Voting
winner_probabilities_approval = approvalvoting(n_parties,n_voters,n_simulation,P,sigma) 

%find the actual winner using plurality voting
%winner_probabilities_plurality = pluralityvoting(n_parties,n_voters,n_simulation,P,sigma)

