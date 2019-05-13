% Produces the two-sided periodogram of the input and
% decides what key was pressed
% Uses Reference [1] as template for decoding using PSD
function key = specanaly(x, tm, Fs, N, num, print) %print is boolean
% Compute the two-sided periodogram of the input
    if print ~= 0
        figure(num)
        periodogram(x,[],'twosided',N,Fs)
        title(['Periodogram PSD for Key #: ',num2str(num)]);
        xlim([0 Fs/2000]);
    end
    PSD = periodogram(x,[],'twosided',N,Fs);
    
% Decide what symbol was pressed
    limit = 0.001; % threshold used on the PSD
    count = 2;
    for m = 1:(N/2)+1
        if count > 0
            if PSD(m) > limit
                count=count-1;
                if count==1
                    r = m;
                else
                    s = m;
                end
            end
        else
            break;
        end
    end
    tem = [(r-1)*(Fs/N),(s-1)*(Fs/N)];
    [h, v] = dec(tem(1),tem(2));
    key = char(tm(h,v));
    if print ~= 0
        disp(['Touch-Tone Symbol #',num2str(num),' = ',key])
    end
end
