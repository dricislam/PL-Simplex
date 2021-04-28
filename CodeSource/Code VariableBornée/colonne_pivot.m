function [s,S1,S2,S] = colonne_pivot(M,x ,BI ,BS)%choix de la colonne pivot "la var rentrante"
[m,n]=size(M) ;
F=0;

i =1;
while (i<=n-1 && F==0)
if (M(m,i)>0 && x(i)==BI(i)) %parcourir le vecteur coût ac xi=Binf 
    F=M(m,i);
 j=i ;
 end
 i=i +1;
 end
 if F>0
 for i =1:n-1 
 if(M(m,i)>F && M(m,i)>0 && x(i)==BI(i))%prendre le max des ci ac xi=Binf
 F=M(m,i); 
 j=i ;
 end
 end
 S1=F;%le max des ci ac xi=Binf
 else 
 S1=0; j =0;
 end
 G=0; i =1;
 while ( i<=n-1 && G==0)
 if (M(m,i)<0 && x(i)==BS(i))%parcourir le vecteur cout ac xi=Bsup
 G=M(m, i ) ;
 k=i ;
 end
 i=i +1;
 end
 if G<0
 for i =1:n-1
 if (M(m,i)<G && M(m,i)<0 &&x(i)==BS(i))%prendre le max des ci ac xi=Bsup
 G=M(m, i ) ;
 k=i ;
 end
 end
 S2=-G;%-ci ac xi=Bsup
 else
 S2=0; k=0;
 end
 S=max(S1 ,S2) ;
 if (S==S1 && S~=0)
 s=j;%indice de colonne pivot
 end
 if (S==S2 && S~=S1 && S~=0)
 s=k ;%indice de colonne pivot
 end
 if (S==0)%optimum
 s=0;%indice de l'optimum 
 end
 end