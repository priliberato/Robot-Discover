*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Resource        ../resources/base.resource


*** Test Cases ***

Deve poder cadastrar um novo do walker

    ${dog_walker}        Create Dictionary    #essa função cria um dicionário de dados
    ...    name=Priscilla Braga    
    ...    email=priscillaliberato@yahoo.com.br    
    ...    cpf=00000014141    
    ...    cep=04534011        
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi    
    ...    city_uf=São Paulo/SP    
    ...    number=1000    
    ...    details=Apto 28    
    ...    cnh=toretto.jpg

    Start session
    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup Should be    Recebemos o seu cadastro e em breve retornaremos o contato.
    Finish session

Não deve cadastrar se o CPF for incorreto
    [Tags]    cpf_inv

    ${dog_walker}        Create Dictionary    #essa função cria um dicionário de dados
    ...    name=Priscilla Braga    
    ...    email=priscillaliberato@yahoo.com.br    
    ...    cpf=000000141aa   
    ...    cep=04534011        
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi    
    ...    city_uf=São Paulo/SP    
    ...    number=1000    
    ...    details=Apto 28    
    ...    cnh=toretto.jpg

    Start session
    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Finish session

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required

    Start session
    Go to signup page
    Submit signup form

    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CNH)
    
    Finish session

Deve poder cadastrar um novo do walker que sabe cuidar de pets
    [Tags]        aservice

    ${dog_walker}        Create Dictionary   
    ...    name=Dominic Toretto    
    ...    email=toretto@yahoo.com.br    
    ...    cpf=00000014141    
    ...    cep=04534011        
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi    
    ...    city_uf=São Paulo/SP    
    ...    number=1000    
    ...    details=Apto 28    
    ...    cnh=toretto.jpg
    ...    additional_service=Cuidar

    Start session
    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup Should be    Recebemos o seu cadastro e em breve retornaremos o contato.
    Finish session

Deve poder cadastrar um novo do walker que sabe adestrar pets
    [Tags]        aservice

    ${dog_walker}        Create Dictionary   
    ...    name=Dominic Toretto    
    ...    email=toretto@yahoo.com.br    
    ...    cpf=00000014141    
    ...    cep=04534011        
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi    
    ...    city_uf=São Paulo/SP    
    ...    number=1000    
    ...    details=Apto 28    
    ...    cnh=toretto.jpg
    ...    additional_service=Adestrar

    Start session
    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup Should be    Recebemos o seu cadastro e em breve retornaremos o contato.
    Finish session
