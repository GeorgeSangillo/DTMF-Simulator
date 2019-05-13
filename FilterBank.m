% Bank of Band-Pass Filters
%   input is array that stores the pressed keys
%       >> PhoneNo = ['1','2','3','4','5','6','7','8','9','*','0','#'];
%   outputs the symbols on the Command Window
function keys = FilterBank(PhoneNo, print) % print is boolean
    cfreqs = ones(4,1)*[1209,1336,1477,1633];   % defines column matrix
    rfreqs = [697;770;852;941]*ones(1,4);       % defines row matrix
    CenterF = [rfreqs(:,1)' , cfreqs(1,:)];     % defines 1X8 vector of freqs
    tm = [49 50 51 65;52 53 54 66;55 56 57 67;42 48 35 68];
    Fs = 8000;
    N = 205;
    L = 100;
    x = zeros(length(PhoneNo),205);
    % call ImpRes to form matrix of filters
    h = ImpRes(CenterF,L,Fs);    % ww = L by 8 MATRIX of all the filters
    if print ~= 0
        str = {'Legend for Filter Bank Output plots',
               'n=1:  697 Hz     n=2:  770 Hz',
               'n=3:  852 Hz     n=4:  941 Hz',
               'n=5: 1209 Hz     n=6: 1336 Hz',
               'n=7: 1477 Hz     n=8: 1633 Hz'};
        disp(str);
        disp('OUTPUT for Bank of Band-Pass Filters');
    end
    for m=1:length(PhoneNo)
        x(m,:) = encode(PhoneNo(m),tm,Fs,N);
        keys(m) = filban(x(m,:),tm,CenterF,h,m,print);
    end
end
