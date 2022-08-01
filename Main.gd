extends Node

const prefix := "!c"

onready var code_view: CodeDisplay = $"%Code"
onready var viewport: CodeViewport = $"%CodeViewport"

var file = File.new()


func compile(source: String) -> RegEx:
	var reg := RegEx.new()
	reg.compile(source)
	return reg


func _ready():
	var bot := DiscordBot.new()
	add_child(bot)
	var err = file.open("res://token", File.READ)
	var token
	if err == OK:
		token = file.get_as_text()
	elif OS.has_environment("TOKEN"):
		token = OS.get_environment("TOKEN")
	else:
		push_error("token missing")
	file.close()
	bot.TOKEN = token
	bot.connect("bot_ready", self, "_on_bot_ready")
	bot.connect("message_create", self, "_on_message_create")
	bot.login()


func _on_bot_ready(bot: DiscordBot):
	bot.set_presence({"activity": {"type": "Game", "name": "Creating imagery"}})
	print("Logged in as " + bot.user.username + "#" + bot.user.discriminator)
	print("Listening on " + str(bot.channels.size()) + " channels and " + str(bot.guilds.size()) + " guilds.")


func _on_message_create(bot: DiscordBot, message: Message, _channel: Dictionary):
	var split = message.content.split(" ")
	if message.author.bot or not prefix in split[0]:
		return
	var res
	if message.content.find("```") != -1:
		var reg := compile("```([\\s\\S]+)```")
		res = reg.search(message.content)
	elif message.content.find("`") != -1:
		var reg := compile("`([^`]+)`")
		res = reg.search(message.content)
	split.remove(0)
	var code: String = res.strings[1] if res else split.join(" ")
	var lines = code.split("\n")
	if res and lines[0] in ["swift", "py", "c", "c++"]:
		lines.remove(0)
		code = lines.join("\n")

	code = code.strip_edges()
	
	if !code:
		return

	code_view.set_text(code)
	code_view.emit_signal("text_changed")
	viewport.warmup()

	yield(get_tree(), "idle_frame")
	var img: Image = viewport.save()
	bot.reply(
		message, {"files": [{"name": "code.png", "media_type": "image/png", "data": img.save_png_to_buffer()}]}
	)
