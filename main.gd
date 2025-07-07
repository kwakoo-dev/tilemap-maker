extends Control

var image : Image
var input_texture : ImageTexture

var chunk_width : int = 8
var chunk_height : int = 8
var tile_columns : int = 24
var tile_rows : int = 8

var top_left_positions : Array[Vector2i]
var top_positions : Array[Vector2i]
var top_right_positions : Array[Vector2i]
var left_positions : Array[Vector2i]
var center_positions : Array[Vector2i]
var right_positions : Array[Vector2i]
var bottom_left_positions : Array[Vector2i]
var bottom_positions : Array[Vector2i]
var bottom_right_positions : Array[Vector2i]

func _init() -> void:
	top_left_positions = [
		to_image_coords(0, 0),
		to_image_coords(2, 0),
		to_image_coords(16, 0),
		
		to_image_coords(0, 6),
		to_image_coords(2, 6),
	]
	top_positions = [
		to_image_coords(3, 0),
		to_image_coords(4, 0),
		to_image_coords(5, 0),
		to_image_coords(6, 0),
		
		to_image_coords(10, 0),
		to_image_coords(11, 0),
		to_image_coords(12, 0),
		to_image_coords(13, 0),
		
		to_image_coords(17, 0),
		to_image_coords(20, 0),
		to_image_coords(21, 0),
		to_image_coords(22, 0),
		
		to_image_coords(3, 6),
		to_image_coords(4, 6),
		to_image_coords(5, 6),
		to_image_coords(6, 6),
	]
	top_right_positions = [
		to_image_coords(1, 0),
		to_image_coords(7, 0),
		to_image_coords(23, 0),
		
		to_image_coords(1, 6),
		to_image_coords(7, 6),
	]
	left_positions = [
		to_image_coords(0, 1),
		to_image_coords(2, 1),
		to_image_coords(16, 1),
		
		to_image_coords(0, 2),
		to_image_coords(2, 2),
		to_image_coords(8, 2),
		to_image_coords(16, 2),
		
		to_image_coords(0, 3),
		to_image_coords(2, 3),
		to_image_coords(8, 3),
		to_image_coords(16, 3),
		
		to_image_coords(0, 4),
		to_image_coords(2, 4),
		to_image_coords(8, 4),
		
		to_image_coords(8, 5),
		
		to_image_coords(16, 6),
	]
	center_positions = [
		to_image_coords(8, 0),
		to_image_coords(15, 0),
		
		to_image_coords(11, 1),
		to_image_coords(12, 1),
		
		to_image_coords(17, 1),
		to_image_coords(18, 1),
		to_image_coords(19, 1),
		to_image_coords(20, 1),
		to_image_coords(21, 1),
		to_image_coords(22, 1),
		
		to_image_coords(11, 2),
		to_image_coords(12, 2),
		
		to_image_coords(17, 2),
		to_image_coords(19, 2),
		to_image_coords(22, 2),
		
		to_image_coords(9, 3),
		to_image_coords(10, 3),
		to_image_coords(11, 3),
		to_image_coords(12, 3),
		to_image_coords(13, 3),
		to_image_coords(14, 3),
		
		to_image_coords(17, 3),
		to_image_coords(18, 3),
		to_image_coords(22, 3),
		
		to_image_coords(9, 4),
		to_image_coords(10, 4),
		to_image_coords(11, 4),
		to_image_coords(12, 4),
		to_image_coords(13, 4),
		to_image_coords(14, 4),
		
		to_image_coords(17, 4),
		to_image_coords(18, 4),
		to_image_coords(19, 4),
		to_image_coords(20, 4),
		to_image_coords(22, 4),
		
		to_image_coords(11, 5),
		to_image_coords(12, 5),
		
		to_image_coords(17, 5),
		to_image_coords(18, 5),
		to_image_coords(19, 5),
		to_image_coords(21, 5),
		to_image_coords(22, 5),
		
		to_image_coords(11, 6),
		to_image_coords(12, 6),
		
		to_image_coords(17, 6),
		to_image_coords(18, 6),
		to_image_coords(19, 6),
		to_image_coords(20, 6),
		to_image_coords(21, 6),
		to_image_coords(22, 6),
	]
	right_positions = [
		to_image_coords(1, 1),
		to_image_coords(7, 1),
		to_image_coords(23, 1),
		
		to_image_coords(1, 2),
		to_image_coords(7, 2),
		to_image_coords(15, 2),
		
		to_image_coords(1, 3),
		to_image_coords(7, 3),
		to_image_coords(15, 3),
		
		to_image_coords(1, 4),
		to_image_coords(7, 4),
		to_image_coords(15, 4),
		to_image_coords(23, 4),
		
		to_image_coords(15, 5),
		to_image_coords(23, 5),
		
		to_image_coords(23, 6),
	]
	bottom_left_positions = [
		to_image_coords(0, 5),
		to_image_coords(2, 5),
		
		to_image_coords(0, 7),
		to_image_coords(2, 7),
		
		to_image_coords(16, 7),
	]
	bottom_positions = [
		to_image_coords(3, 5),
		to_image_coords(4, 5),
		to_image_coords(5, 5),
		to_image_coords(6, 5),
		
		to_image_coords(3, 7),
		to_image_coords(4, 7),
		to_image_coords(5, 7),
		to_image_coords(6, 7),
		
		to_image_coords(10, 7),
		to_image_coords(11, 7),
		to_image_coords(12, 7),
		to_image_coords(13, 7),
		
		to_image_coords(17, 7),
		to_image_coords(18, 7),
		to_image_coords(19, 7),
		to_image_coords(22, 7),
	]
	bottom_right_positions = [
		to_image_coords(1, 5),
		to_image_coords(7, 5),
		
		to_image_coords(1, 7),
		to_image_coords(7, 7),
		to_image_coords(23, 7),
	
	]

func _on_button_pressed() -> void:
	$FileDialog.popup_centered_ratio()

func _on_file_dialog_file_selected(path: String) -> void:
	image = Image.new()
	image.load(path)
	input_texture = ImageTexture.create_from_image(image)
	$InputPreview.texture = input_texture
	$Generate.disabled = false

func _on_generate_pressed() -> void:
	var chunks : Chunks = Chunks.get_chunks(Vector2i(chunk_width, chunk_height))
	var image_format : Image.Format = image.get_format()
	var output_image : Image = Image.create_empty(tile_columns * chunk_width, tile_rows * chunk_height, false, image_format)
	
	blit_chunks(output_image, chunks.top_left, top_left_positions)
	blit_chunks(output_image, chunks.top, top_positions)
	blit_chunks(output_image, chunks.top_right, top_right_positions)
	
	blit_chunks(output_image, chunks.left, left_positions)
	blit_chunks(output_image, chunks.center, center_positions)
	blit_chunks(output_image, chunks.right, right_positions)
	
	blit_chunks(output_image, chunks.bottom_left, bottom_left_positions)
	blit_chunks(output_image, chunks.bottom, bottom_positions)
	blit_chunks(output_image, chunks.bottom_right, bottom_right_positions)
	
	$OutputPreview.texture =  ImageTexture.create_from_image(output_image)

func blit_chunks(output_image : Image, chunk_coords : Rect2i, target_coords : Array[Vector2i]) -> void:
	for coords in target_coords:
		output_image.blit_rect(image, chunk_coords, coords)

func to_image_coords(x : int, y : int) -> Vector2i:
	return Vector2i(x * chunk_width, y * chunk_height)
