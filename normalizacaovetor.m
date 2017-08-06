function vetornormalizado = normalizacaovetor(V)

sum = 0;
n=size(V);
n = n(1);

%Passo 1 - Encontrando a soma dos elementos do vetor 
for x = 1:n;
	sum = sum + V(x);
end
%Passo 2 - Dividindo cada elemento do velor pelo somatório do passo 1
for x = 1:n;
	vetornormalizado(x) = V(x) / sum;
end
vetornormalizado = vetornormalizado';
end