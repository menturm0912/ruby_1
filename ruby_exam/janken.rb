# プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
class Player
    def hand
      # プレイヤーにじゃんけんの手を選択させる文章を表示させます。
      puts "数字を入力してください。"
      puts "0:グー, 1:チョキ, 2:パー"
      # 変数「input_hand」にプレイヤーの入力値を代入します。
      # ヒント：getsメソッドについて調べてみましょう。
      input_hand = gets.to_i
      # puts "A"
      # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外（アルファベットも含む）だと繰り返し処理を継続します。
      while true
        # if input_hand.include?("0") || input_hand.include?("1") || input_hand.include?("2") # この書き方はあまり好きではない。
        if input_hand == 0 || input_hand == 1 || input_hand == 2
          # puts "B1"
          return input_hand #ここは受け取った値を使用するので、「break」ではなく「return」。「puts」が残っていると正しく認識されない。
        else
          puts "0〜2の数字を入力してください。"
          puts "0:グー, 1:チョキ, 2:パー"
          # puts "C"
          input_hand = gets.to_i
        end
        # if 「input_hand」が「0, 1, 2」のいずれかの場合だった場合
        # ヒント：include?メソッドについて調べてみましょう。
          # 「input_hand」をそのまま返す。
          # ヒント：戻り値を返して繰り返し処理を終了させたい場合、「return」を使用します。
        # else それ以外の場合
          # プレイヤーに「0〜2」を入力させる文章を表示させる。
          # puts "0〜2の数字を入力してください。"
          # puts "0:グー, 1:チョキ, 2:パー"
          # 変数「input_hand」にプレイヤーの入力値を代入します。
        # end if文のend
      end
    end
end
# a = Player.new
# a.hand

# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
    def hand
      # グー、チョキ、パーの値をランダムに取得する。
      # puts "B2"
      return rand(3).to_i #「puts」が残っていると正しく認識されない。
    end
end
# b = Enemy.new
# b.hand

# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
    def pon(player_hand, enemy_hand)
      # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
      janken = ["グー", "チョキ", "パー"]
      #「相手の手は#{相手の手}です。」と出力させます。「enemy_hand」が数値で「配列janken」のインデックス番号で表示する。
      puts "相手の手は#{janken[enemy_hand]}です。"
      # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。
      if  player_hand == enemy_hand
        # Playerクラスの戻り値(player_hand)とEnemyクラスの戻り値(enemy_hand)の値が同じだった場合
        # 「あいこ」を出力します。
        puts "あいこ"
        return true
        #「true」を返してじゃんけんを繰り返し実行させます。
        # ヒント：「return」を使って戻り値を返すことができます。しかし、Rubyでは戻り値を返す場合、「return」を省略するのが一般的です。
        # もしも下記の組み合わせだった場合
      elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
        puts "あなたの勝ちです"
        return false
        #「あなたの勝ちです」を出力します。
        #「false」を返してじゃんけんを終了させます。
      else
        puts "あなたの負けです"
        return false
        #「あなたの負けです」を出力します。
        #「false」を返してじゃんけんを終了させます。
      end
    end
end

# じゃんけんゲームを実行するロジックを書きます。
class GameStart
    # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
    def jankenpon
      # プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
      player = Player.new
      # 相手が「0~2」の値をランダムに生成するロジックを書きます。
      enemy = Enemy.new
      # 「PlayerとEnemy」がじゃんけんした結果をコンソール上に出力するロジックを書きます。
      janken = Janken.new
      # 変数「next_game」に「true」を代入しましょう。
      next_game = true
      # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
      while true
        # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
        #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
        next_game = janken.pon(player.hand, enemy.hand)
        if next_game == false
          false
          break
        else
          true
        end
      end
    end
end

# クラス名を使ってjankenponメソッドを呼び出します。
# GameStart.jankenpon
ruby_exam = GameStart.new
ruby_exam.jankenpon