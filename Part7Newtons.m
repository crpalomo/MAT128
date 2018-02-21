%PART 7:NEWTON'S METHOD

n=2;
phi = @(zz) zz.^n + 1;
phiprime= @(w) n.*w.^(n-1);
nmax=800;
max=40;
xmin=-1;ymin=-1;
xmax=1; ymax=1;

%Creating LinSpace likein mandelbrot.m
[x,y] = meshgrid(linspace(xmin, xmax, nmax), linspace(ymin, ymax, nmax));
z=x+1i*y;
zk=zeros(size(z));
k=zeros(size(z));

for j = 1:max
    zk = z - phi(z)./phiprime(z); %Newton's Interation
    k(abs(zk) > 2 & k == 0) = max - j; %Checking divergence
    z=zk;
end

x=[xmin,xmax];
y=[ymin,ymax]; %Setting x&y values for the image
figure,
imagesc(x,y,k),
colormap hot %Color scheme- Black means convergence, border is fixed points
axis square