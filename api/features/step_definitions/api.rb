Dado("que eu tenho uma requisição com uma data passada") do
    @data_passada = "08032020"
end
  

Quando("fizer uma chamada para a API") do
    @result = HTTParty.get("https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoDolarDia(dataCotacao=@dataCotacao)?%40dataCotacao='#{@data_passada}'&%24format=json")
end

Então("poderei validar que a cotação é positiva") do
    expect(@result.code).to eq 200
    puts("A requisição retornou o status #{@result.code}")
    @response = @result.parsed_response
    puts @response
    expect(@response["value"][0]["cotacaoCompra"]).to be_positive
    expect(@response["value"][0]["dataHoraCotacao"]).not_to eql(Time.now)
end

Então("poderei validar o seu formato") do
    expect(@result.code).to eq 200
    puts("A requisição retornou o status #{@result.code}")
    @response = @result.parsed_response
    expect(@response["value"][0]["cotacaoCompra"]).to eq(5.3069)
end

Então("poderei validar as suas casas decimais") do
    expect(@result.code).to eq 200
    puts("A requisição retornou o status #{@result.code}")
    @response = @result.parsed_response
    expect(@response["value"][0]["cotacaoCompra"].round).to eq(5)
end