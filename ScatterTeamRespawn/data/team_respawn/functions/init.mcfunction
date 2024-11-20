# scorebaord trackers (uninstall script to match)
scoreboard objectives add deathT deathCount
scoreboard objectives add tpQueue dummy
# to be replaced with predicate
scoreboard objectives add teamID dummy

execute as @a run scoreboard players set @s deathT 0

# death check timer init
schedule function team_respawn:death_check 1t