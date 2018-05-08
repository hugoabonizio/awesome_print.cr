require "./awesome_print/*"

def self.ap(v)
  r = Formater.selector(v)
  print r
  r
end

class Formater
  MAX_ELEMENTS_PER_ROW = 7

  def self.selector(v)
    if v.is_a? Array
      r = Formater.array(v)
    elsif v.is_a? String
      r = Formater.string(v)
    elsif v.is_a? Char
      r = Formater.char(v)
    else
      r = v
    end
    return r
  end

  def self.integer(v)
    return v
  end

  def self.string(v)
    return "\"#{v}\""
  end

  def self.char(v)
    return "'#{v}'"
  end

  def self.array(vars)
    i = 0
    s = "["
    vars.each { |v|
      s = s + selector(v).to_s
      i = i + 1
      if i < vars.size
        s = s + ", "
      end
      if i % MAX_ELEMENTS_PER_ROW == 0 && i < vars.size
        s += "\n "
      end
    }
    s += "]"
    return s
  end
end
