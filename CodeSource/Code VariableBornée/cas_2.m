function [r,R1,R2,R] = cas_2(M,x,BI,BS,s,base)%calcul des teta cas où C<0 xi=Bsup
 [m,n]=size(M);
 
 for i =1:m-1
     if M(i,s)<0
Y(i)=(BS(base(i))-x(base(i)))/-(M(i,s));%teta 2
     else
      Y(i)=0;
 end 
 end
H=Y(1);
k=1;
 for i =2:m-1
 G=Y(i);
 if (H==0 && G~=0)
 H=G;
 k=i ;
 end
 if (G>H && G~=0)%max des teta 2
 H=G;
 k=i ;
 end
 end
 if (H~=0)
 R1=H;
 k;
 else
 R1=BI(s);
end
 for i =1:m-1
if M(i,s)>0
 T(i)=x(base(i))/M(i,s);%teta 1
else
 T(i)=0;
end
end
 F=T(1) ; 
 j =1;
 for i =2:m-1
G=T(i) ;
 if (F==0 && G~=0)
 F=G; j=i ;
 end
if (G>F && G~=0)%max des teta 1
F=G; j=i ;
end
 end
if (F~=0)
 R2=F;
 j;
 else
R2=BI(s);
end
 L=[R1 R2 BI(s) ];
 R=max(L);%teta 
if (R==R1 && R~=BS(s))
    r=k;
 end
 if (R==R2 && R~=BS(s) && R~=R1)
     r=j ;
 end
 if R==BS(s) 
     r=0;
end
 end