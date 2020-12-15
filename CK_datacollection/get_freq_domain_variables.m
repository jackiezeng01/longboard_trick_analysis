function [freq, amplitude] = get_freq_domain_variables(x, Fs)


if(mod(length(x),2) ~=0)
    x = x(1:end-1);
end

freq = linspace(-Fs/2, Fs/2-Fs/length(x),length(x));
amplitude = 1/length(x)*fftshift(abs(fft(x)));