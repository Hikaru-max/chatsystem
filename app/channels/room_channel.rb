class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data) # data = { "Post" => "...." }
    Rails.logger.info data
    post = Post.new(content: data['Post'], importance: data['Importance'])
    post.save
    Rails.logger.info post.errors.full_messages
    ActionCable.server.broadcast 'room_channel', { id: post.id, content: post.content, importance: post.importance } #ここが書かれてなくて非同期通信ができなかった
  end
end
