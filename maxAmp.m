% Looks at the peaks and decides if it's above the threshold
% which means that there was a tone at the center frequency
% of the bandpass
function peak = maxAmp(x, h)
    x = x*((2./max(abs(x))))';% Scales x[n] to the range [-2,+2]
    y = conv(x,h);      % convolution of signal with BPF impulse response
    n = max(abs(y));    % binary output of signal presence in waveform
    if(n >= .4)     % 0.4 is the threshold value
        peak = 1;   % ABOVE threshold
    else
        peak = 0;   % BELOW threshold
    end
end
