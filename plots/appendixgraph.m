% 文件名列表
fileNames = {'per_approval_top2.fig', 'per_approval_top3.fig', 'per_approval_top4.fig'}; % 假设文件名按这种方式命名

% 打开文件并获取坐标轴
for j = 1:3
    % 正确加载文件名
    hf(j) = open(['C:\Users\86198\OneDrive\桌面\votingmethod\Voting-Methods-Simulation\', fileNames{j}]);
    % 获取图形坐标轴
    fig(j) = get(hf(j), 'CurrentAxes');
end

% 创建新的图形窗口
figure;

for i = 1:3
    % 创建子图
    subplot(1, 3, i); % 因为i从2开始，这里要做减一操作
    axChildren = get(fig(i), 'Children');
    % 将图形内容复制到当前子图
    copyobj(axChildren, gca);
    % 关闭加载的文件
    close(hf(i));

    if i == 1
        title(sprintf('Top 2'), 'Interpreter', 'none');
    elseif i == 2
            title(sprintf('Top 3'), 'Interpreter', 'none');
            
    else
        title(sprintf('Top 4'), 'Interpreter', 'none');
    end
    if i == 1
        xlabel('Candidates'); % 设置横轴标签
        ylabel('Winning Probability'); % 设置纵轴标签
    end


end

% 在整个图形上添加注释
annotation('textbox', [0, 0, 0.3, 0.05], 'String', 'Number of simulations = 200 Sigma = 0.35 Using Approval Voting based on perceived preference', 'EdgeColor', 'none', 'HorizontalAlignment', 'left', 'FontSize', 12);
