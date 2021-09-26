# Test Home page
Feature: Test Home page
   Background: Define URL
     Given url 'http://localhost:3000/api/'

     #verify response is an array and each array element is a string. And verify some values
  @second
  Scenario:  Get all Tags
    Given path 'tags'
    When method Get
    Then status 200
    And print response
    And match response.tags contains ['karate', 'Covid']
    And match response.tags !contains 'truck'
    And match response.tags == "#array"
    And match each response.tags == "#string"

  # https://conduit.productionready.io/api/articles?limit=10&offset=0
  # verify size of the array is 10
  @ignore
  Scenario: Get 10 articles from the page
    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articlesCount ==5