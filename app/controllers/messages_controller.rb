class MessagesController < ApplicationController

  def index
    @message = Message.new
  end

  def show 
    begin
      @message = Message.find(params[:id])
    rescue
      logger.debug("#{Time.now} couldn't find message with ID #{params[:id]}")
      respond_to do |format| 
        render "public/404.html", status: 400
      end
    end
  end

  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html {redirect_to @message}
      else
        logger.info("#{Time.now} couldn't save message: #{@message.errors}")
        format.html {render action: 'index'}
      end
    end
  end

  def destroy    
    begin
      @message = Message.find(params[:id])
      @message.destroy
      logger.info("#{Time.now} destroyed message ID ##{@message.id}")
    rescue
      logger.debug("#{Time.now} couldn't find message with ID #{params[:id]}")
      respond_to do |format| 
        format.html {render "public/404.html", status: 400}
      end
    end

  end

end
