clc
clear all
 
TRUE = 1;
FALSE = 0;  
RCref = 0.1;%Valor de referência para indicação de coerência dos dados
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Leitura dos dados para avaliação das prioridades dos especialistas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ResumoGrupos = xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','ResumoEntrevistados','B1:B30'); 

%Nome do arquivo (sem aspas): “entrevistados_NOVO3_pos_escrita.xlsx”.         %Nome da aba selecionada(sem aspas):”ResumoEntrevistados”.
%Células selecionadas:	B1:B20 (B1 a B20).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Segregação e arrumação dos dados obtidos com a planilha do Excel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
QuantTotalEntrevistados = ResumoGrupos(1);
QuantCriteriosEolica = ResumoGrupos (2);
QuantSubTecGerEolica=ResumoGrupos(3);     % Quantidade de Subcritérios Técnicos do Ponto de Vista de Geração - Caso Eólica
QuantSubTecTerritEolica=ResumoGrupos(4);  % Quantidade de Subcritérios Técnicos do Ponto de Vista Territorial - Caso Eólica
QuantSubTecInfraEolica=ResumoGrupos(5);   % Quantidade de Subcritérios Técnicos do Ponto de Vista de Infraestrutura - Caso Eólica
QuantSubTecEolica=ResumoGrupos(6);
QuantSubSociais = ResumoGrupos (7);       % Quantidade de Subcritérios Sociais - Eólica e Solar
QuantSubEconomicos = ResumoGrupos (8);   % Quantidade de Subcritérios Econômicos - Eólica e Solar
QuantSubTotalEolica = ResumoGrupos (9); % Quantidade de Subcritérios Total - Eólica
QuantRegioes = ResumoGrupos (10);       % Quantidade de Regiões
 
 
CriteriosEolica = xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','CriteriosEolica','A1:D200'); %Contém dados que não são números
TecnicoGeracaoEolica=xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','TecnicoGeracaoEolica','A1:D200');
TecnicoTerritorialEolica=xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','TecnicoTerritorialEolica','A1:D200');
TecnicoInfraestruturaEolica=xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','TecnicoInfraestruturaEolica','A1:D200');
DadosRegioesEolica=xlsread('Dados_de_entrada_Turbinas_Eolicas_Eixo_HORIZONTAL','DadosRegioes','A1:D230');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exclusão de termos que não são numeros (NaN - Not a Number)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CriteriosEolica(~any(~isnan(CriteriosEolica),2),:)=[];
TecnicoGeracaoEolica(~any(~isnan(TecnicoGeracaoEolica),2),:)=[];
TecnicoTerritorialEolica(~any(~isnan(TecnicoTerritorialEolica),2),:)=[];
TecnicoInfraestruturaEolica(~any(~isnan(TecnicoInfraestruturaEolica),2),:)=[];
DadosRegioesEolica(~any(~isnan(DadosRegioesEolica),2),:)=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Coerência Comparação Criterios - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Critérios - Usinas Eólicas';
[Vetorprioridadecriterioseolica,MatrizRCComparacaoCriterioseolica,a]=prioridade(CriteriosEolica,QuantTotalEntrevistados,QuantCriteriosEolica,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coerência Comparação Criterios - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Coerência Comparação Subcritérios Técnicos de GERAÇÃO - Eólica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcritérios Técnicos de GERAÇÃO - Usinas Eólicas';
[VetorprioridadesSubTecGerEolica, MatrizRCComparacaoSubTecGerEolica,a]=prioridade(TecnicoGeracaoEolica,QuantTotalEntrevistados,QuantSubTecGerEolica,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coerência Comparação Subcritérios Técnicos de GERAÇÃO - Eólica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Coerência Comparação Subcritérios Técnicos - TERRITORIAL - Eólica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcritérios Técnicos de TERRITORIAL - Usinas Eólicas';
[VetorprioridadesSubTecTerritEolica, MatrizRCComparacaoSubTecTerritEolica,a]=prioridade(TecnicoTerritorialEolica,QuantTotalEntrevistados,QuantSubTecTerritEolica,RCref,s);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coerência Comparação Subcritérios Técnicos - TERRITORIAL - Eólica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Coerência Comparação Subcritérios Técnicos - INFRAESTRUTURA - Eólica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s='Subcritérios Técnicos de INFRAESTRUTURA - Usinas Eólicas';
[VetorprioridadesSubTecInfraEolica, MatrizRCComparacaoSubTecInfraEolica,a]=prioridade(TecnicoInfraestruturaEolica,QuantTotalEntrevistados,QuantSubTecInfraEolica,RCref,s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Coerência Comparação Subcritérios Técnicos - INFRAESTRUTURA - Eólica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Sociais - Eólica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha=1;
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Social de REGIÕES - Usinas Eólicas';
    [VetorprioridadesRegioesSocialEolica, MatrizRCComparacaoSocialRegioesEolica,a]=prioridade(MatrizAux,QuantSubSociais,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Sociais - Eólica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Econômicos - Eolica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*QuantSubSociais;
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Econômico de REGIÕES - Usinas Eólicas';
    [VetorprioridadesRegioesEconomicoEolica, MatrizRCComparacaoEconomicaRegioesEolica,a]=prioridade(MatrizAux,QuantSubEconomicos,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Econômicos - Eolica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Técnicos - GERAÇÃO - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos); %Início da %Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecGerEolica
        
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Técnico de GERAÇÃO de REGIÕES - Usinas Eólicas';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.
    VetorprioridadesRegioesSubTecGerEolica(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecGerRegioesEolica(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Técnicos - GERAÇÃO - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Técnicos - TERRITORIAL - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos+QuantSubTecGerEolica); %Início da %Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecTerritEolica
        
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Técnico TERRITORIAL de REGIÕES - Usinas Eólicas';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.
    VetorprioridadesRegioesSubTecTerritEolica(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
    MatrizRCComparacaoSubTecTerritRegioesEolica(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Técnicos - TERRITORIAL - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Início - Comparacao Dados Regioes - Subcritérios Técnicos - INFRAESTRUTURA - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ContLinha = 1+QuantRegioes*(QuantSubSociais+QuantSubEconomicos+QuantSubTecGerEolica+QuantSubTecTerritEolica); %Início da Contagem das Linhas
    Cont1=1;
    
    for Cont=1:QuantSubTecInfraEolica
        
    MatrizAux = DadosRegioesEolica( [ContLinha : ContLinha + QuantRegioes - 1] ,1 );
    MatrizAux=matrizcomparacao(MatrizAux,QuantRegioes);
    ContLinha=ContLinha + QuantRegioes;
    s='Subcritério Técnico INFRAESTRUTURA de REGIÕES - Usinas Eólicas';
    [Vetorprioridade, MatrizRCComparacao,a]=prioridade(MatrizAux,1,QuantRegioes,RCref,s); %Intencionalmente colocou-se 1 para o cálculo de 1 único subcritério e quantidade de regiões em vez de quantidade de subcritérios, para o cálculo da prioridade dos dados das regiões.
    VetorprioridadesRegioesSubTecInfraEolica(:,Cont)=Vetorprioridade;
    MatrizRCComparacao(1)=Cont1;
    Cont1=Cont1+1;
     MatrizRCComparacaoSubTecInfraRegioesEolica(Cont,:)=MatrizRCComparacao;
    
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Comparacao Dados Regioes - Subcritérios Técnicos - INFRAESTRUTURA - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Critérios Técnicos - GERAÇÃO - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecGerEolicaConcatenado(:,Cont)= VetorprioridadesRegioesSubTecGerEolica*VetorprioridadesSubTecGerEolica(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Critérios Técnicos – GERAÇÃO - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Critérios Técnicos - TERRITORIAL - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecTerritEolicaConcatenado(:,Cont)= VetorprioridadesRegioesSubTecTerritEolica*VetorprioridadesSubTecTerritEolica(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Critérios Técnicos – TERRITORIAL - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Encontrando o Vetor Prioridade para Critérios Técnicos - INFRAESTRUTURA - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for Cont=1:QuantTotalEntrevistados
 VetorSubTecInfraEolicaConcatenado(:,Cont)= VetorprioridadesRegioesSubTecInfraEolica*VetorprioridadesSubTecInfraEolica(:,Cont);
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim - Encontrando o Vetor Prioridade para Critérios Técnicos – INFRAESTRUTURA - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCATENANDO os Vetores Prioridades para TODOS os critérios - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cont1=1;
 for Cont=1:QuantTotalEntrevistados
 VetorSubcriteriosConcatenadoEolica(:,[Cont1:Cont1+QuantCriteriosEolica-1])= horzcat(VetorprioridadesRegioesSocialEolica,  VetorprioridadesRegioesEconomicoEolica,  VetorSubTecGerEolicaConcatenado(:,Cont), VetorSubTecTerritEolicaConcatenado(:,Cont), VetorSubTecInfraEolicaConcatenado(:,Cont));
 Cont1=Cont1+QuantCriteriosEolica;
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Concatenando os Vetores Prioridades para Todos os critérios - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encontrando o Vetor Prioridade Final para cada Entrevistado - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cont1=1;
 for Cont=1:QuantTotalEntrevistados
VetorPrioridadeFinalEntrevistadoEolica(:,Cont)= VetorSubcriteriosConcatenadoEolica(:,[Cont1:Cont1+QuantCriteriosEolica-1])*Vetorprioridadecriterioseolica(:,Cont);
 Cont1=Cont1+QuantCriteriosEolica;
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Encontrando o Vetor Prioridade Final para cada Entrevistado - Usinas Eólica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encontrando o Vetor Prioridade Final para todos os Entrevistados - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%VetorPrioridadeFinalSolar=1;
% Calculando a Média Geométrica Final
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
     VetorPrioridadeFinalEolica(Cont,1)= VetorPrioridadeFinalEolica(Cont,1)^(1/QuantTotalEntrevistados); %Média Geométrica
 end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fim - Encontrando o Vetor Prioridade Final para todos os Entrevistados - Usinas Eolicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Normalizando para que os índices do Vetor Prioridade Final fiqueo no %intervalo de (0;100] - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
VetorPrioridadeFinalEolicaNormalizado=normalizacao(VetorPrioridadeFinalEolica, QuantRegioes);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fim -  Normalizando para que os índices do Vetor Prioridade Final fiqueo %no intervalo de (0;100] - Usinas Eólicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
