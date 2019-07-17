require 'rails_helper'

RSpec.feature "Listing Articles" do
  before do
    @article1 = Article.create(title: "First article", body: "First article body")
    @article2 = Article.create(title: "Second article", body: "Second article body")
  end

  scenario "A user lists all Articles" do
      visit "/"
      expect(page).to have_content(@article1.title)
      expect(page).to have_content(@article1.body)
      expect(page).to have_content(@article2.title)
      expect(page).to have_content(@article2.body)

      expect(page).to have_link(@article1.title)
      expect(page).to have_link(@article2.title)
    end

  scenario "A user has no Articles" do
    Article.delete_all ## This will make sure that the articles created in the before block will gets deleted (test_db)
    visit "/"
      expect(page).not_to have_content(@article1.title)
      expect(page).not_to have_content(@article1.body)
      expect(page).not_to have_content(@article2.title)
      expect(page).not_to have_content(@article2.body)

      expect(page).not_to have_link(@article1.title)
      expect(page).not_to have_link(@article2.title)

      within ("h1#no-articles") do
        expect(page).to have_content("No articles created")
      end
    end
end