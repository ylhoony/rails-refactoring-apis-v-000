class RepositoriesController < ApplicationController
  before_action :set_github

  def index
    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # @repos_array = JSON.parse(response.body)
    # binding.pry

    # github = GithubService.new( { "access_token": session[:token] })
    @repos_array = @github.get_repos
  end

  def create
    # github = GithubService.new( { "access_token": session[:token] })
    @github.create_repo(params[:name])
    # response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end

  private

  def set_github
    @github = GithubService.new( { access_token: session[:token] })
  end

end
