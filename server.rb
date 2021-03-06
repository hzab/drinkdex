require 'sinatra'
require 'csv'
require 'pry'
require_relative 'person_class'
require_relative 'alcohol_class'

get '/' do

  erb :home
end

post '/drink' do
  person_info = params['name'], params['weight'], params['gender'], params['hours_since_first_drink']
  CSV.open('data_drink.csv', 'a+') do |file|
    file.puts(person_info)
  end
  @drink_data = CSV.readline('data_drink.csv')


  erb :how_drunk
end

get '/:url_name' do
  @drink_class_holder = Person.new(params[])
end

