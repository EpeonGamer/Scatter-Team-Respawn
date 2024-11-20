# check players who have died, select one from queue to teleport
execute as @a[scores={deathT=1..},sort=random,limit=1] run scoreboard players set @s tpQueue 1
# conditional version
# execute as @a[scores={deathT=1..},sort=random,limit=1] if score @s condition matches 1 run scoreboard players set @s tpQueue 1

# Teleport dead player, TODO: predicate teamID
# Can be coded to check all players not in death queue (if deathT only sometimes active), or all players not in tp queue
execute as @a[scores={deathT=0},sort=random,limit=1] if score @s teamID = @a[scores={tpQueue=1},limit=1] teamID run scoreboard players set @s tpQueue 2
tp @a[scores={tpQueue=1},limit=1] @r[scores={tpQueue=2}]

# reset scoreboards for processed players for continued play
scoreboard players set @a[scores={tpQueue=1}] deathT 0
scoreboard players reset @a tpQueue

# run check again a later
schedule function team_respawn:death_check 1s