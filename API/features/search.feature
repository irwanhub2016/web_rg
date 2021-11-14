@search
Feature: Search

  @smoke-test @continue
  Scenario Outline: user able to create account
    Then user able to get search data by '<param>' and '<value>'
    Examples:
    | param       | value     |
    | page        | 1         |
    | pageSize    | 20        |
    | searchQuery | java      |
    | sortBy      | price     |
    | orderBy     | desc      |
    | minPrice    | 0         |
    | maxPrice    | 1000000   |
    | minDuration | 0         |
    | maxDuration | 999999999 |