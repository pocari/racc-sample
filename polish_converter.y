class PolishConverter
  token NUM

rule
  program: exp { result = val[0] }
        |

  exp: term '+' exp { result = [:+, val[0], val[2]] }
     | term '-' exp { result = [:-, val[0], val[2]] }
     | term { result = val[0] }

  term: primary '*' term { result = [:*, val[0], val[2]] }
      | primary '/' term { result = ["/".to_sym, val[0], val[2]] }
      | primary { result = val[0] }

  primary: '(' exp ')' { result = val[1] }
         | NUM { result = val[0] }
         | '+' primary { result = val[1] }
         | '-' primary { result = [:-, val[1]] }
end
---- inner
  def parse(str)
    @tokens = str.scan(/\d+|\S/)
    puts "#{str} is "
    do_parse
  end

  def next_token
    t = @tokens.shift
    case t
    when /\d+/
      [:NUM, t.to_i]
    when nil
      nil
    else
      [t, t]
    end
  end

