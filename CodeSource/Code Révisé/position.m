function [ pos ]= position(V) %Cette fonction renvoie les indices des �l�ments positifs qui
%se trouvent dans un vecteur donn�
  pos=[];
  j=1;
  for i=1:length(V)
    if(V(i)> 0 && V(1)~=0)
    pos(j)=i;
    j=j+1;
  end 
  end
end
