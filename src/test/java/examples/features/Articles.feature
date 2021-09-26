# Test articles
Feature: Test articles
   Background: Define URL
     Given url 'http://localhost:3000/api/'

     Given path 'users/login'
     And request {  "user": {  "email": "karatelove@test.com",  "password": "karate1'3"  }}
     When method Post
     Then status 200
     And print response
     * def token = response.user.token
     And print token

     #Login and grab token received to  post an articles
  Scenario:  login and create a new article

    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request { "article": {  "tagList": [],  "title": "Love Karate",  "description": "Testing this api",  "body": "Love Karate" }}
    When method Post
    Then status 200
    And print response
    And match response.article.title == 'Love Karate'

  @debug
  Scenario:  create and delete an article
    #Create an article
    Given header Authorization = 'Token ' + token
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
    Given header Authorization = 'Token ' + token
    Given path 'articles',articleId
    When method Delete
    Then status 204

    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles !contains 'To be deleted'
