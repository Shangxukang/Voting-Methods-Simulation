
% 文件名列表
fileNames = {'under_pairwise.fig', 'per_approval_top3.fig', 'per_borda.fig', 'per_plura.fig'};
filetitle = {'Underlying Preference + Pairwise Voting', 'Perceived Preference + Approval Voting', 'Perceived Preference + Borda Count', 'Perceived Preference + Plurality Voting'};
for j =1:4
    hf(j) = open(['C:\Users\86198\OneDrive\桌面\votingmethod\Voting-Methods-Simulation\',fileNames{j}]);
    fig(j) = get(hf(j),'CurrentAxes');
end

figure;

for i = 1:4
    subplot(2, 2, i); % 2行2列布局，第i个位置
    axChildren = get(fig(i),'Children');
    copyobj(axChildren,gca);
    close(hf(i));
     if i == 1
        xlabel('Candidates'); % 设置横轴标签
        ylabel('Winning Probability'); % 设置纵轴标签
    end
    title(filetitle{i}, 'Interpreter', 'none'); 
end
annotation('textbox', [0, 0, 0.3, 0.05], 'String', 'Number of simulations = 200 Sigma = 0.35', 'EdgeColor', 'none', 'HorizontalAlignment', 'left', 'FontSize', 12);
