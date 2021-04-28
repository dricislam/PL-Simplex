function [x,base,z]=simplexe_brn(A,b,c,p,x,BI,BS,base)
  
 M=[A b ; c p];
   [s,S1,S2,S]=colonne_pivot(M,x,BI,BS)
 if (S==0)%optimum
 [m,n]=size(M) ;
 F=0;
 for j =1:n-1
 F=F+(x(j)*M(m,j)) ;
 end
 z=(F-M(m,n));
 else 
 while (S~=0) 
 if(S==S1 )
  [r,R1,R2,R]= cas_1 (M,x,BS,s,base)
if (R==R1 && R~=BS(s) && R~=R2)
 M=pivotage (M,r,s) ;
 x(base(r))=BI(base(r));
 base(r)=s;
[x]=xbase(base,x,M)
 end
 if (R==R2 && R~=R1 && R~=BS(s))
M=pivotage (M,r,s) ;
x(base(r))=BS(base(r));
base (r)=s ;
 [x] = xbase(base,x,M) 
 end
if (R==BS(s))
 x(s)=BS( s ) ;
 [x]=xbase(base,x,M) 
 end

 end

if (S==S2 && S~=S1)

 [r,R1,R2,R]=cas_2(M,x,BI,BS,s,base)

 if (R==R1 && R~=BS(s) && R~=R2)
 [M]=pivotage (M,r,s); %Changement de base
x(base(r))=BI(base(r));
base(r)=s ;
 [x]=xbase(base,x,M)
 end
 if(R==R2 && R~=R1 && R~=BI( s ) )
[M]=pivotage(M,r,s);
 x(base(r))=BS(base(r));
 base(r)=s;
 [x]=xbase(base,x,M) 
 end
 if (R==BI(s))
 x(s)=BI(s);%pas de changengement de base
 [x] = xbase(base,x,M)
 end
 end

 [s,S1,S2,S] =colonne_pivot(M,x,BI,BS)

 end

 [m,n]=size(M);
 F=0;
 for j =1:n-1
 F= F+(x(j)*M(m,j));
 end
 z =(F-M(m,n))%la valeur de la fonction objective

end
 end

