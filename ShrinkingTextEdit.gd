class_name ShrinkingTextEdit
extends TextEdit

onready var font: DynamicFont = get_font("font")
var line_spacing
var line_height
var line_count = -1 setget set_line_count
var longest_line: String setget set_longest_line

export(int) var min_line_count := 5
onready var horizontal_min_size := rect_min_size.x - 57


func _ready():
	line_spacing = get_constant("line_spacing")
	line_height = font.get_height() + line_spacing
	connect("text_changed", self, "_on_text_changed")
	emit_signal("text_changed")
	yield(get_tree(), "idle_frame")
	update()


func set_line_count(count):
	if line_count != max(min_line_count, count):
		line_count = max(min_line_count, count)
		rect_min_size.y = (line_count * line_height) + 20
		update()


func set_longest_line(new_longest_line):
	if longest_line != new_longest_line:
		longest_line = new_longest_line
		rect_min_size.x = max(font.get_string_size(longest_line).x, horizontal_min_size) + 57
		update()


func _on_text_changed():
	self.line_count = get_line_count()
	self.longest_line = get_longest_line()


func get_longest_line():
	var longest: String
	for line in text.split("\n"):
		if len(line) > len(longest):
			longest = line
	return longest


func update():
	rect_size = rect_min_size
	.update()
