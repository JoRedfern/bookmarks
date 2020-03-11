require 'pg'

feature 'go to index page' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

feature 'viewing bookmarks' do
  scenario 'a user can see bookmarks' do
    Bookmark.create(url: "http://makersacademy.com", title: 'Makers Academy')
    Bookmark.create(url: "http://destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://google.com", title: "Google")
    visit '/bookmarks'
    expect(page).to have_link("Makers Academy", href: 'http://makersacademy.com')
    expect(page).to have_link("Destroy All Software", href: 'http://destroyallsoftware.com')
    expect(page).to have_link("Google", href: 'http://google.com')
  end
end
end
