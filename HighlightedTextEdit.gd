extends ShrinkingTextEdit
class_name HighlightedTextEdit

const BUILTIN_COLOR = Color("ffd33682")
const KEYWORD_COLOR = Color("ffb58900")
const SYMBOL_COLOR = Color("ff839496")
const FUNCTION_COLOR = Color("ff268bd2")
# const FUNC_DEF_COLOR = Color("ff2aa198")
const MEMBER_VAR_COLOR = Color("ff268bd2")
const NUMBER_COLOR = Color("ffd33682")
const STRING_COLOR = Color("ff2aa198")
const COMMENT_COLOR = Color("ff586e75")
const NODE_PATH_COLOR = Color("ffd33682")
const FONT_COLOR = Color("ff839496")


const keywords = 'and in not or self void as assert breakpoint class class_name extends is func setget signal tool yield const enum export onready static var break continue if elif else for pass return match while remote sync master puppet remotesync mastersync puppetsync'
const literals = 'null true false'
const builtin = 'Color8 ColorN abs acos asin atan atan2 bytes2var cartesian2polar ceil char clamp convert cos cosh db2linear decimals dectime deg2rad dict2inst ease exp floor fmod fposmod funcref get_stack hash inst2dict instance_from_id inverse_lerp is_equal_approx is_inf is_instance_valid is_nan is_zero_approx len lerp lerp_angle linear2db load log max min move_toward nearest_po2 ord parse_json polar2cartesian posmod pow preload print_stack push_error push_warning rad2deg rand_range rand_seed randf randi randomize range_lerp round seed sign sin sinh smoothstep sqrt step_decimals stepify str str2var tan tanh to_json type_exists typeof validate_json var2bytes var2str weakref wrapf wrapi bool int float String NodePath Vector2 Rect2 Transform2D Vector3 Rect3 Plane Quat Basis Transform Color RID Object NodePath Dictionary Array PoolByteArray PoolIntArray PoolRealArray PoolStringArray PoolVector2Array PoolVector3Array PoolColorArray'

func _ready():
	for keyword in keywords.split(" "):
		add_keyword_color(keyword, KEYWORD_COLOR)

	for builtin in builtin.split(" "):
		add_keyword_color(builtin, BUILTIN_COLOR)
	
	for literal in literals.split(" "):
		add_keyword_color(literal, KEYWORD_COLOR)

	for cls in ClassDB.get_class_list():
		add_keyword_color(cls, BUILTIN_COLOR)

	add_color_region('"', '"', STRING_COLOR, false)
	add_color_region("'", "'", STRING_COLOR, false)
	add_color_region("$", " ", NODE_PATH_COLOR, true)
	add_color_region("#", "", COMMENT_COLOR, true)

	# add_color_region("func", ":", FUNC_DEF_COLOR)

	add_color_override("font_color", FONT_COLOR)
	add_color_override("function_color", FUNCTION_COLOR)
	add_color_override("member_variable_color", MEMBER_VAR_COLOR)
	add_color_override("number_color", NUMBER_COLOR)
	add_color_override("symbol_color", SYMBOL_COLOR)
