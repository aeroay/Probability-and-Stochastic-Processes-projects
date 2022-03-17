%project 1
clc; clear; close all;
N = 26;
%% importing file and extracting data
file ="Sample.txt";
%input('Enter the file name: ','s');
fid = fopen(file,'r');
txt = lower(fscanf(fid,'%s'));
character = 'a':'z';
for n=1:26
    freq(n)=length(strfind(txt,character(n)));
end
%% Most 5 repeated characters
[max,index] = maxk(freq,5);
fprintf('The most five repested characters are: \n')
for i=1:5
fprintf('%d. %c with a frequency of %d \n',i,upper(character(index(i))), max(i))
end
%% calculating statistics of the data
c = 1:26;
charP = freq/sum(freq);  %charcter probability
mean = sum(c.*charP);
variance =sum((c-mean).^2.*charP);
sd = sqrt(variance);     %standard deviation
skew = sum((c-mean).^3)/(N*sd^3);
kurt = sum((c-mean).^4)/(N*sd^4);
%% plotting PMF, CDF
%pmf
figure(1)
x = {'a ','b ','c ','d ','e ','f ','g ','h ','i ','j ','k ','l ','m ','n ','o ','p ','q ','r ','s ','t ','u ','v ','w ','x ','y ','z'};
X = categorical(x);
X = reordercats(X,x);
bar(X,charP)
title('PMF')
ylabel('f(x)')
xlabel('x')
%cdf
figure(2)
for i = 1:26
    cdf(i)=sum(charP(1:i));
end 
xx = 0:26;
cdf = [0 cdf];
 stairs(xx,cdf)
title('CDF')
ylabel('F(x)')
xlabel('x')
