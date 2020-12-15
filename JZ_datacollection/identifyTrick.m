function trickname = identifyTrick(filename)
% This function takes in a file and outputs a string telling you what
% longbaord dance trick it is. The possible tricks are push, 180 step,
% cross step, and peter pan

% process data
[MotionData]=ParseMatlabApp(filename);
t = MotionData.t_Accel; 
accel = MotionData.Accel;

secondsToTrim = 5;
[t, accel] = trim_accel_data(t, accel, secondsToTrim);

Fs = 50;    
reduction_range = 0.1;
ax = reduce_gravity(moving_avg(accel(:,1)), Fs, reduction_range);
ay = reduce_gravity(moving_avg(accel(:,2)), Fs, reduction_range);
az = reduce_gravity(moving_avg(accel(:,3)), Fs, reduction_range);

% get variables in the frequency domain
[ax_freq, ax_amp] = get_freq_domain_variables(ax, Fs);
[ay_freq, ay_amp] = get_freq_domain_variables(ay, Fs);
[az_freq, az_amp] = get_freq_domain_variables(az, Fs);

% find peaks
[max_ax, max_ax_i] = max(ax_amp);
[max_ay, max_ay_i] = max(ay_amp);
[max_az, max_az_i] = max(az_amp);

% freq where highest az peak occurs
max_az_freq = -az_freq(max_az_i);

% logic to determine trick
if max_ax<0.5 && max_ay<0.2
    if max_az_freq > 0.5
        trickname = "180 Step";
    else
        trickname = "Peter Pan";
    end
elseif max_az>1.5
    trickname = "Push";
else
    trickname = "Cross Step";
end
end