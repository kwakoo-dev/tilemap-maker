class_name Chunks
extends RefCounted

var top_left : Rect2i
var top : Rect2i
var top_right : Rect2i

var left : Rect2i
var center : Rect2i
var right : Rect2i

var bottom_left : Rect2i
var bottom : Rect2i
var bottom_right : Rect2i

var out_top_left : Rect2i
var out_top_right : Rect2i
var out_bottom_left : Rect2i
var out_bottom_right : Rect2i

static func get_chunks(chunks_size : Vector2i) -> Chunks:
	var chunks : Chunks = Chunks.new()
	
	chunks.top_left = get_region_at(0, 0, chunks_size)
	chunks.top = get_region_at(1, 0, chunks_size)
	chunks.top_right = get_region_at(2, 0, chunks_size)
	
	chunks.left = get_region_at(0, 1, chunks_size)
	chunks.center = get_region_at(1, 1, chunks_size)
	chunks.right = get_region_at(2, 1, chunks_size)
	
	chunks.bottom_left = get_region_at(0, 2, chunks_size)
	chunks.bottom = get_region_at(1, 2, chunks_size)
	chunks.bottom_right = get_region_at(2, 2, chunks_size)
	
	chunks.out_top_left = get_region_at(3, 0, chunks_size)
	chunks.out_top_right = get_region_at(4, 0, chunks_size)
	chunks.out_bottom_left = get_region_at(3, 1, chunks_size)
	chunks.out_bottom_right = get_region_at(4, 1, chunks_size)
	return chunks

static func get_region_at(x : int, y : int, chunks_size : Vector2i) -> Rect2i:
	return Rect2i(x * chunks_size.x, y * chunks_size.y, chunks_size.x, chunks_size.y)
