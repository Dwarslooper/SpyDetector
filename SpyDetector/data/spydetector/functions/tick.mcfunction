scoreboard objectives add sd.detected dummy
scoreboard objectives add sd.setAction trigger
scoreboard objectives add sd.action dummy
scoreboard players enable @a sd.setAction
scoreboard players add spydetector sd.detected 0

execute as @a[scores={sd.setAction=1..}] at @s run execute store result score spydetector sd.action run scoreboard players get @s sd.setAction
execute as @a[scores={sd.setAction=1..}] at @s run scoreboard players reset @s sd.setAction

execute as @e[type=wandering_trader,tag=!sd.detected] at @s as @a at @s run playsound minecraft:entity.ender_dragon.hurt master @s ~ ~ ~ 100 0 1
execute as @e[type=wandering_trader,tag=!sd.detected] at @s run tellraw @a {"text":"⚠ SPION erkannt! ⚠\n","color":"red","bold":"true"}
execute as @e[type=wandering_trader,tag=!sd.detected] at @s run tellraw @a {"text":"Der Spion wird nun beseitigt.","color":"yellow"}
execute as @e[type=wandering_trader,tag=!sd.detected] at @s run tellraw @a [{"text":"HIER","color":"aqua","hoverEvent":{"action":"show_text","contents":[{"text":"Klicken zum Teleportieren","color":"red"}]},"clickEvent":{"action":"suggest_command","value":"/teleport @e[type=wandering_trader] @s"}},{"text":" klicken zum Teleportieren\n","color":"yellow"}]
execute as @e[type=wandering_trader,tag=!sd.detected] at @s run data merge entity @s {Fire:999999,ActiveEffects:[{Id:2,Amplifier:10b,Duration:999999,ShowParticles:0b},{Id:19,Amplifier:10b,Duration:999999,ShowParticles:0b},{Id:20,Amplifier:10b,Duration:999999,ShowParticles:0b},{Id:24,Amplifier:10b,Duration:999999,ShowParticles:0b}],Health:4f}
execute as @e[type=wandering_trader,tag=!sd.detected] at @s if score spydetector sd.detected matches 1 run tellraw @a [{"text":"Bisher wurde ","color":"aqua"},{"score":{"name":"spydetector","objective":"sd.detected"},"color":"gold"},{"text":" Spion erkannt."}]
execute as @e[type=wandering_trader,tag=!sd.detected] at @s unless score spydetector sd.detected matches 1 run tellraw @a [{"text":"Bisher wurden ","color":"aqua"},{"score":{"name":"spydetector","objective":"sd.detected"},"color":"gold"},{"text":" Spione erkannt."}]
execute as @e[type=wandering_trader,tag=!sd.detected] at @s run scoreboard players add spydetector sd.detected 1
execute as @e[type=wandering_trader,tag=!sd.detected] at @s run tag @s add sd.detected