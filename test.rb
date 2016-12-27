require_relative 'polish_converter.tab.rb'

parser = PolishConverter.new

p parser.parse("-1 + (+2) * (-3) * (4 + 5) / (6 - 7)")
