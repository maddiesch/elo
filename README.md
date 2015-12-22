# ELO

### Calculate an update from a match

```ruby
p1 = ELO::Player.new(2400)
p1 = ELO::Player.new(2000)

match = ELO::Match.new(player_one: p1, player_two: p2)

# If player one wins
match.player_one_score = ELO::Match::WIN
match.player_two_score = ELO::Match::LOSS

match.update_scores

p1.score # => 2403
p2.score # => 1997
```
