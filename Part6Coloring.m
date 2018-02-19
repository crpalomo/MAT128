
z=.1;
c=.36+.1i;
phi = @(z) z^2 + c;
fixpt1 = (1 + sqrt(1-4*c))/2;
fixpt2 = (1 - sqrt(1-4*c))/2;
colormap hot;

for j=1:101,               %initial values with imaginary parts between 
  y = -1 + (j-1)*.02;     % -1 and 1
  for i=1:101,             
      x= -1 + (i-1)*.02; 
      zk= x + 1i*y;         
      iflag1 = 0;          
      iflag2 = 0;         
      kount = 0;           
   
      while kount < 1500 & abs(zk) <=100 & iflag1 < 6 & iflag2 < 6 
          kount = kount+1;
          zk = phi(zk);    % This is the fixed point iteration.
          
          err1 = abs(zk-fixpt1); %Test for convergence to fixpt1.
          if err1 < 1.e-6, iflag1 = iflag1 +1; else, iflag1 = 0; end
          
          err2 = abs(zk-fixpt2); %Test for convergence to fixpt2.
          if err2 < 1.e-6, iflag2 =iflag2+1; else, iflag2 = 0; end
          
      end
      
      if abs(zk)>100
       M(j,i) =kount;
      end       
 end
end

image([-10 10],[-10 10],M), %This plots the results.
pbaspect ([1 1 1]);      %sets the ratio of x axis to y axis equal to 1
axis xy %Otherwise the vertical axis is inverted.

