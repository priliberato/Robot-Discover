*** Settings ***
Documentation        Suite de testes da home page

Library        Browser

*** Test Cases ***
Home page deve estar online
    New Browser    browser=chromium    headless=False 
    New Page    https://walkdog.vercel.app

    Get Text    h1    equal    Cuidado e diversão em cada passo        #procura um texto igual a frase "cuidado e ...", para comprovar que está na pag.

    Take Screenshot        #Faz o print da tela pra comprovar o teste de acessar a pagina