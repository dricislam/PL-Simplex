A=[1 1 2 3 -2; -1 -2 3 -2 3];
b=[4 ;10];
c=[-2 1 3 -1 1];
inq=[-1 -1];
Type='0';
[X_opt,f_opt,etat,itr,J]= Revise_simplexe(A,b,c,inq,Type)