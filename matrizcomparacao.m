function MatrizComparacao=matrizcomparacao(MatrizAux,QuantRegioes)

%Aproximação de valores nulos para números ínfimos
n=size(MatrizAux,1);
for i=1:n
    if MatrizAux(i)==0
        MatrizAux(i)=1E-32;
    end
end
    
%Comparando regiões
for i=1:QuantRegioes
        for j=1:QuantRegioes
          if i>=j
              MatrizComparacao(i,j)=MatrizAux(i)/MatrizAux(j);
              MatrizComparacao(j,i)=MatrizAux(j)/MatrizAux(i);         
          end 
        end        
    end