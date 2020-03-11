require 'bookmarks'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://google.com');")
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://makersacademy.com')
      expect(bookmarks).to include('http://destroyallsoftware.com')
      expect(bookmarks).to include('http://google.com')
    end
  end
  
  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.testbookmark.com')
      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end
  end
end
