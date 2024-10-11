
*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    BuiltIn
Library    XML
Variables    ./data.yaml



*** Test Cases ***
Open web site testing
    Open browser chrome    ${url}    ${browser}
    Input username    ${name.standard.user}
    Input password    ${name.standard.password}
    Click login
    Verify text products
    Add to cart
    Click cart logo
    Verify cart page
    Click checkout
    Verify checkout page
    Input first name    ${information.fname}
    Input last name    ${information.lname}
    Input postal code    ${information.postalcode}
    Click continue
    Verify continue page
    Click finish
    Verify finish page
    Click logout
    Verify back to login
    

*** Keywords ***
Open browser chrome
    [Arguments]    ${url}    ${browser}    
    Open Browser    ${url}    ${browser}        

Input username
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}    

Input password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]     ${password}

Click login
    Click Button    //*[@id="login-button"]

Verify text products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=30s

Add to cart
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button


Click cart logo
    Wait Until Element Is Visible    //*[@id="shopping_cart_container"]/a    timeout=30s
    Click Element    //*[@id="shopping_cart_container"]/a

Verify cart page
    Wait Until Element Is Visible    //div[contains(text(),"Your Cart")]    timeout=30s
    Wait Until Element Is Visible    //div[contains(text(),"Sauce Labs Backpack")]    timeout=30s
    Wait Until Element Is Visible    //div[contains(text(),"29.99")]    timeout=30s

Click checkout
    Wait Until Element Is Visible    //a[contains(@class, 'checkout_button')]    timeout=30s
    Click Element    //a[contains(@class, 'checkout_button')]

Verify checkout page
    Wait Until Element Is Visible    //div[contains(text(),"Checkout: Your Information")]    timeout=30s

Input first name
    [Arguments]    ${first_name}
    Input Text    //*[@id="first-name"]    ${first_name}

Input last name
    [Arguments]    ${last_name}
    Input Text    //*[@id="last-name"]    ${last_name}

Input postal code
    [Arguments]    ${postal_code}
    Input Text    //*[@id="postal-code"]    ${postal_code}


Click continue
    Click Button    //*[@id="checkout_info_container"]/div/form/div[2]/input

Verify continue page
    Wait Until Element Is Visible    //*[@id="item_4_title_link"]/div    timeout=30s
    ${item_name}=    Get Text    //*[@id="item_4_title_link"]/div
    Should Be Equal    ${item_name}    Sauce Labs Backpack

    ${item_price}=    Get Text    //*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[2]/div[2]
    Should Be Equal    ${item_price}    $29.99

    Wait Until Element Is Visible    //*[@id="checkout_summary_container"]/div/div[2]/div[5]    timeout=30s
    Wait Until Element Is Visible    //*[@id="checkout_summary_container"]/div/div[2]/div[6]    timeout=30s
    Wait Until Element Is Visible    //*[@id="checkout_summary_container"]/div/div[2]/div[7]    timeout=30s

Click finish
    Click Element    //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

Verify finish page
    Wait Until Element Is Visible    //*[@id="checkout_complete_container"]/h2    timeout=30s

Click logout    
    Click Button    //*[@id="menu_button_container"]/div/div[3]/div/button   
    Wait Until Element Is Visible    //*[@id="logout_sidebar_link"]    timeout=30s
    Click Element    //*[@id="logout_sidebar_link"]

Verify back to login
    Wait Until Element Is Visible    //*[@id="login-button"]    timeout=30s

    