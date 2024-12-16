% using Borda Count
function winner_probabilities = bordacount(n_parties,n_voters,n_simulation,P,sigma)
    winner_counts = zeros(1,n_parties);
    for c = 1:n_simulation
        X = -1 + 2 * rand(1,n_voters); % underlying voter bliss point
        D = abs(X' - P); % each row vector represents the distance vector of voter towards each party 
        %calculate the perceived preference
        P_per = [];
        for j = 1:n_voters
            P_per_j = zeros(1,n_parties); % "per" means perceived
            for i = 1:n_parties
                P_per_j(i) = normrnd(P(i),sigma);
                P_per_j(i) = max(-1,P_per_j(i));
                P_per_j(i) = min(1,P_per_j(i));
            end
            P_per(j,:) = P_per_j;
        end
        %calculate the perceived distance
        D_per = abs(X' - P_per);
        %find the actual winner
        [~,D_per_index] = sort(D_per,2);
        Victory = zeros(1,n_parties);
        for q = 1:size(D_per_index)
            for w = 1:n_parties
                Victory(w) = Victory(w) + 6 - find(D_per_index(q,:) == w,1);
            end
        end
        [~,winner] = max(Victory);
        winner_counts(winner) = winner_counts(winner) + 1;
    end
    %calculate the distribution
    winner_probabilities = winner_counts / n_simulation;
    figure;
    bar(winner_probabilities, 'FaceColor', [0.2, 0.6, 0.8]);
    title('Perceived Preference + Borda Count');
    xlabel('Candidate');
    ylabel('Winning Probability');
    xticks(1:n_parties); % 设置 x 轴刻度为候选人编号
    grid on;
    disp("winners distribution")
    disp(winner_probabilities)
   end