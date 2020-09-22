class MahjongTileTag < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    @input = input.strip.split("")
  end

  def render(context)
    set = ""
    extension = ""
    output = ""
    modifier = 0

    for i in @input.reverse
      case i
      when ' ', ','
        output = '&nbsp;&nbsp;' + output
        set = ""
        extension = ""
      when "'"
        extension = "e"
        modifier = 2
      when '"'
        extension = "k"
        modifier = 2
      when 'm', 's', 'p', 'z'
        set = i
        if modifier > 0
          modifier -= 1
          if modifier == 0
            extension = ""
          end
        end
      else 
        output = get_unicode(set, i, extension) + output
        if modifier == 2 
          extension = ""
          modifier = 0
        end
      end
    end
    output = + "<span style=\"font-size: 300%\">"+ output + "</span>"
    return output
  end

  def get_unicode(set, number, extension)
    if extension == 'e'
      return "<span style=\"display:inline-block;transform: rotate(-90deg) translateX(-0.15em); transform-origin:50% 50%;margin-left:.15em;margin-right:.08em;\">" + get_unicode(set, number, '') + "</span>"
    elsif extension == 'k'
      if number == 0 and set != 'z'
        return "<span style=\"display:inline-block;transform: rotate(-90deg) translateX(0.4em) translateY(0.333em);transform-origin:50% 50%;margin-left:-0.76em;margin-right:-.1em\">" + get_unicode(set, number, '') + get_unicode(set, '5', '') + "</span>"
      else
        return "<span style=\"display:inline-block;transform: rotate(-90deg) translateX(0.4em) translateY(0.333em);transform-origin:50% 50%;margin-left:-0.76em;margin-right:-.1em\">" + get_unicode(set, number, '') + get_unicode(set, number, '') + "</span>"
      end
    end
    case set
    when 'm'
      case number
      when '1'
        return '🀇'
      when '2'
        return '🀈'
      when '3'
        return '🀉'
      when '4'
        return '🀊'
      when '5'
        return '🀋'
      when '6'
        return '🀌'
      when '7'
        return '🀍'
      when '8'
        return '🀎'
      when '9'
        return '🀏'
      else
        return '<span style="text-red">🀋</span>'
      end
    when 's'
      case number
      when '1'
        return '🀐'
      when '2'
        return '🀑'
      when '3'
        return '🀒'
      when '4'
        return '🀓'
      when '5'
        return '🀔'
      when '6'
        return '🀕'
      when '7'
        return '🀖'
      when '8'
        return '🀗'
      when '9'
        return '🀘'
      else
        return '<span class="text-red">🀔</span>'
      end
    when 'p'
      case number
      when '1'
        return '🀙'
      when '2'
        return '🀚'
      when '3'
        return '🀛'
      when '4'
        return '🀜'
      when '5'
        return '🀝'
      when '6'
        return '🀞'
      when '7'
        return '🀟'
      when '8'
        return '🀠'
      when '9'
        return '🀡'
      else
        return '<span class="text-red">🀝</span>'
      end
    else
      case number
      when '1'
        return '🀀'
      when '2'
        return '🀁'
      when '3'
        return '🀂'
      when '4'
        return '🀃'
      when '5'
        return '🀆'
      when '6'
        return '🀅'
      when '7'
        return '🀄'
      when '8'
        return '🀥'
      when '9'
        return '🀪'
      else
        return '🀫'
      end
    end
  end
end

Liquid::Template.register_tag('mj', MahjongTileTag)