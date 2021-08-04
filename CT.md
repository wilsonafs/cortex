CT001 - Validar que o robô consegue acessar a url do MDIC 
CT002 - Validar comportamento do robô quando não consegue acessar a url 
CT003 - Validar o download dos arquivos de importação e exportação no formato CSV
CT004 - Validar que os 11 campos estão presentes no csv 
CT005 - Validar que os dados correspondem ao ano corrente
CT006 - Validar que o ano e mês foram foi transformados em um único período
CT007 - Validar que o campo criado "Período" está gravando o valor correto ex. 01/03/19
CT008 - Validar que o campo Tipo de atividade foi criado (Exportação e Importação)
CT009 - Validar que os campos estão com dados válidos 
CT010 - Tentativa de alimentar o feed com dados inválidos 
CT011 - Tentativa de alimentar o feed com dados da coluna em branco 
CT012 - Valdiar que o feed armazena a carga histórica desde 2018 
CT013 - Validar que o feed armazena sempre os últimos 2 meses disponíveis 


CT005 - Validar que os dados correspondem ao ano corrente
Fluxo Principal - Exportação CSV
    Dado que o download do arquivo de exportação foi realizado com sucesso 
    Quando o usuário acessar o arquivo 
    Então deverá visualizar toda a relação de dados disponíveis 
    E o ano corrente deverá corresponder ao ano solicitado 

Fluxo de Exceção - Exportação CSV com ano errado 
    Dado que o download do arquivo de exportação foi realizado com sucesso 
    Quando o usuário acessar o arquivo 
    Então deverá visualizar toda a relação de dados disponíveis 
    Mas o ano corrente não corresponde ao ano solicitado 
    Então o arquivo deverá ser descartado 
    E um novo dowload deverá ser feito 

CT007 - Validar que o campo criado "Período" está gravando o valor correto ex. 01/03/21
Fluxo Principal - Validar campo "Período"
    Dado que o arquivo CSV foi gerado para o mês de Março do ano de 2021
    Quando for criado o campo "Período" para alimentar o feed
    Então o campo deve exibir o formato "01/03/21"

CT007 - Validar que o campo criado "Período" está gravando o valor correto ex. 01/03/21
Fluxo de Exceção - Validar campo "Período"
    Dado que o arquivo CSV foi gerado para o mês de Março do ano de 2021
    Quando for criado o campo "Período" para alimentar o feed
    Mas o campo fazer o cálculo errado ex. "05/03/21" 
    Então o feed não será alimentado com as informações dessa atualização
