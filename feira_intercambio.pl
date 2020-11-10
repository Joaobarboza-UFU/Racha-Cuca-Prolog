% Autor : João Barboza Rodrigues
% Data : 10/11/2020
% https://rachacuca.com.br/logica/problemas/feira-de-intercambio/

resolve(S) :-
           S = sala(estudante(_,_,_,_,_,_),
                    estudante(_,_,_,_,_,_),
                    estudante(_,_,_,_,_,_),
                    estudante(_,_,_,_,_,_),
                    estudante(_,_,_,_,_,_)),

% A estudante de mochila Verde está ao lado da estudante de 30 anos.

            ao_lado(C,D,S),
            mochila(C,verde),
            idade(D,trinta),

% A dona da mochila Azul está em algum lugar entre a Bruna e a estudante de 24 anos, nessa ordem.

            algum_lugar_entre(A,B,F,S),
            mochila(A,azul),
            nome(B,bruna),
            idade(F,vinte_quatro),

% Em uma das pontas está a estudante que vai parcelar o intercâmbio em 2 anos e meio.

            uma_das_pontas(E,S),
            parcelas(E, trinta),

% A dona da mochila Amarela está em algum lugar à esquerda de quem vai fazer um intercâmbio de 6 meses.

            algum_lugar_a_esquerda(G,H,S),
            mochila(G,amarela),
            duracao(H,seis_meses),

% Luiza está exatamente à esquerda da estudante de 24 anos.

            exatamente_a_esquerda(I,J,S),
            nome(I,luiza),
            idade(J,vinte_quatro),

% Quem vai para o Canadá está em algum lugar à direita de quem tem a mochila Verde

            algum_lugar_a_direita(K,L,S),
            pais(K,canada),
            mochila(L,verde),

% A estudante que vai para a Austrália está exatamente à esquerda da estudante de mochila Amarela.

            exatamente_a_esquerda(M,N,S),
            pais(M,australia),
            mochila(N,amarela),

% A dona da mochila Azul está ao lado de quem vai pagar o intercâmbio em 24 parcelas.

            ao_lado(O,P,S),
            mochila(O,azul),
            parcelas(P,vinte_quatro),

% Quem vai fazer um intercâmbio de 15 meses está em algum lugar à direita da estudante de mochila Verde

            algum_lugar_a_direita(Q,R,S),
            duracao(Q,quinze_meses),
            mochila(R,verde),

% A estudante de mochila Azul está exatamente à esquerda da estudante que vai fazer um intercâmbio de 18 meses.

            exatamente_a_esquerda(T,U,S),
            mochila(T,azul),
            duracao(U,dezoito_meses),

% A dona da mochila Verde está ao lado de quem vai parcelar os gastos em 1 ano e meio.

            ao_lado(V,W,S),
            mochila(V,verde),
            parcelas(W,dezoito),

% Em uma das pontas está a estudante que vai parcelar o intercâmbio em 6 parcelas.

            uma_das_pontas(Y,S),
            parcelas(Y,seis),

% A estudante de 33 anos está em algum lugar à direita da estudante de mochila Verde.

            algum_lugar_a_direita(Z,A1,S),
            idade(Z,trinta_e_tres),
            mochila(A1,verde),
            
% A estudante de mochila Azul está em algum lugar à esquerda de quem vai pagar o intercâmbio em 18 vezes.

            algum_lugar_a_esquerda(B1,C1,S),
            mochila(B1,azul),
            parcelas(C1,dezoito),

% Quem vai para a Irlanda está em algum lugar entre quem vai para os Estados Unidos e quem vai para a Austrália, nessa ordem.

            algum_lugar_entre(D1,E1,F1,S),
            pais(D1,irlanda),
            pais(E1,eua),
            pais(F1,australia),

% Emily está exatamente à direita da estudante de mochila Verde.

            exatamente_a_direita(G1,H1,S),
            nome(G1,emily),
            mochila(H1,verde),

% A estudante mais nova está na segunda posição.

            segunda_posicao(I1,S),
            idade(I1,vinte_um),


% Fabiana é a estudante mais velha.

            pessoa(J1,S),
            nome(J1,fabiana),
            idade(J1,trinta_e_tres),

% Quem vai para a Inglaterra vai parcelar o intercâmbio em 30 vezes.

            pessoa(K1,S),
            pais(K1,inglaterra),
            parcelas(K1, trinta),

% A estudante que vai fazer um intercâmbio de 9 meses está com a mochila Branca.

            pessoa(L1,S),
            duracao(L1,nove_meses),
            mochila(L1,branca),

% Quem vai fazer um intercâmbio de 1 ano está na segunda posição.

            segunda_posicao(M1,S),
            duracao(M1,um_ano),

