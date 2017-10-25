require 'spec_helper'

describe 'qaform' do

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @url = 'http://toolsqa.com/automation-practice-form/'
  end

# R - G DONE
  it 'should open the qaform page' do
    @driver.get(@url)
    expect(@driver.current_url).to eq @url
    @driver.find_element(:name, 'firstname').displayed?
  end

# Checking that the text field with the name 'first name' is on the page somewhere
  it 'should have a text field for "first name"' do
    expect @driver.find_element(:name, 'firstname').displayed?
  end

# Send keys to the text field for 'firstname' and then check it returns the same value
  it 'will contain the value of the text added in "first name"' do
    @driver.find_element(:name, 'firstname').send_keys('Mash')
    expect(@driver.find_element(:name, 'firstname')['value']).to eq "Mash"
  end

# Same as above, check the text entered for 'lastname' matches what it outputs
  it 'Finds and returns the entered last name' do
    @driver.find_element(:name, 'lastname').send_keys('Ash')
    expect(@driver.find_element(:name, 'lastname')['value']).to eq "Ash"
  end

# Check the button is seleted by first clicking it, then checking it is 'selected'
  it 'validates the male click' do
    @driver.find_element(:id, 'sex-0').click
    expect(@driver.find_element(:id, 'sex-0').selected?).to be_equal(true)
  end

# Check the button is seleted by first clicking it, then checking it is 'selected'
  it 'validates the female click' do
    @driver.find_element(:id, 'sex-1').click
    expect(@driver.find_element(:id, 'sex-1').selected?).to be_equal(true)
  end

# Same as the above buttons
  it 'Will select the correct year experience' do
    @driver.find_element(:id, 'exp-0').click
    expect(@driver.find_element(:id, 'exp-0').selected?).to be_equal(true)

    @driver.find_element(:id, 'exp-1').click
    expect(@driver.find_element(:id, 'exp-1').selected?).to be_equal(true)

    @driver.find_element(:id, 'exp-2').click
    expect(@driver.find_element(:id, 'exp-2').selected?).to be_equal(true)

    @driver.find_element(:id, 'exp-3').click
    expect(@driver.find_element(:id, 'exp-3').selected?).to be_equal(true)

    @driver.find_element(:id, 'exp-4').click
    expect(@driver.find_element(:id, 'exp-4').selected?).to be_equal(true)

    @driver.find_element(:id, 'exp-5').click
    expect(@driver.find_element(:id, 'exp-5').selected?).to be_equal(true)

    @driver.find_element(:id, 'exp-6').click
    expect(@driver.find_element(:id, 'exp-6').selected?).to be_equal(true)
  end

# Send keys to the date input box, and match what it actually contains with what was sent
  it 'will contain the value of the date added in "date" ' do
    @driver.find_element(:id, 'datepicker').send_keys('241017')
    expect(@driver.find_element(:id, 'datepicker')['value']).to eq '241017'
  end

# Same as above buttons
  it 'will select the Manual Tester profession' do
    @driver.find_element(:id, 'profession-0').click
    expect(@driver.find_element(:id, 'profession-0').selected?).to be_equal(true)

    @driver.find_element(:id, 'profession-1').click
    expect(@driver.find_element(:id, 'profession-1').selected?).to be_equal(true)
  end

# Same as above buttons
  it 'will correctly select the automation tool' do
    @driver.find_element(:id, 'tool-0').click
    expect(@driver.find_element(:id, 'tool-0').selected?).to be_equal(true)

    @driver.find_element(:id, 'tool-1').click
    expect(@driver.find_element(:id, 'tool-1').selected?).to be_equal(true)

    @driver.find_element(:id, 'tool-2').click
    expect(@driver.find_element(:id, 'tool-2').selected?).to be_equal(true)
  end

  context 'Form should contain a link, and have a href target'
  it 'has a working "partial link"' do
    expect(@driver.find_element(:link, 'Partial Link Test').displayed?).to eq(true)
    link = @driver.find_element(:link, 'Partial Link Test')
    expect(link.attribute("href")).to eq('http://toolsqa.wpengine.com/automation-practice-form/')
  end

  it 'should have a "Selenium Automation Hybrid Framework" link that downloads a file' do
    expect(@driver.find_element(:link, 'Selenium Automation Hybrid Framework').displayed?).to eq(true)
  #   # link = @driver.find_element(:link, 'Selenium Automation Hybrid Framework')
  #   # expect(link.attribute("href")).to eq('http://toolsqa.wpengine.com/wp-content/uploads/2014/04/OnlineStore.zip')
  end

# Ensuring file download link exists and checks the downloads folder to verify
  context 'User has access to the test file, and it successfully downloads the .xlsx file' do
    it 'should have a "Test File to Download"' do
      expect(@driver.find_element(:link, 'Test File to Download').displayed?).to eq(true)
    end

    it 'should download the test file' do
      @driver.find_element(:link, 'Test File to Download').click
      sleep 5
      File.exists?('/Users/tech-a06/Downloads/Test-File-to-Download.xlsx')
      sleep 5
    end
  end

# Module to support the select menu included. Select option in the list by actual text, and check it matches the actual string.
  it 'should hold the correct value from a drop down list on click' do
    dropdown = @driver.find_element(id: 'continents')
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)

    select_list.select_by(:text, 'Asia')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Asia'

    select_list.select_by(:text, 'Europe')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Europe'

    select_list.select_by(:text, 'Africa')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Africa'

    select_list.select_by(:text, 'Australia')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Australia'

    select_list.select_by(:text, 'South America')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'South America'

    select_list.select_by(:text, 'North America')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'North America'

    select_list.select_by(:text, 'Antartica')
    selected_option = select_list.selected_options[0].text
    expect(selected_option).to eql 'Antartica'
  end

# The value of each selected option should match it's displayed label
  it 'should hold the correct value from a scroll down list on click' do
    scroll = @driver.find_element(id: 'selenium_commands')
    scroll_list = Selenium::WebDriver::Support::Select.new(scroll)

    scroll_list.select_by(:text, 'Browser Commands')
    selected_option = scroll_list.selected_options[0].text
    expect(selected_option).to eql 'Browser Commands'

    scroll_list.select_by(:text, 'Navigation Commands')
    selected_option = scroll_list.selected_options[1].text
    expect(selected_option).to eql 'Navigation Commands'

    scroll_list.select_by(:text, 'Switch Commands')
    selected_option = scroll_list.selected_options[2].text
    expect(selected_option).to eql 'Switch Commands'

    scroll_list.select_by(:text, 'Wait Commands')
    selected_option = scroll_list.selected_options[3].text
    expect(selected_option).to eql 'Wait Commands'

    scroll_list.select_by(:text, 'WebElement Commands')
    selected_option = scroll_list.selected_options[4].text
    expect(selected_option).to eql 'WebElement Commands'
  end

# Check the first name and last name text fields are now empty on submit click
  it 'clears the form on clicking the submit button' do
      @driver.find_element(id: 'submit').click
      first_name_contents = @driver.find_element(:name, 'firstname').text
      last_name_contents = @driver.find_element(:name, 'lastname').text
      expect(first_name_contents).to eql ''
      expect(last_name_contents).to eql ''
  end

# Messing up the other tests potentially?
  it 'should have a working link test' do
    expect(@driver.find_element(:link, 'Link Test').displayed?).to eq(true)
    link = @driver.find_element(:link, 'Link Test')
    expect(link.attribute("href")).to eq('http://toolsqa.wpengine.com/automation-practice-table/')
  end


end
