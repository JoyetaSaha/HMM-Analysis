/*Initialization α1(i)=π(i)b(O1),1≤i≤N*/

a = [0.80, 0.05, 0.05; 0.15, 0.70, 0.05 ; 0.05, 0.10, 0.75];
b=[0.30, 0.20, 0.25, 0.10, 0.05, 0.05, 0.00, 0.05; 0.00, 0.00, 0.05, 0.05, 0.05, 0.20, 0.30, 0.35; 0.00, 0.05, 0.05,0.20, 0.35, 0.25, 0.05, 0.05];
o=[6,4,2,1,3];
pi=[0.40, 0.25, 0.35];
n=length(a(1,:));
T=length(o);


for i=1:n
    m(1,i)=b(i,o(1))*pi(i);
end
//1.2 Induction αt+1(j)=(∑Ni=1αt(i)∗aij)bj(Ot+1) 1≤j≤N; 1≤t≤T−1;
//The vector is updated for each observation using this code

for t=1:(T-1)
    for j=1:n
        z=0;
        for i=1:n
            z=z+a(i,j)*m(t,i);
        end
        m(t+1,j)=z*b(j,o(t+1));
    end
end
1.3 Termination P(O|λ)=∑Ni=1αT(i)
We sum up the alpha vector to get the probability

p=0;
for i=1:n         %termination
    p=p+m(T,i);        
end