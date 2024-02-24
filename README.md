# Farmsay
> GNU Bison example with ascii animals.
Contains a basic grammar scanned by Flex and passing strings upwards with semantic values.

One day the only animal that could speak fluently: the cow, went on holiday.
Now the farm animals have to work together to echo back user input.
The team consists of:
+ the snake, who can only state
+ the bison, who can only exclaim
+ the sheep, who can only ask
+ and, the duck, who is just happy to be here (and also likes bread)

## Dependencies
+ Flex
+ Bison
+ C++ compiler
+ GNU Make

## Notes
If you are trying to learn from the code i recommend you check out previous commit states.
The make targets are the implicit and `test`,
for which to run you may have to remove the `valgrind` call to run in case you dont have it.
If you somehow manage to get it to work, the animals will recite Nietzsche for you in Hungarian.
