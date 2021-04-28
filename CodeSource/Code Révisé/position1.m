function [ pos1 ]= position1(V)
  pos1=[];
  j=1;
  for i=1:length(V)
    if(V(i)<0 && V(i)~=0)
    pos1(j)=i;
    j=j+1;
    end 
  end
end
