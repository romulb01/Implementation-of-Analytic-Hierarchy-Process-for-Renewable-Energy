clc
clear all
 
TRUE = 1;
FALSE = 0;  
RCref = 0.1;%Valor de refer�ncia para indica��o de coer�ncia dos dados
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Leitura dos dados para avalia��o das prioridades dos especialistas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ResumoGrupos = xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','ResumoEntrevistados','B1:B30'); 

%Nome do arquivo (sem aspas): �entrevistados_NOVO3_pos_escrita.xlsx�.         %Nome da aba selecionada(sem aspas):�ResumoEntrevistados�.
%C�lulas selecionadas:	B1:B20 (B1 a B20).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Segrega��o e arruma��o dos dados obtidos com a planilha do Excel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
QuantTotalEntrevistados = ResumoGrupos(1);
QuantCriteriosSolar = ResumoGrupos (2);
QuantSubTecGerSolar=ResumoGrupos(3);      % Quantidade de Subcrit�rios T�cnicos do Ponto de Vista de Gera��o - Caso Solar 
QuantSubTecTerritSolar=ResumoGrupos(4);   % Quantidade de Subcrit�rios T�cnicos do Ponto de Vista Territorial - Caso Solar
QuantSubTecInfraSolar=ResumoGrupos(5);    % Quantidade de Subcrit�rios T�cnicos do Ponto de Vista de Infraestrutura - Caso Solar
QuantSubTecSolar=ResumoGrupos(6);
QuantSubSociais = ResumoGrupos (7);       % Quantidade de Subcrit�rios Sociais - E�lica e Solar
QuantSubEconomicos = ResumoGrupos (8);   % Quantidade de Subcrit�rios Econ�micos - E�lica e Solar
QuantSubTotalSolar = ResumoGrupos (9);  % Quantidade de Subcrit�rios Total - Solar
QuantRegioes = ResumoGrupos (10);        % Quantidade de Regi�es
 
 
CriteriosSolar = xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','CriteriosSolar','A1:D200'); %Cont�m dados que n�o s�o n�meros
TecnicoGeracaoSolar=xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','TecnicoGeracaoSolar','A1:D200');
TecnicoTerritorialSolar=xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','TecnicoTerritorialSolar','A1:D200');
TecnicoInfraestruturaSolar=xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','TecnicoInfraestruturaSolar','A1:D200');
DadosRegioesSolar=xlsread('Dados_de_entrada_Usinas_SOLARES_FOTOVOLTAICAS','DadosRegioes','A1:D230');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exclus�o de termos que n�o s�o numeros (NaN - Not a Number)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CriteriosSolar(~any(~isnan(CriteriosSolar),2),:)=[];
TecnicoGeracaoSolar(~any(~isnan(TecnicoGeracaoSolar),2),:)=[];
TecnicoTerritorialSolar(~any(~isnan(TecnicoTerritorialSolar),2),:)=[];
TecnicoInfraestruturaSolar(~any(~isnan(TecnicoInfraestruturaSolar),2),:)=[];
DadosRegioesSolar(~any(~isnan(DadosRegioesSolar),2),:)=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Coer�ncia Compara��o Criterios - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Crit�rios - Usinas Solares';
[Vetorprioridadecriteriossolar,MatrizRCComparacaoCriteriosSolar,a]=prioridade(CriteriosSolar,QuantTotalEntrevistados,QuantCriteriosSolar,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coer�ncia Compara��o Criterios - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Coer�ncia Compara��o Subcrit�rios T�cnicos de GERA��O - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcrit�rios T�cnicos de GERA��O - Usinas Solares';
[VetorprioridadesSubTecGerSolar, MatrizRCComparacaoSubTecGerSolar,a]=prioridade(TecnicoGeracaoSolar,QuantTotalEntrevistados,QuantSubTecGerSolar,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coer�ncia Compara��o Subcrit�rios T�cnicos de GERA��O - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Coer�ncia Compara��o Subcrit�rios T�cnicos - TERRITORIAL - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcrit�rios T�cnicos de TERRITORIAL - Usinas Solares';
[VetorprioridadesSubTecTerritSolar, MatrizRCComparacaoSubTecTerritSolar,a]=prioridade(TecnicoTerritorialSolar,QuantTotalEntrevistados,QuantSubTecTerritSolar,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coer�ncia Compara��o Subcrit�rios T�cnicos - TERRITORIAL - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Coer�ncia Compara��o Subcrit�rios T�cnicos - INFRAESTRUTURA - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcrit�rios T�cnicos de INFRAESTRUTURA - Usinas Solares';
[VetorprioridadesSubTecInfraSolar, MatrizRCComparacaoSubTecInfraSolar,a]=prioridade(TecnicoInfraestruturaSolar,QuantTotalEntrevistados,QuantSubTecInfraSolar,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coer�ncia Compara��o Subcrit�rios T�cnicos - INFRAESTRUTURA - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


  
%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios Sociais - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha=1;
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio Social de REGI�ES - Usinas Solares';
    [VetorprioridadesRegioesSocialSolar, MatrizRCComparacaoSocialRegioesSolar,a]=prioridade(MatrizAux,QuantSubSociais,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios Sociais - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios Econ�micos - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*QuantSubSociais;
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio Econ�mico de REGI�ES - Usinas Solares';
    [VetorprioridadesRegioesEconomicoSolar, MatrizRCComparacaoEconomicaRegioesSolar,a]=prioridade(MatrizAux,QuantSubEconomicos,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios Econ�micos - Solar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios T�cnicos - GERA��O - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos); %In�cio da %Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecGerSolar
        
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio T�cnico de GERA��O de REGI�ES - Usinas Solares';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.
    VetorprioridadesRegioesSubTecGerSolar(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecGerRegioesSolar(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios T�cnicos - GERA��O - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios T�cnicos - TERRITORIAL - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos+QuantSubTecGerSolar); %In�cio da Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecTerritSolar
        
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio T�cnico TERRITORIAL de REGI�ES - Usinas Solares';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.
    VetorprioridadesRegioesSubTecTerritSolar(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecTerritRegioesSolar(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios T�cnicos - TERRITORIAL - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios T�cnicos - INFRAESTRUTURA - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos+QuantSubTecGerSolar+QuantSubTecTerritSolar); %In�cio da Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecInfraSolar
        
    MatrizAux = DadosRegioesSolar( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio T�cnico INFRAESTRUTURA de REGI�ES - Usinas Solares';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.
    VetorprioridadesRegioesSubTecInfraSolar(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecInfraRegioesSolar(Cont,:)=MatrizRCComparacao;
    
    end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios T�cnicos - INFRAESTRUTURA - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Crit�rios T�cnicos - GERA��O - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecGerSolarConcatenado(:,Cont)= VetorprioridadesRegioesSubTecGerSolar*VetorprioridadesSubTecGerSolar(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Crit�rios T�cnicos � GERA��O - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Crit�rios T�cnicos - TERRITORIAL - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecTerritSolarConcatenado(:,Cont)= VetorprioridadesRegioesSubTecTerritSolar*VetorprioridadesSubTecTerritSolar(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Crit�rios T�cnicos � TERRITORIAL - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Crit�rios T�cnicos - INFRAESTRUTURA - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecInfraSolarConcatenado(:,Cont)= VetorprioridadesRegioesSubTecInfraSolar*VetorprioridadesSubTecInfraSolar(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Crit�rios T�cnicos � INFRAESTRUTURA - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCATENANDO os Vetores Prioridades para TODOS os crit�rios - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cont1=1;
 for Cont=1:QuantTotalEntrevistados
 VetorSubcriteriosConcatenadoSolar(:,[Cont1:Cont1+QuantCriteriosSolar-1])= horzcat(VetorprioridadesRegioesSocialSolar,  VetorprioridadesRegioesEconomicoSolar,  VetorSubTecGerSolarConcatenado(:,Cont), VetorSubTecTerritSolarConcatenado(:,Cont), VetorSubTecInfraSolarConcatenado(:,Cont));
 Cont1=Cont1+QuantCriteriosSolar;
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Concatenando os Vetores Prioridades para Todos os crit�rios - Usinas Solares
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
% Calculando a M�dia Geom�trica Final
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
     VetorPrioridadeFinalSolar(Cont,1)= VetorPrioridadeFinalSolar(Cont,1)^(1/QuantTotalEntrevistados); %M�dia Geom�trica
 end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Encontrando o Vetor Prioridade Final para todos os Entrevistados - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Normalizando para que os �ndices do Vetor Prioridade Final fiqueo no %intervalo de (0;100] - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
VetorPrioridadeFinalSolarNormalizado=normalizacao(VetorPrioridadeFinalSolar, QuantRegioes);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Normalizando para que os �ndices do Vetor Prioridade Final fiqueo no intervalo de (0;100] - Usinas Solares
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
