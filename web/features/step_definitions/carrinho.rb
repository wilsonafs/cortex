Dado("que o usuário acessa a loja") do
    @home.carregar_home
end
  
Quando("ele filtrar por um vestido com desconto") do
    @home.selecionar_link_menu
end
  
Quando("selecionar a cor desejada") do
    @home.selecionar_cor
end
  
Quando("selecionar o tamanho desejado") do
    @home.selecionar_tamanho
end
  
Então("poderá adicionar o produto ao carrinho") do
    @home.adicionar_carrinho
end
  
Quando("o usuário adicionar o segundo produto ao carrinho") do
    @home.selecionar_link_camiseta
end
  
Então("poderá verificar o valor da compra no carrinho") do
    @home.validar_valor
end