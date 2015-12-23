# Elo

### Calculate an update from a match

```ruby
p1 = Elo::Player.new(2400)
p1 = Elo::Player.new(2000)

match = Elo::Match.new(player_one: p1, player_two: p2)

# If player one wins
match.player_one_score = Elo::Match::WIN
match.player_two_score = Elo::Match::LOSS

match.update_scores

p1.score # => 2403
p2.score # => 1997
```

### Calculate a team score update

```ruby
p1 = Elo::Player.new(1300)
p2 = Elo::Player.new(2800)
p2 = Elo::Player.new(1700)
p3 = Elo::Player.new(3000)

t1 = Elo::Team.new(p1, p2)
t2 = Elo::Team.new(p3, p4)

# Create a match with the teams instead of players
match = Elo::Match.new(player_one: t1, player_two: t2)

# If Team 1 wins
match.player_one_score = Elo::Match::WIN
match.player_two_score = Elo::Match::LOSS

# Update the match scores for the teams
match.update_scores

# Update the players in each team with the results
t1.update_players
t2.update_players

p1.score # => 1317  (17)
p2.score # => 2837  (37)

p3.score # => 1680  (20)
p4.score # => 2966  (34)

```
