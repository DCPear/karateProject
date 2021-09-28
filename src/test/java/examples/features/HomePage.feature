# Test Home page
Feature: Test Home page
   Background: Define URL
     Given url apiUrl

     #verify response is an array and each array element is a string. And verify some values
  @second
  Scenario:  Get all Tags
    Given path 'tags'
    When method Get
    Then status 200
    And print response
    And match response.tags contains ['karate', 'Covid']
    And match response.tags contains any ['karate', 'tea' , 'Coffee']
    And match response.tags !contains 'truck'
    And match response.tags == "#array"
    And match each response.tags == "#string"

  # http://localhost:3000/api//articles?limit=10&offset=0
  # verify size of the array is 10
  # @ignore
  Scenario: Get 10 articles from the page
    * def timeValidator = read('classpath:helpers/timeValidator.js')

    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articlesCount !=5
    * match response.articlesCount == 13
    * match response == {"articles": "#array", "articlesCount":13}
    * match response.articles[0].createdAt contains '2021'
    * match response.articles[*].favoritesCount contains 1
    * match response.articles[*].author.bio contains null
    * match response..bio contains null
    * match each response..following == false
    * match each response..following == '#boolean'
    * match each response..favoritesCount == '#number'
    # acceptable value null or string
    * match each response..bio == '##string'
    #fuzzy matching schema
    * match each response.articles ==
    """
      {
            "title": "#string",
                "slug": "#string",
                "body": "#string",
                "createdAt": "#? timeValidator(_)",
                "updatedAt": "#? timeValidator(_)",
                "tagList": "#array",
                "description": "#string",
                "author": {
                    "username": "#string",
                    "bio": "##string",
                    "image": "#string",
                    "following": '#boolean'
                },
                "favorited": '#boolean',
                "favoritesCount": '#number'
            }
      }
    """




