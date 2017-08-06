function MatrizComparacao=matrizcomparacao(MatrizAux,QuantRegioes)

%Aproxima��o de valores nulos para n�meros �nfimos
n=size(MatrizAux,1);
for i=1:n
    if MatrizAux(i)==0
        MatrizAux(i)=1E-32;
    end
end
    
%Comparando regi�es
for i=1:QuantRegioes
        for j=1:QuantRegioes
          if i>=j
              MatrizComparacao(i,j)=MatrizAux(i)/MatrizAux(j);
              MatrizComparacao(j,i)=MatrizAux(j)/MatrizAux(i);         
          end 
        end        
    end