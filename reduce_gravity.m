function filt_a = reduce_gravity(a, f, reduction_range)
% This function takes an acceleration data set and reduces the amplitude of
% the data at a low frequency range. 

fft_a = fftshift(fft(a));
figure
plot(f, 1/length(a)*abs(fft_a))
hold on

% process data in this range
low_range = -reduction_range;
high_range = reduction_range;
for k = 1:size(fft_a)
    if (f(k) >= low_range && f(k) <= high_range)
        % Make amplitude smaller
        fft_a(k) = fft_a(k)*0.05;
    end
end

filt_a = ifft(ifftshift(fft_a));
end

