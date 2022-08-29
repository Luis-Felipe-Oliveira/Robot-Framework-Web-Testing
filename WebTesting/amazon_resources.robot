*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.amazon.com.br
${MENU_ELETRONICOS}        //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}      //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br 
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains     text=${FRASE}
    Wait Until Element Is Visible     locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be     title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa 
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa, se está listando o produto pesquisado "${PRODUTO}"
    Wait Until Element Is Visible    locator=//span[@class='a-color-state a-text-bold'][contains(.,'"${PRODUTO}"')]



Adicionar o produto "${PRODUTO}" no carrinho
    Wait Until Element Is Visible            locator=//img[@alt='${PRODUTO}']
    Click Element                            locator=//img[@alt='${PRODUTO}']
    Click Element                            locator=add-to-cart-button
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible            locator=//div[@class='a-section a-padding-medium sw-atc-message-section'][contains(.,'Adicionado ao carrinho')]

Remover o produto "Console Xbox Series S" do carrinho
    Click Element                            locator=//span[@class='a-button-inner'][contains(.,'Ir para o carrinho')]
    Click Element                            locator=//input[@value='Excluir']
    
Verificar se o carrinho fica vazio
    Wait Until Element Is Visible            locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

    
# GHERKIN STEPS
Dado que estou na home page da Amazon.com.br 
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia|Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"

Quando pesquisar pelo produto "Console Xbox Series S"
    Digitar o nome de produto "Console Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 

Então o título da página deve ficar "Amazon.com.br : Console Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Console Xbox Series S"

E um produto da linha "Console Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, se está listando o produto pesquisado "Console Xbox Series S"





E adicionar o produto "Xbox Series S" no carrinho
    Adicionar o produto "Xbox Series S" no carrinho

E verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

E verificar se o carrinho fica vazio
    Verificar se o carrinho fica vazio
