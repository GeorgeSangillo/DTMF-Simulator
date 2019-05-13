%******************************************************************
% DECODE% keys = decode(x,L,fs)
% returns the list of key names found in x[n]
% keys = decoded keypads
% x = DTMF waveform
% L = filter length
% fs = sampling frequency
%******************************************************************
function keys = decode(x,L,fs)
keypads = ['1','2','3','A';...
'4','5','6','B';
'7','8','9','C';
'*','0','#','D'];
cfreqs = ones(4,1)*[1209,1336,1477,1633];   % defines column matrix
rfreqs = [697;770;852;941]*ones(1,4);       % defines row matrix
CenterF = [rfreqs(:,1)' , cfreqs(1,:)];     % defines 1X8 vector of freqs

% call ImpRes to form matrix of filters
ww = ImpRes( CenterF,L,fs );    % ww = L by 8 MATRIX of all the filters
% call nTones to find the start and end tone indices
[numbeg,numend] = nTones(x,fs);
keys = [];                  % initializes keys
for kk=1:length(numbeg)     % cycle through each tone
    n = [];
    x_1 = x(numbeg(kk):numend(kk)); % Extract one DTMF tone
    for i=1:length(CenterF)         % cycle through each filter
        zz = maxAmp(x_1,ww(:,i));
        n = [n,zz];     % creates a vector of ones and zeros representing
                        % where the frequency components lie.
    end
    aa = find(n==1);    % creates a vector of indicies where ones occur
    
% checks for impossible scores and skips if they are found
    if length(aa) ~= 2 || aa(1) > 4 || aa(2) < 5
        keys = [keys,'error'];
        continue
    end
    row = aa(1);                      % decodes row position from aa
    col = aa(2)-4;                    %decodes col position from aa
    keys = [keys, keypads(row,col)];  %sets keys equal to the current keys
                                      %and the key found in this iteration
end
