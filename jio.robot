
*** Settings ***
Library    AppiumLibrary    




*** Test Cases ***
TC1_Verify_Invalid_login
    Open Application    http://localhost:4723/wd/hub    
    ...    platformName=android
    ...    deviceName=vivo
    ...    appPackage=com.jpl.jiomart
    ...    appActivity=com.jpl.jiomart.dashboard.activities.DashboardActivity
    ...    noReset=True
     
    Set Appium Timeout    30s
    Wait Until Page Contains Element    //android.view.View[@content-desc="groceries"]
    Click Element    //android.view.View[@content-desc="groceries"]
    Wait Until Page Contains Element    //*[@text="VIEW ALL"]
    Click Element    //*[@text="VIEW ALL"]
    Wait Until Page Contains Element    //*[@text="Sort | Filter"]
    Click Element    //*[@text="Sort | Filter"]
    Wait Until Page Contains Element    //*[@text="Low to High"]
    Click Element    //*[@text="Low to High"]
    Wait Until Page Contains Element    //*[@text="Done"]
    Click Element    //*[@text="Done"]
    #Scroll Down   //*[@text="Cadbury Five Star Chocolate 19.5 g"]    
    FOR    ${i}    IN RANGE    0    7
        ${output}    Run Keyword And Ignore Error     Click Element    //*[contains(@text,"Cadbury Five Star Chocolate 19.5 g")]   
        Swipe By Percent    50    75    50    25    1000
        Exit For Loop If    ' ${output}[0]'=='PASS'
    END
    
    Wait Until Page Contains Element    //*[@text="Add to Cart"]
    Click Element    //*[@text="Add to Cart"]
    #Wait Until Page Contains Element    (//android.widget.ImageView[@content-desc="Menu"])[3]
    #Click Element    (//android.widget.ImageView[@content-desc="Menu"])[3]
    
    Wait Until Page Contains Element    //*[@text="VIEW CART"]
    Click Element    //*[@text="VIEW CART"]
    Sleep    10s    
    # Click A Point      758    1004    100
    Tap    //*    758    1004    5
    #Click Element    //*[contains(@text,'You Save')]//following::[@class='android.view.View'][2]
    
