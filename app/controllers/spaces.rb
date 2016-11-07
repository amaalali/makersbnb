class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    #@spaces = Space.new(params)
    @space = Space.new(params.merge(user: current_user))
    if @space.save
      session[:space_id] = @space.id
      redirect '/spaces'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'  #success!
    end
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

  post '/spaces' do
    @spaces = filter_available_spaces(params[:available_on])
    erb :'spaces/spaces'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :'spaces/space'
  end

  # post '/spaces/:id' do
  #   @space = Space.first(id: params[:id])
  #   @request = Request.create(params.merge(user: current_user, space_id: current_space))
  #   if @request.save
  #
  #   else
  #     @request.errors.each {|e| puts e}
  #   end
  #   redirect('/requests')
  # end

end
