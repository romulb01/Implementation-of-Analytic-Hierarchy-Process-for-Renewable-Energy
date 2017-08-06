clc
clear all
 
TRUE = 1;
FALSE = 0;  
RCref = 0.1;%Valor de refer�ncia para indica��o de coer�ncia dos dados
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Leitura dos dados para avalia��o das prioridades dos especialistas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ResumoGrupos = xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','ResumoEntrevistados','B1:B30'); 

%Nome do arquivo (sem aspas): �entrevistados_NOVO3_pos_escrita.xlsx�.         %Nome da aba selecionada(sem aspas):�ResumoEntrevistados�.
%C�lulas selecionadas:	B1:B20 (B1 a B20).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Segrega��o e arruma��o dos dados obtidos com a planilha do Excel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
QuantTotalEntrevistados = ResumoGrupos(1);
QuantCriteriosEolica = ResumoGrupos (2);
QuantSubTecGerEolica=ResumoGrupos(3);     % Quantidade de Subcrit�rios T�cnicos do Ponto de Vista de Gera��o - Caso E�lica
QuantSubTecTerritEolica=ResumoGrupos(4);  % Quantidade de Subcrit�rios T�cnicos do Ponto de Vista Territorial - Caso E�lica
QuantSubTecInfraEolica=ResumoGrupos(5);   % Quantidade de Subcrit�rios T�cnicos do Ponto de Vista de Infraestrutura - Caso E�lica
QuantSubTecEolica=ResumoGrupos(6);
QuantSubSociais = ResumoGrupos (7);       % Quantidade de Subcrit�rios Sociais - E�lica e Solar
QuantSubEconomicos = ResumoGrupos (8);   % Quantidade de Subcrit�rios Econ�micos - E�lica e Solar
QuantSubTotalEolica = ResumoGrupos (9); % Quantidade de Subcrit�rios Total - E�lica
QuantRegioes = ResumoGrupos (10);       % Quantidade de Regi�es
 
 
CriteriosEolica = xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','CriteriosEolica','A1:D200'); %Cont�m dados que n�o s�o n�meros
TecnicoGeracaoEolica=xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','TecnicoGeracaoEolica','A1:D200');
TecnicoTerritorialEolica=xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','TecnicoTerritorialEolica','A1:D200');
TecnicoInfraestruturaEolica=xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','TecnicoInfraestruturaEolica','A1:D200');
DadosRegioesEolica=xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','DadosRegioes','A1:D230');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exclus�o de termos que n�o s�o numeros (NaN - Not a Number)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CriteriosEolica(~any(~isnan(CriteriosEolica),2),:)=[];
TecnicoGeracaoEolica(~any(~isnan(TecnicoGeracaoEolica),2),:)=[];
TecnicoTerritorialEolica(~any(~isnan(TecnicoTerritorialEolica),2),:)=[];
TecnicoInfraestruturaEolica(~any(~isnan(TecnicoInfraestruturaEolica),2),:)=[];
DadosRegioesEolica(~any(~isnan(DadosRegioesEolica),2),:)=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Coer�ncia Compara��o Criterios - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Crit�rios - Usinas E�licas';
[Vetorprioridadecriterioseolica,MatrizRCComparacaoCriterioseolica,a]=prioridade(CriteriosEolica,QuantTotalEntrevistados,QuantCriteriosEolica,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coer�ncia Compara��o Criterios - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Coer�ncia Compara��o Subcrit�rios T�cnicos de GERA��O - E�lica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcrit�rios T�cnicos de GERA��O - Usinas E�licas';
[VetorprioridadesSubTecGerEolica, MatrizRCComparacaoSubTecGerEolica,a]=prioridade(TecnicoGeracaoEolica,QuantTotalEntrevistados,QuantSubTecGerEolica,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coer�ncia Compara��o Subcrit�rios T�cnicos de GERA��O - E�lica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Coer�ncia Compara��o Subcrit�rios T�cnicos - TERRITORIAL - E�lica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcrit�rios T�cnicos de TERRITORIAL - Usinas E�licas';
[VetorprioridadesSubTecTerritEolica, MatrizRCComparacaoSubTecTerritEolica,a]=prioridade(TecnicoTerritorialEolica,QuantTotalEntrevistados,QuantSubTecTerritEolica,RCref,s);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coer�ncia Compara��o Subcrit�rios T�cnicos - TERRITORIAL - E�lica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Coer�ncia Compara��o Subcrit�rios T�cnicos - INFRAESTRUTURA - E�lica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcrit�rios T�cnicos de INFRAESTRUTURA - Usinas E�licas';
[VetorprioridadesSubTecInfraEolica, MatrizRCComparacaoSubTecInfraEolica,a]=prioridade(TecnicoInfraestruturaEolica,QuantTotalEntrevistados,QuantSubTecInfraEolica,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coer�ncia Compara��o Subcrit�rios T�cnicos - INFRAESTRUTURA - E�lica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios Sociais - E�lica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha=1;
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio Social de REGI�ES - Usinas E�licas';
    [VetorprioridadesRegioesSocialEolica, MatrizRCComparacaoSocialRegioesEolica,a]=prioridade(MatrizAux,QuantSubSociais,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios Sociais - E�lica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios Econ�micos - Eolica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*QuantSubSociais;
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio Econ�mico de REGI�ES - Usinas E�licas';
    [VetorprioridadesRegioesEconomicoEolica, MatrizRCComparacaoEconomicaRegioesEolica,a]=prioridade(MatrizAux,QuantSubEconomicos,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios Econ�micos - Eolica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios T�cnicos - GERA��O - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos); %In�cio da %Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecGerEolica
        
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio T�cnico de GERA��O de REGI�ES - Usinas E�licas';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.
    VetorprioridadesRegioesSubTecGerEolica(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecGerRegioesEolica(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios T�cnicos - GERA��O - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios T�cnicos - TERRITORIAL - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos+QuantSubTecGerEolica); %In�cio da %Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecTerritEolica
        
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio T�cnico TERRITORIAL de REGI�ES - Usinas E�licas';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.
    VetorprioridadesRegioesSubTecTerritEolica(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecTerritRegioesEolica(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios T�cnicos - TERRITORIAL - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%In�cio - Comparacao Dados Regioes - Subcrit�rios T�cnicos - INFRAESTRUTURA - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos+QuantSubTecGerEolica+QuantSubTecTerritEolica); %In�cio da Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecInfraEolica
        
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcrit�rio T�cnico INFRAESTRUTURA de REGI�ES - Usinas E�licas';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o c�lculo de 1 �nico subcrit�rio e quantidade de regi�es em vez de quantidade de subcrit�rios, para o c�lculo da prioridade dos dados das regi�es.
    VetorprioridadesRegioesSubTecInfraEolica(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
     MatrizRCComparacaoSubTecInfraRegioesEolica(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcrit�rios T�cnicos - INFRAESTRUTURA - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Crit�rios T�cnicos - GERA��O - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecGerEolicaConcatenado(:,Cont)= VetorprioridadesRegioesSubTecGerEolica*VetorprioridadesSubTecGerEolica(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Crit�rios T�cnicos � GERA��O - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Crit�rios T�cnicos - TERRITORIAL - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecTerritEolicaConcatenado(:,Cont)= VetorprioridadesRegioesSubTecTerritEolica*VetorprioridadesSubTecTerritEolica(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Crit�rios T�cnicos � TERRITORIAL - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Crit�rios T�cnicos - INFRAESTRUTURA - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecInfraEolicaConcatenado(:,Cont)= VetorprioridadesRegioesSubTecInfraEolica*VetorprioridadesSubTecInfraEolica(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Crit�rios T�cnicos � INFRAESTRUTURA - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCATENANDO os Vetores Prioridades para TODOS os crit�rios - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cont1=1;
 for Cont=1:QuantTotalEntrevistados
 VetorSubcriteriosConcatenadoEolica(:,[Cont1:Cont1+QuantCriteriosEolica-1])= horzcat(VetorprioridadesRegioesSocialEolica,  VetorprioridadesRegioesEconomicoEolica,  VetorSubTecGerEolicaConcatenado(:,Cont), VetorSubTecTerritEolicaConcatenado(:,Cont), VetorSubTecInfraEolicaConcatenado(:,Cont));
 Cont1=Cont1+QuantCriteriosEolica;
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Concatenando os Vetores Prioridades para Todos os crit�rios - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encontrando o Vetor Prioridade Final para cada Entrevistado - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cont1=1;
 for Cont=1:QuantTotalEntrevistados
VetorPrioridadeFinalEntrevistadoEolica(:,Cont)= VetorSubcriteriosConcatenadoEolica(:,[Cont1:Cont1+QuantCriteriosEolica-1])*Vetorprioridadecriterioseolica(:,Cont);
 Cont1=Cont1+QuantCriteriosEolica;
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Encontrando o Vetor Prioridade Final para cada Entrevistado - Usinas E�lica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encontrando o Vetor Prioridade Final para todos os Entrevistados - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%VetorPrioridadeFinalSolar=1;
% Calculando a M�dia Geom�trica Final
if QuantTotalEntrevistados <=1
    VetorPrioridadeFinalEolica =  VetorPrioridadeFinalEntrevistadoEolica;
else
 for Cont=1:QuantRegioes
     for cont1=1:QuantTotalEntrevistados
         if cont1==1
             VetorPrioridadeFinalEolica(Cont,1) =  VetorPrioridadeFinalEntrevistadoEolica(Cont,cont1);
         else
 VetorPrioridadeFinalEolica(Cont,1) =  VetorPrioridadeFinalEolica(Cont,1)*VetorPrioridadeFinalEntrevistadoEolica(Cont,cont1);
         end
     end
     VetorPrioridadeFinalEolica(Cont,1)= VetorPrioridadeFinalEolica(Cont,1)^(1/QuantTotalEntrevistados); %M�dia Geom�trica
 end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Encontrando o Vetor Prioridade Final para todos os Entrevistados - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Normalizando para que os �ndices do Vetor Prioridade Final fiqueo no %intervalo de (0;100] - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
VetorPrioridadeFinalEolicaNormalizado=normalizacao(VetorPrioridadeFinalEolica, QuantRegioes);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim -  Normalizando para que os �ndices do Vetor Prioridade Final fiqueo %no intervalo de (0;100] - Usinas E�licas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
