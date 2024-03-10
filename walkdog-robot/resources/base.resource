    
*** Settings ***
Documentation

Library     Browser

Resource    Actions/signup.resource

*** Keywords

Start session
    New Browser    browser=chromium        headless=False     #Procura o browser definido e o False faz com que a gente verifique o site abrindo.
    New Page       https://walkdog.vercel.app

    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo
    ...        visible    5
    #inspeciona um elemento e verifica se tá visivel na página

Finish session
    Take Screenshot     fullPage=True       #Faz um print ao finalizar o teste,para garantir que o teste foi finalizado com sucesso
    #fullpage=true, tira um print da tela inteira