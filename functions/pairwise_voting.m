% using pairwise voting
function winner_probabilities = pairwise_voting(n_parties, n_voters,n_simulation,P) % D is the distance matrix, namely the preference matric
    winner_counts = zeros(1, n_parties); % record how many times each party wins
    winner_margins = zeros(1,n_parties);

    for w = 1:n_simulation
        X = -1 + 2 * rand(1,n_voters); % underlying voter bliss point
        D = abs(X' - P); % each row vector represents the distance vector of voter towards each party 
        [~,D_indices] = sort(D,2);
        Victory = zeros(n_parties, n_parties); % victory matrix, used to restore
        for i = 1:n_parties
            for j = 1:n_parties
                if i ~= j
                    vic = 0;
                    for q = 1:size(D_indices)
                        rank_i = find(D_indices(q, :) == i); % 找到 i 的排名位置
                        rank_j = find(D_indices(q, :) == j); % 找到 j 的排名位置
                        if rank_i < rank_j
                            vic = vic + 1;
                        else
                            vic = vic - 1;
                        end
                    end
                    Victory(i,j) = vic > 0; 
                end
            end
        end
        vic_times = sum(Victory,2);
        [winner_margin,winner] = max(vic_times);
        winner_counts(winner) = winner_counts(winner) + 1;
        winner_margins(winner_margin) = winner_margins(winner_margin) + 1;
    end

    %calculate the distribution
    winner_probabilities = winner_counts / n_simulation;
    figure;
    bar(winner_probabilities, 'FaceColor', [0.2, 0.6, 0.8]);
    title('Underlying Preference + Pairwise Voting');
    xlabel('Candidate');
    ylabel('Winning Probability');
    xticks(1:n_parties); % 设置 x 轴刻度为候选人编号
    grid on;
    disp("winners distribution")
    disp(winner_probabilities)
    disp("winners win at a margin of ")
    disp(winner_margins)
end

