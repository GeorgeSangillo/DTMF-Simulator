% Modulation and Filtering
%   input is array that stores the pressed keys
%       >> PhoneNo = ['1','2','3','4','5','6','7','8','9','*','0','#'];
%   outputs the symbols on the Command Window and the periodograms
function keys = Modulation(PhoneNo, print) % print is boolean
    tm = [49 50 51 65;52 53 54 66;55 56 57 67;42 48 35 68];
    Fs = 8000;
    N = 205;
    x = zeros(length(PhoneNo),205);
    if print ~= 0
        disp('OUTPUT for Modulation and Filtering');
    end
    for m=1:length(PhoneNo)
        x(m,:) = encode(PhoneNo(m),tm,Fs,N);
        % here would be function for modulation
        % here would be function for filtering
    end
end
