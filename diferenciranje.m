% Uros Bojanic 2019/0077
f = @(x)(exp(-x)-x);
f_a = @(x,h)((f(x+h)-f(x))/h);
f_b = @(x,h)((f(x)-f(x-h))/h);
f_c = @(x,h)((f(x+h)-f(x-h))/(2*h));
x = 2;
h = 0.002:0.002:0.5;
fpa = zeros(size(h));
fpb = zeros(size(h));
fpc = zeros(size(h));
for i = 1 : size(h,2)
    fpa(i) = f_a(x,h(i));
    fpb(i) = f_b(x,h(i));
    fpc(i) = f_c(x,h(i));
end
fp = -exp(-x) - 1;

figure(1)
plot(h,fpa);hold all;
plot(h,fpb);hold all;
plot(h,fpc);hold all;
plot(h,fp*ones(size(h)),'--','color','red');
grid on
set(gca,'gridlinestyle','--')
legend('a) unapred','b) unazad','c) centralno','Tacna vrednost');
title('Prvi izvod')
xlabel('h')
ylabel('Vrednost prvog izvoda')

err_a = abs(fpa - fp);
err_b = abs(fpb - fp);
err_c = abs(fpc - fp);
figure(2)
plot(h,err_a);hold all;
plot(h,err_b);hold all;
plot(h,err_c);  
legend('a) unapred','b) unazad','c) centralno')
grid on
set(gca,'gridlinestyle','--')
title('Greska prvog izvoda')
xlabel('h')
ylabel('Apsolutna vrednost greske')