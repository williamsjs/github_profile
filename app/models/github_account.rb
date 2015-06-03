class GithubAccount
  attr_reader :profile_name

  def initialize(profile_name)
    @profile_name = profile_name
  end

  private def get_user_page
    HTTParty.get("https://api.github.com/users/#{profile_name}?token_key=#{ENV['GITHUB_KEY']}")
  end

  private def get_repos_page
    HTTParty.get("https://api.github.com/users/#{profile_name}/repos?token_key=#{ENV['GITHUB_KEY']}")
  end

  private def get_organizations
    HTTParty.get("https://api.github.com/users/#{profile_name}?token_key=#{ENV['GITHUB_KEY']}")
  end

  def image
    get_user_page['avatar_url']
  end

  def repos
    get_repos_page.map {|i| i['name']}
  end

  def location
    get_user_page['location']
  end

  def email
    get_user_page['email']
  end

  def name
    get_user_page['name']
  end

  def username
    get_user_page['login']
  end

  def joined_on
    get_user_page['created_at'][0..9] if get_user_page['created_at'] != nil
  end

end
