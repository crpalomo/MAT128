%%Computing orb(0) to determine if Julia set is connected. If orb is
%%unbounded, Julia set is not connected. If orb stays bounded in 1500
%%iterations, we consider it bounded, thus Julia set connnected.

%We use z as our z0
fprintf('Computing orb(0) to determine connnectivity of Filled Julia Set with\n')
z = .1;
c = -.4+.6i

%Defining Function and Calculating our Fixed Points
phi = @(z) z^2 + c;
fxpt1 = (1 + sqrt(1-4*c))/2;
fxpt2 = (1 - sqrt(1-4*c))/2;

%Setting our initial values
zk = z;
iflag1 = 0;
iflag2 = 0;
kount = 0;
orbit = ones(1500); %We will let it run for 1500 times. If it still does
                    %diverge after this many times, we assume connected

while kount < 1500 && abs(zk) <= 100 && iflag1 < 10 && iflag2 < 10
    kount = kount + 1;
    zk = phi(zk);
    orbit(kount) = zk;

    err1 = abs(zk - fxpt1);
    if err1 < 1e-6
        iflag1 = iflag1 + 1;
    else
        iflag1 = 0;
    end

    err2 = abs(zk - fxpt2);
    if err2 < 1e-6
        iflag2 = iflag2 + 1;
    else
        iflag2 = 0;
    end
end

if kount < 1000
    orbit = orbit(1:kount)';
end

if iflag1 >= 10 || iflag2 >= 10
    fprintf('Filled Julia set is connected, converges to fixed point.\n');
elseif abs(zk) > 100
     fprintf('Orb(0) is unbounded, Filled Julia set is disconnnected.\n');
else
    fprintf('Orb(0) is still bounded after 1500 iterations, assume connnectivity.\n')
end


% image([-high, high], [-low, low], M);
% axis xy
% title(['Part 2: c = ', num2str(c)])