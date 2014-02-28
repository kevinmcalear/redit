require 'spec_helper'

describe "a user can login and logout" do
  let!(:user) { FactoryGirl.create(:user) }

  it "logs in and out" do
    # The user visits the homepage
    visit root_path
    expect(page).to have_selector(:link_or_button, 'Login')

    # The user types in their user name
    fill_in :username, with: user.username

    # The user types in their password
    fill_in :password, with: user.password

    # The user clicks login
    click_button "Login"


    ### THE EXPECTATIONS ###

    # The user sees a logout link with their name on it
    within ".nav-bar" do
      expect(page).to have_content "Logout"
    end

    # The user sees a link to their profile
    within ".nav-bar" do
      expect(page).to have_content "Heyo #{user.username}"
      expect(page).to_not have_selector(:link_or_button, 'Login')
    end

    ### MORE WORKFLOW ###

    # The user clicks logout
    click_link "Logout"

    ### MORE EXPECTATIONS ###

    # The user sees login
    within ".nav-bar" do
      expect(page).to_not have_content "Heyo #{user.username}"
      expect(page).to have_selector(:link_or_button, 'Login')
    end
  end
end

