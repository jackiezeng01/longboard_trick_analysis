function filt_a = reduce_gravity(a, Fs, reduction_range)
% This function takes an acceleration data set and reduces the amplitude of
% the data at a low frequency range. 

% This works on parsed accel data (ex. ax, ay, az) and not the 3 column vector.

fft_a = fftshift(fft(a));

N = size(a);
N = N(1);
f = linspace(-Fs/2 , Fs/2 - Fs/N, N) + Fs/(2*N)*mod(N,2);

% set range
low_range = -reduction_range;
high_range = reduction_range;

% process data for set range
for k = 1:size(fft_a)
    if (f(k) >= low_range && f(k) <= high_range)
        % Make amplitude smaller
        fft_a(k) = fft_a(k)*0.05;
    end
end

% output
filt_a = ifft(ifftshift(fft_a));
end

