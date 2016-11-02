class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    space = Space.new(space_name: params[:space_name],
                      description: params[:description],
                      price_per_night: params[:price_per_night],
                      available_from: params[:available_from],
                      available_to: params[:available_to])
    redirect('/spaces')
  end

end
