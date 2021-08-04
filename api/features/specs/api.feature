#language: pt

Funcionalidade: Realizar validações para a API pública do Banco Central

Validar que a cotação nunca é negativa para uma data passada.
Que os valores sempre obedecem ao mesmo formato, separando as casas decimais por vírgula.
Que os valores sempre apresentam até 4 casas decimais.

Cenário: Validar que a cotação nunca é negativa para uma data passada.
    Dado que eu tenho uma requisição com uma data passada
    Quando fizer uma chamada para a API
    Então poderei validar que a cotação é positiva  

Cenário: Validar que os valores sempre obedecem ao mesmo formato
    Dado que eu tenho uma requisição com uma data passada
    Quando fizer uma chamada para a API
    Então poderei validar o seu formato

Cenário: Que os valores sempre apresentam até 4 casas decimais.
    Dado que eu tenho uma requisição com uma data passada
    Quando fizer uma chamada para a API
    Então poderei validar as suas casas decimais