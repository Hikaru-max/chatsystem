App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log("connected")
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log("disconnected") #このコードを入れておけばブラウザのコンソールでエラー箇所を追えて便利！
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("received")
    url = "/posts/#{data['id']}"
    #html = "<li>" + 
    #"<a href 
    importance_class = ""
    if data['importance'] == 1
      importance_class = "importance-emergency"
    if data['importance'] == 2
      importance_class = "importance-high"
    if data['importance'] == 4
      importance_class = "importance-work"
      
    $('#posts').append "<li class=\"post #{importance_class}\">#{data['id']} : #{data['content']}</li>"  #index.html.erbに挿入された時に見た目が一緒になるようにしている、ulにid=chatsを指定している。
#""の中に""を入れたい場合は\"\"を使う。ここができていなかったからruntime errorが出た。

  speak: (post, importance) ->
    console.log("speak")    
    @perform 'speak', Post: post, Importance: importance  #サーバ側に送るために引数を定義。クライアント側とサーバ側は完全に分ける。

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 #13=enterkey
      importance = $('#importance').val()
      App.room.speak event.target.value, importance  #event.target=コメント欄
      event.target.value = ''
      event.preventDefault()
      
      