require "lovelee/version"
require 'net/http'
require 'uri'
require 'json'

class Lovelee
  def initialize(user = nil)
    @user = user
  end

  def loves
    return if @user.nil?
    url = "https://api.github.com/users/#{@user}/following"
    get_lovers(get_json(url))
  end

  def loved_by
    return if @user.nil?
    url = "https://api.github.com/users/#{@user}/followers"
    get_lovers(get_json(url))
  end

  def get_json(url)
    uri = URI.parse(url)
    json = Net::HTTP.get(uri)
    people = JSON.parse(json)
  end

  def get_lovers(people)
    return if people.is_a?(Hash)

    @lovers = []
    people.each do |person|
      lover = {}
      lover[:name] = person["login"]
      lover[:image] = person["avatar_url"]
      @lovers.push lover
    end

    @lovers
  end
end
