function [ k ]= indice(V,t) %Cette fonction renvoie l’indice d’une valeur donnée dans un vecteur.
  i=1;
  while(V(i)~=t)
  i=i+1;
end
k=i;
end
