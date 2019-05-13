% Encode the key presses into a sum of two sinusoids with embedded noise
% Uses Reference [1] from Report as template for encoding
function x = encode(d, tm, Fs, N)
    %   Frequencies   | 1209 Hz | 1336 Hz | 1477 Hz | 1633 Hz
    %        697 Hz   |    1    |    2    |    3    |    A
    %        770 Hz   |    4    |    5    |    6    |    B
    %        852 Hz   |    7    |    8    |    9    |    C
    %        941 Hz   |    *    |    0    |    #    |    D
    
    for p = 1:4
    for q = 1:4
        if tm(p,q) == abs(d);break,end
    end
        if tm(p,q) == abs(d);break,end
    end
    f1 = [697 770 852 941];
    f2 = [1209 1336 1477 1633];
    n = 0:N-1;
% encoded input with embedded noise
    x = sin(2*pi*n*f1(p)/Fs) + sin(2*pi*n*f2(q)/Fs) + randn(size(n));
end
