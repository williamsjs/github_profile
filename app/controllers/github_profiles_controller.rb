class GithubProfilesController < ApplicationController
  def index
  end

  def profile
    account = GithubAccount.new(params[:q])
    @image = account.image
    @location = account.location
    @email = account.email
    @username = account.username
    @name = account.name
    @date_joined = account.joined_on
    @repos = account.repos
    @orgs = account.orgs
  end
end
