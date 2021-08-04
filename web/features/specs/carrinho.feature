#language: pt

@carrinho
Funcionalidade: Adicionar produto ao carrinho 

Contexto: Acessar a home da Loja
    Dado que o usuário acessa a loja 

Cenário: Adicionar dois produtos ao carrinho 
    Quando ele filtrar por um vestido com desconto 
    E selecionar a cor desejada 
    E selecionar o tamanho desejado 
    Então poderá adicionar o produto ao carrinho 
    Quando o usuário adicionar o segundo produto ao carrinho 
    Então poderá verificar o valor da compra no carrinho
    
    