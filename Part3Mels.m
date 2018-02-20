c = .36 + .1*1i;

zkr = zeros(361*141, 1);
zki = zeros(361*141, 1);

for j = 1:141
    y = -.7 + (j-1)*.01;
    for i = 1:361
        x = -1.3 + (i-1)*.01;
        z = x + 1i*y;
        zk = z;
        kount = 0;
        while kount < 100
            rzk = real(zk);   %Spliting up into Real & Imaginary Parts
            rc = real(c);     %to calculate r & theta
            imzk = imag(zk);
            imc = imag(c);
            kount = kount + 1;
            r = sqrt((rzk-rc)^2 +(imzk-imc)^2); %Finding r using real & im parts
            if (rzk-rc) > 0
                theta = atan((imzk-imc)/(rzk-rc)); %finding theta using real & im parts
            elseif (rzk-rc) < 0
                theta = atan((imzk-imc)/(rzk-rc))+pi; %Since we have to keep
                                           % within range of arctan
            end
            ran = randi(2);   %We have to randomly pick if we have pos
            if ran == 2       %or negative sqrt value
               ran = -1; 
            end
            zk = ran*sqrt(r)*(cos(theta/2) + 1i*sin(theta/2));  
        end  
        zkr(i + (j-1)*261) = real(zk); %Stores our real & imag values
        zki(i + (j-1)*261) = imag(zk);        
    end
end

plot(zkr, zki,'r.') %Plots red boundary of Julia set, real as x, im as y