clc
clear
L = readmatrix('limits.txt');
file = fopen('C:\Users\Misha\Desktop\проект\Imatlab.txt','w+');



f = @(x)(exp(3*x));
tic
for i = 1:100
    res = integral(@(x) f(x),L(i,1),L(i,2));
    fprintf(file,'%f \n',res);
    
end
tm = toc;
fprintf(file,'%6s%3.12f','time: ',tm);
fclose(file);
