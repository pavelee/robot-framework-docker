*** Settings ***
Library    Browser

*** Tasks ***
Vistit Google
    Start Browser
    Go To    https://google.com
    End Browser

*** Keywords ***
Start Browser
    New Browser    firefox    headless=0    slowMo=0.1
    New Context    viewport={'width': 1920, 'height': 1080}    acceptDownloads=true    recordVideo={'dir': 'video'}
    New Page

End Browser
    Close Browser
