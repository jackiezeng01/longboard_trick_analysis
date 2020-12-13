function y = movingavg(a_x)
    y = [a_x(1) + a_x(2); a_x(1:end-2) + a_x(2:end-1) + a_x(3:end); a_x(end-1) + a_x(end)]/3;
end
% function y = movingavg(x)
%     y = movmean(x,3, 'Endpoints', 'discard');
%     % Add end elements
%     y = [(x(1)+x(2))/3, y'];
%     y(end+1) = (x(end-1) + x(end))/3;
% end