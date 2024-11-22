# frozen_string_literal: true

require_relative('lib/table')
require_relative('lib/table_reader')
require_relative('lib/match')

def main(file_path = ARGV[0])
  reader = TableReader.new
  table_raw = reader.read_table_from_file(file_path)

  table = Table.new
  table_raw.split("\n").each do |i|
    match = Match.new(i)
    table.matches << match
  end
  table.add_matches_to_table
  puts table.format_scores
end

main
