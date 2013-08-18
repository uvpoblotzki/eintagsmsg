class MessagesController < ApplicationController

  def index
    @message = Message.new
  end

  def new

  end

  def show 
    begin
      @message = Message.find(params[:id])
    rescue
      render "public/404.html", status: 400
    end
  end

  def create
    @message = Message.new(params[:message])

    if @message.save
      redirect_to @message
    else
      render action: 'index'
    end
  end

  def destroy    
    begin
      @message = Message.find(params[:id])
      @message.destroy
    rescue
      render "public/404.html", status: 400
    end

  end

end
