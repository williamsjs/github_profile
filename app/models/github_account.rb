class GithubAccount
  attr_reader :profile_name

  def initialize(profile_name)
    @profile_name = profile_name
  end

  private def get_user_page
    HTTParty.get("https://api.github.com/users/#{profile_name}?access_token=#{ENV['GITHUB_KEY']}")
  end

  private def get_repos_page
    HTTParty.get("https://api.github.com/users/#{profile_name}/repos?access_token=#{ENV['GITHUB_KEY']}")
  end

  private def get_organizations
    HTTParty.get("https://api.github.com/users/#{profile_name}/orgs?access_token=#{ENV['GITHUB_KEY']}")
  end

  def image
    get_user_page['avatar_url']
  end

  def repos
    repos = {}
    get_repos_page.each {|i| repos[i['name']] = i['html_url']}
    repos
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
    get_user_page['created_at'][0..9]
  end

  def orgs
    orgs = {}
    get_organizations.each {|org| orgs[org['login'] = org['avatar_url']]}
  end

end
