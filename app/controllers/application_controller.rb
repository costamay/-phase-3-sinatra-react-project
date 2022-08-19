class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Implement the CRUD functionalities
  get '/todos' do
    todos = Todo.all.order(created_at: :desc).limit(10)
    todos.to_json
  end

  get '/category' do
    category = Category.all.order(created_at: :desc)
    category.to_json
  end

  post '/todo' do
    todo = Todo.create(task: params[:task])
    puts todo.task
    todo.to_json
  end

  get '/todo/:id' do
    todo = Todo.find(params[:id])
    todo.to_json
  end

  delete '/todo/:id' do
    todo = Todo.find(params[:id])
    todo.destroy
    { message: 'Todo deleted' }.to_json
  end

  patch '/todo/:id' do
    todo = Todo.find(params[:id])
    todo.update(task: params[:task])
    todo.to_json
  end
end
