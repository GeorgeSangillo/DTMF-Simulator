N = 1000;     % number of tests
n = 10;     % number of digits per test
for i=1:N
    print = 0; % turns OFF all figures
    tm = [49 50 51 65;52 53 54 66;55 56 57 67;42 48 35 68]; % chars used
% randomly choose which keys are pressed
    for k=1:n
        r = randi([1 4],1);
        c = randi([1 4],1);
        corrKey(i,k) = char(tm(r,c));
    end
    
% Test the two methods
    keys_Spec(i,:)  = SpectrumAnalysis(corrKey(i,:),print);
    keys_Filt(i,:)  = FilterBank(corrKey(i,:),print);
% Compares the orignal string with the decoded output by digit
    for k=1:n
        Success_Spec_perDig(i,k) = strcmp(corrKey(i,k),keys_Spec(i,k));
        Success_Filt_perDig(i,k) = strcmp(corrKey(i,k),keys_Filt(i,k));
    end
% Compares the orignal string with the decoded output by sequence
    Success_Spec_perSeq(i) = strcmp(corrKey(i,:),keys_Spec(i,:));
    Success_Filt_perSeq(i) = strcmp(corrKey(i,:),keys_Filt(i,:));
end
perc_Spec_T = sum(sum(Success_Spec_perDig)) / N / n * 100;
perc_Filt_T = sum(sum(Success_Filt_perDig)) / N / n * 100;
perc_Spec_I = sum(Success_Spec_perSeq) / N * 100;
perc_Filt_I = sum(Success_Filt_perSeq) / N * 100;
disp(['Success Percentage of Digit for Spectrum Analysis:    ',num2str(perc_Spec_T),'%']);
disp(['Success Percentage of Digit for Filter Bank:          ',num2str(perc_Filt_T),'%']);
disp(['Success Percentage of Sequence for Spectrum Analysis: ',num2str(perc_Spec_I),'%']);
disp(['Success Percentage of Sequence for Filter Bank:       ',num2str(perc_Filt_I),'%']);
