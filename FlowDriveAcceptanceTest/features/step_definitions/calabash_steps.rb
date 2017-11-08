require 'calabash-android/calabash_steps'

Given /^I press "([^\"]*)" journey button$/ do |text|
  tap_when_element_exists("android.widget.ImageButton {id CONTAINS[c] '#{text}'}")
end

Given /^I press "([^\"]*)" button$/ do |text|
  tap_when_element_exists("android.widget.ImageButton {id CONTAINS[c] '#{text}'}")
end

Then /^I press "([^\"]*)" tab$/ do |text|
	tap_when_element_exists("* id:'tab_#{text}'")
end

When /^I tap "([^\"]*)"$/ do |text|
  tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
end

Then /^I tap the search box$/ do
  tap_when_element_exists("* id:'edit_text_faq_search'")
end

Then /^I select "([^\"]*)" view$/ do |text|
  tap_when_element_exists("android.widget.RadioButton {id CONTAINS[c] '#{text}'}")
end

When /^I change suspend journey when battery drops to 25 percent$/ do
  tap_when_element_exists("android.widget.RadioButton {id CONTAINS[c] 'index_2'}")
end

Then /^I should see the "([^\"]*)" page$/ do |text|
	wait_for_element_exists("* id:'tab_#{text}' selected:'true';")
end

Then /^I should see "([^\"]*)" button$/ do |text|
	wait_for_element_exists("android.widget.ImageButton {id CONTAINS[c] '#{text}'}")
end

Then /^I should see "([^\"]*)" as "([^\"]*)"$/ do |id , text|
  wait_for_element_exists("* id:'#{id}' *text CONTAINS[c] '#{text}'")
end

Then /^I should see "([^\"]*)" view selected$/ do |text|
   wait_for_element_exists("android.widget.RadioButton {id CONTAINS[c] '#{text}'} checked:'true';")
end

Then /^I should see the score as "([^\"]*)"$/ do |text|
  wait_for_text(text, timeout: 10)
end

Then /^I should see "([^\"]*)" as "([^\"]*)" on the page$/ do |text1 , text2|
  wait_for_text(text1, timeout: 10)
  wait_for_text(text2, timeout: 10)
end

Then /^the journey should be saved$/ do
  wait_for_element_exists("* id:'image_view_journey_type'")
end

Then /^suspend journey when battery drops should be set to 25 percent$/ do
  wait_for_element_exists("android.widget.RadioButton {id CONTAINS[c] 'index_2'} checked:'true';")
end

Then /^the name should be updated as "([^\"]*)"$/ do |text|
  wait_for_text(text, timeout: 10)
end

