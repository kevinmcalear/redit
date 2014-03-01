require 'spec_helper'

describe "a user can join the site" do
  
  it "joins the site" do
    username = "Jevin"
    # The user visits the homepage
    visit root_path

    # The user clicks join
    click_link "Join!"

    within ".join-form" do

      # The user types in their name
      fill_in "Username", with: username

      # The user types in their email
      fill_in "Email", with: "jevin@kevenn.com"

      # The user does password stuff
      fill_in "Password", with: "kevenn"
      fill_in "Password confirmation", with: "kevenn"

      # The user clicks join
      click_button "Join!"

    end

    expect(page).not_to have_content "Errors!"

    # The user is joined and logged in
    within ".nav-bar" do
      expect(page).to have_content "Logout"
      expect(page).to have_content "Heyo #{username}"
    end
  end
end