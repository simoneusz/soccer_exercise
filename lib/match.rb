# frozen_string_literal: true

# Match class
class Match
  attr_accessor :team_x, :team_y, :team_x_score, :team_y_score

  def initialize(raw_match)
    @team_x = nil
    @team_y = nil
    @team_x_score = nil
    @team_y_score = nil
    parse_raw_match(raw_match)
  end

  def parse_raw_match(raw_match)
    teams_scores = raw_match.split(', ')
    @team_x, @team_x_score = parse_team(teams_scores[0])
    @team_y, @team_y_score = parse_team(teams_scores[1])
  end

  def to_s
    "#{@team_x} #{@team_x_score}:#{@team_y_score} #{@team_y}"
  end

  def points
    score_diff = @team_y_score - team_x_score
    if score_diff.negative?
      [3, 0]
    elsif score_diff.positive?
      [0, 3]
    else
      [1, 1]
    end
  end

  private

  def parse_team(raw_team)
    name = raw_team.scan(/[a-zA-Z]+/).join(' ')
    score = raw_team.match(/\d+/).to_s.to_i
    [name, score]
  end
end
