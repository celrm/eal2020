clear; clc; close all 

gif('estandar.gif')

% Genera esfera
ts = 1 : 1 : 10000;
x = ts;
y = ts;
z = ts;
for t = ts
    p = random('Normal',0,1);
    q = random('Normal',0,1);
    u = random('Normal',0,1);
    v = random('Normal',0,1);
    w = random('Normal',0,1);
    norm = (p*p + q*q + u*u + v*v + w*w)^(0.5);
    x(t) = u/norm;
    y(t) = v/norm;
    z(t) = w/norm;
end
xb = x;
yb = y;
zb = z;

% Dibuja
h = scatter3(x,y,z,'filled');
axis(2.*[-1 1 -1 1 -1 1]);
xlabel('x'); ylabel('y'); zlabel('z');
pause(1)

% b : bola -> prisma
for i = 0 : .1 : 1;
    set(h, 'xdata', (1-i).*x + ...
        i.*(1/3).*(3-(4/3).*(x.*x+y.*y)).^2.*x.*x...
        , 'ydata', (1-i).*y + ...
        i.*(1/3).*(3-(4/3).*(x.*x+y.*y)).^2.*y.*y...
        , 'zdata', (1-i)*z + ...
        i.*(3.*z-4.*z.*z.*z))
    drawnow
    gif
end
x = (1/3).*(3-(4/3).*(xb.*xb+yb.*yb)).^2.*xb.*xb;
y = (1/3).*(3-(4/3).*(xb.*xb+yb.*yb)).^2.*yb.*yb;
z = (3.*zb-4.*zb.*zb.*zb);
xb = x;
yb = y;
zb = z;

pause(1)
% c : prisma -> prisma
for i = 0 : .1 : 1;
    set(h, 'xdata', (1-i).*x + ...
        i.*(2.*x + y -1)...
        , 'ydata', (1-i).*y + ...
        i.*(2.*y))
    drawnow
    gif
end
x = (2.*xb + yb -1);
y = (2.*yb);
xb = x;
yb = y;

pause(1)
% G : prisma -> diamante
for i = 0 : .1 : 1;
    set(h, 'ydata', (1-i).*y + ...
        i.*(-y.*z))
    drawnow
    gif
end
y = (-yb.*zb);
yb = y;

pause(1)
% Proyección
for i = 0 : .1 : 1;
    set(h, 'zdata', (1-i)*z)
    drawnow
    gif
end
pause(1)