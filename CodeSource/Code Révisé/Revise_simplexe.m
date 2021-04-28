function [X_opt,f_opt,etat,itr,J]= Revise_simplexe(A,b,c,inq,Type)
  etat=1; % 1 si (p) admet de solution et -1 sinon
  itr=0; %nombre d'itérations
  [m , n]=size(A);
  Id=eye(m);
  X_opt=[]; %solution obtimal
  f_opt=[]; % valeur obtimal de la fonction objective

  % Ecrire (p) sous la forme standard
  for i=1:m
    if(inq(i)==-1)
      A=[A Id(:,i)];
    else
      A(i,:)= -A(i,:);
      b(i)= -b(i);
      A=[A Id(:,i)];
    end
  endfor

  %la base réalisable de départ
  disp('J est la base realisable de depart');
  J=(n+1 : m+n);
  [m, n]=size(A);
  X=zeros(n,1);
  %solution de base réalisable de départ
  disp('La solution de base de d�part');
  X(J)=b
  c=[c zeros(1,m)];
  c1=c;     %initialisation du vecteur cout réduit

  if(strcmp(Type,'1')) % selection Type de probleme 1 pour maximiser 0 pour minimiser
     M=position(c1); %Chercher les indices positives du vecteur C1
     while( isempty(M) == 0)
       itr=itr+1;
       X=zeros(n,1);
       B=A(:,J); %La Matrice associée a la base J 'Matrice de base'
       pi=c(J)* B^(-1); %vecteur multiplicateur
       c1= c - pi*A; %Le vecteur cout réduit
       S = position(c1);
       if(isempty(S)==1)
         disp('J est une base optimale');
         J=J;   %la base courante est optimale
         X(J)=B^(-1)*b; %la solution associée a la base J
         X_opt=X; % La solution optimale
         f_opt=pi*b; % la valeur optimale
         itr=itr;
         return;
       else
       	 %determier la variable entrante dans la base 
         h=max(c1); % determiner la valeur maximale du vectur C
         s=indice(c1,h); %la rechrche de l'indice de la valeur maximale
         A_s =B^(-1)*A(:,s); %calculer la colonne A_s
         I = position(A_s); %la recherche des indices des valeurs strictement positive 
         if(isempty(I)==1)
           disp('(P) n admet pas de solution optimale'); 
           etat=-1;
           return;
         else
         %detrminer les varibles sortante de la base
           b1=B^(-1)*b; %Le second membre
           L=zeros(1,length(I));
           for i=1:length(I)
             L(i)=b1(I(i))/A_s(I(i));
           endfor
           K=min(L); %la recherche de la valeur minimale du vecteur L
           j=indice(L,k); %la recherche de l'indice de la valeur minimal dans L 
           r=I(j); %l'indice de la variable sortante 
           J(r)=s; %la nouvelle base 
         end
       end
       M=position(c1);
     end



  else %Probleme de minimisation

    M=position1(c1);
    while(isempty(M)==0)
      X=zeros(n,1);
      itr=itr+1;
      B=A(:,J);
      pi=c(J)*B^(-1);
      c1=c-pi*A;
      S=position1(c1);
      if(isempty(S)==1)
        disp('J est une base optimale');
        J=J;
        X(J)=B^(-1)*b;
        X_opt=X;
        f_opt=pi*b;
        itr=itr;
        return;
      else
        h=min(c1);
        s =indice(c1,h);
        A_s=B^(-1)*A(:,s);
        I=position(A_s);
        if(isempty(I)==1)
          disp('(P) n admet pas de solution optimal');
          etat=-1;
          return;
        else
          b1=B^(-1)*b;
          L=zeros(1,length(I));
          for i=1:length(I)
             L(i)=b1(I(i))/ A_s(I(i));
          endfor
          k=min(L);
          j=indice(L,k);
          r=I(j);
          J(r)=s;
        end
      end
    M=position1(c1);
    end
  end
endfunction
