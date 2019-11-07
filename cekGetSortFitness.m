clc
close all
clear all
pop_size=5

Fitness=[0.0939;0.0358;0.0524;0.3953;0.0708]
% mencari indexsorting secara descending
for i=1:pop_size
    IndexAwal(i) = i;
end

FitnessAwal= Fitness;

    
    
    % 4     5     1     2     3
    % 4     1     5     3     2


for i=1:pop_size
   TempNilaiFx = Fitness(i)
   TempIndexAwal = IndexAwal(i)
   for j=i+1:pop_size
       Fitness(j)
        if (Fitness(j) > TempNilaiFx)
            TempNilaiFx = Fitness(j);
            Fitness(j) = Fitness(i);
            Fitness(i) = TempNilaiFx;
            %TempIndexAwal = IndexAwal(j);
            TempIndexAwal = IndexAwal(j);
            IndexAwal(j) = IndexAwal(i);
            IndexAwal(i) = TempIndexAwal;
        end
   end
end

[FitnessAwal Fitness]
IndexAwal

% pause

IndexSortingDesc=IndexAwal;