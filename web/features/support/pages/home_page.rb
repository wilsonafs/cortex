include RSpec::Matchers

class HomePage < SitePrism::Page
  set_url ENV["url_padrao"]
  
  section :header, "#header" do
    element :logo, "#header_logo img"
    element :busca, "#searchbox"
    element :carrinho, ".shopping_cart"
    elements :menu_link, "#block_top_menu>ul>li>a"
  end

  element :submenu, ".sfHover"
  elements :submenu_link, ".sfHover>ul>li>a"
  elements :lista_produtos, ".product-container"
  elements :tag_desconto, ".price-percent-reduction"
  elements :link_produto, ".product_img_link"

  #página produto
  element :titulo_secao, ".cat-name"

  #modal produto 
  element :modal_tag_desconto, "#reduction_percent_display"
  element :btn_add_carrinho, "#add_to_cart button"
  element :cor_laranja, "#color_13"
  element :tamanho, "#uniform-group_1"
  element :btn_carrinho, "#add_to_cart button"
  elements :quantidade, "[data-field-qty='qty']"

  #produto adicionado
  elements :titulo_adicionado, "#layer_cart h2"
  element :continuar_comprando, ".continue"
  element :qtd_item, "#layer_cart_product_quantity"
  element :checkout, ".button-container a.button-medium"

  #checkout
  element :total_carrinho, "#total_price"

  def carregar_home
    load
    wait_until_header_visible
    expect(header).to have_logo
    expect(header).to have_busca
    expect(header).to have_carrinho
    expect(header).to have_menu_link(:count => 3)
  end

  def selecionar_link_menu
    header.menu_link[1].hover
    wait_until_submenu_visible
    submenu_link[2].click
    if lista_produtos[0].has_css?(".price-percent-reduction")
      @valor_desconto = tag_desconto[1].text
      puts @valor_desconto
      expect(@valor_desconto).to eq("-5%")
      link_produto[0].click
    else
      puts "produto não tem desconto"
    end
    within_frame(find('.fancybox-iframe')) do
      wait_until_modal_tag_desconto_visible
      expect(modal_tag_desconto.text).to eq(@valor_desconto)
    end
  end

  def selecionar_cor 
    within_frame(find('.fancybox-iframe')) do
      cor_laranja.click
    end
  end

  def selecionar_tamanho 
    within_frame(find('.fancybox-iframe')) do
      tamanho.select($tamanho_m)
    end
  end

  def adicionar_carrinho 
    within_frame(find('.fancybox-iframe')) do
      btn_carrinho.click
    end
    wait_until_titulo_adicionado_visible
    expect(titulo_adicionado[0].text).to eq($produto_adicionado)
    continuar_comprando.click
  end

  def selecionar_link_camiseta
    header.menu_link[2].click
    wait_until_titulo_secao_visible
    expect(titulo_secao.text).to eq($titulo_camisetas)
    link_produto[0].click
    within_frame(find('.fancybox-iframe')) do
      wait_until_tamanho_visible
      quantidade[1].click
      btn_carrinho.click
    end
    wait_until_titulo_adicionado_visible
    expect(titulo_adicionado[0].text).to eq($produto_adicionado)
    expect(qtd_item.text).to eq($quantidade_camisetas)
    checkout.click
  end
  
  def validar_valor
    wait_until_total_carrinho_visible
    expect(total_carrinho.text).to eq($valor_compra)
  end

end
