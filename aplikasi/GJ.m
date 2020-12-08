function [gjx]= GJ(mu,sigma,n,x) 

% Fungsi Diskriminan 

%Deklarasi Variabel 
% GJx, sigma, mu, pw 
% x adalah sebuah nilai


%Cek banyaknya kelas

[p,C] = size(n) ;
nTot = sum(n) ;

for j = 1:C
    
    pw(j) = n(j) / nTot ;
    gjx(j) = -log(sigma(j)) - 0.5*((x-mu(j))/sigma(j))^2 + log(pw(j)) ;
    
end

    
end