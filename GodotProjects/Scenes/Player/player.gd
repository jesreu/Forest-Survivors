extends CharacterBody2D

var movement_speed = 80.0
var hp = 80
var maxhp = 80
var last_movement = Vector2.UP
#Attacks
var waterbolt = preload("res://Scenes/Player/Attack/waterbolt.tscn")
var fireball = preload("res://Scenes/Player/Attack/fireball.tscn")
var time = 0

#AttackNodes
@onready var WaterBoltTimer = get_node("%WaterBoltTimer")
@onready var WaterBoltAttackTimer = get_node("%WaterBoltAttackTimer")
@onready var FireballTimer = get_node("%FireballTimer")
@onready var FireballAttackTimer = get_node("%FireBallAttackTimer")
@onready var healthBar = get_node("%HealthBar")
@onready var gameTimer = get_node("%gameTimer")
#WaterBolt
var bolt_ammo = 0
var bolt_baseammo = 2
var bolt_attackspeed = 1.5
var bolt_level = 1

#Fireball
var fireball_ammo = 0
var fireball_baseammo = 1
var fireball_attackspeed = 3
var fireball_level = 1

#Enemy check
var enemy_close = []

@onready var sprite = $AnimatedSprite2D
@onready var IdleTimer = get_node("%IdleTimer")

@onready var deathPanel = get_node("%DeathPanel")
@onready var lblResult = get_node("%Result")

func _ready():
	attack()
	_on_hurt_box_hurt(0,0,0)

#Kutsuu liikkumis funktiota 60x sekunnissa
func _physics_process(delta):
	movement()

# Liikkumis skripti vertaa pelaajan suunnan arvoa, oikea - vasen ja sitä kautta määrittää mihin suuntaan pelaaja liikkuu
# Saadut arvot asetetaan vector2 muuttujalle jonka avulla voidaan siirtää liike 2d ympäristöön.
func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	#Käännetään pelaajan grafiikka suunnan mukaisesti
	if mov.x < 0:
		sprite.flip_h = true
	elif  mov.x > 0:
		sprite.flip_h = false
	
	if mov == Vector2.ZERO:
		sprite.play("idle")
	else:
		last_movement = mov
		sprite.play("run")
	
	# Normalisoidaan nopeus, jotta pelaaja ei liiku nopeammin tilanteissa jossa pelaaja liikkuu y ja x aksellilla saman aikaisesti
	velocity = mov.normalized()*movement_speed
	move_and_slide()

func attack():
	if bolt_level > 0:
		WaterBoltTimer.wait_time = bolt_attackspeed
		if WaterBoltTimer.is_stopped():
			WaterBoltTimer.start()
	if fireball_level > 0:
		FireballTimer.wait_time = fireball_attackspeed
		if FireballTimer.is_stopped():
			FireballTimer.start()

func _on_hurt_box_hurt(damage, _angle, _knockback):
	hp -= damage
	if hp <= 0:
		death()
	healthBar.max_value = maxhp
	healthBar.value = hp

func death():
	deathPanel.visible = true
	emit_signal("playerdeath")
	get_tree().paused = true
	var tween = deathPanel.create_tween()
	tween.tween_property(deathPanel,"position",Vector2(220,50), 3.0).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	if time >= 20:
		lblResult.text = "You Win"
	else:
		lblResult.text = "You Lose"

func _on_water_bolt_timer_timeout():
	bolt_ammo += bolt_baseammo
	WaterBoltAttackTimer.start()


func _on_fireball_timer_timeout():
	fireball_ammo += fireball_baseammo
	FireballAttackTimer.start()


func _on_water_bolt_attack_timer_timeout():
	if bolt_ammo > 0:
		var bolt_attack = waterbolt.instantiate()
		bolt_attack.position = position
		bolt_attack.target = get_random_target()
		bolt_attack.level = bolt_level
		add_child(bolt_attack)
		bolt_ammo -= 1
		if bolt_ammo > 0:
			WaterBoltAttackTimer.start()
		else:
			WaterBoltAttackTimer.stop()

func _on_fire_ball_attack_timer_timeout():
	if fireball_ammo > 0:
		var fireball_attack = fireball.instantiate()
		fireball_attack.position = position
		fireball_attack.last_movement = last_movement
		fireball_attack.level = fireball_level
		add_child(fireball_attack)
		fireball_ammo -= 1
		if fireball_ammo > 0:
			FireballAttackTimer.start()
		else:
			FireballAttackTimer.stop()

func get_random_target():
	if enemy_close.size() > 0:
		return enemy_close.pick_random().global_position
	else:
		return Vector2.UP

func _on_enemy_detection_body_entered(body):
	if enemy_close.has(body):
		enemy_close.append(body)


func _on_enemy_detection_body_exited(body):
	if  enemy_close.has(body):
		enemy_close.erase(body)

func change_time(argtime=0):
	time = argtime
	var get_m = int(time/60)
	var get_s = time % 60
	if get_m < 10:
		get_m = str(0,get_m)
	if get_s < 10:
		get_s = str(0,get_s)
	gameTimer.text = str(get_m,":",get_s)

func _on_button_click_end():
	get_tree().paused = false
	var _level = get_tree().change_scene_to_file("res://Scenes/titlescreen.tscn")
