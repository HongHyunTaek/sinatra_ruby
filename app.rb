require 'sinatra'
require "sinatra/reloader" if development?

get '/' do
  'Hello world! Welcome'
end


get '/htmlfile' do
    send_file 'views/htmlfile.html'
end

get '/htmltag' do
 '<h1> html태그를 보낼수 있습니다.</h1>
 <ul>
 <li>1</li>
 <li>222</li>
 </ul>'
 
end


get '/welcome/:name' do
"#{params[:name]}님 안녕하세요"
end


get '/cube/:num' do
"result = #{params[:num].to_i**3}"    
end


get '/erbfile' do
   @name = "hyun111"
   erb :erbfile
end

get '/luncharray' do
    
    menu = ["20층", "순남시래기", "양자강", "한우","김밥","햄버거"]
    @lunch = menu.sample
    erb :lunch
end

get '/lunchhash' do
   # 메뉴들이 저장된 배열을 만든다
   # 메뉴 이름(key) 사진 URL(Value)을 가진 Hash를 만든다.
   # 랜덤으로 하나를 출력한다.
   # 이름과 url을 남겨서 erb를 렌더링한다. \
   
   menuhash = {"짜장면" => "http://m.bunjang.co.kr/products/83030455/?ref=%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC%EC%84%A0%ED%83%9D%EA%B2%B0%EA%B3%BC
    "}
   
   @menukey = menuhash.keys.sample
   @menuvalue = menuhash[@menukey]
   erb :lunchhash
   
end
