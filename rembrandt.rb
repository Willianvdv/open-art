require 'RMagick'
require 'yaml'
require 'color_porter'

include Magick

class Rembrandt
  def initialize
    @canvas = Image.new(300, 300) { self.background_color = "white" }
  end

  def paint
    puts "Let's paint"
    pixels.each do |row, column, color|
      Magick::Draw.new.fill("\##{color}")
                      .point(row, column)
                      .draw(@canvas)
    end

    @canvas.write('painting.gif')
    puts 'Done! Now open painting.gif to see the result'
  end

  private

  def pixels
    pixels = []
    pixel_files.each do |pixel_file|
      pixel_data = YAML.load_file(pixel_file)

      # Iterate over every row
      pixel_data.each do |row, columns|
        row_number = row.gsub('row_', '').to_i

        # Iterate over every column in the row
        columns.each do |column, color|
          column_number = column.gsub('column_', '').to_i
          pixels << [row_number, column_number, color]
        end
      end
    end

    pixels
  end

  def pixel_files
    Dir["canvas/**.yaml"]
  end
end

rembrandt = Rembrandt.new
rembrandt.paint
