function y = moving_avg(a)
%     3 pt moving avg
%     y = [a(1) + a(2); a(1:end-2) + a(2:end-1) + a(3:end); a(end-1) + a(end)]/3;
%     5 pt moving avg
    y = movmean(a,20);
end