def play(num)
    # keep track of the number of games played and wins of each scenario
    games = 0
    keep_wins = 0.0
    swap_wins = 0.0

    # iterate through however many rounds the user inputs
    for i in 1..num do

    # three doors, one winning, .shuffle randomizes the order of the doors
    doors = [0, 0, 1].shuffle

    # pick an initial door at random, the "keep" variable will be
    # the scenario where the player doesn't switch doors
    keep = doors.delete_at(rand(doors.length))

    # replicate the host opening and door
    # and thereby removing it from play
    if doors[0] == 0
        open = doors.shift
    else
        open = doors.pop
    end

    # with the initial door chosen and the host removing
    # a losing door, the play can swap to the third door
    swap = doors[0]

    keep_wins += keep
    swap_wins += swap

    games += 1
    end

    keep_wins = keep_wins/games * 100
    swap_wins = swap_wins/games * 100
    p "#{games} games have been played. Wow, that was tiring!"
    p "Keeping the initial pick has won #{keep_wins.round(1)}% of the time!"
    p "Swapping doors has won #{swap_wins.round(1)}% of the time!"
end

# prompt for user input
p "Welcome to the statistician's favorite show: The Monty Hall Game!"
p "Please enter the number of games you'd like to simulate:"

# loop to ensure the user is entering an int
begin
    num = Integer(gets.chomp)
  rescue
    p "Please enter your response as an integer:"
    retry
  end

#simulate the games
play(num)