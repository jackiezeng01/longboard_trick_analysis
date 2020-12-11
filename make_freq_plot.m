function make_freq_plot(x, Fs, title_)

% make a frequency domain plot with frequency labels
%
%   x = input signal
%   Fs = sampling frequency in Hz
%   title = title of plot

if(mod(length(x),2) ~=0)
    x = x(1:end-1);
end

plot(linspace(-Fs/2, Fs/2-Fs/length(x),length(x)), 1/length(x)*fftshift(abs(fft(x))))

ylabel('Magnitude of FFT');
xlabel('Frequency (Hz)');
title(title_)
