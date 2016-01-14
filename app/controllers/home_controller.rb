class HomeController < ApplicationController
  def index
    @dogs = Dog.all
    @dog = Dog.new
  end

  def buy
  end
end
