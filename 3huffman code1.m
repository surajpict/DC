clear all;
pkg load communications
disp("Hello World");

list_symb = [1 2 3 4 ];
p = [0.5, 0.25,0.125,0.125];

dict = huffmandict(list_symb,p); 
disp(dict)
dict = huffmandict(list_symb,p,0,true);
disp(dict);
inputSig = [1 2 3 3];
code = huffmanenco(inputSig,dict);
disp(code);

%Entropy h(x)
Hx=0;
for i=1:4
  Hx=Hx+(-(p(i)*log2(p(i))));
end 
disp(Hx)


Lx = 0;
for i = 1:4
  Lx = Lx +inputSig(i)  *p(i);
end
disp(Lx)
 
Nn = Hx/Lx;
disp(Nn)