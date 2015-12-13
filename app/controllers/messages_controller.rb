class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "DevBBQ_development")
    @messages = client.query("SELECT * FROM messages WHERE user_id = #{current_user.id}")
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save!
      redirect_to root_path
    else
      render :message
    end
  end

  private
  def message_params
    params.require(:message).permit(:title, :content)
  end
end
