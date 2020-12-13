function y = moving_avg(a)
    y = [a(1) + a(2); a(1:end-2) + a(2:end-1) + a(3:end); a(end-1) + a(end)]/3;
end
% function y = movingavg(x)
%     y = movmean(x,3, 'Endpoints', 'discard');
%     % Add end elements
%     y = [(x(1)+x(2))/3, y'];
%     y(end+1) = (x(end-1) + x(end))/3;
% end