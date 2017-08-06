function vetorcoluna = somalinhas(A)

%A=xlsread('template','Plan1','A1:K34');
sum = 0;
n = size(A);
n = n(1);

for x = 1:n;
	for y = 1:n;
		sum = sum + A(x,y); %Somatório das linhas
	end
	vetorcoluna(x) = sum;  %Vetor prioridade
	sum = 0;
end

vetorcoluna = vetorcoluna';

end