# frozen_string_literal: true

# Table class create a table of tournament
class Table
  attr_accessor :matches, :table

  def initialize
    @table = Hash.new(0)
    @matches = []
  end

  def add_matches_to_table
    @matches.each do |match|
      points = match.points
      table[match.team_x] += points[0]
      table[match.team_y] += points[1]
    end
  end

  def format_scores
    sorted_scores = @table.sort_by { |team, points| [-points, team] }
    sorted_scores.map.with_index(1) do |(team, points), index|
      "#{index}. #{team}, #{points} pt#{'s' if points != 1}"
    end.join("\n")
  end
end
