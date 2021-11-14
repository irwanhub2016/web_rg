@search
Feature: Search

  Background: Acces home page
    Given user access to home page

  @continue
  Scenario: User try to search a course with exist data
    When user able to search a course about 'java'
    Then user verify the course should be successfully searched

  @continue
  Scenario: User try to search a course with data not found
    When user able to search a course about 'ngopi'
    Then user verify the data course is not found