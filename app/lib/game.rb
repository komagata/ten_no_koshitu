class Game
  attr_accessor :name, :content
  def initialize(name,content)
    @name = name
    @content = content # 全てのログ（文字列）
    # @type = set_type(content)
  end

  # def set_type(content)
  #   ary = content.split(" ")
  #
  #   if ary.count == 10 ## 4人打ち
  #     4
  #   else ## 3人打ち
  #     3
  #   end
  # end
end

class OneGame
  attr_accessor :name, :one_game_log, :type
  def initialize(name, one_game_log)
    @name = name
    @one_game_log = one_game_log
    @type = set_type(one_game_log)
  end

  def four_or_three(one_game_log)
    logs = { name: game.name, content: JSON.parse(game.content) }
  end

  def set_type(one_game_log)
    ary = one_game_log.split(" ")

    if ary.count == 10 ## 4人打ち
      4
    else ## 3人打ち
      3
    end
  end
end
