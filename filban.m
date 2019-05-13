% Produces the bank of bandpass filters and
% decides what key was pressed
function key = filban(x, tm, CenterF, h, num, print) % print is boolean
    n = [];
    for i=1:length(CenterF)     % cycle through each filter
        zz = maxAmp(x,h(:,i));
        n = [n,zz];     % creates a binary vector representing
                        % which bandpass filter had significant output
        if print ~= 0
            figure(num)
            stem(abs(n));
            title(['Filter Bank Output for Key #: ',num2str(num)]);
            grid on
            xlabel('Filter Number');
            ylabel('Magnitude');
            axis([0 10 0 1.2]);
        end
    end
    rc = find(n==1);     % creates a vector storing the index for the
                         % row and column of the key that was pressed
    if length(rc) == 2 && rc(1) <= 4 && rc(2) >= 5
        key = char(tm(rc(1),rc(2)-4));  % sets key equal the char that was pressed
    else
        key = '?';          % checks for impossible values
    end
    if print ~= 0
        disp(['Touch-Tone Symbol #',num2str(num),' = ',key])
    end
end
