*** Settings ***
Library    SeleniumLibrary
Documentation   This is to search something in Ebay
Default Tags    ebay-search
Test Teardown   Close Browser


*** Variables ***
${ISHEADLESSMODE}                               false
${ebay_app}                                     https://www.ebay.com/
${ebay_search_field}                            xpath=//input[@id='gh-ac']
${ebay_search_button}                           xpath=//input[@id='gh-btn']


*** Test Cases ***
TestCase1
    Access Ebay Via Browser
    Search Mobile
    Click Search Button
    Page Will Show Mobile Results




*** Keywords ***
#GIVEN
Access Ebay Via Browser
    Open Browser     ${ebay_app}    chrome

#WHEN
Search Mobile
    wait until element is visible   ${ebay_search_field} 
    input text   ${ebay_search_field}     mobile

Click Search Button
    click element   ${ebay_search_button}

#THEN
Page Will Show Mobile Results
    wait until page contains    results for mobile