% Restrições de fechamento.

            pessoa(N1,S),
            mochila(N1,vermelha),

            pessoa(O1,S),
            nome(O1,talita),

            pessoa(P1,S),
            parcelas(P1,doze),

            pessoa(R1,S),
            idade(R1,vinte_sete).


pessoa(X,sala(X,_,_,_,_)).
pessoa(X,sala(_,X,_,_,_)).
pessoa(X,sala(_,_,X,_,_)).
pessoa(X,sala(_,_,_,X,_)).
pessoa(X,sala(_,_,_,_,X)).

mochila(estudante(X,_,_,_,_,_),X).
nome(estudante(_,X,_,_,_,_),X).
pais(estudante(_,_,X,_,_,_),X).
duracao(estudante(_,_,_,X,_,_),X).
parcelas(estudante(_,_,_,_,X,_),X).
idade(estudante(_,_,_,_,_,X),X).

algum_lugar_a_esquerda(X,Y,sala(X,Y,_,_,_)).
algum_lugar_a_esquerda(X,Y,sala(X,_,Y,_,_)).
algum_lugar_a_esquerda(X,Y,sala(X,_,_,Y,_)).
algum_lugar_a_esquerda(X,Y,sala(X,_,_,_,Y)).
algum_lugar_a_esquerda(X,Y,sala(_,X,Y,_,_)).
algum_lugar_a_esquerda(X,Y,sala(_,X,_,Y,_)).
algum_lugar_a_esquerda(X,Y,sala(_,X,_,_,Y)).
algum_lugar_a_esquerda(X,Y,sala(_,_,X,Y,_)).
algum_lugar_a_esquerda(X,Y,sala(_,_,X,_,Y)).
algum_lugar_a_esquerda(X,Y,sala(_,_,_,X,Y)).

exatamente_a_esquerda(X,Y,sala(X,Y,_,_,_)).
exatamente_a_esquerda(X,Y,sala(_,X,Y,_,_)).
exatamente_a_esquerda(X,Y,sala(_,_,X,Y,_)).
exatamente_a_esquerda(X,Y,sala(_,_,_,X,Y)).

algum_lugar_a_direita(X,Y,sala(Y,X,_,_,_)).
algum_lugar_a_direita(X,Y,sala(Y,_,X,_,_)).
algum_lugar_a_direita(X,Y,sala(Y,_,_,X,_)).
algum_lugar_a_direita(X,Y,sala(Y,_,_,_,X)).
algum_lugar_a_direita(X,Y,sala(_,Y,X,_,_)).
algum_lugar_a_direita(X,Y,sala(_,Y,_,X,_)).
algum_lugar_a_direita(X,Y,sala(_,Y,_,_,X)).
algum_lugar_a_direita(X,Y,sala(_,_,Y,X,_)).
algum_lugar_a_direita(X,Y,sala(_,_,Y,_,X)).
algum_lugar_a_direita(X,Y,sala(_,_,_,Y,X)).

exatamente_a_direita(X,Y,sala(Y,X,_,_,_)).
exatamente_a_direita(X,Y,sala(_,Y,X,_,_)).
exatamente_a_direita(X,Y,sala(_,_,Y,X,_)).
exatamente_a_direita(X,Y,sala(_,_,_,Y,X)).

algum_lugar_entre(X,Y,Z,sala(Y,X,Z,_,_)).
algum_lugar_entre(X,Y,Z,sala(Y,X,_,Z,_)).
algum_lugar_entre(X,Y,Z,sala(Y,X,_,_,Z)).
algum_lugar_entre(X,Y,Z,sala(Y,_,X,Z,_)).
algum_lugar_entre(X,Y,Z,sala(Y,_,X,_,Z)).
algum_lugar_entre(X,Y,Z,sala(Y,_,_,X,Z)).
algum_lugar_entre(X,Y,Z,sala(_,Y,X,Z,_)).
algum_lugar_entre(X,Y,Z,sala(_,Y,X,_,Z)).
algum_lugar_entre(X,Y,Z,sala(_,Y,_,X,Z)).
algum_lugar_entre(X,Y,Z,sala(_,_,Y,X,Z)).

uma_das_pontas(X,sala(X,_,_,_,_)).
uma_das_pontas(X,sala(_,_,_,_,X)).

ao_lado(X,Y,sala(X,Y,_,_,_)).
ao_lado(X,Y,sala(Y,X,_,_,_)).
ao_lado(X,Y,sala(_,X,Y,_,_)).
ao_lado(X,Y,sala(_,Y,X,_,_)).
ao_lado(X,Y,sala(_,_,X,Y,_)).
ao_lado(X,Y,sala(_,_,Y,X,_)).
ao_lado(X,Y,sala(_,_,_,X,Y)).
ao_lado(X,Y,sala(_,_,_,Y,X)).

segunda_posicao(X,sala(_,X,_,_,_)).
