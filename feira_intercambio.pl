# Autor : João Barboza Rodrigues
# Data : 10/11/2020
# https://rachacuca.com.br/logica/problemas/feira-de-intercambio/

resolve(S) :-
           S = sala(estudante(_,_,_,_,_,_),
                    estudante(_,_,_,_,_,_),
                    estudante(_,_,_,_,_,_),
                    estudante(_,_,_,_,_,_),
                    estudante(_,_,_,_,_,_)),

% A estudante de mochila Verde está ao lado da estudante de 30 anos.

            ao_lado(C,D,E,S),
            mochila(C,verde),
            idade(D,trinta),

% A dona da mochila Azul está em algum lugar entre a Bruna e a estudante de 24 anos, nessa ordem.
# Em uma das pontas está a estudante que vai parcelar o intercâmbio em 2 anos e meio.
# A dona da mochila Amarela está em algum lugar à esquerda de quem vai fazer um intercâmbio de 6 meses.
# Fabiana é a estudante mais velha.
# Luiza está exatamente à esquerda da estudante de 24 anos.
# Quem vai para o Canadá está em algum lugar à direita de quem tem a mochila Verde
# A estudante que vai para a Austrália está exatamente à esquerda da estudante de mochila Amarela.
# A dona da mochila Azul está ao lado de quem vai pagar o intercâmbio em 24 parcelas.
# Quem vai fazer um intercâmbio de 15 meses está em algum lugar à direita da estudante de mochila Verde
# A estudante mais nova está na segunda posição.
# A estudante de mochila Azul está exatamente à esquerda da estudante que vai fazer um intercâmbio de 18 meses.
# Quem vai para a Inglaterra vai parcelar o intercâmbio em 30 vezes.
# A dona da mochila Verde está ao lado de quem vai parcelar os gastos em 1 ano e meio.
# A estudante que vai fazer um intercâmbio de 9 meses está com a mochila Branca.
# Em uma das pontas está a estudante que vai parcelar o intercâmbio em 6 parcelas.
# A estudante de 33 anos está em algum lugar à direita da estudante de mochila Verde.
# Quem vai fazer um intercâmbio de 1 ano está na segunda posição.
# A estudante de mochila Azul está em algum lugar à esquerda de quem vai pagar o intercâmbio em 18 vezes.
# Quem vai para a Irlanda está em algum lugar entre quem vai para os Estados Unidos e quem vai para a Austrália, nessa ordem.
# Emily está exatamente à direita da estudante de mochila Verde.
# Restrições de fechamento.
.


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
