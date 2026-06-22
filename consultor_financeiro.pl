% Definição dos fatos %
 
% Perfis Possíveis
perfil(conservador).
perfil(moderado).
perfil(balanceado).
perfil(arrojado).
perfil(agressivo).
 
% Níveis de Risco
risco(baixo).
risco(medio).
risco(medio_alto).
risco(alto).
risco(altissimo).
 
% Taxa de Lucro
lucro(baixo).
lucro(equilibrado).
lucro(elevado).
lucro(alto).
lucro(expressivo).
 
% Prazo de Retorno
prazo(curto).
prazo(regular).
prazo(longo).
 
% Objetivos Possíveis
objetivo(seguranca).
objetivo(rentabilidade).
objetivo(equilibrio).
objetivo(retorno_maior).
objetivo(maximizacao_lucro).

% Investimentos 

investimento(tesouro_direto).
investimento(cdb).
investimento(fundo_di).
investimento(fundo_multimercado).
investimento(bolsa_valores).
investimento(ativos_internacionais).
investimento(ativos_renda_fixa).
investimento(ativos_renda_variavel).

% Regras do Agente

% Identifica o perfil do investidor com base em seus critérios de investimento,
% focando em características, como: risco tolerado, retorno esperado, prazo de espera e objetivo final.

identifica_perfil(X, conservador) :- 
    risco(X,baixo), 
    lucro(X,baixo), 
    prazo(X,curto), 
    objetivo(X,seguranca).

identifica_perfil(X,moderado) :- 
    risco(X,medio), 
    lucro(X,equilibrado), 
    prazo(X,regular), 
    objetivo(X,equilibrio).

identifica_perfil(X,balanceado) :- 
    risco(X,medio_alto), 
    lucro(X,elevado), 
    prazo(X,regular), 
    objetivo(X,elevado).

identifica_perfil(X,arrojado) :- 
    risco(X,alto), 
    lucro(X,alto), 
    prazo(X,longo), 
    objetivo(X,retorno_maior).

identifica_perfil(X,agressivo) :- 
    risco(X,altissimo), 
    lucro(X,expressivo), 
    prazo(X,longo), 
    objetivo(X,maximizacao_lucro).

% Sugere opções de investimento com base no perfil do investidor, visando apresentar as melhores opções para ele.

sugere_investimento(conservador, Investimento) :-
    Investimento = investimento(tesouro_direto);
    Investimento = investimento(cdb);
    Investimento = investimento(ativos_renda_fixa).

sugere_investimento(moderado, Investimento) :-
    Investimento = investimento(cdb);
    Investimento = investimento(ativos_renda_fixa);
    Investimento = investimento(fundo_multimercado).

sugere_investimento(balanceado, Investimento) :-
    Investimento = investimento(ativos_renda_fixa);
    Investimento = investimento(fundo_multimercado);
    Investimento = investimento(ativos_renda_variavel).

sugere_investimento(arrojado, Investimento) :-
    Investimento = investimento(fundo_multimercado);
    Investimento = investimento(ativos_renda_variavel);
    Investimento = investimento(bolsa_valores).

sugere_investimento(agressivo, Investimento) :-
    Investimento = investimento(ativos_renda_variavel);
    Investimento = investimento(bolsa_valores);
    Investimento = investimento(ativos_internacionais).

% Massa de teste para regra recursiva:

risco(ana, baixo).
risco(carlos, alto).
risco(joao, medio).
risco(maria, altissimo).

lucro(ana, baixo).
lucro(carlos, alto).
lucro(joao, equilibrado).
lucro(maria, expressivo).

prazo(ana, curto).
prazo(carlos, longo).
prazo(joao, regular).
prazo(maria, longo).

objetivo(ana, seguranca).
objetivo(carlos, retorno_maior).
objetivo(joao, equilibrio).
objetivo(maria, maximizacao_lucro).

% Regra recursiva que terá como objetivo a análise em massa de vários clientes, utilizando fatos definidos previamente

% Lista vazia, o processo para.
avalia_clientes([]).

avalia_clientes([Cliente | T]) :-
    write('---------------------------------------'), nl,
    write('Cliente: '), write(Cliente), nl,
    
    % Regra de identificação definida anteriormente
    identifica_perfil(Cliente, Perfil),
    
    write('Perfil de Investimento:    '), write(Perfil), nl,
    
    % Continua para o resto da lista
    avalia_clientes(T).

main :-
    statistics(cputime, T1),
    nl,
    writeln('=== RESULTADO DAS AVALIACOES ==='),
    avalia_clientes([ana, joao, carlos, maria]),
    statistics(cputime, T2),
    Tempo is T2 - T1,
    nl,
    write('Tempo de execucao: '), write(Tempo), writeln(' segundos.').
