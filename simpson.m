% Uros Bojanic 2019/0077
f = @(x)1/(1+x^2);
a = -4;
b = 4;
I = zeros(8,1);
for k = 1 : 8
    h = (b-a)/(2^k);
    s = f(a) + f(b);
    for i = 1 : 2^(k-1) - 1
        s = s + 4 * f(a + (2*i-1)*h) + 2 * f(a + (2*i)*h);
    end
    I(k) = h / 3 * s;
    fprintf('k = %d\tI = %.5f\n', k, I(k));
end
I_a = 2 * atan(4);
fprintf('tacno\tI = %.5f\n', I_a);

figure(1)
plot(I);
hold all;
plot(I_a*ones(8),'--','color','red');
grid on
set(gca,'gridlinestyle','--')
legend('Simpsonova formula','Tacna vrednost');
title('Simpsonova formula')
xlabel('k')
ylabel('Vrednost integrala')

err = abs(I - I_a);
figure(2)
plot(err,'color','red');
grid on
set(gca,'gridlinestyle','--')
title('Greska Simpsonove formule')
xlabel('k')
ylabel('Apsolutna vrednost greske')