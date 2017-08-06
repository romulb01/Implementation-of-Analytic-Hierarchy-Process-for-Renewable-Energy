function [Vetorprioridade,MatrizRCComparacaoCriterios,a]=prioridade(planilha,QuantTotalEntrevistados,QuantCriterios,RCref,s)

TRUE = 1;
FALSE = 0;

ContLinha = 1; %In�cio da Contagem das Linhas
FlagIncoerencia = 0; % Flag raz�o de incoer�ncia (in�cio)
 
 for Cont = 1:QuantTotalEntrevistados;
    MatrizAux = planilha( [ContLinha : ContLinha + QuantCriterios-1] , [ 1 : QuantCriterios] );
    ContLinha = ContLinha + QuantCriterios;
 
    VetorAux = somalinhas(MatrizAux); %Somando as linhas da matriz de %opini�es sobre prioridades das profiss�es
    VetorAux = normalizacaovetor(VetorAux); %Normalizando o vetor %prioridades das profiss�es
    VetorRCComparacaoRegioes(Cont) = razaodecoerencia(MatrizAux,VetorAux);%Avalia��o da Coer�ncia da Matriz das %Profiss�es 
    VetorNumeroEntrevistado(Cont) = Cont;
    Vetorprioridade(:,Cont)=VetorAux;
    
    if VetorRCComparacaoRegioes (Cont) > RCref
            FlagIncoerencia = TRUE;
         VetorFlagIncoerencia (Cont)= 1;
     else
         VetorFlagIncoerencia (Cont)= 0;
    end     
 end
 
 %Se houve pelo menos um entrevistado cuja RC deu incoer�ncia, mostra-se o %n�mero do entrevistado e sua RC
 if (FlagIncoerencia == TRUE && Cont == QuantTotalEntrevistados)
   % disp('H� dados de entrevistados incoerentes na Compara��o dos Crit�rios');
   a=fprintf('Compara��o de %s - INCOERENTE!!!!!!!!!!!!!!!!!!!!!\n', s);
 else
   % disp('Compara��o ok')
   a=fprintf('Compara��o de %s OK\n',s);
 end
 MatrizRCComparacaoCriterios = horzcat(VetorNumeroEntrevistado', VetorRCComparacaoRegioes', VetorFlagIncoerencia');