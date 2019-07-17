require 'rails_helper'

RSpec.feature "Editing an article" do 
  before do 
    @article = Article.create(title: "First article", body: "First article body")
  end


  scenario "A User updates an article" do 
    visit "/"
    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Updated title"
    fill_in "Body", with: "Updated First article body"

    click_button "Update Article"

    # redirect_to article_path(@article)

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "A User fails to updates an article" do 
    visit "/"
    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Updated First article body"

    click_button "Update Article"

    # redirect_to article_path(@article)

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end