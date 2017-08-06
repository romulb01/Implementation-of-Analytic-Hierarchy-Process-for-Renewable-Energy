clc
clear all
 
TRUE = 1;
FALSE = 0;  
RCref = 0.1;%Valor de referência para indicação de coerência dos dados
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Leitura dos dados para avaliação das prioridades dos especialistas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ResumoGrupos = xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','ResumoEntrevistados','B1:B30'); 

%Nome do arquivo (sem aspas): “entrevistados_NOVO3_pos_escrita.xlsx”.         %Nome da aba selecionada(sem aspas):”ResumoEntrevistados”.
%Células selecionadas:	B1:B20 (B1 a B20).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Segregação e arrumação dos dados obtidos com a planilha do Excel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
QuantTotalEntrevistados = ResumoGrupos(1);
QuantCriteriosSolar = ResumoGrupos (2);
QuantSubTecGerSolar=ResumoGrupos(3);      % Quantidade de Subcritérios Técnicos do Ponto de Vista de Geração - Caso Solar 
QuantSubTecTerritSolar=ResumoGrupos(4);   % Quantidade de Subcritérios Técnicos do Ponto de Vista Territorial - Caso Solar
QuantSubTecInfraSolar=ResumoGrupos(5);    % Quantidade de Subcritérios Técnicos do Ponto de Vista de Infraestrutura - Caso Solar
QuantSubTecSolar=ResumoGrupos(6);
QuantSubSociais = ResumoGrupos (7);       % Quantidade de Subcritérios Sociais - Eólica e Solar
QuantSubEconomicos = ResumoGrupos (8);   % Quantidade de Subcritérios Econômicos - Eólica e Solar
QuantSubTotalSolar = ResumoGrupos (9);  % Quantidade de Subcritérios Total - Solar
QuantRegioes = ResumoGrupos (10);        % Quantidade de Regiões
 
 
CriteriosSolar = xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','CriteriosSolar','A1:D200'); %Contém dados que não são números
TecnicoGeracaoSolar=xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','TecnicoGeracaoSolar','A1:D200');
TecnicoTerritorialSolar=xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','TecnicoTerritorialSolar','A1:D200');
TecnicoInfraestruturaSolar=xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','TecnicoInfraestruturaSolar','A1:D200');
DadosRegioesSolar=xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','DadosRegioes','A1:D230');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exclusão de termos que não são numeros (NaN - Not a Number)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CriteriosSolar(~any(~isnan(CriteriosSolar),2),:)=[];
TecnicoGeracaoSolar(~any(~isnan(TecnicoGeracaoSolar),2),:)=[];
TecnicoTerritorialSolar(~any(~isnan(TecnicoTerritorialSolar),2),:)=[];
TecnicoInfraestruturaSolar(~any(~isnan(TecnicoInfraestruturaSolar),2),:)=[];
DadosRegioesSolar(~any(~isnan(DadosRegioesSolar),2),:)=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Coerência Comparação Criterios - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Critérios - Usinas Solares';
[Vetorprioridadecriteriossolar,MatrizRCComparacaoCriteriosSolar,a]=prioridade(CriteriosSolar,QuantTotalEntrevistados,QuantCriteriosSolar,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coerência Comparação Criterios - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Coerência Comparação Subcritérios Técnicos de GERAÇÃO - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcritérios Técnicos de GERAÇÃO - Usinas Solares';
[VetorprioridadesSubTecGerSolar, MatrizRCComparacaoSubTecGerSolar,a]=prioridade(TecnicoGeracaoSolar,QuantTotalEntrevistados,QuantSubTecGerSolar,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coerência Comparação Subcritérios Técnicos de GERAÇÃO - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Coerência Comparação Subcritérios Técnicos - TERRITORIAL - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcritérios Técnicos de TERRITORIAL - Usinas Solares';
[VetorprioridadesSubTecTerritSolar, MatrizRCComparacaoSubTecTerritSolar,a]=prioridade(TecnicoTerritorialSolar,QuantTotalEntrevistados,QuantSubTecTerritSolar,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coerência Comparação Subcritérios Técnicos - TERRITORIAL - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Coerência Comparação Subcritérios Técnicos - INFRAESTRUTURA - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcritérios Técnicos de INFRAESTRUTURA - Usinas Solares';
[VetorprioridadesSubTecInfraSolar, MatrizRCComparacaoSubTecInfraSolar,a]=prioridade(TecnicoInfraestruturaSolar,QuantTotalEntrevistados,QuantSubTecInfraSolar,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coerência Comparação Subcritérios Técnicos - INFRAESTRUTURA - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


  
%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Sociais - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha=1;
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Social de REGIÕES - Usinas Solares';
    [VetorprioridadesRegioesSocialSolar, MatrizRCComparacaoSocialRegioesSolar,a]=prioridade(MatrizAux,QuantSubSociais,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Sociais - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Econômicos - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*QuantSubSociais;
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Econômico de REGIÕES - Usinas Solares';
    [VetorprioridadesRegioesEconomicoSolar, MatrizRCComparacaoEconomicaRegioesSolar,a]=prioridade(MatrizAux,QuantSubEconomicos,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Econômicos - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Técnicos - GERAÇÃO - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos); %Início da %Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecGerSolar
        
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Técnico de GERAÇÃO de REGIÕES - Usinas Solares';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.
    VetorprioridadesRegioesSubTecGerSolar(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecGerRegioesSolar(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Técnicos - GERAÇÃO - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Técnicos - TERRITORIAL - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos+QuantSubTecGerSolar); %Início da Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecTerritSolar
        
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Técnico TERRITORIAL de REGIÕES - Usinas Solares';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.
    VetorprioridadesRegioesSubTecTerritSolar(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecTerritRegioesSolar(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Técnicos - TERRITORIAL - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Técnicos - INFRAESTRUTURA - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos+QuantSubTecGerSolar+QuantSubTecTerritSolar); %Início da Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecInfraSolar
        
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Técnico INFRAESTRUTURA de REGIÕES - Usinas Solares';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.
    VetorprioridadesRegioesSubTecInfraSolar(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecInfraRegioesSolar(Cont,:)=MatrizRCComparacao;
    
    end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Técnicos - INFRAESTRUTURA - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Critérios Técnicos - GERAÇÃO - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecGerSolarConcatenado(:,Cont)= VetorprioridadesRegioesSubTecGerSolar*VetorprioridadesSubTecGerSolar(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Critérios Técnicos – GERAÇÃO - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Critérios Técnicos - TERRITORIAL - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecTerritSolarConcatenado(:,Cont)= VetorprioridadesRegioesSubTecTerritSolar*VetorprioridadesSubTecTerritSolar(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Critérios Técnicos – TERRITORIAL - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Critérios Técnicos - INFRAESTRUTURA - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecInfraSolarConcatenado(:,Cont)= VetorprioridadesRegioesSubTecInfraSolar*VetorprioridadesSubTecInfraSolar(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Critérios Técnicos – INFRAESTRUTURA - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCATENANDO os Vetores Prioridades para TODOS os critérios - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cont1=1;
 for Cont=1:QuantTotalEntrevistados
 VetorSubcriteriosConcatenadoSolar(:,[Cont1:Cont1+QuantCriteriosSolar-1])= horzcat(VetorprioridadesRegioesSocialSolar,  VetorprioridadesRegioesEconomicoSolar,  VetorSubTecGerSolarConcatenado(:,Cont), VetorSubTecTerritSolarConcatenado(:,Cont), VetorSubTecInfraSolarConcatenado(:,Cont));
 Cont1=Cont1+QuantCriteriosSolar;
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Concatenando os Vetores Prioridades para Todos os critérios - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encontrando o Vetor Prioridade Final para cada Entrevistado - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 Cont1=1;
 VetorPrioridadeFinalEntrevistadoSolar(:,Cont)= VetorSubcriteriosConcatenadoSolar(:,[Cont1:Cont1+QuantCriteriosSolar-1])*Vetorprioridadecriteriossolar(:,Cont);
 Cont1=Cont1+QuantCriteriosSolar;
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Encontrando o Vetor Prioridade Final para cada Entrevistado - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encontrando o Vetor Prioridade Final para todos os Entrevistados - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%VetorPrioridadeFinalSolar=1;
% Calculando a Média Geométrica Final
if QuantTotalEntrevistados <=1
    VetorPrioridadeFinalSolar =  VetorPrioridadeFinalEntrevistadoSolar;
else
 for Cont=1:QuantRegioes
     for cont1=1:QuantTotalEntrevistados
         if cont1==1
             VetorPrioridadeFinalSolar(Cont,1) =  VetorPrioridadeFinalEntrevistadoSolar(Cont,cont1);
         else
 VetorPrioridadeFinalSolar(Cont,1) =  VetorPrioridadeFinalSolar(Cont,1)*VetorPrioridadeFinalEntrevistadoSolar(Cont,cont1);
         end
     end
     VetorPrioridadeFinalSolar(Cont,1)= VetorPrioridadeFinalSolar(Cont,1)^(1/QuantTotalEntrevistados); %Média Geométrica
 end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Encontrando o Vetor Prioridade Final para todos os Entrevistados - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Normalizando para que os índices do Vetor Prioridade Final fiqueo no %intervalo de (0;100] - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
VetorPrioridadeFinalSolarNormalizado=normalizacao(VetorPrioridadeFinalSolar, QuantRegioes);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Normalizando para que os índices do Vetor Prioridade Final fiqueo no intervalo de (0;100] - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
