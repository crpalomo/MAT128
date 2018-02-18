%Mandelbrot Set
function mandelbrot(n, max)
n=800; %height&width of image
max=40; %Maximum number of iterations
xmin = -1.5;   xmax = .6; %x & y max and min
ymin = -1.26; ymax = 1.26;

%We create a grid that our c will span
%It's a square around out x and y max/min
[x,y] = meshgrid(linspace(xmin, xmax, n), linspace(ymin, ymax, n));

%Creating an array of space to keep the iterative values, z
%and the number of iterations it took to diverge, k
c = x + 1i * y;
z = zeros(size(c));
k = zeros(size(c));

for j = 1:max
    z   = z.^2 + c;
    k(abs(z) > 2 & k == 0) = max - j; %Checking divergence
end

x=[-1.5,.6];
y=[-1.26,1.26]; %Setting x&y values for the image
figure,
imagesc(x,y,k),
colormap hot %Color scheme of mandelbrot set
axis square