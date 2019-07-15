require 'rails_helper'


RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Loremmmm espsssum"
    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end
end

=begin
 - visit root page
 - click on new article
 - fill in title
 - fill in body
 - create artile - click

 result: (expectations)
 - Article has been created
 - redirect to articles path
=end