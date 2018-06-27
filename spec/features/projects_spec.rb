require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  scenario "user creates a new project" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect {
      click_link "New Project"
      fill_in "Name", with: "Test Project"
      fill_in "Description", with: "Trying out Capybara"
      click_button "Create Project"

      expect(page).to have_content "Project was successfully created"
      expect(page).to have_content "Test Project"
      expect(page).to have_content "Owner: #{user.name}"
    }.to change(user.projects, :count).by(1)
  end

  scenario "guest adds a project" do
    visit projects_path
    save_and_open_page
    click_link "New Project"
  end
end

# scenario "works with all kinds of HTML elements" do
#   visit "/fake/page"
#   click_on "A link or button label"
#   check "A checkbox label"
#   uncheck "A checkbox label"
#   choose "A radio button label"
#   select "An option", from: "A select menu"
#   attach_file "A file upload label", "/some/file/in/my/test/suite.gif"
#
#   expect(page).to have_css "h2#subheading"
#   expect(page).to have_selector "ul li"
#   expect(page).to have_current_path "project/new"
# end
#
# within "#rails" do
#   click_link "click here!"
# end
#
# language = find_field("Programming language").value
# expect(language).to eq "Ruby"
#
# find("#fine_print").find("#disclaimer").click
# find_button("Publish").click
