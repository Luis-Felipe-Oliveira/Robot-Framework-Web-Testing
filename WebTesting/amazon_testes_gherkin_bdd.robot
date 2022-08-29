*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 Acesso ao menu "Eletrônicos"
    [Documentation]    Esse Teste verifica o menu eletrônico do site da Amazon.com.br
    [Tags]             menus    categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia|Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de Teste 02 Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Console Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Console Xbox Series S"
    E um produto da linha "Console Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Console Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Console Xbox Series S"
    E um produto da linha "Console Xbox Series S" deve ser mostrado na página
    E adicionar o produto "Xbox Series S" no carrinho
    E verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Console Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Console Xbox Series S"
    E um produto da linha "Console Xbox Series S" deve ser mostrado na página
    E adicionar o produto "Xbox Series S" no carrinho
    E verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    E remover o produto "Console Xbox Series S" do carrinho
    E verificar se o carrinho fica vazio