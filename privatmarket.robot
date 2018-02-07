*** Settings ***
Library  String
Library  DateTime
Library  Selenium2Library
Library  Collections
Library  DebugLibrary
Library  privatmarket_service.py
Library  op_robot_tests.tests_files.service_keywords


*** Variables ***
${COMMONWAIT}  40s
${locator_tenderSearch.searchInput}  css=input#search-query-input
${locator_tender.switchToDemo}  css=a#test-model-switch
${locator_tender.switchToDemoMessage}  css=.test-mode-popup-content.ng-binding
${locator_tenderSearch.addTender}  css=button[data-id='createNewTenderBtn']
${locator_lotAdd.postalCode}  css=input[data-id='postalCode']
${locator_lotAdd.countryName}  css=input[data-id='countryName']
${locator_lotAdd.region}  css=input[data-id='region']
${locator_lotAdd.locality}  css=input[data-id='locality']
${locator_lotAdd.streetAddress}  css=input[data-id='streetAddress']
${locator_tenderAdd.btnSave}  css=button[data-id='actSave']
${locator_tenderCreation.buttonSend}  css=button[data-id='actSend']
${locator_tenderClaim.buttonCreate}  css=button[data-id='editProcBtn']

${tender_data_title}  css=.title-div [data-id='tender-full-title']
${tender_data_description}  css=#tenderDescription
${tender_data_procurementMethodType}  css=#tenderType
${tender_data_status}  css=#tenderStatus
${tender_data_value.amount}  css=#tenderBudget
${tender_data_value.currency}  css=#tenderBudgetCcy
${tender_data_value.valueAddedTaxIncluded}  css=#tenderBudgetTax
${tender_data_tenderID}  css=#tenderId
${tender_data_procuringEntity.name}  css=a[ng-click='commonActions.openCard()']
${tender_data_enquiryPeriod.startDate}  id=active.enquiries-bd
${tender_data_enquiryPeriod.endDate}  id=active.enquiries-ed
${tender_data_tenderPeriod.startDate}  id=active.tendering-bd
${tender_data_tenderPeriod.endDate}  id=active.tendering-ed
${tender_data_auctionPeriod.startDate}  xpath=(//span[@ng-if='p.bd'])[3]
${tender_data_minimalStep.amount}  css=div#lotMinStepAmount
${tender_data_documentation.title}  xpath=//div[contains(@class, 'doc-file-title')]
${tender_data_documents[0].title}  xpath=//div[contains(@class, 'doc-file-title')]
${tender_data_qualificationPeriod.endDate}  id=active.pre-qualification-ed
${tender_data_causeDescription}  css=#tenderType div.question-div>div:nth-of-type(1)
${tender_data_cause}  css=#tenderType>.action-element

${tender_data_tender.procurementMethodType}  css=span[data-id='tender-type']
${tender_data_budget.amount}  css=#tenderBudget
${tender_data_budget.description}  css=div[data-id='lot-description']

${tender_data_item.description}  //div[@class='description']//span)
${tender_data_item.deliveryDate.startDate}  //div[@ng-if='adb.deliveryDate.startDate']/div[2])
${tender_data_item.deliveryDate.endDate}  //div[@ng-if='adb.deliveryDate.endDate']/div[2])
${tender_data_item.deliveryLocation.latitude}  //span[contains(@class, 'latitude')])
${tender_data_item.deliveryLocation.longitude}  //span[contains(@class, 'longitude')])
${tender_data_item.deliveryAddress.countryName}  //span[@id='countryName'])
${tender_data_item.deliveryAddress.countryName_ru}  //span[@id='countryName'])
${tender_data_item.deliveryAddress.countryName_en}  //span[@id='countryName'])
${tender_data_item.deliveryAddress.postalCode}  //span[@id='postalCode'])
${tender_data_item.deliveryAddress.region}  //span[@id='region'])
${tender_data_item.deliveryAddress.locality}  //span[@id='locality'])
${tender_data_item.deliveryAddress.streetAddress}  //span[@id='streetAddress'])
${tender_data_item.classification.scheme}  //span[contains(@class, 'cl-scheme')])[1]
${tender_data_item.classification.id}  //span[contains(@class, 'cl-id')])[1]
${tender_data_item.classification.description}  //span[contains(@class, 'cl-name')])[1]
${tender_data_item.additionalClassifications[0].scheme}  //span[contains(@class, 'cl-scheme')])[2]
${tender_data_item.additionalClassifications[0].id}  //span[contains(@class, 'cl-id')])[2]
${tender_data_item.additionalClassifications[0].description}  //span[contains(@class, 'cl-name')])[2]
${tender_data_item.unit.name}  //div[@ng-if='adb.quantity']/div[2]/span[2])
${tender_data_item.unit.code}  //div[@ng-if='adb.quantity']/div[2]/span[2])
${tender_data_item.quantity}  //div[@ng-if='adb.quantity']/div[2]/span)
${tender_data_items[0].deliveryDate.endDate}  xpath=//div[@data-id='deliveryDate.endDate']
${tender_data_items[0].deliveryDate.startDate}  xpath=//div[@data-id='deliveryDate.startDate']
${tender_data_items[0].description}  xpath=//div[@class='description']

${tender_data_lot.title}  //div[@id='lot-title'])
${tender_data_lot.description}  //section[contains(@class, 'description marged')])
${tender_data_lot.value.amount}  //div[@id='lotAmount'])
${tender_data_lot.value.currency}  //div[@id='lotCcy'])
${tender_data_lot.value.valueAddedTaxIncluded}  //div[@id='lotTax'])
${tender_data_lot.minimalStep.amount}  //div[@id='lotMinStepAmount'])
${tender_data_lot.minimalStep.currency}  //div[@id='lotMinStepCcy'])
${tender_data_lot.minimalStep.valueAddedTaxIncluded}  //div[@id='lotMinStepTax'])

${tender_data_question.title}  //span[contains(@class, 'question-title')])
${tender_data_question.description}  //div[@class='question-div']/div[1])
${tender_data_question.answer}  //div[@class='question-div question-expanded']/div[1])

${tender_data_lot_question.title}  //span[contains(@class, 'question-title')]
${tender_data_lot_question.description}  //div[@class='question-div']/div[1]
${tender_data_lot_question.answer}  //div[@class='question-div question-expanded']/div[1]
${tender_data_lot_question.questions[0].title}  //span[contains(@class, 'question-title')]
${tender_data_lot_question.questions[0].description}  (//div[@class='question-div']/div[1])[1]
${tender_data_lot_question.questions[0].answer}  (//div[@class='question-div']/div[1])[2]

#${tender_data_lot_question.questions[0].id}  //div[@class='question-div question-expanded']/div[1]

${tender_data_feature.featureOf}  /../../../*[1]

${tender_data_complaint.complaintID}  //span[@data-id='complaint-id']
${tender_data_complaint.status}  //span[contains(@id, 'cmplStatus')]
${tender_data_complaint.resolutionType}  //div[contains(@ng-if,"resolutionType")]
${tender_data_complaint.resolution}  //div[@class="question-answer title ng-scope"]//div[@class="question-div"]/div[1]
${tender_data_complaint.satisfied}  //span[contains(@data-id, 'satisfied')]
${tender_data_complaint.cancellationReason}  //*[@description='q.cancellationReason']/div/div[1]
${tender_data_complaint.title}  //span[contains(@class, 'claimHead')]
${tender_data_complaint.description}  //div[@class='question-div']
${tender_data_complaintPeriod.endDate}  css=#cmplPeriodEnd

${tender_data_procuringEntity.address.countryName}  css=.delivery-info-container [data-id='address.countryName']
${tender_data_procuringEntity.address.locality}  css=.delivery-info-container [data-id='address.locality']
${tender_data_procuringEntity.address.postalCode}  css=.delivery-info-container [data-id='address.postalCode']
${tender_data_procuringEntity.address.region}  css=.delivery-info-container [data-id='address.region']
${tender_data_procuringEntity.address.streetAddress}  css=.delivery-info-container [data-id='address.streetAddress']
${tender_data_procuringEntity.contactPoint.name}  css=[data-id='contactPoint.name']
${tender_data_procuringEntity.contactPoint.telephone}  css=[data-id='contactPoint.telephone']
${tender_data_procuringEntity.contactPoint.url}  css=[data-id='contactPoint.url']
${tender_data_procuringEntity.identifier.legalName}  css=[data-id='identifier.legalName']
${tender_data_procuringEntity.identifier.scheme}  css=[data-id='identifier.scheme']
${tender_data_procuringEntity.identifier.id}  css=[data-id='identifier.id']

${tender_data_awards[0].documents[0].title}  css=.participant-info-block .doc-file-title
${tender_data_awards[0].status}  xpath=//div[@data-id='status']
${tender_data_awards[0].suppliers[0].address.countryName}  css=.participant-info-block [data-id='address.countryName']
${tender_data_awards[0].suppliers[0].address.locality}  css=.participant-info-block [data-id='address.locality']
${tender_data_awards[0].suppliers[0].address.postalCode}  css=.participant-info-block [data-id='address.postalCode']
${tender_data_awards[0].suppliers[0].address.region}  css=.participant-info-block [data-id='address.region']
${tender_data_awards[0].suppliers[0].address.streetAddress}  css=.participant-info-block [data-id='address.streetAddress']
${tender_data_awards[0].suppliers[0].contactPoint.telephone}  css=.participant-info-block [data-id='contactPoint.telephone']
${tender_data_awards[0].suppliers[0].contactPoint.name}  css=.participant-info-block [data-id='contactPoint.name']
${tender_data_awards[0].suppliers[0].contactPoint.email}  css=.participant-info-block [data-id='contactPoint.email']
${tender_data_awards[0].suppliers[0].identifier.scheme}  css=.participant-info-block [data-id='identifier.scheme']
${tender_data_awards[0].suppliers[0].identifier.legalName}  css=.participant-info-block [data-id='identifier.legalName']
${tender_data_awards[0].suppliers[0].identifier.id}  css=.participant-info-block [data-id='identifier.id']
${tender_data_awards[0].suppliers[0].name}  css=.participant-info-block [data-id='identifier.legalName']
${tender_data_awards[0].value.valueAddedTaxIncluded}  css=.participant-info-block [data-id='value.valueAddedTaxIncluded']
${tender_data_awards[0].value.currency}  css=.participant-info-block [data-id='value.currency']
${tender_data_awards[0].value.amount}  css=.participant-info-block [data-id='value.amount']
${tender_data_contracts[0].status}  css=#contractStatus
${tender_data_features[0].title}  xpath=//div[@class='no-price']//span[@data-id='feature.title']

${tender_data_funders[0].name}  xpath=//td[@ng-bind='model.ad.funders[0].contactPoint.name']
${tender_data_funders[0].address.countryName}  xpath=//div[@data-id='funders-block']//span[@data-id='address.countryName']
${tender_data_funders[0].address.locality}  xpath=//div[@data-id='funders-block']//span[@data-id='address.locality']
${tender_data_funders[0].address.postalCode}  xpath=//div[@data-id='funders-block']//span[@data-id='address.postalCode']
${tender_data_funders[0].address.region}  xpath=//div[@data-id='funders-block']//span[@data-id='address.region']
${tender_data_funders[0].address.streetAddress}  xpath=//div[@data-id='funders-block']//span[@data-id='address.streetAddress']
${tender_data_funders[0].contactPoint.url}  xpath=//td[@ng-bind='model.ad.funders[0].contactPoint.url']
${tender_data_funders[0].identifier.id}  xpath=//div[@data-id='funders-block']//td[@data-id='funder-identifier-id']
${tender_data_funders[0].identifier.legalName}  xpath=//div[@data-id='funders-block']//td[@data-id='funder-identifier-legalName']
${tender_data_funders[0].identifier.scheme}  xpath=//div[@data-id='funders-block']//td[@data-id='funder-identifier-scheme']

${tender_data_lots[0].auctionPeriod.startDate}  css=#active.auction-bd
${tender_data_lots[0].auctionPeriod.endDate}  css=#active.auction-ed
${tender_data_tender.tenderPeriod.startDate}  xpath=//div[@data-id='plan-purchase-beg']

${tender_data_classification.description}  xpath=//*[@data-id='common-classif-description']
${tender_data_classification.scheme}  xpath=//*[@data-id='common-classif-scheme']
${tender_data_classification.id}  xpath=//*[@data-id='common-classif-id']


*** Keywords ***
Підготувати дані для оголошення тендера
    [Arguments]  ${username}  ${tender_data}  ${role_name}
    ${tender_data.data}=  privatmarket_service.modify_test_data  ${tender_data.data}
    ${adapted.data}=  privatmarket_service.modify_test_data  ${tender_data.data}
    [Return]  ${tender_data}


Підготувати клієнт для користувача
    [Arguments]  ${username}
    [Documentation]  Відкрити брaвзер, створити обєкт api wrapper, тощо
    ${service args}=  Create List  --ignore-ssl-errors=true  --ssl-protocol=tlsv1
    ${browser}=  Convert To Lowercase  ${USERS.users['${username}'].browser}
    ${disabled}  Create List  Chrome PDF Viewer
    ${prefs}  Create Dictionary  download.default_directory=${OUTPUT_DIR}  plugins.plugins_disabled=${disabled}
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method  ${chrome_options}  add_argument  --allow-running-insecure-content
    Call Method  ${chrome_options}  add_argument  --disable-web-security
    Call Method  ${chrome_options}  add_argument  --nativeEvents\=false
    Call Method  ${chrome_options}  add_experimental_option  prefs  ${prefs}
    #Для Viewer'а нужен хром, т.к. на хром настроена автоматическая закачка файлов
    Create WebDriver  Chrome  chrome_options=${chrome_options}  alias=${username}
    Go To  ${USERS.users['${username}'].homepage}

    #Open Browser  ${USERS.users['${username}'].homepage}  ${browser}  alias=${username}
    Set Window Size  @{USERS.users['${username}'].size}
    Set Selenium Implicit Wait  10s
    Run Keyword Unless  '${username}' == 'PrivatMarket_Viewer'  Login  ${username}


Пошук тендера по ідентифікатору
    [Arguments]  ${username}  ${tenderId}
    Go To  ${USERS.users['${username}'].homepage}
#    Close notification
    Wait Until Element Is Visible  ${locator_tenderSearch.searchInput}  timeout=${COMMONWAIT}

    ${class}=  Get Element Attribute  xpath=//span[@data-id='pinhead']@class
    Run Keyword If  'color-green' in '${class}'  Click Element  css=[data-id='pinhead']

    ${suite_name}=  Convert To Lowercase  ${SUITE_NAME}
    ${education_type}=  Run Keyword If  'negotiation' in '${suite_name}'  Set Variable  False
    ...  ELSE  Set Variable  True

    Wait For Tender  ${tenderId}  ${education_type}
    Wait Visibility And Click Element  xpath=//tr[@id='${tenderId}']
    Sleep  5s
    Wait Until Element Is Visible  ${tender_data_title}  ${COMMONWAIT}


Пошук плану по ідентифікатору
  [Arguments]  ${username}  ${tenderId}
    Go To  ${USERS.users['${username}'].homepage}
#    Close notification
    Wait Until Element Is Visible  ${locator_tenderSearch.searchInput}  timeout=${COMMONWAIT}

    ${class}=  Get Element Attribute  xpath=//span[@data-id='pinhead']@class
    Run Keyword If  'color-green' in '${class}'  Click Element  css=[data-id='pinhead']

    Wait Visibility And Click Element  css=[data-id='ttype-plans-label']

    ${suite_name}=  Convert To Lowercase  ${SUITE_NAME}
    ${education_type}=  Run Keyword If  'negotiation' in '${suite_name}'  Set Variable  False
    ...  ELSE  Set Variable  True

    ${type}=  Set Variable  plan
    Wait For Tender  ${tenderId}  ${education_type}  ${type}

    Wait Visibility And Click Element  xpath=//tr[@id='${tenderId}']
    Sleep  5s
    Wait Until Element Is Visible  ${tender_data_tenderID}  ${COMMONWAIT}


Оновити сторінку з планом
    [Arguments]  ${username}  ${tenderId}
    Reload Page
    Sleep  2s


Пошук тендера за кошти донора
     [Arguments]  ${username}  ${funder_id}
    ${tenderId}=  Get text  ${tender_data_tenderID}
    Go To  ${USERS.users['${username}'].homepage}

    Wait Until Element Is Visible  ${locator_tenderSearch.searchInput}  timeout=${COMMONWAIT}
    ${suite_name}=  Convert To Lowercase  ${SUITE_NAME}
    ${education_type}=  Run Keyword If  'negotiation' in '${suite_name}'  Set Variable  False
    ...  ELSE  Set Variable  True

    Wait For Tender  ${tenderId}  ${education_type}
    Run Keyword If  ${funder_id} == '44000'  Wait Visibility And Click Element  xpath=//select[@ng-model='template.funder']/option[contains(., 'Світовий Банк')]
    Sleep  5s
    Wait Visibility And Click Element  xpath=//tr[@id='${tenderId}']
    Sleep  5s
    Wait Until Element Is Visible  ${tender_data_title}  ${COMMONWAIT}



Створити план
    [Arguments]  ${username}  ${tender_data}

    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  lots
    @{lots}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  lots
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  items
    @{items}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  items
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  features
    @{features}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  features

    log to console    ${tender_data.data}

    Wait Visibility And Click Element  ${locator_tenderSearch.addTender}
    Wait Visibility And Click Element  xpath=(//a[@data-toggle='tab'])[2]
    Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanBelowThreshold']
    Wait Element Visibility And Input Text  //input[@data-id='budgetId']   ${tender_data.data.budget.id}
    Input Text  xpath=//input[@data-id='procurementName']  ${tender_data.data.budget.description}
    Input Text  xpath=//input[@data-id='projectId']  ${tender_data.data.budget.project.id}
    Input Text  xpath=//input[@data-id='projectName']  ${tender_data.data.budget.project.name}
    Input Text  xpath=//textarea[@data-id='procurementDescription']  ${tender_data.data.budget.description}
    Click Element  xpath=(//a[@data-id='actChoose'])[1]

    Search By Query  css=input[data-id='query']  ${tender_data.data.classification.id}
    Wait Visibility And Click Element  css=button[data-id='actConfirm']
    Run Keyword If  '${items[0].classification.id}' == '99999999-9'  Обрати додаткові класифікатори   ${items[0].additionalClassifications[0].scheme}   ${items[0].additionalClassifications[0].id}
    Set Date  tenderPeriod  startDate  ${tender_data.data.tender.tenderPeriod.startDate}

    ${amount}=  convert_float_to_string  ${tender_data.data.budget.amount}
    Input Text  xpath=//input[@data-id='valueAmount']  ${amount}

    Click Element  xpath=//button[@data-id='actSave']


    #Заповнити лоти та предмети закупівлі
    Додати предмети закупівлі в план  ${items}
    Click Element  xpath=//button[@data-id='actSave']
    Wait Visibility And Click Element  xpath=//button[@data-id='actSend']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']

    ${date}=  get_date_formatting  ${tender_data.data.tender.tenderPeriod.startDate}  %y-%m-%d

    Дочекатися зміни статусу  ${date}
    ${plan_id}  Get Text  xpath=//div[@id='tenderId'][contains(text(),'${date}')]
    [Return]  ${plan_id}

Дочекатися зміни статусу
     [Arguments]  ${date}
     Wait Until Keyword Succeeds  10min  1s  Перевірити зміну статусу  xpath=//div[@id='tenderId'][contains(text(),'${date}')]

Перевірити зміну статусу
     [Arguments]  ${locator}
     Reload Page
     Sleep  2s
     Wait Until Element Is Enabled  ${locator}

Додати предмети закупівлі в план
    [Arguments]  ${items}
    ${items_count}=  Get Length  ${items}

    : FOR  ${index}  IN RANGE  0  ${items_count}
    \  ${index_xpath}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Run Keyword If  ${index} > 0  Click Element  xpath=//button[@data-id='actAddItem']
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='description'])[${index_xpath}]  ${items[${index}].description}
    \  Input Text  xpath=(//input[@data-id='quantity'])[${index_xpath}]  ${items[${index}].quantity}
    \  Select From List By Label  xpath=(//select[@data-id='unit'])[${index_xpath}]  ${items[${index}].unit.name}
    \  Set Date In Item  ${index}  deliveryDate  endDate  ${items[${index}].deliveryDate.endDate}

Внести зміни в план
    [Arguments]  ${user_name}  ${tenderId}  ${parameter}  ${value}
    Дочекатися зміни статусу  ${tenderId}
    Wait Visibility And Click Element  xpath=//button[contains(@ng-click,'editPlan')]

    ${index}=  privatmarket_service.get_match_from_string  ${parameter}  items\\[(.+?)\\]  1
    ${status}=  Set Variable If  '${index}' == 'null'  'false'  'true'
    Run Keyword And Return If  ${status} == 'true'  Внести зміни в план item  ${index}  ${parameter}  ${value}
    Run Keyword If  '${parameter}' == 'budget.description'  Input Text  xpath=//input[@data-id='procurementName']  ${value}

    ${amount}=  Run Keyword If  '${parameter}' == 'budget.amount'  convert_float_to_string  ${value}
    Run Keyword If  '${parameter}' == 'budget.amount'  Input Text  xpath=//input[@data-id='valueAmount']  ${amount}

    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Until Element Is Visible  xpath=(//input[@data-id='description'])
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Visibility And Click Element  xpath=//button[@data-id='actSend']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']

Внести зміни в план item
   [Arguments]  ${index}  ${parameter}  ${value}

    ${index_xpath}=  privatmarket_service.sum_of_numbers  ${index}  1
    Wait For Ajax
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Sleep  2s
    Run Keyword If  '${parameter}' == 'items[${index}].deliveryDate.endDate'  Wait Until Element Is Visible  xpath=(//input[@data-id='deliveryDateEnd'])[${index_xpath}]
    Run Keyword If  '${parameter}' == 'items[${index}].deliveryDate.endDate'  Set Date In Item  ${index}  deliveryDate  endDate  ${value}
    Run Keyword If  '${parameter}' == 'items[${index}].quantity'  Wait Element Visibility And Input Text  xpath=(//input[@data-id='quantity'])[${index_xpath}]  ${value}

    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Visibility And Click Element  xpath=//button[@data-id='actSend']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']


Додати предмет закупівлі в план
    [Arguments]  ${tender_owner}  ${tender_uaid}  ${item}

    privatmarket.Пошук плану по ідентифікатору  ${tender_owner}  ${tender_uaid}
    Дочекатися зміни статусу  ${tender_uaid}
    Wait Visibility And Click Element  xpath=//button[contains(@ng-click,'editPlan')]
    Sleep  2s
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Until Element Is Visible  xpath=(//select[@data-id='unit'])
    ${elements}=  Get Webelements  xpath=(//input[@data-id='description'])
    ${count}=  Get_Length  ${elements}
    ${index_xpath}=  privatmarket_service.sum_of_numbers  ${count}  1

    Wait Visibility And Click Element  xpath=//button[@data-id='actAddItem']
    Wait Element Visibility And Input Text  xpath=(//input[@data-id='description'])[${index_xpath}]  ${item.description}
    Input Text  xpath=(//input[@data-id='quantity'])[${index_xpath}]  ${item.quantity}
    Select From List By Label  xpath=(//select[@data-id='unit'])[${index_xpath}]  ${item.unit.name}
    Set Date In Item  ${count}  deliveryDate  endDate  ${item.deliveryDate.endDate}

    ${elements}=  Get Webelements  xpath=(//input[@data-id='description'])
    ${count_add}=  Get_Length  ${elements}
    Should Be True  ${count_add} == ${index_xpath}

    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Visibility And Click Element  xpath=//button[@data-id='actSend']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']


Видалити предмет закупівлі плану
    [Arguments]  ${tender_owner}  ${tender_uaid}  ${item}

    privatmarket.Пошук плану по ідентифікатору  ${tender_owner}  ${tender_uaid}
    Дочекатися зміни статусу  ${tender_uaid}
    Wait Visibility And Click Element  xpath=//button[contains(@ng-click,'editPlan')]
    Sleep  2s
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Until Element Is Visible  xpath=(//select[@data-id='unit'])
    ${elements}=  Get Webelements  xpath=(//input[@data-id='description'])
    ${count_before}=  Get_Length  ${elements}

    :FOR  ${i}  In Range  0  ${count_before}
    \  ${index_xpath}=  privatmarket_service.sum_of_numbers  ${i}  1
    \  ${text_value}=  Get Value  xpath=(//input[@data-id='description'])[${index_xpath}]
    \  ${item_delete}=  Get Regexp Matches  ${text_value}  ${item}
    \  ${count_item}=  Get_Length  ${item_delete}
    \  Run Keyword If  ${count_item} >0  Click Element  xpath=(//button[@data-id='actRemove'])[${index_xpath}]

    ${elements}=  Get Webelements  xpath=(//input[@data-id='description'])
    ${count_delete}=  Get_Length  ${elements}
    Should Be True  ${count_before} > ${count_delete}


Створити тендер
    [Arguments]  ${username}  ${tender_data}
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  lots
    @{lots}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  lots
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  items
    @{items}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  items
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  features
    @{features}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  features
#    Close notification
    Wait Until Element Is Visible  ${locator_tenderSearch.searchInput}  ${COMMONWAIT}
    Check Current Mode New Realisation

    ${scenarios_name}=  privatmarket_service.get_scenarios_name

#go to form
    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderSearch.addTender}
    ${status}  ${type}=  Run Keyword And Ignore Error  Set Variable  '${tender_data.data.procurementMethodType}'
    ${type}=  Run Keyword If
    ...  '${status}' == 'PASS'  Set Variable  ${type}
    ...  ELSE  Set Variable  ''

    #submissionMethodDetails
    ${submissionMethod}  ${mode}=  Run Keyword And Ignore Error  Set Variable  '${tender_data.data.submissionMethodDetails}'
    ${mode}=  Run Keyword If
    ...  '${submissionMethod}' == 'PASS'  Set Variable  ${mode}
    ...  ELSE  Set Variable  ''

    Run Keyword IF
    ...  ${type} == 'aboveThresholdEU'  Wait Visibility And Click Element  css=a[data-id='choosedPrzAboveThresholdEU']
    ...  ELSE IF  ${type} == 'aboveThresholdUA'  Wait Visibility And Click Element  css=a[data-id='choosedPrzAboveThresholdUA']
    ...  ELSE IF  ${type} == 'negotiation'  Wait Visibility And Click Element  css=a[data-id='choosedPrzNegotiation']
    ...  ELSE IF  ${type} == 'competitiveDialogueEU'  Wait Visibility And Click Element  css=a[data-id='choosedPrzCompetitiveDialogueEU']
    ...  ELSE IF  ${type} == 'competitiveDialogueUA'  Wait Visibility And Click Element  css=a[data-id='choosedPrzCompetitiveDialogueUA']
    ...  ELSE IF  ${type} == 'reporting'  Wait Visibility And Click Element  css=a[data-id='choosedPrzReporting']
    ...  ELSE  Wait Visibility And Click Element  css=a[data-id='choosedPrzBelowThreshold']

    Wait For Ajax
    Run Keyword If
    ...  ${type} == 'negotiation'  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '1080')]
    ...  ELSE IF  ${type} == '' and 'before_resolved_award_complaint' in '${scenarios_name}'  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '720')]
    ...  ELSE IF  ${type} == '' and 'after_resolved_award_complaint' in '${scenarios_name}'  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '360')]
    ...  ELSE IF  ${type} == ''  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '1440')]
    ...  ELSE  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '1440')]

#step 0
    #we should add choosing of procurementMethodType
    Wait For Ajax
    Wait Element Visibility And Input Text  css=input[data-id='procurementName']  ${tender_data.data.title}
    Wait Element Visibility And Input Text  css=textarea[data-id='procurementDescription']  ${tender_data.data.description}
    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=input[data-id='procurementNameEn']  ${tender_data.data.title_en}
    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=textarea[data-id='procurementDescriptionEn']  ${tender_data.data.description_en}

    #CPV
    Wait Visibility And Click Element  xpath=(//a[@data-id='actChoose'])[1]
    Wait Until Element Is Visible  css=section[data-id='classificationTreeModal']  ${COMMONWAIT}
    Wait Until Element Is Visible  css=input[data-id='query']  ${COMMONWAIT}
    Search By Query  css=input[data-id='query']  ${items[0].classification.id}
    Wait Visibility And Click Element  css=button[data-id='actConfirm']
    Run Keyword If  '${items[0].classification.id}' == '99999999-9'  Обрати додаткові класифікатори   ${items[0].additionalClassifications[0].scheme}   ${items[0].additionalClassifications[0].id}

    #date
    Wait For Ajax
    Run Keyword Unless  ${type} == 'aboveThresholdEU' or ${type} == 'aboveThresholdUA' or ${type} == 'negotiation' or ${type} == 'competitiveDialogueEU' or ${type} == 'competitiveDialogueUA'  Set Enquiry Period  ${tender_data.data.enquiryPeriod.startDate}  ${tender_data.data.enquiryPeriod.endDate}
    Run Keyword If  ${type} == ''  Set Start Tender Period  ${tender_data.data.tenderPeriod.startDate}
    Run Keyword Unless  ${type} == 'negotiation'  Set End Tender Period  ${tender_data.data.tenderPeriod.endDate}

    #skipAuction
    Run Keyword If  'quick(mode:fast-forward)' in ${mode}  Wait Visibility And Click Element  css=label[data-id='skip_auction']

    #cause
    Run Keyword If  ${type} == 'negotiation'  Обрати підставу вибору переговорної процедури  ${tender_data}
    Run Keyword If  ${type} == 'negotiation'  Wait Element Visibility And Input Text  css=textarea[data-id='causeDescription']  ${tender_data.data.causeDescription}

    #procuringEntityAddress
    Wait Element Visibility And Input Text  ${locator_lotAdd.postalCode}  ${tender_data.data.procuringEntity.address.postalCode}
    Wait Element Visibility And Input Text  ${locator_lotAdd.countryName}  ${tender_data.data.procuringEntity.address.countryName}
    Wait Element Visibility And Input Text  ${locator_lotAdd.region}  ${tender_data.data.procuringEntity.address.region}
    Wait Element Visibility And Input Text  ${locator_lotAdd.locality}  ${tender_data.data.procuringEntity.address.locality}
    Wait Element Visibility And Input Text  ${locator_lotAdd.streetAddress}  ${tender_data.data.procuringEntity.address.streetAddress}

    #contactPoint
    Wait Element Visibility And Input Text  css=[data-id='contactPoint'] input[data-id='fullNameUa']  ${tender_data.data.procuringEntity.contactPoint.name}
    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='contactPoint'] input[data-id='fullNameEn']  ${tender_data.data.procuringEntity.contactPoint.name_en}

    ${modified_phone}=  Привести номер телефону до відповідного формату  ${tender_data.data.procuringEntity.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=input[data-id='phone']  ${modified_phone}
    Wait Element Visibility And Input Text  css=input[data-id='email']  ${USERS.users['${username}'].email}
    Wait Element Visibility And Input Text  css=input[data-id='url']  ${tender_data.data.procuringEntity.contactPoint.url}
    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='addContactPoint'] input[data-id='fullNameUa']  ${tender_data.data.procuringEntity.contactPoint.name}
    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='addContactPoint'] input[data-id='fullNameEn']  ${tender_data.data.procuringEntity.contactPoint.name_en}
    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='addContactPoint'] input[data-id='phone']  ${modified_phone}
    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='addContactPoint'] input[data-id='email']  ${USERS.users['${username}'].email}
    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=input[data-id='legalNameEn']  ${tender_data.data.procuringEntity.name_en}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}

#step 1
    Додати lots  ${lots}  ${items}  ${type}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Run Keyword If  ${type} == 'negotiation'  Wait Until Element Is Visible  css=label[for='documentation_tender_yes']  ${COMMONWAIT}
    ...  ELSE  Wait Until Element Is Visible  css=section[data-id='step3']  ${COMMONWAIT}

#step 3
    Wait For Ajax
    Run Keyword IF
    ...  ${type} == 'aboveThresholdEU'  Додати нецінові показники  ${features}  ${type}
    ...  ELSE IF  ${type} == 'aboveThresholdUA'  Додати нецінові показники  ${features}  ${type}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}

#step 4
    Run Keyword Unless  ${type} == 'negotiation'  Wait Until Element Is Visible  css=section[data-id='step4']  ${COMMONWAIT}
    Run Keyword Unless  ${type} == 'negotiation'  Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
#step 5
    Wait Until Element Is Visible  css=section[data-id='step5']  ${COMMONWAIT}
    Sleep  3s

    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//button[@data-id="modal-close"]

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}

    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.

    Run Keyword IF
    ...  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait For Element With Reload  css=[data-tender-status='active.tendering']  1
    ...  ELSE IF  ${type} == 'aboveThresholdUA' or ${type} == 'competitiveDialogueUA'  Wait For Element With Reload  css=[data-tender-status='active.tendering']  1
    ...  ELSE IF  ${type} == 'negotiation'  Wait For Element With Reload  css=[data-tender-status='active']  1
    ...  ELSE  Wait For Element With Reload  css=[data-tender-status='active.enquiries']  1
    ${tender_id}=  Get Text  ${tender_data_tenderID}
    [Return]  ${tender_id}


Додати lots
    [Arguments]  ${lots}  ${items}  ${type}
    ${lots_count}=  Get Length  ${lots}
    Wait For Ajax

    : FOR  ${index}  IN RANGE  0  ${lots_count}
    \  ${lot_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Run Keyword Unless  '${lot_index}' == '1'  Wait Visibility And Click Element  css=button[data-id='actAddLot']
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='lotTitle'])[${lot_index}]  ${lots[${index}].title}
    \  Wait Element Visibility And Input Text  xpath=(//textarea[@data-id='lotDescription'])[${lot_index}]  ${lots[${index}].description}
    \  ${value_amount}=  privatmarket_service.convert_float_to_string  ${lots[${index}].value.amount}
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='valueAmount'])[${lot_index}]  ${value_amount}
    \  Sleep  3s
    \  Run Keyword Unless  ${type} == 'negotiation'  Ввести мінімальний крок  ${lots}  ${index}  ${lot_index}
    \  Run Keyword Unless  ${type} == 'negotiation'  Wait Visibility And Click Element  xpath=(//label[contains(@for,'guarantee')])[${lot_index}]
    \  Run Keyword Unless  ${type} == 'negotiation'  Wait Element Visibility And Input Text  xpath=(//input[@data-id='guaranteeAmount'])[${lot_index}]  1
    \  Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  xpath=(//input[@data-id='procurementNameEn'])[${lot_index}]  ${lots[${index}].title_en}
    \  Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  xpath=(//textarea[@data-id='lotDescriptionEn'])[${lot_index}]  ${lots[${index}].description}
    \  ${count}=  Get Length  ${items}
    \  Run Keyword If  ${count} > 0  Додати items  ${items}  ${lot_index}  ${lots[${index}].id}  ${type}


Додати items
    [Arguments]  ${items}  ${lot_index}  ${lot_id}  ${type}
    ${lot_items}=  privatmarket_service.get_items_from_lot  ${items}  ${lot_id}
    ${items_count}=  Get Length  ${lot_items}
    Wait For Ajax
    : FOR  ${index}  IN RANGE  0  ${items_count}
    \  Додати item до лоту  ${lot_items}  ${items_count}  ${lot_index}  ${index}  ${type}


Додати item до лоту
    [Arguments]  ${items}  ${items_count}  ${lot_index}  ${index}  ${type}
    ${item_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    Run Keyword Unless  '${item_index}' == '1'  Wait Visibility And Click Element  xpath=(//button[@data-id='actAddItem'])[${lot_index}]
    Wait Element Visibility And Input Text  xpath=(((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])//input[@data-id='description'])[${item_index}]  ${items[${index}].description}
    Wait Element Visibility And Input Text  xpath=(((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])//input[@data-id='quantity'])[${item_index}]  ${items[${index}].quantity}

    ${unitName}=  Run Keyword If
    ...  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  privatmarket_service.get_unit_name  ${items[${index}].unit.name}
    ...  ELSE  privatmarket_service.get_unit_name  ${items[${index}].unit.name}

    Wait Visibility And Click Element  xpath=(((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])//select[@data-id='unit'])[${item_index}]/option[text()='${unitName}']

    #CPV
    Wait Visibility And Click Element  xpath=((//div[@data-id='lot'][${lot_index}])//div[@data-id='item']//a[@data-id='actChoose'])[${item_index}]
    Wait Until Element Is Visible  css=section[data-id='classificationTreeModal']  ${COMMONWAIT}
    Wait Until Element Is Visible  css=input[data-id='query']  ${COMMONWAIT}
    Search By Query  css=input[data-id='query']  ${items[${index}].classification.id}
    Wait Visibility And Click Element  css=button[data-id='actConfirm']

    ${classification_id}=  Get Substring  ${items[${index}].classification.id}  0  5
    ${pre_classification_id}=  Get Substring  ${items[${index}].classification.id}  0  3
    ${classification_status}=  Set Variable If  '${pre_classification_id}' == '33695'  ${False}  ${True}
    Run Keyword If  '${classification_status}' == 'True' and '${pre_classification_id}' == '336'  Обрати додаткові класифікатори для лікарських засобів  ${items}  ${index}

    ${deliveryStartDate}=  Get Regexp Matches  ${items[${index}].deliveryDate.startDate}  (\\d{4}-\\d{2}-\\d{2})
    ${deliveryStartDate}=  Convert Date  ${deliveryStartDate[0]}  result_format=%d-%m-%Y
    ${deliveryEndDate}=  Get Regexp Matches  ${items[${index}].deliveryDate.endDate}  (\\d{4}-\\d{2}-\\d{2})
    ${deliveryEndDate}=  Convert Date  ${deliveryEndDate[0]}  result_format=%d-%m-%Y

    Wait Element Visibility And Input Text  xpath=//div[@data-id='lot'][${lot_index}]//div[@data-id='item'][${item_index}]//input[@data-id='postalCode']  ${items[${index}].deliveryAddress.postalCode}
    Wait Element Visibility And Input Text  xpath=//div[@data-id='lot'][${lot_index}]//div[@data-id='item'][${item_index}]//input[@data-id='countryName']  ${items[${index}].deliveryAddress.countryName}
    Wait Element Visibility And Input Text  xpath=//div[@data-id='lot'][${lot_index}]//div[@data-id='item'][${item_index}]//input[@data-id='region']  ${items[${index}].deliveryAddress.region}
    Wait Element Visibility And Input Text  xpath=//div[@data-id='lot'][${lot_index}]//div[@data-id='item'][${item_index}]//input[@data-id='locality']  ${items[${index}].deliveryAddress.locality}
    Wait Element Visibility And Input Text  xpath=//div[@data-id='lot'][${lot_index}]//div[@data-id='item'][${item_index}]//input[@data-id='streetAddress']  ${items[${index}].deliveryAddress.streetAddress}
    Wait Until Element Is Visible  xpath=//div[@data-id='lot'][${lot_index}]//div[@data-id='item'][${item_index}]//input[@data-id='deliveryDateEnd']  ${COMMONWAIT}
    ${abs_item_index}=  privatmarket_service.get_abs_item_index  ${lot_index}  ${index}  ${items_count}
    Set Date In Item  ${abs_item_index}  deliveryDate  startDate  ${items[${index}].deliveryDate.startDate}
    Set Date In Item  ${abs_item_index}  deliveryDate  endDate  ${items[${index}].deliveryDate.endDate}
    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  xpath=//div[@data-id='lot'][${lot_index}]//div[@data-id='item'][${item_index}]//input[@data-id='descriptionEn']  ${items[${index}].description_en}


Додати нецінові показники
    [Arguments]  ${features}  ${type}
    Wait For Ajax

    #add tender feature
    Wait Visibility And Click Element  css=label[for='features_tender_yes']
    Wait Element Visibility And Input Text  css=[data-id='ptrFeatures'] [data-id='title']  ${features[1].title}
    Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='ptrFeatures'] [data-id='titleEn']  ${features[1].title_en}
    Wait Element Visibility And Input Text  css=textarea[data-id='description']  ${features[1].description}
    Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='ptrFeatures'] textarea[data-id='descriptionEn']  ${features[1].description}

    @{tender_enums}=  Get From Dictionary  ${features[1]}  enum
    ${tender_criterion_count}=  Get Length  ${tender_enums}

    : FOR  ${index}  IN RANGE  0  ${tender_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  css=[data-id='criteria'] button[data-id='actAdd']
    \  ${tender_criterion_value}=  privatmarket_service.get_percent  ${tender_enums[${index}].value}
    \  ${tender_criterion_value}=  Convert to String  ${tender_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='criterionValue'])[${elem_index}]  ${tender_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='criterionTitle'])[${elem_index}]  ${tender_enums[${index}].title}
    \  Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  xpath=(//section[@data-id='ptrFeatures']//input[@data-id='criterionTitleEn'])[${elem_index}]  ${tender_enums[${index}].title}

    #add lot feature
    Wait Visibility And Click Element  css=label[for='features_lots_yes']
    Wait Visibility And Click Element  css=[data-id='lot'] button[data-id='actAdd']
    Wait Element Visibility And Input Text  css=[data-id='lot'] [data-id='title']  ${features[0].title}
    Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='lot'] [data-id='titleEn']  ${features[0].title_en}
    Wait Element Visibility And Input Text  css=[data-id='lot'] [data-id='description']  ${features[0].description}
    Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='lot'] [data-id='descriptionEn']  ${features[0].description}

    @{lot_enums}=  Get From Dictionary  ${features[0]}  enum
    ${lot_criterion_count}=  Get Length  ${lot_enums}

    : FOR  ${index}  IN RANGE  0  ${lot_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  css=[data-id='lot'] [data-id='criteria'] button[data-id='actAdd']
    \  ${lot_criterion_value}=  privatmarket_service.get_percent  ${lot_enums[${index}].value}
    \  ${lot_criterion_value}=  Convert to String   ${lot_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionValue'])[${elem_index}]  ${lot_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionTitle'])[${elem_index}]  ${lot_enums[${index}].title}
    \  Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionTitleEn'])[${elem_index}]  ${lot_enums[${index}].title}

    #add item feature
    Wait Visibility And Click Element  css=label[for='features_items_yes']
    Wait Visibility And Click Element  css=[data-id='item'] button[data-id='actAdd']
    Wait Element Visibility And Input Text  css=[data-id='item'] [data-id='title']  ${features[2].title}
    Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='item'] [data-id='titleEn']  ${features[2].title_en}
    Wait Element Visibility And Input Text  css=[data-id='item'] [data-id='description']  ${features[2].description}
    Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  css=[data-id='item'] [data-id='descriptionEn']  ${features[2].description}


    @{item_enums}=  Get From Dictionary  ${features[2]}  enum
    ${item_criterion_count}=  Get Length  ${item_enums}

    : FOR  ${index}  IN RANGE  0  ${item_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  css=[data-id='item'] [data-id='criteria'] button[data-id='actAdd']
    \  ${item_criterion_value}=  privatmarket_service.get_percent  ${item_enums[${index}].value}
    \  ${item_criterion_value}=  Convert to String   ${item_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionValue'])[${elem_index}]  ${item_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionTitle'])[${elem_index}]  ${item_enums[${index}].title}
    \  Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionTitleEn'])[${elem_index}]  ${item_enums[${index}].title}


Обрати додаткові класифікатори для лікарських засобів
    [Arguments]  ${items}  ${item_index}
    @{additionalClassifications}=  Get From Dictionary  ${items[${item_index}]}  additionalClassifications
    ${classifications_count}=  Get Length  ${additionalClassifications}

    : FOR  ${index}  IN RANGE  0  ${classifications_count}
    \  ${id}=  Set Variable  ${items[${item_index}].additionalClassifications[${index}].id}
    \  ${scheme}=  Set Variable  ${items[${item_index}].additionalClassifications[${index}].scheme}
    \  Run Keyword  Додати класифікатор  ${id}  ${scheme}


Додати класифікатор
    [Arguments]  ${id}  ${scheme}
    Run Keyword If  '${scheme}' == 'INN'  Wait Visibility And Click Element  xpath=(//a[@data-id='actChoose'])[2]
    ...  ELSE  Wait Visibility And Click Element  xpath=(//a[@data-id='actChoose'])[3]
    Search By Query  css=input[data-id='query']  ${id}
    Wait Visibility And Click Element  css=button[data-id='actConfirm']
    Sleep  1s


Обрати підставу вибору переговорної процедури
    [Arguments]  ${tender_data}

    Wait Visibility And Click Element  xpath=//a[contains(text(),'Обрати')]
    Wait For Ajax
    Wait Visibility And Click Element  css=input[value='${tender_data.data.cause}']
    Wait Visibility And Click Element  css=button[data-id='actConfirm']
    Wait For Ajax


Ввести мінімальний крок
    [Arguments]  ${lots}  ${index}  ${elem_index}
    ${minimalStep_amount}=  Convert to String  ${lots[${index}].minimalStep.amount}
    Wait Element Visibility And Input Text  xpath=(//input[@data-id='minimalStepAmount'])[${elem_index}]  ${minimalStep_amount}


Оновити сторінку з тендером
    [Arguments]  @{ARGUMENTS}
    [Documentation]
    ...  ${ARGUMENTS[0]} == username
    ...  ${ARGUMENTS[1]} == tenderId
    Reload Page
    Sleep  2s


Внести зміни в тендер
    [Arguments]  ${user_name}  ${tenderId}  ${parameter}  ${value}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Run Keyword If  '${parameter}' == 'tenderPeriod.endDate'  Set Date  tenderPeriod  endDate  ${value}
    Run Keyword If  '${parameter}' == 'description'  Wait Element Visibility And Input Text  css=textarea[data-id='procurementDescription']  ${value}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait Until Element Is Visible  css=section[data-id='step2']  ${COMMONWAIT}
    Wait Visibility And Click Element  css=#tab_4 a
    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  120s


Змінити лот
    [Arguments]  ${user_name}  ${tenderId}  ${lot_id}  ${field}  ${value}

    Run Keyword And Return If  'value.amount' == '${field}'  Змінити ${field} лоту  ${value}
    Run Keyword And Return If  'minimalStep.amount' == '${field}'  Змінити ${field} лоту  ${value}

    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait Element Visibility And Input Text  xpath=(//textarea[@data-id='lotDescription'])[1]  ${value}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Wait Visibility And Click Element  css=#tab_4 a
    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.


Змінити value.amount лоту
    [Arguments]  ${value}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait For Ajax
    Wait Visibility And Click Element  css=#tab_1 a
    ${value_amount}=  privatmarket_service.convert_float_to_string  ${value}
    Wait Element Visibility And Input Text  css=input[data-id='valueAmount']  ${value_amount}
    Sleep  3s


Змінити minimalStep.amount лоту
    [Arguments]  ${value}
    ${minimalStep_amount}=  Convert to String  ${value}
    Wait Element Visibility And Input Text  css=input[data-id='minimalStepAmount']  ${minimalStep_amount}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Wait Visibility And Click Element  css=#tab_4 a
    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.


Додати неціновий показник на лот
    [Arguments]  ${user_name}  ${tenderId}  ${feature}  ${lot_id}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  css=#tab_2 a
    Sleep  2s
    Wait Visibility And Click Element  xpath=//div[@data-id='lot']//button[contains(., 'Додати показник')]
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='title'])[last()]  ${feature.title}
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='titleEn'])[last()]  ${feature.title_en}
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//textarea[@data-id='description'])[last()]  ${feature.description}
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//textarea[@data-id='descriptionEn'])[last()]  ${feature.description}

    @{lot_enums}=  Get From Dictionary  ${feature}  enum
    ${lot_criterion_count}=  Get Length  ${lot_enums}

    : FOR  ${index}  IN RANGE  0  ${lot_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  xpath=(//div[@data-id='lot']//section[@data-id='criteria']//button)[last()]
    \  ${lot_criterion_value}=  privatmarket_service.get_percent  ${lot_enums[${index}].value}
    \  ${lot_criterion_value}=  Convert to String   ${lot_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionValue'])[last()]  ${lot_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionTitle'])[last()]  ${lot_enums[${index}].title}
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionTitleEn'])[last()]  ${lot_enums[${index}].title}

    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Wait Visibility And Click Element  css=#tab_4 a
    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  120s


Додати неціновий показник на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${feature}  ${item_id}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  css=#tab_2 a
    Sleep  3
    Wait Visibility And Click Element  xpath=//div[@data-id='item']//button[contains(., 'Додати показник')]
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='title'])[last()]  ${feature.title}
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//textarea[@data-id='description'])[last()]  ${feature.description}

    @{item_enums}=  Get From Dictionary  ${feature}  enum
    ${item_criterion_count}=  Get Length  ${item_enums}

    : FOR  ${index}  IN RANGE  0  ${item_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  xpath=(//div[@data-id='item']//section[@data-id='criteria']//button)[last()]
    \  ${item_criterion_value}=  privatmarket_service.get_percent  ${item_enums[${index}].value}
    \  ${item_criterion_value}=  Convert to String   ${item_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionValue'])[last()]  ${item_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionTitle'])[last()]  ${item_enums[${index}].title}

    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Wait Visibility And Click Element  css=#tab_4 a
    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  360s


Видалити неціновий показник
    [Arguments]  ${user_name}  ${tenderId}  ${feature_id}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait For Ajax
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  css=#tab_2 a
    Wait Visibility And Click Element  xpath=(//div[@data-id='lot']//button[@data-id='actRemove'])[last()]
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Wait Visibility And Click Element  css=#tab_4 a
    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.


Завантажити документ
    [Arguments]  ${user_name}  ${filepath}  ${tenderId}
    #перейдем к редактированию
    Run Keyword If
    ...  'Неможливість' in '${TEST_NAME}'  Wait Until Element Is Visible  ${locator_tenderClaim.buttonCreate}  1s
    ...  ELSE  Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1

    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Sleep  2s
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    #откроем нужную вкладку
    Run Keyword If  'переговорної процедури' in '${TEST_NAME}'  Wait Visibility And Click Element  css=#tab_2 a
    ...  ELSE  Wait Visibility And Click Element  css=#tab_3 a

    #загрузим файл
    Wait Visibility And Click Element  css=label[for='documentation_tender_yes']
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//div[@data-id='ptrDocuments']//select[@data-id='filetype']//option[2]
    Sleep  1s
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//div[@data-id='ptrDocuments']//select[@data-id='filelang']//option[@value='string:en']
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector("div[data-id='ptrDocuments'] input[data-id='input-file']").style = ''
    Sleep  1s
    Run Keyword And Ignore Error  Choose File  css=div[data-id='ptrDocuments'] input[data-id='input-file']  ${filePath}
    Sleep  5s
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Wait Until Element Is Visible  css=section[data-id='step5']  ${COMMONWAIT}
    Sleep  1s
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}

    #Дождемся подтверждения и обновим страницу, поскольку тут не выходит его закрыть
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  180s


Завантажити документ в лот
    [Arguments]  ${user_name}  ${filepath}  ${tenderId}  ${lot_id}
    Run Keyword If
    ...  'Неможливість' in '${TEST_NAME}'  Wait Until Element Is Visible  ${locator_tenderClaim.buttonCreate}
    ...  ELSE  Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1

    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Sleep  2s
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  css=#tab_3 a
    Sleep  2s
    Wait Visibility And Click Element  css=label[for='documentation_lot_yes']
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@data-id='lotDocuments']//select[@data-id='filetype']//option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@data-id='lotDocuments']//select[@data-id='filelang']//option[@value='string:en']
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector("div[data-id='lotDocuments'] input[data-id='input-file']").style = ''
    Sleep  1s
    Choose File  css=div[data-id='lotDocuments'] input[data-id='input-file']  ${filePath}
    Sleep  5s
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Wait Until Element Is Visible  css=section[data-id='step5']  ${COMMONWAIT}
    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}

    #Дождемся подтверждения и обновим страницу, поскольку тут не выходит его закрыть
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  180s


Завантажити документ у кваліфікацію
    [Arguments]  ${user_name}  ${filepath}  ${tenderId}  ${bid_index}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]

    ${index}=  privatmarket_service.sum_of_numbers  ${bid_index}  1
    Run Keyword If
    ...  '${index}' == '1'  Wait Visibility And Click Element  xpath=(//a[@ng-click='act.openQualification(q)'])[${index}]
    ...  ELSE  Wait Visibility And Click Element  xpath=(//a[@ng-click='act.openQualification(q)'])[last()]
    Wait For Ajax
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select form-block__select_short']//option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select ng-scope form-block__select_short']//option[2]
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector(".files-upload input[type='file']").class = ''
    Sleep  1s
    Choose File  xpath=//div[@class='files-upload']//input[@type='file']  ${filePath}
    Sleep  5s


Підтвердити кваліфікацію
    [Arguments]  ${user_name}  ${tenderId}  ${bid_index}
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Run Keyword If  ${bid_index} < 0  privatmarket_service.positivate_numbers  ${bid_index}
    ${index}=  privatmarket_service.sum_of_numbers  ${bid_index}  1
    Wait Visibility And Click Element  xpath=(//a[@ng-click='act.openQualification(q)'])[${index}]
    Wait For Ajax
    Wait Visibility And Click Element  css=#chkSelfQualified
    Wait Visibility And Click Element  css=#chkSelfEligible
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@data-id='choseType']//option[2]
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@data-id='choseLang']//option[2]
    ${file_path}  ${file_title}  ${file_content}=  create_fake_doc
    Run Keyword And Ignore Error  Choose File  xpath=//input[@class="ng-hide"]  ${filePath}
    Wait Until Element Is Enabled  xpath=//button[@ng-click="act.setQualificationStatus('active')"]
    Wait Visibility And Click Element  xpath=//button[@ng-click="act.setQualificationStatus('active')"]
    Wait Until Element Is Visible  css=.notify
    Підписати ЕЦП  ${index}


Підписати ЕЦП
    [Arguments]  ${bid_index}
    Reload Page
    Wait For Element With Reload  xpath=//span[@data-id="status" and contains(text(), 'Очікує ЕЦП')]  1

    Wait Visibility And Click Element  xpath=(//a[@ng-click='act.openQualification(q)'])[${bid_index}]
    Wait For Ajax
    Wait Visibility And Click Element  xpath=//button[@data-id='addQualFileEcp']
    Select Window  name=signWin
    Wait Until Element Is Visible  id=CAsServersSelect
    Wait Visibility And Click Element  xpath=//select[@id='CAsServersSelect']//option[19]
    Choose File  id=PKeyFileInput  get_ECP_key
    Wait Element Visibility And Input Text  id=PKeyPassword  qwerty
    Wait Visibility And Click Element  id=PKeyReadButton
    Wait Until Element Is Visible  xpath=//span[@id='PKStatusInfo' and contains(text(), 'Ключ успішно завантажено')]
    Wait Visibility And Click Element  id=SignDataButton
    Wait Until Element Is Visible  xpath=//span[@id='PKStatusInfo' and contains(text(), 'ok')]
    Close Window
    Select Window


Затвердити остаточне рішення кваліфікації
    [Arguments]  ${user_name}  ${tenderId}
    Wait For Element With Reload  css=button[data-id='finishPreQualBtn']  1
    Wait Visibility And Click Element  css=button[data-id='finishPreQualBtn']
    Wait For Element With Reload  css=[data-tender-status='active.pre-qualification.stand-still']  1


Отримати інформацію із тендера
    [Arguments]  ${user_name}  ${tender_uaid}  ${field_name}
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${tender_data_title}  5s
    Run Keyword If  '${status}' == 'False'  privatmarket.Пошук тендера по ідентифікатору  ${user_name}  ${tender_uaid}
    Reload And Switch To Tab  1
    Wait Until Element Is Visible  ${tender_data_title}  ${COMMONWAIT}

    Run Keyword Unless  'award_view' in @{TEST_TAGS} or 'add_contract' in @{TEST_TAGS}  Відкрити детальну інформацію по позиціям

    #get information
    ${result}=  Run Keyword If
    ...  'award_view' in @{TEST_TAGS} or 'add_contract' in @{TEST_TAGS}  Отримати інформацію про постачальника  ${tender_uaid}  ${field_name}
    ...  ELSE  Отримати інформацію зі сторінки  ${user_name}  ${tender_uaid}  ${field_name}
    [Return]  ${result}


Відкрити детальну інформацію по позиціям
    Відкрити детальну інформацію по лотам
    ${elements}=  Get Webelements  css=.lot-info .description a
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  ${class}=  Get Element Attribute  xpath=(//div[@class='lot-info']//div[@class='description']/a)[${item}]@class
    \  Run Keyword Unless  'checked-item' in '${class}'  Click Element  xpath=(//div[@class='lot-info']//div[@class='description']/a)[${item}]


Відкрити інформацію по запитанням на всі лоти
    ${elements}=  Get Webelements  xpath=//a[contains(@ng-class, 'lot-faq')]
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'lot-faq')])[${item}]@class
    \  Run Keyword Unless  'checked-item' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot-faq')])[${item}]
    \  Run Keyword If  'відповіді на запитання' in '${TEST_NAME}'  Wait Visibility And Click Element  xpath=(//div[contains(@class, 'question-answer')]//div[contains(@class, 'question-expand-div')]/a[1])[${item}]


Відкрити інформацію про вкладені файли вимоги
    ${elements}=  Get Webelements  xpath=//a[@data-id='toggle-file-section']
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  Click Element  xpath=(//a[@data-id='toggle-file-section'])[${item}]


Відкрити повну відповідь на запитання
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=.question-answer .question-expand-div>a:nth-of-type(1)


Відкрити детальну інформацію по лотам
    ${elements}=  Get Webelements  xpath=//a[contains(@ng-class, 'description')]
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'description')])[${item}]@class
    \  Sleep  1s
    \  Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'description')])[${item}]


Створити постачальника, додати документацію і підтвердити його
    [Arguments]  ${username}  ${tender_uaid}  ${supplier_data}  ${document}
    Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Wait For Ajax
    Run Keyword And Ignore Error  Click Button  css=button[data-id='addParticipant']
    Wait Visibility And Click Element  xpath=//span[@ng-click="act.openAwardDraftEditWnd(b.psId)"]
    Wait Until Element Is Visible  css=.modal.fade.in  ${COMMONWAIT}
    Wait For Ajax
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.identifier.legalName']  ${supplier_data.data.suppliers[0].identifier.legalName}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.identifier.id']  ${supplier_data.data.suppliers[0].identifier.id}

    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.postalCode']  ${supplier_data.data.suppliers[0].address.postalCode}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.countryName']  ${supplier_data.data.suppliers[0].address.countryName}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.region']  ${supplier_data.data.suppliers[0].address.region}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.locality']  ${supplier_data.data.suppliers[0].address.locality}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.streetAddress']  ${supplier_data.data.suppliers[0].address.streetAddress}

    Wait Element Visibility And Input Text  css=input[ng-model='supplier.contactPoint.name']  ${supplier_data.data.suppliers[0].contactPoint.name}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.contactPoint.telephone']  ${supplier_data.data.suppliers[0].contactPoint.telephone}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.contactPoint.email']  ${supplier_data.data.suppliers[0].contactPoint.email}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.contactPoint.url']  ${supplier_data.data.suppliers[0].contactPoint.url}

    Wait Element Visibility And Input Text  css=input[ng-model='model.awardDraft.value.amount']  ${supplier_data.data.value.amount}
    Wait Visibility And Click Element  css=.modal.fade.in input[type='checkbox']
    Wait Visibility And Click Element  css=button[data-id='btn-send-award']
    Wait Until Element Is Enabled  css=div.alert-info  timeout=${COMMONWAIT}
    Wait Until Element Contains  css=div.alert-info  Данні успішно відправлені  timeout=10
    Wait Visibility And Click Element  css=div.modal-header i.icon-remove
    Wait For Ajax
    Reload Page
    Wait Visibility And Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Wait Visibility And Click Element  xpath=//span[@ng-click="act.openAward(b)"]
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[1]/option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[2]/option[2]
    Sleep  1s
    Choose File  xpath=//div[@class='form-block__item']/form/div/input  ${document}
    Sleep  5s
    Wait Visibility And Click Element  css=button[data-id='setActive']
    Sleep  3min


Підтвердити підписання контракту
    [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
    Wait For Element With Reload  css=input[data-id='contract.title']  1
    Wait Element Visibility And Input Text  css=input[data-id='contract.title']  ${tender_uaid}
    Wait Element Visibility And Input Text  css=#contractNumber  ${tender_uaid}
    Click Element  css=#dateSigned
    Wait Visibility And Click Element  css=.today.day
    Wait For Ajax
    Click Element  css=#endDate
    Wait Visibility And Click Element  xpath=//div[@class="datepicker-days"]//tbody//tr[6]//td[4]
    Wait For Ajax
    Wait Until Element Is Enabled  css=button[ng-click="act.saveContract('active')"]  ${COMMONWAIT}
    Click Button  css=button[ng-click="act.saveContract('active')"]
    Wait Until Element Is Visible  css=.notify  ${COMMONWAIT}
    Sleep  3min


Отримати інформацію зі сторінки
    [Arguments]  ${user_name}  ${base_tender_uaid}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'value.amount'  Convert Amount To Number  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'value.currency'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'value.valueAddedTaxIncluded'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'enquiryPeriod.startDate'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'enquiryPeriod.endDate'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'tenderPeriod.startDate'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'tenderPeriod.endDate'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'minimalStep.amount'  Convert Amount To Number  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'status'  Отримати інформацію з ${field_name}  ${user_name}  ${base_tender_uaid}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'qualificationPeriod.endDate'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'qualifications[0].status'  Отримати статус пропозиції кваліфікації  1
    Run Keyword And Return If  '${field_name}' == 'qualifications[1].status'  Отримати статус пропозиції кваліфікації  2
    Run Keyword And Return If  '${field_name}' == 'title_en'  Отримати інформацію зі зміною локалізації  ${field_name}  EN
    Run Keyword And Return If  '${field_name}' == 'title_ru'  Отримати інформацію зі зміною локалізації  ${field_name}  RU
    Run Keyword And Return If  '${field_name}' == 'description_en'  Отримати інформацію зі зміною локалізації  ${field_name}  EN
    Run Keyword And Return If  '${field_name}' == 'description_ru'  Отримати інформацію зі зміною локалізації  ${field_name}  RU
    Run Keyword And Return If  '${field_name}' == 'causeDescription'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'cause'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'awards[0].complaintPeriod.endDate'  Отримати інформацію з ${field_name}  1
    Run Keyword And Return If  '${field_name}' == 'procurementMethodType'  Отримати інформацію з ${field_name}  1
    Run Keyword And Return If  '${field_name}' == 'complaintPeriod.endDate'  Отримати інформацію з ${field_name}  ${field_name}  0
    Run Keyword And Return If  '${field_name}' == 'items[0].deliveryDate.startDate'  Отримати дату та час  ${field_name}

    Run Keyword And Return If  '].deliveryAddress.countryName_en' in '${field_name}'  Отримати інформацію із предмету зі зміною локалізації для пропозицій  ${field_name}  EN
    Run Keyword And Return If  '].deliveryAddress.countryName_ru' in '${field_name}'  Отримати інформацію із предмету зі зміною локалізації для пропозицій  ${field_name}  RU
    Run Keyword And Return If  '${field_name}' == 'items[0].deliveryDate.endDate'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'stage2TenderID'  Отримати інформацію з ${field_name}
    Run Keyword And Return If  '${field_name}' == 'features[0].title'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'lots[0].auctionPeriod.endDate'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'lots[0].auctionPeriod.startDate'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'questions[0].title'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'questions[0].description'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'questions[0].answer'  Отримати інформацію з ${field_name}  ${field_name}


    Wait Until Element Is Visible  ${tender_data_${field_name}}
    ${result_full}=  Get Text  ${tender_data_${field_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію з questions[0].title
    [Arguments]  ${field_name}
    Wait For Element With Reload  ${tender_data_lot_question.${field_name}}  1
    ${result}=  Отримати текст елемента  ${tender_data_lot_question.${field_name}}
    [Return]  ${result}


Отримати інформацію з questions[0].description
    [Arguments]  ${field_name}
    Wait For Element With Reload  ${tender_data_lot_question.${field_name}}  1
    ${result}=  Отримати текст елемента  ${tender_data_lot_question.${field_name}}
    [Return]  ${result}


Отримати інформацію з questions[0].answer
    [Arguments]  ${field_name}
    Wait For Element With Reload  ${tender_data_lot_question.${field_name}}  1
    ${result}=  Отримати текст елемента  ${element_name}
    [Return]  ${result}


Отримати інформацію із лоту
    [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field_name}
    Execute JavaScript    window.scrollTo(${0},${0})
    ${className}=  Get Element Attribute  xpath=//section[@id='lotSection']/section[contains(., '${object_id}')]//a[1]@class
    Run Keyword If  '${className}' == 'nav-item'  Wait Visibility And Click Element  //section[@id='lotSection']/section[contains(., '${object_id}')]//a[1]
    ${element}=  Set Variable  xpath=(//section[@id='lotSection']/section[contains(., '${object_id}')]${tender_data_lot.${field_name}}

    Run Keyword And Return If  '${field_name}' == 'value.amount'  Convert Amount To Number  ${element}
    Run Keyword And Return If  '${field_name}' == 'value.currency'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'value.valueAddedTaxIncluded'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'minimalStep.amount'  Отримати суму  ${element}
    Run Keyword And Return If  '${field_name}' == 'minimalStep.currency'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'minimalStep.valueAddedTaxIncluded'  Отримати інформацію з ${field_name}  ${element}

    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із предмету
    [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field_name}
    Відкрити детальну інформацію по позиціям
    ${info}=  Set Variable  xpath=//div[@class='lot-info']/section[contains(., '${object_id}')]//div[@class='info-item-val']/div[@class='description']/a
    ${element_present_status}=  Run Keyword And Return Status  Element Should Be Visible  ${element_name}
    Run Keyword unless  ${element_present_status}  Wait For Element With Reload  ${info}  1
    ${info_class}=  Get Element Attribute  ${info}@class
    Run Keyword Unless  'checked-item' in '${info_class}'  Click Element  ${info}
    ${element}=  Set Variable  xpath=(//div[@class='lot-info']/section[contains(., '${object_id}')]${tender_data_item.${field_name}}

    Run Keyword And Return If  '${field_name}' == 'deliveryDate.startDate'  Отримати дату та час  ${element}
    Run Keyword And Return If  '${field_name}' == 'deliveryDate.endDate'  Отримати дату та час  ${element}
    Run Keyword And Return If  '${field_name}' == 'deliveryLocation.latitude'  Отримати число  ${element}  0
    Run Keyword And Return If  '${field_name}' == 'deliveryLocation.longitude'  Отримати число  ${element}  0
    Run Keyword And Return If  '${field_name}' == 'additionalClassifications[0].scheme'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'unit.name'  Отримати інформацію з ${field_name}  ${element}  0
    Run Keyword And Return If  '${field_name}' == 'unit.code'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'quantity'  Отримати суму  ${element}
    Run Keyword And Return If  '${field_name}' == 'deliveryAddress.countryName_ru'  Отримати інформацію із предмету зі зміною локалізації  ${field_name}  ${object_id}  RU
    Run Keyword And Return If  '${field_name}' == 'deliveryAddress.countryName_en'  Отримати інформацію із предмету зі зміною локалізації  ${field_name}  ${object_id}  EN

    Wait Until Element Is Visible  ${element}  timeout=${COMMONWAIT}
    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із плану
    [Arguments]  ${username}  ${tender_uaid}  ${field_name}
    Відкрити детальну інформацію по плану

    Run Keyword And Return If  '${field_name}' == 'tender.procurementMethodType'  Отримати тип запланованого тендера  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'budget.amount'  Convert Amount To Number  ${tender_data_value.amount}
    Run Keyword And Return If  '${field_name}' == 'budget.currency'  Отримати інформацію з value.currency  value.currency
    Run Keyword And Return If  '${field_name}' == 'tender.tenderPeriod.startDate'  Отримати и привести дату до заданого формату  xpath=//div[@data-id='plan-purchase-beg']

    ${index}=  privatmarket_service.get_match_from_string  ${field_name}  items\\[(.+?)\\]  1
    ${status}=  Set Variable If  '${index}' == 'null'  'false'  'true'
    Run Keyword And Return If  ${status} == 'true'  Отримати інформацію для item  ${index}  '${field_name}'

    Wait Until Element Is Visible  ${tender_data_${field_name}}
    ${result_full}=  Get Text  ${tender_data_${field_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію для item
    [Arguments]  ${index}  ${field_name}
    ${index}=  privatmarket_service.sum_of_numbers  ${index}  1

    Run Keyword And Return If  '].description' in ${field_name}  Отримати текст з item  xpath=(//a[@data-id='plan-classifications-toggle'])[${index}]
    Run Keyword And Return If  'quantity' in ${field_name}  Отримати кількості необхідних одиниць об'єкта приведенних до цілих  xpath=(//span[@class='item-count ng-binding'])[${index}]
    Run Keyword And Return If  'unit.name' in ${field_name}  Отримати текст з item  xpath=(//span[contains(@class,'item-unit')])[${index}]
    Run Keyword And Return If  'classification.description' in ${field_name}  Отримати текст з item  xpath=(//*[@data-id='item-classif-description'])[${index}]
    Run Keyword And Return If  'classification.scheme' in ${field_name}  Отримати текст з item  xpath=(//*[@data-id='item-classif-scheme'])[${index}]
    Run Keyword And Return If  'classification.id' in ${field_name}  Отримати текст з item  xpath=(//*[@data-id='item-classif-id'])[${index}]
    Run Keyword And Return If  'deliveryDate.endDate' in ${field_name}  Отримати и привести дату до заданого формату  xpath=(//div[@class='info-item-val normal-font ng-binding'])[${index}]
    ${text_element}=  Get text  ${field_name}

    [Return]  ${result}



Отримати текст з item
    [Arguments]  ${locator}
    ${text_element}=  Get text  ${locator}
    ${result}=  Strip String  ${text_element}
    [Return]  ${result}


Отримати кількості необхідних одиниць об'єкта приведенних до цілих
    [Arguments]  ${locator}
    ${text_element}=  Get text  ${locator}
    ${result}=  Strip String  ${text_element}
    ${result}=  get_conversion_to_int  ${result}
    [Return]  ${result}



Отримати и привести дату до заданого формату
    [Arguments]  ${locator}
    ${date}=  Отримати текст з item  ${locator}
    ${result}=  get_time_with_offset_formatted  ${date}  %d.%m.%Y  %Y-%m-%d %H:%M:%S.%f%z
    [Return]  ${result}

Відкрити детальну інформацію по плану
    Wait Until Element Is Visible  xpath=//a[contains(@ng-click, 'itemShowTab')]

    ${count}=  Get Matching Xpath Count  .//section//a[contains(@class, 'nav-item ng-binding checked')]
    Run Keyword if  ${count} == 0  Click Element  xpath=//a[contains(@ng-click, 'itemShowTab')]

    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'checked-item')]
    ${count}=  Get Matching Xpath Count  xpath=//section//a[@class="ng-binding"]

    Run Keyword if  ${count} != 0  Відкрити itemObject  ${count}

Відкрити itemObject
    [Arguments]  ${count}
    @{list}=  Get Webelements  xpath=//section//a[@class="ng-binding"]
    :FOR  ${i}  IN  @{list}
     \  Click Element  ${i}

Отримати інформацію про постачальника
    [Arguments]  ${tender_uaid}  ${field_name}
    ${open_status}=  Run Keyword And Return Status  Wait Until Element Is Visible  xpath=//img[contains(@ng-src, 'icon-minus.png')]  1s
    Run Keyword Unless  ${open_status}  Відкрити детальну інформацію про постачальника

    Run Keyword And Return If  '${field_name}' == 'awards[0].status'  Отримати статус заявки  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'awards[0].value.valueAddedTaxIncluded'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'awards[0].value.currency'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'awards[0].value.amount'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'contracts[0].status'  Отримати статус договору  ${field_name}

    Wait Until Element Is Visible  ${tender_data_${field_name}}  ${COMMONWAIT}
    ${result_full}=  Get Text  ${tender_data_${field_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із запитання
    [Arguments]  ${username}  ${tender_uaid}  ${question_id}  ${field_name}

    ${element}=  Set Variable If
    ...  'запитання на тендер' in '${TEST_NAME}'  xpath=(//div[contains(@class, 'faq') and contains(., '${question_id}')]${tender_data_question.${field_name}}
    ...  'запитання на всі лоти' in '${TEST_NAME}'  xpath=//div[contains(@class, 'lot-info') and contains(., '${question_id}')]${tender_data_lot_question.${field_name}}
    ...  'запитання на всі предмети' in '${TEST_NAME}'  xpath=//div[contains(@class, 'lot-info') and contains(., '${question_id}')]${tender_data_lot_question.${field_name}}

    Run Keyword If
    ...  'запитання на тендер' in '${TEST_NAME}'  Wait For Element With Reload  ${element}  2
    ...  ELSE  Wait For Element With Reload  ${element}  1

    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із документа
    [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field}
    Wait For Element With Reload  xpath=//div[contains(@${field},'${doc_id}')]  1
    Wait Until Element Is Visible  xpath=//div[contains(@${field},'${doc_id}')]  ${COMMONWAIT}
    ${result}=  Get Text  xpath=//div[contains(@${field},'${doc_id}')]
    [Return]  ${result}


Отримати інформацію із нецінового показника
    [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field_name}
    Відкрити детальну інформацію по позиціям

    ${element}=  Set Variable IF
        ...  '${field_name}' == 'featureOf'  xpath=//div[contains(@class, 'feature name') and contains(., '${object_id}')]${tender_data_feature.${field_name}}
        ...  xpath=//div[contains(@class, 'feature name') and contains(., '${object_id}')]

    Run Keyword And Return If  '${field_name}' == 'title'  Отримати інформацію з feature  ${element}  0
    Run Keyword And Return If  '${field_name}' == 'description'  Отримати інформацію з feature  ${element}  1
    Run Keyword And Return If  '${field_name}' == 'featureOf'  Отримати інформацію з ${field_name}  ${element}

    Wait Until Element Is Visible  ${element}  timeout=${COMMONWAIT}
    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із скарги
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${field_name}  ${award_index}
    ${element}=  Set Variable  xpath=//div[contains(@class, 'faq') and contains(., '${complaintID}')]${tender_data_complaint.${field_name}}
    ${test_case_name}=  Remove String  ${TEST_NAME}  '
    Run Keyword If
    ...  '${test_case_name}' == 'Відображення поданого статусу вимоги'  Search by status  ${element}[contains(@data-status,'claim')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу answered вимоги'  Search by status  ${element}[contains(@data-status,'answered')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу resolved вимоги'  Search by status  ${element}[contains(@data-status,'resolved')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled вимоги'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу pending вимоги'  Search by status  ${element}[contains(@data-status,'pending')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled скарги'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу answered вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'answered')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу resolved вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'resolved')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled чернетки вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled чернетки вимоги'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled скарги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу ignored вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'ignored')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу declined вимоги про виправлення умов закупівлі'  Search by status  ${element}[contains(@data-status,'declined')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу invalid вимоги про виправлення умов лоту'  Search by status  ${element}[contains(@data-status,'invalid')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу invalid вимоги про виправлення умов закупівлі'  Search by status  ${element}[contains(@data-status,'invalid')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу declined вимоги про виправлення умов лоту'  Search by status  ${element}[contains(@data-status,'declined')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled чернетки вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  'Відображення статусу cancelled після draft -> claim вимоги' in '${test_case_name}'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  'Відображення статусу cancelled після draft -> claim -> answered вимоги' in '${test_case_name}'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  'Відображення статусу pending після draft -> claim -> answered вимоги' in '${test_case_name}'  Search by status  ${element}[contains(@data-status,'pending')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу answered вимоги про виправлення умов закупівлі'  Search by status  ${element}[contains(@data-status,'answered')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу resolved вимоги про виправлення умов закупівлі'  Search by status  ${element}[contains(@data-status,'resolved')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу answered вимоги про виправлення умов лоту'  Search by status  ${element}[contains(@data-status,'answered')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу resolved вимоги про виправлення умов лоту'  Search by status  ${element}[contains(@data-status,'resolved')]  3
    ...  ELSE  run keyword  Search by status  ${element}  3
    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    Run Keyword And Return If  '${field_name}' == 'status'  privatmarket_service.get_claim_status  ${result}
    Run Keyword And Return If  '${field_name}' == 'resolutionType'  Отримати resolutionType  ${result}
    Run Keyword And Return If  '${field_name}' == 'satisfied'  Отримати статус вирішення  ${result}
    [Return]  ${result}


Search by status
    [Arguments]  ${locator}  ${tab_number}
    Wait Until Keyword Succeeds  20min  10s  Try To Search Complaint  ${locator}  3


Try To Search Complaint
    [Arguments]  ${locator}  ${tab_number}
    Reload And Switch To Tab  ${tab_number}
    Wait For Ajax
    Wait Until Element Is Visible  ${locator}  5s


Отримати тип запланованого тендера
    [Arguments]  ${element}
    Wait For Ajax
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Run Keyword If  'Допорогові закупівлі' == '${text}'  Set Variable  belowThreshold
    [Return]  ${result}


Отримати resolutionType
    [Arguments]  ${text}
    ${text}=  Set Variable If  'Рішення замовника: вирiшена' in '${text}'  resolved
    [Return]  ${text}


Отримати статус вирішення
    [Arguments]  ${text}
    ${text}=  Set Variable If
    ...  'так' in '${text}'  ${TRUE}
    ...  'ні' in '${text}'  ${FALSE}
    ...  ${text}
    [Return]  ${text}


Відкрити детальну інформацію про контракт
    ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'lot-cont')])[1]@class
    Run Keyword Unless  'checked-nav' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot-cont')])[1]


Відкрити детальну інформацію про постачальника
    ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]@class
    Run Keyword Unless  'checked-nav' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Run keyword And Ignore Error  Wait Visibility And Click Element  xpath=//img[contains(@ng-src, 'icon-plus')]


Отримати статус заявки
    [Arguments]  ${field_name}
    Wait Until Element Is Visible  ${tender_data_${field_name}}  ${COMMONWAIT}
    ${status_name}=  Get text  ${tender_data_${field_name}}
    ${status_type}=  Set Variable If
    ...  'Переможець переговорів' == '${status_name}'  active
    ...  ELSE  ${status_name}
    [Return]  ${status_type}


Отримати статус договору
    [Arguments]  ${field_name}
    Відкрити детальну інформацію про контракт

    Run Keyword If  'статусу підписаної угоди з постачальником' in '${TEST_NAME}'
    ...  Wait For Element With Reload  xpath=//span[contains(., 'Підписаний') and contains(@id, 'contractStatus')]  1

    ${status}  ${status_name}=  Run Keyword And Ignore Error  Get text  ${tender_data_${field_name}}
    ${status_name}=  Run Keyword If
    ...  '${status}' == 'PASS'  Set Variable  ${status_name}
    ...  ELSE  Set Variable  'Очiкує пiдписання'
    ${status_name}=  Replace String  ${status_name}  '  ${EMPTY}

    ${status_type}=  Run Keyword If
    ...  'Очiкує пiдписання' == '${status_name}'  Set Variable  pending
    ...  ELSE IF  'Підписаний' == '${status_name}'  Set Variable  active
    ...  ELSE  Set Variable  ${status_name}
    Reload Page
    [Return]  ${status_type}


Отримати інформацію із документа до скарги
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${doc_id}  ${field}
    ${element} =  Set Variable  xpath=//a[contains(.,"Показати вкладені файли")]
    Показати вкладені файли  ${element}
    ${element_new}=  Set Variable  xpath=(//div[contains(@title,'${doc_id}')])
    Wait Until Element Is Visible  xpath=(//div[contains(@title,'${doc_id}')])
    ${doc_text} =  Get Text  ${element_new}
    [Return]  ${doc_text}


Показати вкладені файли
     [Arguments]  ${element}
     ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${element}  20s
     Run Keyword If  '${status}' == 'True'  Click Element  ${element}



Отримати статус пропозиції кваліфікації
    [Arguments]  ${item}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Wait Until Element Is Visible  css=.bids>tbody>tr:nth-of-type(${item})>td:nth-of-type(3)  timeout=${COMMONWAIT}

    ${elem_text}=  Get Text  xpath=(//span[@data-id='status'])[${item}]
    ${status_text}=  Split String  ${elem_text}  \n
    ${status}=  Strip String  ${status_text[0]}
    ${result}=  privatmarket_service.get_status_type  ${status}
    [Return]  ${result}


Отримати документ до лоту
    [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${doc_id}
    ${file_name}=  privatmarket.Отримати документ  ${username}  ${tender_uaid}  ${doc_id}
    [Return]  ${file_name}


Отримати документ до скарги
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${doc_id}  ${award_id}=${None}
    Wait For Element With Reload  xpath=//div[contains(@title,'${doc_id}')]  3
    Scroll Page To Element  xpath=//div[contains(@title,'${doc_id}')]
    Wait Visibility And Click Element  xpath=//div[contains(@title,'${doc_id}')]
    # Добален слип, т.к. док не успевал загрузиться
    sleep  20s
    ${file_name_full}=  Get Text  xpath=//div[contains(@title,'${doc_id}')]
    ${file_name}=  Strip String  ${file_name_full}
    [Return]  ${file_name}


Отримати документ
    [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
    Wait For Element With Reload  xpath=//div[contains(@title,'${doc_id}')]  1
    Scroll Page To Element  xpath=//div[contains(@title,'${doc_id}')]
    Wait Visibility And Click Element  xpath=//div[contains(@title,'${doc_id}')]
    # Добален слип, т.к. док не успевал загрузиться
    sleep  20s
    ${file_name_full}=  Get Text  xpath=//div[contains(@title,'${doc_id}')]
    ${file_name}=  Strip String  ${file_name_full}
    [Return]  ${file_name}


Отримати посилання на аукціон для глядача
    [Arguments]  ${user}  ${tenderId}  ${object_id}=${Empty}
    Wait For Element With Reload  xpath=//a[contains(@href, 'https://auction-sandbox.openprocurement.org/tenders/')]  1  30
    ${result}=  Get Element Attribute  xpath=//a[contains(@href, 'https://auction-sandbox.openprocurement.org/tenders/')]@href
    [Return]  ${result}


Відкрити модальне вікно з посиланням на аукціон
    Wait Visibility And Click Element  css=button#takepartLink


Відповісти на запитання
    [Arguments]  ${username}  ${tender_uaid}  ${answer_data}  ${question_id}
    Run Keyword And Return If  'на всі лоти' in '${TEST_NAME}'  Відповісти на запитання на лот  ${answer_data}  ${question_id}

    Switch To Tab  2
    Wait For Element With Reload  xpath=//button[contains(@ng-click, 'act.answerFaq')]  2
    Wait Visibility And Click Element  xpath=//button[contains(@ng-click, 'act.answerFaq')]
    Wait Element Visibility And Input Text  id=questionAnswer  ${answer_data.data.answer}
    Sleep  2s
    Wait Visibility And Click Element  id=btnSendAnswer
    Wait For Notification  Ваша відповідь успішно відправлена!
    Wait Visibility And Click Element  css=span[ng-click='act.hideModal()']
    Sleep  90s


Відповісти на запитання на лот
    [Arguments]  ${answer_data}  ${question_id}
    ${element}=  Set Variable  xpath=//div[contains(@class, 'lot-info') and contains(., '${question_id}')]//button
    Wait For Element With Reload  ${element}  1
    Wait Visibility And Click Element  ${element}
    Wait Element Visibility And Input Text  id=questionAnswer  ${answer_data.data.answer}
    Sleep  2s
    Wait Visibility And Click Element  id=btnSendAnswer
    Wait For Notification  Ваша відповідь успішно відправлена!
    Wait Visibility And Click Element  id=btnClose
    Sleep  90s


Отримати інформацію з value.currency
    [Arguments]  ${element_name}
    ${currency}=  Отримати строку  ${element_name}  0
    ${currency_type}=  get_currency_type  ${currency}
    [Return]  ${currency_type}


Отримати інформацію з stage2TenderID
    ${type}=  Отримати текст елемента  xpath=//div[@class='info-item']//div[2]//span[1]
##    Wait For Element With Reload  xpath=//*[@id="prozorroHash"]/div/a  1
##    Click Element  xpath=//*[@id="prozorroHash"]/div/a
##    ${text}=  Get Text  xpath=//div//h3
##    ${text_new}=  Strip String  ${text}
##    @{values_list}=  Split String  ${text_new}
##    ${result}=  @{values_list}[4]
##    Reload Page
##    Go Back
    [Return]  ${type}


Отримати інформацію з features[0].title
    [Arguments]  ${element_name}
    Reload Page
    Wait Until Element Is Visible  xpath=//li[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//li[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked-nav' in '${class}'  Click Element  xpath=(//li[contains(@ng-class, 'lot.showTab')])[1]
    Wait Until Element Is Visible  ${tender_data_${element_name}}
    ${result_full}=  Get Text  ${tender_data_${element_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію з awards[0].value.currency
    [Arguments]  ${element_name}
    ${currency}=  Отримати текст елемента  ${element_name}
    ${currency_type}=  privatmarket_service.get_currency_type  ${currency}
    [Return]  ${currency_type}


Отримати інформацію з awards[0].value.amount
    [Arguments]  ${element_name}
    ${text}=  Отримати текст елемента  ${element_name}
    ${text_new}=  Strip String  ${text}
    ${text_new}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Отримати інформацію з value.valueAddedTaxIncluded
    [Arguments]  ${element_name}
    ${temp_name}=  Remove String  ${element_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}'  ${element_name}
        ...  ${tender_data_${element_name}}

    ${value_added_tax_included}=  Get text  ${element}
    ${result}=  Set Variable If  'з ПДВ' in '${value_added_tax_included}'  True
    ${result}=  Convert To Boolean  ${result}
    [Return]  ${result}


Отримати інформацію з awards[0].value.valueAddedTaxIncluded
    [Arguments]  ${element_name}
    ${temp_name}=  Remove String  ${element_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}'  ${element_name}
        ...  ${tender_data_${element_name}}

    ${value_added_tax_included}=  Get text  ${element}
    ${result}=  Set Variable If  'з ПДВ' in '${value_added_tax_included}'  True
    ${result}=  Convert To Boolean  ${result}
    [Return]  ${result}


Отримати інформацію з minimalStep.currency
    [Arguments]  ${element_name}
    ${currency}=  Отримати строку  ${element_name}  0
    ${currency_type}=  get_currency_type  ${currency}
    [Return]  ${currency_type}


Отримати інформацію з minimalStep.valueAddedTaxIncluded
    [Arguments]  ${element_name}
    ${temp_name}=  Remove String  ${element_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}'  ${element_name}
        ...  ${tender_data_${element_name}}

    ${value_added_tax_included}=  Get text  ${element}
    ${result}=  Set Variable If  'з ПДВ' in '${value_added_tax_included}'  True
    ${result}=  Convert To Boolean  ${result}
    [Return]  ${result}


Отримати інформацію з типу податку
    [Arguments]  ${element}
    ${value_added_tax_included}=  Get text  ${element}
    ${result}=  Set Variable If  'з ПДВ' in '${value_added_tax_included}'  True
    ${result}=  Convert To Boolean  ${result}
    [Return]  ${result}


Отримати інформацію з unit.code
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}
    ${result_full}=  Get Text  ${element}
    ${result}=  privatmarket_service.get_unit_code  ${result_full}
    [Return]  ${result}


Отримати інформацію з quantity
    [Arguments]  ${element_name}
    ${result_full}=  Get Text  ${element_name}
    ${result}=  Strip String  ${result_full}
    ${result}=  Replace String  ${result}  .00  ${EMPTY}
    ${result}=  Strip String  ${result}
    [Return]  ${result}


Отримати інформацію з classification.scheme
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}
    ${result_full}=  Get Text  ${element}
    ${result}=  privatmarket_service.get_classification_type  ${result_full}
    [Return]  ${result}


Отримати інформацію з additionalClassifications[0].scheme
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}
    ${result_full}=  Get Text  ${element}
    ${result}=  privatmarket_service.get_classification_type  ${result_full}
    [Return]  ${result}


Отримати інформацію з status
    [Arguments]  ${user_name}  ${tender_uaid}  ${element_name}
    privatmarket.Оновити сторінку з тендером
    Wait Until Element Is Visible  ${tender_data_${element_name}}  ${COMMONWAIT}
    Sleep  5s
    ${status_name}=  Get Element Attribute  ${tender_data_status}@data-tender-status
#    ${status_type}=  privatmarket_service.get_status_type  ${status_name}
    [Return]  ${status_name}


Звірити статус
    [Arguments]  ${user_name}  ${tender_uaid}
    ${current_status}=  Отримати інформацію з status  ${user_name}  ${tender_uaid}  status
    Should Be Equal  active.awarded  ${current_status}  msg=Statuses are not equal


Отримати інформацію з feature
    [Arguments]  ${element}  ${id}
    Wait For Element With Reload  ${element}  1
    ${result_full}=  Отримати текст елемента  ${element}
    ${result_full}=  Strip String  ${result_full}
    ${values_list}=  Split String  ${result_full}  \n
    ${result}=  Set Variable  ${values_list[${id}]}
    [Return]  ${result}


Отримати інформацію з featureOf
    [Arguments]  ${element}
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Set Variable If
    ...  'по закупівлі' in '${text}'  tenderer
    ...  'по позиції' in '${text}'  item
    ...  'по лоту' in '${text}'  lot
    [Return]  ${result}


Отримати інформацію з causeDescription
    [Arguments]  ${element}
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//div[contains(@ng-click, 'showReason')]
    ${result_full}=  Отримати текст елемента  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію з cause
    [Arguments]  ${element}
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//div[contains(@ng-click, 'showReason')]
    ${result_full}=  Отримати текст елемента  ${element}
    ${result_full}=  Strip String  ${result_full}
    ${result}=  privatmarket_service.get_cause  ${result_full}
    [Return]  ${result}


Отримати інформацію з procurementMethodType
    [Arguments]  ${element}
    ${type}=  Отримати текст елемента  xpath=//div[@class='info-item']//div[2]//span[1]
    ${type}=  get_procurementMethod_Type  ${type}
    [Return]  ${type}


Отримати інформацію зі зміною локалізації
    [Arguments]  ${element}  ${lang}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//*[@id='langMenu']
    Wait Visibility And Click Element  xpath=//li[contains(text(),'${lang}')]
    Wait For Ajax
    ${element}=  Set Variable If
    ...  'title' in '${element}'  title
    ...  'description' in '${element}'  description
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Strip String  ${text}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//*[@id='langMenu']
    Wait Visibility And Click Element  xpath=//li[contains(text(),'UK')]
    [Return]  ${result}


Отримати інформацію із предмету зі зміною локалізації
    [Arguments]  ${field_name}  ${object_id}  ${lang}
    ${index}=  Get Item Number  ${object_id}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//li[contains(@class, 'change-language-item') and contains(., '${lang}')]
    Wait Until Element Is Visible  xpath=//li[contains(@class, 'change-language-item') and contains(., '${lang}')]/b
    Wait For Ajax
    Відкрити детальну інформацію по позиціям
    ${element}=  Set Variable  xpath=(//section[@id='subject-section']${tender_data_item.${field_name}}[${index}]
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Strip String  ${text}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//li[contains(@class, 'change-language-item') and contains(., 'UK')]
    [Return]  ${result}


Отримати інформацію із предмету зі зміною локалізації для пропозицій
    [Arguments]  ${field_name}  ${lang}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//*[@id='langMenu']
    Wait Visibility And Click Element  xpath=//li[contains(text(),'${lang}')]
    Wait For Ajax
    Відкрити детальну інформацію по позиціям
    ${index}=  privatmarket_service.get_match_from_string  ${field_name}  items\\[(.+?)\\]  1
    ${index_xpath}=  privatmarket_service.sum_of_numbers  ${index}  1

    ${element}=  Set Variable If
    ...  '].deliveryAddress.countryName' in '${field_name}'  xpath=(//*[@data-id='address.countryName'])[${index_xpath}]
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Strip String  ${text}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//*[@id='langMenu']
    Wait Visibility And Click Element  xpath=//li[contains(text(),'UK')]
    [Return]  ${result}


Отримати інформацію з awards[0].complaintPeriod.endDate
    [Arguments]  ${shift}
    Reload Page
    ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    ${title}=  Get Element Attribute  xpath=//a[contains(., 'Переможець')]@title
    ${work_string}=  Get Regexp Matches  ${title}  до (.)*
    ${work_string}=  Get From List  ${work_string}  0
    ${work_string}=  Replace String  ${work_string}  ,${SPACE}  ${SPACE}
    ${values_list}=  Split String  ${work_string}
    ${day}=  Convert To Integer  ${values_list[0 + ${shift}]}
    ${day}=  Set Variable If  ${day} < 10  0${day}  ${day}
    ${month}=  privatmarket_service.get_month_number  ${values_list[1 + ${shift}]}
    ${month}=  Set Variable If  ${month} < 10  0${month}  ${month}
    ${year}=  Convert To String  ${values_list[2 + ${shift}]}
    ${time}=  Convert To String  ${values_list[3 + ${shift}]}
    ${date}=  Convert To String  ${year}-${month}-${day} ${time}
    ${result}=  privatmarket_service.get_time_with_offset  ${date}
    [Return]  ${result}


Отримати інформацію з complaintPeriod.endDate
    [Arguments]  ${element_name}  ${shift}
    Reload Page
    Reload And Switch To Tab  3
    ${result_full}=  Отримати текст елемента  ${element_name}
    ${work_string}=  Replace String  ${result_full}  ${SPACE},${SPACE}  ${SPACE}
    ${work_string}=  Replace String  ${result_full}  ,${SPACE}  ${SPACE}
    ${values_list}=  Split String  ${work_string}
    ${day}=  Convert To String  ${values_list[0 + ${shift}]}
    ${month}=  privatmarket_service.get_month_number  ${values_list[1 + ${shift}]}
    ${month}=  Set Variable If  ${month} < 10  0${month}  ${month}
    ${year}=  Convert To String  ${values_list[2 + ${shift}]}
    ${time}=  Convert To String  ${values_list[3 + ${shift}]}
    ${date}=  Convert To String  ${year}-${month}-${day} ${time}
    ${result}=  privatmarket_service.get_time_with_offset  ${date}
    [Return]  ${result}


Отримати строку
    [Arguments]  ${element_name}  ${position_number}
    ${result_full}=  Отримати текст елемента  ${element_name}
    ${result}=  Strip String  ${result_full}
    ${result}=  Replace String  ${result}  ,  ${EMPTY}
    ${values_list}=  Split String  ${result}
    ${result}=  Strip String  ${values_list[${position_number}]}  mode=both  characters=:
    [Return]  ${result}


Отримати текст елемента
    [Arguments]  ${element_name}
    ${temp_name}=  Remove String  ${element_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}' or 'id=' in '${temp_name}'  ${element_name}
        ...  ${tender_data_${element_name}}

    Wait Until Element Is Visible  ${element}  ${COMMONWAIT}
    ${result_full}=  Get Text  ${element}
    [Return]  ${result_full}


Отримати дату та час
    [Arguments]  ${element_name}
    ${element_present}=  Run Keyword And Return Status  Element Should Be Visible  ${element_name}
    Run Keyword unless  ${element_present}  Wait For Element With Reload  ${tender_data_${element_name}}  1

    ${result_full}=  Отримати текст елемента  ${element_name}
    ${work_string}=  Replace String  ${result_full}  ${SPACE},${SPACE}  ${SPACE}
    ${work_string}=  Replace String  ${result_full}  ,${SPACE}  ${SPACE}
    ${values_list}=  Split String  ${work_string}
    ${day}=  Convert To String  ${values_list[0]}
    ${month}=  privatmarket_service.get_month_number  ${values_list[1]}
    ${month}=  Set Variable If  ${month} < 10  0${month}  ${month}
    ${year}=  Convert To String  ${values_list[2]}
    ${time}=  Convert To String  ${values_list[3]}
    ${date}=  Convert To String  ${year}-${month}-${day} ${time}
    ${result}=  privatmarket_service.get_time_with_offset  ${date}
    [Return]  ${result}


Отримати суму
    [Arguments]  ${element_name}
    ${result}=  Отримати текст елемента  ${element_name}
    ${result}=  Remove String  ${result}  ${SPACE}
    ${result}=  Replace String  ${result}  ,  .
    ${result}=  Convert To Number  ${result}
    [Return]  ${result}


Отримати число
    [Arguments]  ${element_name}  ${position_number}
    ${value}=  Отримати строку  ${element_name}  ${position_number}
    ${result}=  Convert To Number  ${value}
    [Return]  ${result}


Отримати класифікацію
    [Arguments]  ${element_name}
    ${result_full} =  Отримати текст елемента  ${element_name}
    ${reg_expresion} =  Set Variable  [0-9A-zА-Яа-яёЁЇїІіЄєҐґ\\s\\:]+\: \\w+[\\d\\.\\-]+ ([А-Яа-яёЁЇїІіЄєҐґ\\s;,\\"_\\(\\)\\.]+)
    ${result} =  Get Regexp Matches  ${result_full}  ${reg_expresion}  1
    [Return]  ${result[0]}


Отримати інформацію з unit.name
    [Arguments]  ${element_name}  ${position_number}
    ${result_full}=  Отримати строку  ${element_name}  ${position_number}
    ${result}=  privatmarket_service.get_unit_name  ${result_full}
    [Return]  ${result}


Обрати додаткові класифікатори
    [Arguments]  ${scheme}  ${classificationId}
    Обрати схему  ${scheme}
    Обрати класифікатори  ${classificationId}


Обрати класифікатори
    [Arguments]  ${classificationId}
    Wait Visibility And Click Element  xpath=(//a[@data-id='actChoose'])[2]
    Wait Until Element Is Visible  css=section[data-id='classificationTreeModal']  ${COMMONWAIT}
    Wait Until Element Is Visible  css=input[data-id='query']  ${COMMONWAIT}
    Wait Element Visibility And Input Text  css=input[data-id='query']  ${classificationId}
    Wait Until Element Is Not Visible  css=.modal-body.tree.pm-tree
    Wait Until Keyword Succeeds  20s  500ms  Check Element Attribute  css=[data-status='ok']  data-id
    Wait Visibility And Click Element  xpath=//div[@data-id='foundItem']//label[@for='found_${classificationId}']
    Wait Visibility And Click Element  css=[data-id='actConfirm']


Обрати схему
    [Arguments]  ${scheme}
    Wait Visibility And Click Element  css=a[data-id='actAdd']
    Sleep  1
    Wait Visibility And Click Element  xpath=//section[@data-id='schemeCheckModal']//label[@for='scheme_${scheme}']
    Wait Visibility And Click Element  xpath=//section[@data-id='schemeCheckModal']//button[@data-id='actConfirm']
    Sleep  1


Close notification
    ${notification_visibility}=  Run Keyword And Return Status  Wait Until Element Is Visible  css=section[data-id='popupHelloModal'] span[data-id='actClose']
    Run Keyword If  ${notification_visibility}  Click Element  css=section[data-id='popupHelloModal'] span[data-id='actClose']


Switch To Frame
    [Arguments]  ${frameId}
    Wait Until Element Is enabled  ${frameId}  ${COMMONWAIT}
    Select Frame  ${frameId}


Login
    [Arguments]  ${username}
    Wait Visibility And Click Element  css=button[ng-click='act.loginPage()']
    Wait Until Element Is Visible  css=input[data-id='enter-login']  ${COMMONWAIT}
    Input Text  css=input[data-id='enter-login']  +${USERS.users['${username}'].login}
    Input Text  css=input[data-id='enter-pwd']  ${USERS.users['${username}'].password}
    Wait Visibility And Click Element  css=button[data-id='enter-submit']
    Wait For Ajax
    Wait Until Element Is Visible  css=.company-name  timeout=30


Wait Visibility And Click Element
    [Arguments]  ${elementLocator}
    Wait Until Element Is Visible  ${elementLocator}  ${COMMONWAIT}
    Click Element  ${elementLocator}


Wait Element Visibility And Input Text
    [Arguments]  ${elementLocator}  ${input}
    Wait Until Element Is Visible  ${elementLocator}  ${COMMONWAIT}
    Input Text  ${elementLocator}  ${input}


Wait For Tender
    [Arguments]  ${tender_id}  ${education_type}  ${type}=tender
    Wait Until Keyword Succeeds  7min  5s  Try Search Tender  ${tender_id}  ${education_type}  ${type}


Try Search Tender
    [Arguments]  ${tender_id}  ${education_type}  ${type}
    Check Current Mode New Realisation

    #выберем поиск по планам закупок
    Run Keyword If  '${type}' == 'plan'  Wait Visibility And Click Element  css=[data-id='ttype-plans-label']

    #заполним поле поиска
    Clear Element Text  ${locator_tenderSearch.searchInput}
    Sleep  1s
    Input Text  ${locator_tenderSearch.searchInput}  ${tender_id}

    #выполним поиск
    Click Element  css=button#search-query-button
    Wait Until Element Is Not Visible  xpath=//div[@class='ajax_overflow']  ${COMMONWAIT}
    Wait Until Element Is Enabled  id=${tender_id}  timeout=10
    [Return]  True


Check Current Mode New Realisation
    [Arguments]  ${education_type}=${True}
    privatmarket.Оновити сторінку з тендером
#    Close notification
    #проверим правильный ли режим
    Wait Until Element Is Visible  ${locator_tender.switchToDemo}  ${COMMONWAIT}
    Wait Visibility And Click Element  ${locator_tender.switchToDemo}
    Wait For Ajax
    ${check_result}=  Get Text  ${locator_tender.switchToDemo}
    Run Keyword If  '${check_result}' == 'Увійти в демо-режим' or '${check_result}' == 'Войти в демо-режим'  Switch To Education Mode


Switch To Education Mode
    [Arguments]  ${education_type}=${True}
    Wait Visibility And Click Element  ${locator_tender.switchToDemo}
    Wait Until Element Is Visible  ${locator_tender.switchToDemoMessage}  ${COMMONWAIT}


Convert Amount To Number
    [Arguments]  ${field_name}
    ${temp_name}=  Remove String  ${field_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}'  ${field_name}
        ...  ${tender_data_${field_name}}

    ${result_full}=  Get Text  ${element}
    ${text}=  Strip String  ${result_full}
    ${text_new}=  Replace String  ${text}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Wait For Element With Reload
    [Arguments]  ${locator}  ${tab_number}  ${period}=7
    Wait Until Keyword Succeeds  ${period}min  10s  Try Search Element  ${locator}  ${tab_number}


Try Search Element
    [Arguments]  ${locator}  ${tab_number}
    Reload And Switch To Tab  ${tab_number}
    Run Keyword If
    ...  '${tab_number}' == '1' and 'запитання на всі предмети' in '${TEST_NAME}'  Відкрити інформацію по запитанням на всі лоти
    ...  ELSE IF  '${tab_number}' == '1' and 'запитання на всі лоти' in '${TEST_NAME}'  Відкрити інформацію по запитанням на всі лоти
    ...  ELSE IF  '${tab_number}' == '1' and 'статусу підписаної угоди з постачальником' in '${TEST_NAME}'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and '${TEST_NAME}' == 'Можливість укласти угоду для закупівлі'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and '${TEST_NAME}' == 'Можливість укласти угоду для переговорної процедури'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and 'пропозицію кваліфікації' in '${TEST_NAME}'  Wait Visibility And Click Element  xpath=//li[contains(@ng-class, 'lot-parts')]
    ...  ELSE IF  '${tab_number}' == '1' and 'вичитати посилання на аукціон' in '${TEST_NAME}'  Відкрити модальне вікно з посиланням на аукціон
    ...  ELSE IF  '${tab_number}' == '1'  Відкрити детальну інформацію по позиціям
    ...  ELSE IF  '${tab_number}' == '2' and 'відповіді на запитання' in '${TEST_NAME}'  Відкрити повну відповідь на запитання
    ...  ELSE IF  '${tab_number}' == '3' and 'заголовку документації' in '${TEST_NAME}'  Відкрити інформацію про вкладені файли вимоги
    ...  ELSE IF  '${tab_number}' == '3' and 'вмісту документа до вимоги' in '${TEST_NAME}'  Відкрити інформацію про вкладені файли вимоги
    Wait Until Element Is Enabled  ${locator}  10
    Wait For Ajax
    [Return]  True


Reload And Switch To Tab
    [Arguments]  ${tab_number}
    Reload Page
    Switch To Tab  ${tab_number}


Switch To Tab
    [Arguments]  ${tab_number}
    ${class}=  Get Element Attribute  xpath=(//div[@id='nav-tab']/a)[${tab_number}]@class
    Execute JavaScript  window.scrollTo(${0},${0})
    Run Keyword Unless  'checked' in '${class}'  Wait Visibility And Click Element  xpath=(//div[@id='nav-tab']/a)[${tab_number}]
    Sleep  1s


Search By Query
    [Arguments]  ${element}  ${query}
    Sleep  1s
    Wait Element Visibility And Input Text  ${element}  ${query}
    Wait Until Element Is Not Visible  css=.modal-body.tree.pm-tree
    Wait Until Keyword Succeeds  20s  500ms  Check Element Attribute  css=[data-status='ok']  data-id
    Wait Until Element Is Enabled  xpath=//div[@data-id='foundItem']//label[@for='found_${query}']  ${COMMONWAIT}
    Wait Visibility And Click Element  xpath=//div[@data-id='foundItem']//label[@for='found_${query}']


Check Element Attribute
    [Arguments]  ${element}  ${attribute_name}
    Sleep  500ms
    ${attribute}=  Get Element Attribute  ${element}@${attribute_name}


Set Date
    [Arguments]  ${element}  ${fild}  ${date}
    Execute Javascript  var s = angular.element('[ng-controller=ptr-editor]').scope(); s.model.ptr.${element}.${fild} = new Date(Date.parse("${date}")); s.$root.$apply();


Set Date In Item
    [Arguments]  ${index}  ${element}  ${param}  ${date}
    Execute Javascript  var s = angular.element('[ng-controller=ptr-editor]').scope(); s.model.ptr.items[${index}].${element}.${param} = new Date(Date.parse("${date}")); s.$root.$apply();

Set Date in datepicker
    [Arguments]  ${date}
    Execute Javascript  var s = angular.element('[ng-controller=ptr-editor]').scope(); s.model.ptr.tenderPeriod.startDate = new Date(Date.parse("${date}")); s.$root.$apply();


Set Time
    [Arguments]  ${element}  ${date}
    ${time}=  Get Regexp Matches  ${date}  T(\\d{2}:\\d{2})  1
    Input Text  ${element}  ${time[0]}


Close Confirmation In Editor
    [Arguments]  ${confirmation_text}
    Wait Until Element Is Visible  css=div.modal-body.info-div  ${COMMONWAIT}
    Wait Until Element Contains  css=div.modal-body.info-div  ${confirmation_text}  ${COMMONWAIT}
    Sleep  2s
    Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  1s
    Wait Until Element Is Not Visible  css=div.modal-body.info-div  ${COMMONWAIT}


Wait For Notification
    [Arguments]  ${message_text}
    Wait Until Element Is Enabled  xpath=//div[@data-id='alert-info']  timeout=${COMMONWAIT}
    Wait Until Element Contains  xpath=//div[@data-id='alert-info']  ${message_text}  timeout=10


Scroll Page To Element
    [Arguments]  ${locator}
    ${temp}=  Remove String  ${locator}  '
    ${cssLocator}=  Run Keyword If  'css' in '${temp}'  Get Substring  ${locator}  4
    ...  ELSE  Get Substring  ${locator}  6
    ${js_expresion}=  Run Keyword If  'css' in '${temp}'  Convert To String  return window.$("${cssLocator}")[0].scrollIntoView()
    ...  ELSE  Convert To String  return window.$x("${cssLocator}")[0].scrollIntoView()
    Sleep  2s


Set Enquiry Period
    [Arguments]  ${startDate}  ${endDate}
    Wait Until Element Is Visible  css=input[data-id='enquiryPeriodStart']  ${COMMONWAIT}
    Set Date  enquiryPeriod  startDate  ${startDate}
    Wait Until Element Is Visible  css=input[data-id='enquiryPeriodEnd']  ${COMMONWAIT}
    Set Date  enquiryPeriod  endDate  ${endDate}


Set Start Tender Period
    [Arguments]  ${date}
    Wait Until Element Is Visible  css=input[data-id='tenderPeriodStart']  ${COMMONWAIT}
    Set Date  tenderPeriod  startDate  ${date}


Set End Tender Period
    [Arguments]  ${date}
    Wait Until Element Is Visible  css=input[data-id='tenderPeriodEnd']  ${COMMONWAIT}
    Set Date  tenderPeriod  endDate  ${date}


Wait For Ajax
    Sleep  5s


Get Item Number
    [Arguments]  ${object_id}
    ${elements}=  Get Webelements  xpath=//section[contains(@class, 'lot-description')]//section/div/section[not (contains(@class, 'description'))]
    ${item_num}=  Set Variable  0
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  ${text}=  Get Text  xpath=(//div[@class='lot-info']/section//div[@class='description']//a)[${item}]
    \  ${item_num}=  Run Keyword If  '${object_id}' in '${text}'  Set Variable  ${item}
    \  ...  ELSE  Set Variable  ${item_num}
    [Return]  ${item_num}


Відповісти на вимогу про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}
    Wait Until Keyword Succeeds  15min  10s  Wait For Element With Reload  xpath=//div[contains(@class,'faq') and contains(.,'${complaintID}')]//button[@data-id='resolution-button']  3
    Wait Visibility And Click Element  xpath=//div[contains(@class,'faq') and contains(.,'${complaintID}')]//button
    Wait Visibility And Click Element  xpath=//select[@id='resolutionType']/option[@value='string:${answer_data.data.resolutionType}']
    Wait Element Visibility And Input Text  css=textarea[data-id='user-resolution']  ${answer_data.data.resolution}
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-send-complaint-resolution']
    Sleep  120s


Відповісти на вимогу про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}
    privatmarket.Відповісти на вимогу про виправлення умов закупівлі  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}


Завантажити документ рішення кваліфікаційної комісії
    [Arguments]  ${username}  ${document}  ${tender_uaid}  ${award_num}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    Wait Until Keyword Succeeds  10min  10s  Дочекатися можливості завантажити документ рішення кваліфікаційної комісії
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select form-block__select_short']//option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select ng-scope form-block__select_short']//option[3]
    Sleep  1s
    Execute Javascript  document.querySelector(".files-upload input[type='file']").class = ''
    Sleep  1s
    Choose File  css=.files-upload input[type='file']  ${document}
    Sleep  5s


Дочекатися можливості завантажити документ рішення кваліфікаційної комісії
    Reload Page
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Wait Visibility And Click Element  xpath=//div[@class='lot-info ng-scope' and contains(.,'Кваліфікація учасників') ]//table[@class='bids']//a[@class='ng-binding']


Відповісти на вимогу про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}  ${award_index}
    privatmarket.Відповісти на вимогу про виправлення умов закупівлі  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}


Підтвердити постачальника
    [Arguments]  ${username}  ${tender_uaid}  ${award_num}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Wait Visibility And Click Element  xpath=//div[@class='award-section award-actions ng-scope']//button[@data-id='setActive']
    Sleep  180s


Звiрити value of title на сторінці редагуванння
    [Arguments]  ${username}
    ${title_value}=  Get Value  css=input[data-id='procurementName']
    Should be equal as strings  ${title_value}  ${USERS.users['${user_name}'].initial_data.data.title}


Створити вимогу про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${document}=${None}
    Switch To Tab  3
    Wait Visibility And Click Element  css=#btnSendClaim
    Wait Element Visibility And Input Text  css=#titleComplaint  ${claim.data.title}
    Wait Element Visibility And Input Text  css=#descriptionComplaint  ${claim.data.description}
    Run Keyword And Ignore Error  Choose File  css=input[id='fileToUpload']  ${document}
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@id='addressCountry']//option[@value='UA']
    Wait Element Visibility And Input Text  css=#addressPostalCode  ${claim.data.author.address.postalCode}
    Wait Element Visibility And Input Text  css=#addressRegion  ${claim.data.author.address.countryName}
    Wait Element Visibility And Input Text  css=#addressLocality  ${claim.data.author.address.locality}
    Wait Element Visibility And Input Text  css=#addressStreet  ${claim.data.author.address.streetAddress}
    @{contactPoint} =  Split String  ${claim.data.author.contactPoint.name}
    Wait Element Visibility And Input Text  css=#personSurname  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personName  @{contactPoint}[1]
    Wait Element Visibility And Input Text  css=#personPatronymic  @{contactPoint}[2]
    ${telephone}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=#personPhone  ${telephone}
    ${faxNumber}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.faxNumber}
    Wait Element Visibility And Input Text  css=#personFax  ${faxNumber}
    Wait Element Visibility And Input Text  css=#personEmail  ${claim.data.author.contactPoint.email}
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-send-complaint"]
    Sleep  10s
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-close"]
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити чернетку вимоги про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${claim}
    Switch To Tab  3
    Wait Visibility And Click Element  css=#btnSendClaim
    Wait Element Visibility And Input Text  css=#titleComplaint  ${claim.data.title}
    Wait Element Visibility And Input Text  css=#descriptionComplaint  ${claim.data.description}
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@id='addressCountry']//option[@value='UA']
    Wait Element Visibility And Input Text  css=#addressPostalCode  ${claim.data.author.address.postalCode}
    Wait Element Visibility And Input Text  css=#addressRegion  ${claim.data.author.address.countryName}
    Wait Element Visibility And Input Text  css=#addressLocality  ${claim.data.author.address.locality}
    Wait Element Visibility And Input Text  css=#addressStreet  ${claim.data.author.address.streetAddress}
    @{contactPoint} =  Split String  ${claim.data.author.contactPoint.name}
    Wait Element Visibility And Input Text  css=#personSurname  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personName  @{contactPoint}[1]
    Wait Element Visibility And Input Text  css=#personPatronymic  @{contactPoint}[2]
    ${telephone}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=#personPhone  ${telephone}
    ${faxNumber}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.faxNumber}
    Wait Element Visibility And Input Text  css=#personFax  ${faxNumber}
    Wait Element Visibility And Input Text  css=#personEmail  ${claim.data.author.contactPoint.email}
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-send-complaint"]
    Sleep  10s
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-close"]
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити вимогу про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${lot_id}  ${document}=${None}
    Switch To Tab  1
    Відкрити детальну інформацію по лотам
    Wait Visibility And Click Element  css=a[tooltip='Подати вимогу на даний лот']
    Wait Element Visibility And Input Text  css=#titleComplaint  ${claim.data.title}
    Wait Element Visibility And Input Text  css=#descriptionComplaint  ${claim.data.description}
    Run Keyword And Ignore Error  Choose File  css=input[id='fileToUpload']  ${document}
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@id='addressCountry']//option[@value='UA']
    Wait Element Visibility And Input Text  css=#addressPostalCode  ${claim.data.author.address.postalCode}
    Wait Element Visibility And Input Text  css=#addressRegion  ${claim.data.author.address.countryName}
    Wait Element Visibility And Input Text  css=#addressLocality  ${claim.data.author.address.locality}
    Wait Element Visibility And Input Text  css=#addressStreet  ${claim.data.author.address.streetAddress}
    @{contactPoint} =  Split String  ${claim.data.author.contactPoint.name}
    Wait Element Visibility And Input Text  css=#personSurname  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personName  @{contactPoint}[1]
    Wait Element Visibility And Input Text  css=#personPatronymic  @{contactPoint}[2]
    ${telephone}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=#personPhone  ${telephone}
    ${faxNumber}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.faxNumber}
    Wait Element Visibility And Input Text  css=#personFax  ${faxNumber}
    Wait Element Visibility And Input Text  css=#personEmail  ${claim.data.author.contactPoint.email}
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-send-complaint']
    Sleep  10s
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-close']
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити чернетку вимоги про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${lot_id}
    Switch To Tab  1
    Відкрити детальну інформацію по лотам
    Wait Visibility And Click Element  css=a[tooltip='Подати вимогу на даний лот']
    Wait Element Visibility And Input Text  css=#titleComplaint  ${claim.data.title}
    Wait Element Visibility And Input Text  css=#descriptionComplaint  ${claim.data.description}
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@id='addressCountry']//option[@value='UA']
    Wait Element Visibility And Input Text  css=#addressPostalCode  ${claim.data.author.address.postalCode}
    Wait Element Visibility And Input Text  css=#addressRegion  ${claim.data.author.address.countryName}
    Wait Element Visibility And Input Text  css=#addressLocality  ${claim.data.author.address.locality}
    Wait Element Visibility And Input Text  css=#addressStreet  ${claim.data.author.address.streetAddress}
    @{contactPoint} =  Split String  ${claim.data.author.contactPoint.name}
    Wait Element Visibility And Input Text  css=#personSurname  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personName  @{contactPoint}[1]
    Wait Element Visibility And Input Text  css=#personPatronymic  @{contactPoint}[2]
    ${telephone}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=#personPhone  ${telephone}
    ${faxNumber}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.faxNumber}
    Wait Element Visibility And Input Text  css=#personFax  ${faxNumber}
    Wait Element Visibility And Input Text  css=#personEmail  ${claim.data.author.contactPoint.email}
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-send-complaint']
    Sleep  10s
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-close']
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити вимогу про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${award_index}  ${document}=${None}
    Wait until keyword succeeds  5min  10s  Звірити статус  ${username}  ${tender_uaid}
    Reload And Switch To Tab  1
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Sleep  1
    Wait Visibility And Click Element  css=a[ng-click="act.showChooseCmplWnd(b.id, 'award', lot.id)"]
    Sleep  1
    Wait Visibility And Click Element  css=button[data-id='btn-send-claim']
    Sleep  1
    Wait Element Visibility And Input Text  css=#titleComplaint  ${claim.data.title}
    Wait Element Visibility And Input Text  css=#descriptionComplaint  ${claim.data.description}
    Run Keyword And Ignore Error  Choose File  css=input[id='fileToUpload']  ${document}
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@id='addressCountry']//option[@value='UA']
    Wait Element Visibility And Input Text  css=#addressPostalCode  ${claim.data.author.address.postalCode}
    Wait Element Visibility And Input Text  css=#addressRegion  ${claim.data.author.address.countryName}
    Wait Element Visibility And Input Text  css=#addressLocality  ${claim.data.author.address.locality}
    Wait Element Visibility And Input Text  css=#addressStreet  ${claim.data.author.address.streetAddress}
    @{contactPoint} =  Split String  ${claim.data.author.contactPoint.name}
    Wait Element Visibility And Input Text  css=#personSurname  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personName  @{contactPoint}[1]
    Wait Element Visibility And Input Text  css=#personPatronymic  @{contactPoint}[2]
    ${telephone}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=#personPhone  ${telephone}
    ${faxNumber}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.faxNumber}
    Wait Element Visibility And Input Text  css=#personFax  ${faxNumber}
    Wait Element Visibility And Input Text  css=#personEmail  ${claim.data.author.contactPoint.email}
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-send-complaint"]
    Sleep  10s
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-close"]
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити чернетку вимоги про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${award_index}
    Wait until keyword succeeds  5min  10s  Звірити статус  ${username}  ${tender_uaid}
    Reload And Switch To Tab  1
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Sleep  1
    Wait Visibility And Click Element  css=a[ng-click="act.showChooseCmplWnd(b.id, 'award', lot.id)"]
    Sleep  1
    Wait Visibility And Click Element  css=button[data-id='btn-send-claim']
    Sleep  1
    Wait Element Visibility And Input Text  css=#titleComplaint  ${claim.data.title}
    Wait Element Visibility And Input Text  css=#descriptionComplaint  ${claim.data.description}
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@id='addressCountry']//option[@value='UA']
    Wait Element Visibility And Input Text  css=#addressPostalCode  ${claim.data.author.address.postalCode}
    Wait Element Visibility And Input Text  css=#addressRegion  ${claim.data.author.address.countryName}
    Wait Element Visibility And Input Text  css=#addressLocality  ${claim.data.author.address.locality}
    Wait Element Visibility And Input Text  css=#addressStreet  ${claim.data.author.address.streetAddress}
    @{contactPoint} =  Split String  ${claim.data.author.contactPoint.name}
    Wait Element Visibility And Input Text  css=#personSurname  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personName  @{contactPoint}[1]
    Wait Element Visibility And Input Text  css=#personPatronymic  @{contactPoint}[2]
    ${telephone}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=#personPhone  ${telephone}
    ${faxNumber}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.faxNumber}
    Wait Element Visibility And Input Text  css=#personFax  ${faxNumber}
    Wait Element Visibility And Input Text  css=#personEmail  ${claim.data.author.contactPoint.email}
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-send-complaint"]
    Sleep  10s
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-close"]
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Скасувати вимогу про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}  ${award_index}
    Reload And Switch To Tab  3
    Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//a[@data-id='cancel-claim-action']
    Sleep  1s
    Wait Element Visibility And Input Text  css=#reasonCancelComplaint  ${cancellation_data.data.cancellationReason}
    Wait Visibility And Click Element  css=button[data-id='btn-cancel-complaint']


Скасувати вимогу про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}
    Reload And Switch To Tab  3
    Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//a[@data-id='cancel-claim-action']
    Sleep  1s
    Wait Element Visibility And Input Text  css=#reasonCancelComplaint  ${cancellation_data.data.cancellationReason}
    Wait Visibility And Click Element  css=button[data-id='btn-cancel-complaint']


Скасувати вимогу про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}
    Reload And Switch To Tab  3
    Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//a[@data-id='cancel-claim-action']
    Sleep  1s
    Wait Element Visibility And Input Text  css=#reasonCancelComplaint  ${cancellation_data.data.cancellationReason}
    Wait Visibility And Click Element  css=button[data-id='btn-cancel-complaint']


Підтвердити вирішення вимоги про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}
    Reload And Switch To Tab  3
    ${confirmation}=  Set Variable  ${confirmation_data.data.satisfied}
    Run Keyword If  '${confirmation}' == 'True'  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-satisfied']
    ...  ELSE  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-not-satisfied']
    Sleep  1s
    Wait Visibility And Click Element  css=button[data-id='btn-ok']
    Sleep  180s


Підтвердити вирішення вимоги про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}
    Reload And Switch To Tab  3
    ${confirmation}=  Set Variable  ${confirmation_data.data.satisfied}
    Run Keyword If  '${confirmation}' == 'True'  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-satisfied']
    ...  ELSE  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-not-satisfied']
    Sleep  1s
    Wait Visibility And Click Element  css=button[data-id='btn-ok']
    Sleep  180s


Підтвердити вирішення вимоги про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}  ${award_index}
    Reload And Switch To Tab  3
    ${confirmation}=  Set Variable  ${confirmation_data.data.satisfied}
    Run Keyword If  '${confirmation}' == 'True'  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-satisfied']
    ...  ELSE  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-not-satisfied']
    Sleep  1s
    Wait Visibility And Click Element  css=button[data-id='btn-ok']
    Sleep  180s


Привести номер телефону до відповідного формату
    [Arguments]  ${phone}
    ${modified_phone}=  Remove String  ${phone}  ${SPACE}
    ${modified_phone}=  Remove String  ${modified_phone}  -
    ${modified_phone}=  Remove String  ${modified_phone}  (
    ${modified_phone}=  Remove String  ${modified_phone}  )
    ${modified_phone}=  Set Variable If  '+38' in '${modified_phone}'  ${modified_phone}  +38067${modified_phone}
    ${modified_phone}=  Get Substring  ${modified_phone}  0  13
    [Return]  ${modified_phone}


Задати запитання на лот
    [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${question}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-faq')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-faq')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-faq')]
    Wait Visibility And Click Element  css=button[data-id='lot-question']
    Заповнити форму запитання  ${question}


Заповнити форму запитання
    [Arguments]  ${question}
    Wait Element Visibility And Input Text  css=#questionTitle  ${question.data.title}
    Wait Element Visibility And Input Text  css=#questionDescription  ${question.data.description}
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@id='addressCountry']//option[@value='UA']
    Wait Element Visibility And Input Text  css=#addressPostalCode  ${question.data.author.address.postalCode}
    Wait Element Visibility And Input Text  css=#addressRegion  ${question.data.author.address.countryName}
    Wait Element Visibility And Input Text  css=#addressLocality  ${question.data.author.address.locality}
    Wait Element Visibility And Input Text  css=#addressStreet  ${question.data.author.address.streetAddress}
    @{contactPoint} =  Split String  ${question.data.author.contactPoint.name}
    Wait Element Visibility And Input Text  css=#personSurname  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personName  @{contactPoint}[1]
    Wait Element Visibility And Input Text  css=#personPatronymic  @{contactPoint}[2]
    Wait Element Visibility And Input Text  css=#personPhone  ${question.data.author.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=#personFax  ${question.data.author.contactPoint.faxNumber}
    Wait Element Visibility And Input Text  css=#personEmail  ${question.data.author.contactPoint.email}
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-send-question"]
    Sleep  5s
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-close"]
    Sleep  90s


Подати цінову пропозицію
    [Arguments]  ${username}  ${tender_uaid}  ${bid}  ${lots_ids}=${None}  ${features_ids}=${None}
    Wait For Element With Reload  xpath=//button[@data-id='createBidBtn']  1
    Click Element  xpath=//button[@data-id='createBidBtn']
    ${value_amount}=  privatmarket_service.convert_float_to_string  ${bid.data.lotValues[0].value.amount}

    Sleep  2s
    Run Keyword Unless  'Неможливість' in '${TEST_NAME}'  Wait Element Visibility And Input Text  css=input[data-id='lot-user-price']  ${value_amount}
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Wait Until Element Is Visible  css=select[data-id='filetype']
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax

    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    Run Keyword Unless  'single_item' in '${scenarios_name}' or 'below' in '${scenarios_name}'  Wait Visibility And Click Element  css=label[data-id='toggle-qualified']
    Run Keyword Unless  'single_item' in '${scenarios_name}' or 'below' in '${scenarios_name}'  Wait Visibility And Click Element  css=label[data-id='toggle-eligible']

    Wait Element Visibility And Input Text  css=input[data-id='postalCode']  ${bid.data.tenderers[0].address.postalCode}
    Wait Element Visibility And Input Text  css=input[data-id='countryName']  ${bid.data.tenderers[0].address.countryName}
    Wait Element Visibility And Input Text  css=input[data-id='region']  ${bid.data.tenderers[0].address.region}
    Wait Element Visibility And Input Text  css=input[data-id='locality']  ${bid.data.tenderers[0].address.locality}
    Wait Element Visibility And Input Text  css=input[data-id='streetAddress']  ${bid.data.tenderers[0].address.streetAddress}
    ${modified_phone}=  Привести номер телефону до відповідного формату  ${bid.data.tenderers[0].contactPoint.telephone}
    Wait Element Visibility And Input Text  css=input[data-id='fullNameUa']  ${bid.data.tenderers[0].contactPoint.name}
    Wait Element Visibility And Input Text  css=input[data-id='phone']  ${modified_phone}
    Wait Element Visibility And Input Text  css=input[data-id='email']  ${bid.data.tenderers[0].contactPoint.email}
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Sleep  1s
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  60s


Отримати інформацію із пропозиції
    [Arguments]  ${username}  ${tender_uaid}  ${field}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]

    Run Keyword And Return If  '${field}' == 'lotValues[0].value.amount'  Отримати інформацію з пропозиції ${field}
    Run Keyword And Return If  '${field}' == 'value.amount'  Отримати інформацію з пропозиції ${field}
    Run Keyword And Return If  '${field}' == 'status'  Отримати інформацію з пропозиції ${field}
    [Return]  ${result}


Отримати інформацію з пропозиції lotValues[0].value.amount
    ${value}=  Отримати текст елемента  xpath=//tr[contains(@ng-repeat, 'currBids[lot.id] ')]//td[2]
    ${text_new}=  Strip String  ${value}
    ${text_new}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Отримати інформацію з пропозиції value.amount
    ${value}=  Отримати текст елемента  xpath=//tr[contains(@ng-repeat, 'currBids[lot.id] ')]//td[3]
    ${text_new}=  Strip String  ${value}
    ${text_new}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Отримати інформацію з пропозиції status
    ${value}=  Отримати текст елемента  xpath=//tr[contains(@ng-repeat, 'currBids[lot.id] ')]//td[4]
    ${value}=  Set Variable If  '${value}' == 'Недійсна'  invalid  ${value}
    [Return]  ${value}


Завантажити документ в ставку
    [Arguments]  ${username}  ${filePath}  ${tenderId}  ${doc_type}=documents
    privatmarket.Пошук тендера по ідентифікатору  ${username}  ${tenderId}
    Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Sleep  2s
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//file-uploader[@data-id='common-documents']//select[@data-id='filetype']//option[2]
    Sleep  1s
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//file-uploader[@data-id='common-documents']//select[@data-id='filelang']//option[@value='string:en']
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector("file-uploader[data-id='common-documents'] input[data-id='input-file']").style = ''
    Sleep  1s
    Run Keyword And Ignore Error  Choose File  css=file-uploader[data-id='common-documents'] input[data-id='input-file']  ${filePath}
    Sleep  5s
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Click Button  css=button[data-id='save-bid-btn']
    Sleep  10s
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Sleep  1s
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  90s


Змінити документ в ставці
    [Arguments]  ${username}  ${tender_uaid}  ${path}  ${doc_id}  ${doc_type}=documents
    Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Sleep  2s
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Run Keyword And Ignore Error  Execute Javascript  var s = angular.element($('[data-id=common-documents]').get(0)).scope(); s.$ctrl.changedDoc=s.$ctrl.docs[0];
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector("file-uploader[data-id='common-documents'] input[data-id='input-file']").style = ''
    Sleep  1s
    Run Keyword And Ignore Error  Choose File  css=file-uploader[data-id='common-documents'] input[data-id='input-single-file']  ${filePath}
    Sleep  5s
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Sleep  1s
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  60s


Змінити документацію в ставці
    [Arguments]  ${username}  ${tender_uaid}  ${doc_data}  ${doc_id}
    Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Sleep  2s
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Sleep  1s


Змінити цінову пропозицію
    [Arguments]  ${username}  ${tender_uaid}  ${field}  ${value}
    Run Keyword If  '${field}' == 'status'  Wait Visibility And Click Element  xpath=//button[@data-id="createBidBtn"]
    ...  ELSE  Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Sleep  2s
    ${value}=  privatmarket_service.convert_float_to_string  ${value}
    Run Keyword If  'value.amount' in '${field}'  Wait Element Visibility And Input Text  css=input[data-id='lot-user-price']  ${value}
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Wait Until Element Is Visible  css=select[data-id='filetype']
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Sleep  1s
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  60s


Скасувати цінову пропозицію
    [Arguments]  ${username}  ${tender_uaid}
    Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Sleep  2s
    Wait Visibility And Click Element  css=button[data-id='delete-bid-btn']


Отримати посилання на аукціон для учасника
    [Arguments]  ${username}  ${tender_uaid}
    Wait For Element With Reload  xpath=//a[contains(@href, 'https://auction-sandbox.openprocurement.org/tenders/')]  1  30
    ${result}=  Get Element Attribute  xpath=//a[contains(@href, 'https://auction-sandbox.openprocurement.org/tenders/')]@href
    [Return]  ${result}


Задати запитання на тендер
    [Arguments]  ${username}  ${tender_uaid}  ${question}
    Switch To Tab  2
    Wait Visibility And Click Element  css=button[data-id='ask-ptr']
    Заповнити форму запитання  ${question}


Задати запитання на предмет
    [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${question}
    privatmarket.Задати запитання на лот  ${username}  ${tender_uaid}  ${lot_id}=${item_id}  ${question}


Перевести тендер на статус очікування обробки мостом
    [Arguments]  ${username}  ${tender_uaid}
#    debug

активувати другий етап
    [Arguments]  ${username}  ${tender_uaid}
#    debug
