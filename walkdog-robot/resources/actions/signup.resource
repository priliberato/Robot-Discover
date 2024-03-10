*** Settings ***
Documentation    Ações, steps e elementos da funcionalidade de cadastro

Library    Browser

*** Keywords ***

Go to signup page     #Vai para página de cadastro
    Click    css=a[href="/signup"]

    Wait For Elements State    form h1    visible    5000
    Get Text    form h1    equal    Faça seu cadastro

Fill signup form      #Preenche o formulário de cadastro
    [Arguments]    ${dog_walker}
    Fill Text        css=input[name=name]                ${dog_walker}[name]           #Fill text - preenche o campo de acordo com o parâmetro e informação definida
    Fill Text        css=input[name=email]               ${dog_walker}[email]          
    Fill Text        css=input[name=cpf]                 ${dog_walker}[cpf]     
    Fill Text        css=input[name=cep]                 ${dog_walker}[cep]  

    Click            css=input[type=button][value="Buscar CEP"]            #Clica no botão de acordo com o input encontrado no css.

    Get Property    css=input[name=addressStreet]    value        equal    ${dog_walker}[street]        #Obtem/Busca propriedade a partir do click
    Get Property    css=input[name=addressDistrict]    value        equal    ${dog_walker}[district]
    Get Property    css=input[name=addressCityUf]    value        equal    ${dog_walker}[city_uf]

    Fill Text        css=input[name=addressNumber]       ${dog_walker}[number] 
    Fill Text        css=input[name=addressDetails]      ${dog_walker}[details] 

    Click    xpath=//span[text()="${dog_walker}[additional_service]"]/..
    Take Screenshot    selector=//span[text()="${dog_walker}[additional_service]"]/..
    #para printar a evidência

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]   
   #Execdir é uma variável de ambiente do robot que identifica o diretorio de execução do teste automatizado(no caso, walkdog-robot) e recebe junto o nome do arquivo e sua extensão.
    #Upload file by selector faz o upload de um arquivo selecionado

Submit signup form      #Submete o formulário de cadastro
    Click    css=.button-register    #Clica no botão (nesse caso o botão cadastrar que tem como classe '.button-register ' no css)

Popup Should be 
    [Arguments]    ${expected-text}
    Wait For Elements State    css=.swal2-html-container    visible    5    #Vericiar de o elemento(pop-up) ficará visivel em até 5 segundos
    Get Text                   css=.swal2-html-container    equal      ${expected-text}
    #Get text procura o texto do pop-up(que está no elemento '.swal2-html-container' e compara(equal) se está com a mesma frase mostrada após o click no botão cadastro). Assim o teste é validado.

Alert Should be
    [Arguments]    ${expected_text}

     Wait For Elements State    css=.alert-error >> text=${expected_text}
    ...    visible    5
    
    Sleep    10        # Definindo o tempo que o browser ficará aberto para visualização do teste realizado(10s)