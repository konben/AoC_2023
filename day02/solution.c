#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define NO_OF_COLOURS 3

typedef enum _colour_t
{
    RED   = 0,
    GREEN = 1,
    BLUE  = 2,
} colour_t;

colour_t get_colour(const char *str);

int main(void)
{
    int bag[NO_OF_COLOURS];
    bag[RED] = 12;
    bag[GREEN] = 13;
    bag[BLUE] = 14;

    int id;
    int part_1 = 0;
    int part_2 = 0;
    while (scanf("Game %d:", &id) == 1)
    {
        bool valid = true;
        int blocks;
        char colour[16];

        int fewest_possible[NO_OF_COLOURS] = {0, 0, 0};

        char c = getchar();
        while (c != '\n' && c != EOF)
        {
            int matches = scanf("%d %s", &blocks, colour);
            assert(matches == 2);

            colour_t colour_id = get_colour(colour);
            valid &= (blocks <= bag[colour_id]);

            if (blocks > fewest_possible[colour_id])
                fewest_possible[colour_id] = blocks;

            c = getchar();
        }

        if (valid)
            part_1 += id;

        part_2 += fewest_possible[RED]*fewest_possible[GREEN]*fewest_possible[BLUE];
    }

    printf("part I: %d\n", part_1);
    printf("part II: %d\n", part_2);

    return 0;
}

colour_t get_colour(const char *str)
{
    colour_t colour;
    switch (*str)
    {
    case 'r':
        colour = RED;
        break;
    case 'g':
        colour = GREEN;
        break;
    case 'b':
        colour = BLUE;
        break;
    default:
        assert(false);
    }

    return colour;
}

