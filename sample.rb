class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してください。\n0: グー\n1: チョキ\n2:  パー"

    # === START 暫定的にここでやる ===
    while true do
      player_hand = gets.chomp
      # 0,1,2ならループから抜ける
      if (player_hand == "0" || player_hand == "1" || player_hand == "2")
        break
      end
      puts "0〜2の数字を入力してください。"
    end
    # === END 暫定的にここでやる ===
    @hand = player_hand
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    @hand = rand(2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)

    # ===ここで引っかかった回数分、最後に出力されるっぽい　わからんからPlayerで処理する===
    # # 0,1,2以外は再帰
    # player_hand = gets.chomp
    # unless (player_hand == "0" || player_hand == "1" || player_hand == "2")
    #   puts "0〜2の数字を入力してください。"
    #   start
    # end

    #勝ち負け判定　あいこの場合再帰
    case (player_hand.to_i - enemy_hand + 3) % 3

      when 1 then
        gameResult = "あなたの負け"
      when 2 then
        gameResult = "あなたの勝ち"
      when 0 then
        gameResult = "あいこ"
    end

    #　じゃんけんの手に変換
    case enemy_hand
      when 0 then
        handKind = "グー"
      when 1 then
        handKind = "チョキ"
      when 2 then
        handKind = "パー"
    end

    puts "相手の手は#{handKind}です。#{gameResult}です。"

    if gameResult == "あいこ"
      puts "0〜2の数字を入力してください。"
      start
    end
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
  end
end


def start
  player = Player.new
  enemy = Enemy.new
  janken = Janken.new
  janken.pon(player.hand, enemy.hand)
end

# 下記の記述で、ジャンケンメソッドが起動される
start

# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、
#書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。
#課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。
