function rc = razaodecoerencia(A,V)
	
sum = 0;
n=size(A);
n = n(1);

%Passo 1 - Encontrando a matriz auxiliar
for x = 1:n;
	for y = 1:n; 
		Aaux(y,x) = A(y,x) * V(x);
	end
end
%Passo 2 - Encontrando o vetor prioridade auxiliar 1
for x = 1:n;
	for y = 1:n;
		sum = sum + Aaux(x,y); %Somatório das linhas
	end
	Vaux1(x) = sum;  %Vetor prioridade
	sum = 0;
end
Vaux1 = Vaux1';
%Passo 3 - Encontrando o vetor prioridade auxiliar 2
for x = 1:n;
	Vaux2(x) = Vaux1(x) / V(x);
end
%Passo 4 - Encontrando autovalor máximo 
for x = 1:n;
	sum = sum + Vaux2(x);
end
lambdamax = sum / n;
sum = 0;
%Passo 5 - Calculando o Índice de coerência
ic = abs(lambdamax-n)/(n-1);
ic=round(ic,4);
%Passo 6 - Calculando a razão de coerência
ir=[0 0 0.58 0.9 1.12 1.24 1.32 1.41 1.45 1.49 1.51 1.54 1.56 1.57];
if n > 14
	n = 14; 
end
rc = ic / ir(n);
end