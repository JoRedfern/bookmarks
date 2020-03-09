feature "go to index page" do
  scenario "visiting the index page" do
    visit "/"
    expect(page).to have_content "Bookmark Manager"
  end
end

feature "viewing bookmarks" do
  scenario "viewing bookmarks" do
    visit "/bookmarks"
    expect(page).to have_content "List of Bookmarks"
  end
end
