function [r,R1,R2,R] = cas_1(M,x,BS,s,base)%calcul des teta cas où C>0 xi=Binf
 [m, n]=size (M) ;
 
 for i =1:m-1 %parcour de la colonne pivot 
    if M(i,s)>0 %ai^s>0 
T(i)=x(base(i))/M(i,s);%teta 1
else
T(i)=0 ;
    end
 end
 
F=T(1);
j =1;
 for i =2:m-1
 G=T(i) ;
 if (F==0 && G~=0)
 F=G;
 j=i ;
 end
 if (G<F && G~=0)%min des teta 1
 F=G;
 j=i ;%position de la var sortante
 end
end
 if (F~=0)
 R1=F;%teta 1
 j; 
 else
 R1=BS(s);
 end
 for i =1:m-1
 if M(i,s)<0 %ai^s<0
 Y(i)=(BS(base(i))-x(base(i)))/-(M(i,s)) ;%teta 2
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
 if (G<H && G~=0)%min des teta 2
 H=G; 
 k=i;
 end
 end
 if (H~=0)
 R2=H;%teta 2
 k ; 
 else
 R2=BS(s);
 end
 L=[R1 R2 BS(s)] ;
 R=min(L);%teta 
if (R==R1 && R~=BS(s)) 
    r=j;
 end
if (R==R2 && R~=BS(s) && R~=R1 ) 
    r=k ;
 end
 if R==BS(s) 
     r=0;
 end
 end