class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    # client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "DevBBQ_development")
    # @messages = client.query("SELECT * FROM messages WHERE user_id = #{current_user.id}")
    # @messages = ActiveRecord::Base.connection.select_all("SELECT * FROM messages WHERE user_id = #{current_user.id}").rows
    @messages = Message.where(user_id: current_user.id)
    @message = current_user.messages.build
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save!
        MessageMailer.devbbq_email(@message.title, @message.content).deliver_now
      end
      format.html
      format.js
    end   
  end

  private
  def message_params
    params.require(:message).permit(:title, :content, :user_id)
  end
end
