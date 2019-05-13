% Impulse Response of Bandpass Filter
function h = ImpRes(CenterF, L, fs)
    h = ones(L,1)*ones(1,8);
    n =0:L-1;
    w = -pi:pi/2000:pi;
    h1 = cos(0.2*pi*n);
    H1 = freqz(h1,1,w);
    A = 1/max(abs(H1));
    for i=1:length(CenterF)
        h(:,i) = A*cos(2*pi*CenterF(i)*n/fs);
    end
end
