require "date"

class Yakitori
  attr_accessor :name, :price

  def initialize(**params)
    @name = params[:name]
    @price = params[:price]
  end

  def info
    "商品名#{@name}：値段#{@price}"
  end

  def tax(count)
    (@price * count * 0.08).round
  end

  def total_price(count)
    (@price * count * 1.08).round

  end
end

yakitori1 = Yakitori.new(name: "つくね", price: 80)
yakitori2 = Yakitori.new(name: "モモ", price: 100)
yakitori3 = Yakitori.new(name: "とり皮", price: 120)
yakitori4 = Yakitori.new(name: "ネギま", price: 100)
yakitori5 = Yakitori.new(name: "ウインナー", price: 130)
yakitori6 = Yakitori.new(name: "ベーコン巻き", price: 120)

yakitoris = [yakitori1, yakitori2, yakitori3, yakitori4, yakitori5, yakitori6]

yakitoris.each.with_index(1){|yakitori,i| puts "#{i}:#{yakitori.info}"}

puts <<~text
焼き鳥 節原　へようこそ！!
ご注文をどうぞ！
--------------------
ご希望の商品をお選び下さい
text

select_num = gets.chomp.to_i - 1
select_yakitori= yakitoris[select_num]

puts <<~text
--------------------
選択商品：#{select_yakitori.name}

個数を入力してください
--------------------
text

count = gets.chomp.to_i

puts <<~text
商品名：#{select_yakitori.name}
価格：#{select_yakitori.price}円
個数：#{count}個
合計金額：#{select_yakitori.total_price(count)}円(内税#{select_yakitori.tax(count)}円)
まいどあり！！
text
