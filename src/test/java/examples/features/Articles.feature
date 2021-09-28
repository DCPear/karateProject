# Test articles

Feature: Test articles

  Background: Define URL
    Given url apiUrl

     #Login and grab token received to  post an articles
  Scenario:  login and create a new article

    Given path 'articles'
    And request
    """
     {
        "article": {
            "tagList": [],
            "title": "Love Karate",
            "description": "Testing this api",
            "body": "Love Karate"
            }
     }
    """
    When method Post
    Then status 200
    And print response
    And match response.article.title == 'Love Karate'

  @debug
  Scenario:  create and delete an article
    #Create an article
    Given path 'articles'
    And request { "article": {  "tagList": [],  "title": "To be deleted",  "description": "Testing this api",  "body": "Love Karate" }}
    When method Post
    Then status 200
    * def articleId = response.article.slug
    And print articleId

    #Confirm the article is created
    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title =='To be deleted'

    #use the authorization for delete
    Given path 'articles',articleId
    When method Delete
    Then status 204

    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles !contains 'To be deleted'
