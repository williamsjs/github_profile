require 'test_helper'
require './app/models/github_account.rb'

class GithubAccount

  private def get_repos_page
    JSON.parse(File.open("./test/repos.json").read)
  end

  private def get_user_page
    JSON.parse(File.open('./test/profile.json').read)
  end

end

class GithubProfileTest < ActiveSupport::TestCase
  test "get user image" do
    williamsjs = GithubAccount.new("Williamsjs")
    assert_equal 'https://avatars.githubusercontent.com/u/7584557?v=3', williamsjs.image
  end

  test "get repo names" do
    williamsjs = GithubAccount.new("Williamsjs")
    assert_equal ["battleship", "blackjack_advisor", "Brians_site", "currency_converter",
                  "Employee-Review", "employee_reviews", "guessing_game", "my_battleship",
                  "my_portfolio", "PHPMailer", "time_entry_data", "voter_api", "weather_report"],
                   williamsjs.repos
  end

  test "get email" do
    williamsjs = GithubAccount.new("Williamsjs")
    assert_equal "williamsjs1224@gmail.com", williamsjs.email
  end

  test "get location" do
    williamsjs = GithubAccount.new("Williamsjs")
    assert_equal "Durham, NC", williamsjs.location
  end

  test "get name" do
    williamsjs = GithubAccount.new("Williamsjs")
    assert_equal "Scott Williams", williamsjs.name
  end

  test "get username" do
    williamsjs = GithubAccount.new("Williamsjs")
    assert_equal "williamsjs", williamsjs.username
  end

  test "get date joined" do
    williamsjs = GithubAccount.new("Williamsjs")
    assert_equal "2014-05-14", williamsjs.joined_on
  end

end
