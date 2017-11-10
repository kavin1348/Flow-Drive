Feature: Acceptance tests for FlowDrive

  Scenario: Should be able to agree to terms and conditions
	Given I wait for the "I Agree" button to appear
	When I press the "I Agree" button
	Then I should see "Please log in"

  Scenario: Should be able to login to flow drive
	Given I wait to see "Please log in"
	When I enter text "kavin1348@gmail.com" into field with id "edit_text_email"
	And I enter text "kavin123" into field with id "edit_text_password"
	And I press the "Log in" button
	Then I wait for "Welcome to FlowDrive" to appear

  Scenario: Should be able to navigate between tabs
	Given I press "journeys" tab
	Then I wait for 2 seconds
	Then I should see the "journeys" page
	Then I press "score" tab
	Then I wait for 2 seconds
	And I should see the "score" page
	Then I press "social" tab
	Then I wait for 2 seconds
	And I should see the "social" page
	Then I press "help" tab
	Then I wait for 2 seconds
	And I should see the "help" page
	
  Scenario: Should be able to start and stop journeys
	Given I press "start" journey button
	Then I wait for 30 seconds
#   Then I am at 53.3871073, -1.4637310000000525
#	Comment: Previous step cannot be run without Mock location permission, which is not supported in Bitbar      
	And I take a screenshot
	Then I wait for 3 seconds
# 	Then I am at 53.38112899999999, -1.47008500000004  
#   Comment: Previous step cannot be run without Mock location permission, which is not supported in Bitbar 
	Then I press "stop" journey button
	Then I wait for 3 seconds
	And I take a screenshot

  Scenario: Should be able to access Emergency help options
	Given I press "Emergency" button
	When I press "Breakdown" button
	Then I should see "CALL_NOW" button
	Then I go back
	Then I press "Emergency" button
	Then I press "Accident" button
	Then I should see "CALL_NOW" button
 
  Scenario: Should be able to see journey details from saved journey
	Given I press "Journeys"
	When I press view with id "image_view_journey_type"
#   Comment: Above step selects a specific saved journey from the list of available journeys
	Then I wait for 3 seconds
	And I take a screenshot
	Then I should see "text_view_start_time" as "06:10"
	And I should see "text_view_end_time" as "06:15"
	And I should see "text_view_duration" as "4m"
	And I should see "text_view_distance" as "0.9"

  Scenario: Should be able to modify journey details
	Given I press "Journeys"
	When I press view with id "image_view_journey_type"
	And I press "tag_journey" button
	And I press "bus" button
	And I press the "OK" button
	And I press "SAVE" button
	Then the journey should be saved
# 	Comment: Following steps will revert the settings back for subsequent test runs
	And I press "tag_journey" button
	And I press "train" button
	And I press the "OK" button
	And I press "SAVE" button

  Scenario: Should be able to show map view
	Given I press "Journeys"
	When I press view with id "image_view_journey_type"
#   Comment: Above step selects a specific saved journey from the list of available journeys
	And I press "view_map" button
	Then I should see "Street" view selected
	And I select "satellite" view
	Then I should see "satellite" view selected

  Scenario: Should be able to see overall score
	Given I press "Score"
	Then I should see the score as "71"
	Then I select "Monthly" view
	Then I should see "monthly" view selected

  Scenario: Should be able to see individual score details
	Given I press "Score"
	When I press "btn_component_score" button
#   Comment: Above step clicks the button to open score details
	Then I should see "Time on Task" as "97" on the page
	Then I should see "Time of the day" as "65" on the page
	Then I should see "Speed" as "93" on the page
	Then I should see "smooth drive" as "57" on the page
	Then I should see "mobile usage" as "72" on the page
	
  Scenario: Should be able edit my social profile
	Given I press "Social"
	When I press "my_profile" button
	And I press "edit" button
	And I enter text "Kavin R" into field with id "my_profile_name_edit"
	And I press "save" button
	Then the name should be updated as "Kavin R"
	
  Scenario: Should be able to change preferences
	Given I press "Help"
	When I tap "preferences"
	And I change suspend journey when battery drops to 25 percent
	And I go back
	And I tap "preferences"
	Then suspend journey when battery drops should be set to 25 percent

  Scenario: Should be able to search for help about specific topics
	Given I press "Help"
	And I tap "FAQs"
	When I tap the search box
	And I enter text "speed" into field with id "edit_text_faq_search"
	Then I should see text containing "What is the Speed Score?"
	
  Scenario: Should be able to check app version in about page
	Given I press "Help"
	When I tap "About"
	Then I should see "1.7.8.13"
  
  
  
  
  
    
