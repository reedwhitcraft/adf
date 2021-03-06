require 'nbaSeasonAverage'
require 'dailySetup'
require 'dailyResults'

desc "add every nba team, then add players and their stats to the first"
task :test_pop => :environment do
  NbaSeasonAverage.populate_nba_teams
  teams = ProfessionalTeam.all
  teams.each do |team|
    NbaSeasonAverage.get_player_averages(team)
  end
end

desc "resets box score ids and game times to nil for every team"
task :reset_nba_schedule => :environment do
  DailySetup.reset_daily_schedule
end


desc "change the teams playing today to true"
task :set_play_today => :environment do
  DailySetup.set_daily_schedule
end

desc "set the results for each of the games from today"
task :set_results => :environment do
  DailyResults.set_daily_results
end
