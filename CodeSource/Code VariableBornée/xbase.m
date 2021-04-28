function[x]=xbase(base,x,M)%calcul de la sol 
 [m,n]=size(M) ;

 for i =1:m-1
 F=0;
for j =1:n-1
if(j~=base(i))
F=F+(x(j)*M(i,j));
 end
end
 x(base(i))=(M(i,n)-F);
 end
 end