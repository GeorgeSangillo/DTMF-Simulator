% Used to decide values for row and column based on audio tones
% for Specrum Analysis Method
function [h,v] = dec(f1,f2)
    if     f1<733
        h = 1;
    elseif f1<811
        h = 2;
    elseif f1<896
        h = 3;
    elseif f1<1075
        h = 4;
    end
    if     f2<1272
        v = 1;
    elseif f2<1406
        v = 2;
    elseif f2<1555
        v = 3;
    elseif f2<1800
        v = 4;
    end
end
