require 'strscan'

class Lexer
  KEYWORDS = {
    'var'     => :VAR,
    'defun'   => :DEFUN,
    'return'  => :RETURN,
    'if'      => :IF,
    'else'    => :ELSE,
    'true'    => :TRUE,
    'false'   => :FALSE,
    'PRINT'   => :PRINT
  }

  SYMBOLS = {
    '('   => :LPAREN,
    ')'   => :RPAREN,
    '{'   => :LBRACE,
    '}'   => :RBRACE,
    ','   => :COMMA,
    ';'   => :SEMICOLON,
    '='   => :ASSIGN,
    '=='  => :EQ,
    '->'  => :ARROW,
    '.'   => :DOT,
    '+'   => :PLUS,
    '-'   => :MINUS,
    '*'   => :STAR,
    '/'   => :SLASH
  }

  def initialize(source)
    @scanner = StringScanner.new(source)
  end

  def tokenize
    tokens = []

    until @scanner.eos?
      token = next_token
      if token.is_a?(Array) && token[0].is_a?(Array) 
        tokens.concat(token)
      elsif token
        tokens << token
      end
    end

    tokens
  end

  def next_token
    @scanner.skip(/\s+/)
    @scanner.skip(/\n+/)

    return if @scanner.eos?

    [
      :tokenize_keyword,
      :tokenize_symbol,
      :tokenize_string,
      :tokenize_number,
      :tokenize_identifier
    ].each do |method|
      token = send(method)
      return token if token
    end

    raise "Unexpected token at: #{@scanner.peek(10)}"
  end

  def tokenize_keyword
    if token = @scanner.scan(/\b(?:#{KEYWORDS.keys.join('|')})\b/)
      [KEYWORDS[token], token]
    end
  end

  def tokenize_symbol
    if token = @scanner.scan(/==|->|[()\{\},;\.=+\-*\/]/)
      [SYMBOLS[token], token]
    end
  end

  def tokenize_string
    return unless @scanner.scan(/"/)

    tokens = [[:STRING_START, '"']]
    buffer = ""

    until @scanner.eos?
      if @scanner.scan(/\\./)
        buffer << @scanner.matched
      elsif @scanner.scan(/#\{/)
        tokens << [:STRING_CONTENT, buffer] unless buffer.empty?
        buffer = ""
        tokens << [:INTERPOLATION_START, '#{']

        expr = ""
        brace_count = 1
        until @scanner.eos?
          char = @scanner.getch
          if char == '{'
            brace_count += 1
          elsif char == '}'
            brace_count -= 1
            break if brace_count == 0
          end
          expr << char unless brace_count == 0
        end

        tokens << [:INTERPOLATION_EXPR, expr.strip]
        tokens << [:INTERPOLATION_END, '}']
      elsif @scanner.scan(/"/)
        tokens << [:STRING_CONTENT, buffer] unless buffer.empty?
        tokens << [:STRING_END, '"']
        return tokens
      else
        buffer << @scanner.getch
      end
    end

    raise "Unterminated string"
  end

  def tokenize_number
    if token = @scanner.scan(/\d+/)
      [:NUMBER, token]
    end
  end

  def tokenize_identifier
    if token = @scanner.scan(/[a-zA-Z_][a-zA-Z0-9_]*/)
      [:IDENTIFIER, token]
    end
  end
end
