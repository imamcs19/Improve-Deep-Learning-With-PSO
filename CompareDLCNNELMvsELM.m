clc
clear all
close all
warning off

% typeFitur
% typeFitur, jika = 0, maka default, merger dari Filter ke-1,2 dan 3
% jika = 1, maka hanya menggunakan Filter ke-1
% jika = 2, maka hanya menggunakan Filter ke-2
% jika = 3, maka hanya menggunakan Filter ke-3
% jika = 4, maka hanya menggunakan rata-rata Filter ke-1,2, dan 3 type A
% sehingga banyak fitur sama dengan numel(hP{1}{1}(:)');
% jika = 5, maka hanya menggunakan rata-rata Filter ke-1,2, dan 3 type B
% sehingga banyak fitur sama dengan bykFilter
typeFitur = 6

% banyak percobaan
% nCoba = 25
% nLoop = 10
nCoba = 1
nLoop = 1
for i=1:nCoba
    for j=1:nLoop
        
        % ELM 
        tic;
        hasilELM(i,j)=FnArsitekeLM;
        toc;
        time_hasilELM(i,j)=toc;
        
        % DLCNN-ELM
        tic;
        hasilDLCNNELM(i,j)=FnArsitekDLCNNeLM(typeFitur);
        toc;
        time_hasilDLCNNELM(i,j)=toc;
        
        % PSO-DLCNN-ELM
        tic;
        hasilPSODLCNNELM(i,j)=FnArsitekPSODLCNNeLM(typeFitur);
        toc;
        time_hasilPSODLCNNELM(i,j)=toc;
        
        disp(strcat("Uji ke-",num2str(i)," Loop ke-",num2str(j)));
    end
    final_time_hasilELM(i)=mean(time_hasilELM(i,:));
    final_time_hasilDLCNNELM(i)=mean(time_hasilDLCNNELM(i,:));
    Min_hasilELM(i)=min(hasilELM(i,:));
    Min_hasilDLCNNELM(i)=min(hasilDLCNNELM(i,:));
    Mean_hasilELM(i)=mean(hasilELM(i,:));
    Mean_hasilDLCNNELM(i)=mean(hasilDLCNNELM(i,:));
end

[hasilELM' hasilDLCNNELM']

plot([hasilELM' hasilDLCNNELM'])

save('hasilakhir.mat','hasilELM','hasilDLCNNELM','Min_hasilELM','Min_hasilDLCNNELM',...
    'Mean_hasilELM','Mean_hasilDLCNNELM')

disp("Done......!");