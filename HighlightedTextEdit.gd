extends ShrinkingTextEdit
class_name HighlightedTextEdit

const CLASS_COLOR = Color("ffd33682")
const KEYWORD_COLOR = Color("ffb58900")
const SYMBOL_COLOR = Color("ff839496")
const FUNCTION_COLOR = Color("ff268bd2")
const MEMBER_VAR_COLOR = Color("ff268bd2")
const NUMBER_COLOR = Color("ffd33682")
const STRING_COLOR = Color("ff2aa198")
const COMMENT_COLOR = Color("ff586e75")
const NODE_PATH_COLOR = Color("ffd33682")
const FONT_COLOR = Color("ff839496")

const keyword_colors := {
	"if": KEYWORD_COLOR,
	"elif": KEYWORD_COLOR,
	"else": KEYWORD_COLOR,
	"for": KEYWORD_COLOR,
	"while": KEYWORD_COLOR,
	"match": KEYWORD_COLOR,
	"break": KEYWORD_COLOR,
	"continue": KEYWORD_COLOR,
	"pass": KEYWORD_COLOR,
	"return": KEYWORD_COLOR,
	"class": KEYWORD_COLOR,
	"class_name": KEYWORD_COLOR,
	"extends": KEYWORD_COLOR,
	"is": KEYWORD_COLOR,
	"as": KEYWORD_COLOR,
	"self": KEYWORD_COLOR,
	"signal": KEYWORD_COLOR,
	"func": KEYWORD_COLOR,
	"static": KEYWORD_COLOR,
	"const": KEYWORD_COLOR,
	"enum": KEYWORD_COLOR,
	"var": KEYWORD_COLOR,
	"breakpoint": KEYWORD_COLOR,
	"preload": KEYWORD_COLOR,
	"await": KEYWORD_COLOR,
	"yield": KEYWORD_COLOR,
	"assert": KEYWORD_COLOR,
	"void": KEYWORD_COLOR,
	"in": KEYWORD_COLOR,
	"not": KEYWORD_COLOR,
	"and": KEYWORD_COLOR,
	"or": KEYWORD_COLOR,
	"PI": KEYWORD_COLOR,
	"TAU": KEYWORD_COLOR,
	"INF": KEYWORD_COLOR,
	"NAN": KEYWORD_COLOR,
	"null": KEYWORD_COLOR,
	"int": KEYWORD_COLOR,
	"float": KEYWORD_COLOR,
	"bool": KEYWORD_COLOR,
	"super": KEYWORD_COLOR,
	"true": KEYWORD_COLOR,
	"false": KEYWORD_COLOR,
	"AABB": CLASS_COLOR,
	"Array": CLASS_COLOR,
	"Basis": CLASS_COLOR,
	"Color": CLASS_COLOR,
	"Dictionary": CLASS_COLOR,
	"NodePath": CLASS_COLOR,
	"Plane": CLASS_COLOR,
	"PoolByteArray": CLASS_COLOR,
	"PoolColorArray": CLASS_COLOR,
	"PoolIntArray": CLASS_COLOR,
	"PoolRealArray": CLASS_COLOR,
	"PoolStringArray": CLASS_COLOR,
	"PoolVector2Array": CLASS_COLOR,
	"PoolVector3Array": CLASS_COLOR,
	"Quat": CLASS_COLOR,
	"RID": CLASS_COLOR,
	"Rect2": CLASS_COLOR,
	"String": CLASS_COLOR,
	"Transform": CLASS_COLOR,
	"Transform2D": CLASS_COLOR,
	"Variant": CLASS_COLOR,
	"Vector2": CLASS_COLOR,
	"Vector3": CLASS_COLOR,
	"ClassDB": CLASS_COLOR,
}


func _ready():
	for keyword in keyword_colors:
		add_keyword_color(keyword, keyword_colors[keyword])

	for cls in ClassDB.get_class_list():
		add_keyword_color(cls, CLASS_COLOR)

	add_color_region('"', '"', STRING_COLOR, false)
	add_color_region("'", "'", STRING_COLOR, false)
	add_color_region("$", " ", NODE_PATH_COLOR, true)
	add_color_region("#", "", COMMENT_COLOR, true)

	add_color_override("font_color", FONT_COLOR)
	add_color_override("function_color", FUNCTION_COLOR)
	add_color_override("member_variable_color", MEMBER_VAR_COLOR)
	add_color_override("number_color", NUMBER_COLOR)
	add_color_override("symbol_color", SYMBOL_COLOR)


func _resized():
	pass  # Replace with function body.
