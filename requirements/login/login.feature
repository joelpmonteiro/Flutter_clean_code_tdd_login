Feature: Login
Como um cliente
Quero poder acessar minha conta e me manter logado
Para que eu possa ver e responder enquetes de forma rápida

Cenário: Credenciais válidades
Dado que o cliente informou Credenciais válidas
Quando solicitar para fazer Login
Então o sistema deve enviar o usuario para a tela de pesquisas
E manter usuario conectado