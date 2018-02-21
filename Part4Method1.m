c= imread('FilledUnit.png');
c = rgb2gray(c);
[rows, columns, numberOfColorChannels] = size(image);


if ndims(c)==3
    if size(c,3)==3 && size(c,1)>=8 && size(c,2)>=8
        c = sum(c,3);
    end
end

if length(c)==numel(c)
    dim=1;
    if size(c,1)~=1   
        c = c';
    end   
end

width = max(size(c)); 
p = log(width)/log(2); 


if p~=round(p) || any(size(c)~=width)
    p = ceil(p);
    width = 2^p;
            mz = zeros(width, width);
            mz(1:size(c,1), 1:size(c,2)) = c;
            c = mz;
end

n=zeros(1,round(p+1));

n(round((p+1))) = sum(c(:));
        for g=(p-1):-1:0
            siz = 2^(p-g);
            siz2 = round(siz/2);
            for i=1:siz:(width-siz+1)
                for j=1:siz:(width-siz+1)
                    c(i,j) = ( c(i,j) || c(i+siz2,j) || c(i,j+siz2) || c(i+siz2,j+siz2) );
                end
            end
            n(g+1) = sum(sum(c(1:siz:(width-siz+1),1:siz:(width-siz+1))));
        end
        
n = n(end:-1:1);
r = 2.^(0:p); 

loglog(r,n);
xlabel('r, box size'); ylabel('n(r), number of boxes');
coefficients = polyfit(x,y, 1);