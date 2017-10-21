class SubjectsController < ApplicationController
  get '/subjects' do
    if logged_in?
      @subjects = Subject.all
      erb :'subjects/subjects'
    else
      redirect to '/login'
    end
  end

  get '/subjects/new' do
    if logged_in?
      erb :'subjects/create_subject'
    else
      redirect to '/login'
    end
  end

  post '/subjects' do
    if params[:title] == ""
      redirect to "/subjects/new"
    else
      @subject = current_user.subjects.create(title: params[:title])
      redirect to "/subjects"  #redirect to "/subjects/#{@subject.id}"
    end
  end

  get '/subjects/:id' do
    if logged_in?
      @subject = Subject.find_by_id(params[:id])
      erb :'subjects/show_subject'
    else
      redirect to '/login'
    end
  end

  get '/subjects/:id/edit' do
    if logged_in?
      @subject = Subject.find_by_id(params[:id])
      erb :'subjects/edit_subject'
    else
      redirect to '/login'
    end
  end

  patch '/subjects/:id' do
    if params[:content] == ""
      redirect to "/subjects/#{params[:id]}/edit"
    else
      @subject = Subject.find_by_id(params[:id])
      @subject.content = params[:content]
      @subject.save
      redirect to "/subjects/#{@subject.id}"
    end
  end

  delete '/subjects/:id/delete' do
    if logged_in?
      @subject = Subject.find_by_id(params[:id])
      if @subject.user_id == current_user.id
        @subject.delete
        redirect to '/subjects'
      else
        redirect to '/subjects'
      end
    else
      redirect to '/login'
    end
  end
end
