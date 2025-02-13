% testAMARES.m
ver
run('../startup.m')

N=1024;
dwellTime=0.002; % in seconds
timeAxis=(0:N-1)*dwellTime;
T2star=0.3; % in seconds
larmor_frq=200; % in Hz
fid=exp(-timeAxis/T2star+1i*2*pi*larmor_frq*timeAxis);


exptParams.samples=N;
exptParams.imagingFrequency=larmor_frq*1e-6;
exptParams.timeAxis=timeAxis;
exptParams.dwellTime=dwellTime;
exptParams.ppmAxis=((0:N-1)-floor(N/2))/dwellTime/N; % 1ppm = 1Hz
exptParams.offset=200;
exptParams.beginTime=0;

pk=AMARES.priorKnowledge.PK_SinglePeak;
showPlot=2;
disp("first attempt with `fid`")
[results, status]=AMARES.amaresFit(fid.', exptParams, pk, showPlot);
size_fid=size(fid.')
disp("second attempt with `fid.'`")
[results, status]=AMARES.amaresFit(fid, exptParams, pk, showPlot);
size_fid=size(fid)

%% output
% >> test_issue4                       
% -----------------------------------------------------------------------------------------------------
% MATLAB Version: 9.2.0.1226206 (R2017a) Update 4
% MATLAB License Number: 40482169
% Operating System: Linux 5.15.0-119-generic #129~20.04.1-Ubuntu SMP Wed Aug 7 13:07:13 UTC 2024 x86_64
% Java Version: Java 1.7.0_60-b19 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode
% -----------------------------------------------------------------------------------------------------
% MATLAB                                                Version 9.2         (R2017a)
% Curve Fitting Toolbox                                 Version 3.5.5       (R2017a)
% Image Processing Toolbox                              Version 10.0        (R2017a)
% Optimization Toolbox                                  Version 7.6         (R2017a)
% Parallel Computing Toolbox                            Version 6.10        (R2017a)
% Signal Processing Toolbox                             Version 7.4         (R2017a)
% Statistics and Machine Learning Toolbox               Version 11.1        (R2017a)
% Wavelet Toolbox                                       Version 4.18        (R2017a)
% Wiping the Matlab path...
% OXSA version 2.1: completed startup.m

%          initial values for 1 peaks

%     'peakName'     'Peak1'
%     'chemShift'    '[0]'  
%     'linewidth'    '[11]' 
%     'amplitude'    '[0.9]'
%     'phase'        '[0]'  

%          prior knowledge for 1 peaks

%     'peakName'            'Peak1'
%     'multiplet'           '[]'   
%     'chemShiftDelta'      '[]'   
%     'amplitudeRatio'      '[]'   
%     'G_linewidth'         '[]'   
%     'G_amplitude'         '[]'   
%     'G_phase'             '[]'   
%     'G_chemShiftDelta'    '[]'   
%     'refPeak'             '[0]'  

%          upper and lower bounds for 1 peaks

%     'peakName'          'Peak1'     
%     'chemShift'         '[-Inf Inf]'
%     'linewidth'         '[0 Inf]'   
%     'amplitude'         '[0 Inf]'   
%     'phase'             '[0 360]'   
%     'chemShiftDelta'    '[]'        
%     'amplitudeRatio'    '[]'        
% first attempt with `fid`
% Iterations = 20.
% Norm of residual = 74.501
% Norm of the data = 75.501
% resNormSq / dataNormSq = 0.987
% CRBs not calculated, add optional 4th output argument to call to calculate.
% zeroOrderPhaseRad = 0.000
% size_xAxis =
%            1        1024
% size_std_residual =
%            1        1024
% size_residual =
%         1024        1024
% size_fid =
%         1024           1
% second attempt with `fid.'`
% Error using \
% Matrix dimensions must agree.
% Error in AMARES.initializePriorKnowledge (line 38)
% linearFit = FIDmatrix \ inputFid;
% Error in AMARES.amaresFit (line 61)
% [pkWithLinLsq,pkWithLinLsq_orig_phase]= AMARES.initializePriorKnowledge(pk, exptParams, inputFid);
% Error in test_issue4 (line 27)
% [results, status]=AMARES.amaresFit(fid, exptParams, pk, showPlot);