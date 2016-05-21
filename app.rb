require 'gosu'
class Block
  def initialize
    @s = 90; @m = 10
  end

  def colorForBit(bit)
    if  bit == "0"
      Gosu::Color::GRAY
    else
      Gosu::Color::RED
    end
  end

  def drawAtPoint(x,binary_string)
  	x_position = (@s + @m) * 0 + x * (@s * 2 + 3 * @m);
  	x_position_secondo_index = (@s + @m) * 1 + x * (@s * 2 + 3 * @m);
  	blocks_width = @s + @m * 3


    Gosu::draw_rect(x_position,                (@s + @m) * 0, @s, @s, colorForBit(binary_string[0]), 0)
    Gosu::draw_rect(x_position,                (@s + @m) * 1, @s, @s, colorForBit(binary_string[1]), 0)
    Gosu::draw_rect(x_position,                (@s + @m) * 2, @s, @s, colorForBit(binary_string[2]), 0)
    Gosu::draw_rect(x_position,                (@s + @m) * 3, @s, @s, colorForBit(binary_string[3]), 0)
    Gosu::draw_rect(x_position_secondo_index , (@s + @m) * 0, @s, @s, colorForBit(binary_string[4]), 0)
    Gosu::draw_rect(x_position_secondo_index , (@s + @m) * 1, @s, @s, colorForBit(binary_string[5]), 0)
    Gosu::draw_rect(x_position_secondo_index , (@s + @m) * 2, @s, @s, colorForBit(binary_string[6]), 0)
    Gosu::draw_rect(x_position_secondo_index , (@s + @m) * 3, @s, @s, colorForBit(binary_string[7]), 0)

    font = Gosu::Font.new(30)
    font.draw("#{binary_string.to_i(2)}",blocks_width / 2 + x_position,430,0,1,1,Gosu::Color::RED)
  end
end


class MyWindow < Gosu::Window

  def initialize
    super(640, 480)
    self.caption = 'Hello World!'
    @state = true
    
    @values = []

    @blocks = [Block.new(), Block.new(), Block.new()]
  end

  def update
    time = Time.now
    @values[0] = time.hour.to_s(2).rjust(8, "0")
    @values[1] = time.min.to_s(2).rjust(8, "0")
    @values[2] = time.sec.to_s(2).rjust(8, "0")
  end



  def draw
  	puts @blocks.count
    @values.each_with_index { |b, index|
    	@blocks[index].drawAtPoint(index, @values[index])
    }
  end
end

window = MyWindow.new
window.show
