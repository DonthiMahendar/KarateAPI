Feature: Testing Sample API

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * def user =
      """
      {
      "firstname" : "Jim",
      "lastname" : "Brown",
      "totalprice" : 111,
      "depositpaid" : true,
      "bookingdates" : {
        "checkin" : "2018-01-01",
        "checkout" : "2019-01-01"
      },
      "additionalneeds" : "Breakfast"
      }
      """
    * def PutUser =
      """
      {
        "firstname" : "James",
        "lastname" : "Brown",
        "totalprice" : 111,
        "depositpaid" : true,
        "bookingdates" : {
          "checkin" : "2018-01-01",
          "checkout" : "2019-01-01"
        },
        "additionalneeds" : "Breakfast"
      }
      """

    * def PatchUser =
      """
      {
        "firstname" : "James",
        "lastname" : "Brown"
      }
      """

  Scenario: Get a list of users
    Given path '/booking'
    When method GET
    Then status 200
    And match response == '#notnull'

  Scenario: Get a specific user by ID
    Given path '/booking'
    And headers {Accept: 'application/json', Content-Type : 'application/json'}
    And request user
    When method POST
    Then status 200
    And print response

  Scenario: Get a specific user by ID PUT
    Given path '/booking/1'
    And headers {Accept: 'application/json', Content-Type : 'application/json', Authorization: 'Basic YWRtaW46cGFzc3dvcmQxMjM=', Cookie:'token=abc123'}
    And request PutUser
    When method PUT
    Then status 200
    And print response

  Scenario: Get a specific user by ID PUT
    Given path '/booking/1'
    And headers {Accept: 'application/json', Content-Type : 'application/json', Authorization: 'Basic YWRtaW46cGFzc3dvcmQxMjM=', Cookie:'token=abc123'}
    And request PatchUser
    When method PATCH
    Then status 200
    And print response

  Scenario: Get a specific user by ID PUT
    Given path '/booking/2612'
    And headers {Accept: 'application/json', Content-Type : 'application/json', Authorization: 'Basic YWRtaW46cGFzc3dvcmQxMjM=', Cookie:'token=abc123'}
    When method DELETE
    Then status 201
    And print response

