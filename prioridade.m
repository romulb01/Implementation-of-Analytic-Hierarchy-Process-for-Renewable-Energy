function [Vetorprioridade,MatrizRCComparacaoCriterios,a]=prioridade(planilha,QuantTotalEntrevistados,QuantCriterios,RCref,s)

TRUE = 1;
FALSE = 0;

ContLinha = 1; %Início da Contagem das Linhas
FlagIncoerencia = 0; % Flag razão de incoerência (início)
 
 for Cont = 1:QuantTotalEntrevistados;
    MatrizAux = planilha( [ContLinha : ContLinha + QuantCriterios-1] , [ 1 : QuantCriterios] );
    ContLinha = ContLinha + QuantCriterios;
 
    VetorAux = somalinhas(MatrizAux); %Somando as linhas da matriz de %opiniões sobre prioridades das profissões
    VetorAux = normalizacaovetor(VetorAux); %Normalizando o vetor %prioridades das profissões
    VetorRCComparacaoRegioes(Cont) = razaodecoerencia(MatrizAux,VetorAux);%Avaliação da Coerência da Matriz das %Profissões 
    VetorNumeroEntrevistado(Cont) = Cont;
    Vetorprioridade(:,Cont)=VetorAux;
    
    if VetorRCComparacaoRegioes (Cont) > RCref
            FlagIncoerencia = TRUE;
         VetorFlagIncoerencia (Cont)= 1;
     else
         VetorFlagIncoerencia (Cont)= 0;
    end     
 end
 
 %Se houve pelo menos um entrevistado cuja RC deu incoerência, mostra-se o %número do entrevistado e sua RC
 if (FlagIncoerencia == TRUE && Cont == QuantTotalEntrevistados)
   % disp('Há dados de entrevistados incoerentes na Comparação dos Critérios');
   a=fprintf('Comparação de %s - INCOERENTE!!!!!!!!!!!!!!!!!!!!!\n', s);
 else
   % disp('Comparação ok')
   a=fprintf('Comparação de %s OK\n',s);
 end
 MatrizRCComparacaoCriterios = horzcat(VetorNumeroEntrevistado', VetorRCComparacaoRegioes', VetorFlagIncoerencia');