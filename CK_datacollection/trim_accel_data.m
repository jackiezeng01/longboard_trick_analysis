function [trimmedTime, trimmedData] = trim_accel_data(t, accel, secondsToTrim)
%trim acceleration data by the number of seconds specified by the user in
%from both the front and the back. 

N = size(accel);
N = N(1);

% Loop through t from front to locate start point.:
for i = 1:size(t)
    if (t(i) >= secondsToTrim)
        % Make as data start.
        data_start = i;
        break
    end
end


% Loop through t from back to locate end point:
end_time = t(N) - secondsToTrim;
for j = N:-1:1
    if (t(j) <= end_time)
        % Make as data start.
        data_end = j;
        break
    end
end

trimmedData = accel(data_start:data_end,:);
trimmedTime = t(data_start:data_end);
end

