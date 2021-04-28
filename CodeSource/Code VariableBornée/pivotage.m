function [T] = pivotage (M,r,s)
[m,n] = size(M) ;

 for j = 1:n
 T(r,j) = M(r,j)/M(r,s) ;
end

for i =1:m
if(i~=r)
for j =1:n
 T(i,j) = M(i,j)-M(i,s)*T(r,j);
 end
end
end

 end