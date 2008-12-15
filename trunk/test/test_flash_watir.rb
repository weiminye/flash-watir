topdir = File.join(File.dirname(__FILE__), '..')
flash_watir_dev_lib = File.join(topdir, 'lib')
$LOAD_PATH.unshift flash_watir_dev_lib

require "test/unit"
require "flash_watir"

class FlashWatirTests < Test::Unit::TestCase
  include FireWatir
  def setup
    @browser = Firefox.new
  end
  def test_should_give_initial_text_for_rectangle
    @browser.goto "http://localhost/wtrFlash/colors.html"
    assert_equal("(Click here)",@browser.flash(:id, "clickcolors").getSquareLabel)
  end
  def test_should_return_color_of_rectangle
    @browser.goto "http://localhost/wtrFlash/colors.html"
    assert_equal("GREEN", @browser.flash(:id, "clickcolors").getColor)
    @browser.flash(:id, "clickcolors").click
    assert_equal("BLUE", @browser.flash(:id, "clickcolors").getColor)
    @browser.flash(:id, "clickcolors").click
    assert_equal("RED", @browser.flash(:id, "clickcolors").getColor)
    @browser.flash(:id, "clickcolors").click
    assert_equal("GREEN", @browser.flash(:id, "clickcolors").getColor)    
  end
  def test_should_return_color_of_rectangle_inside_frame
    @browser.goto "http://localhost/wtrFlash/nestedFrames.html"
    assert_equal("GREEN", @browser.frame(:id, "ns2").flash(:id,'clickcolors').getColor)
    @browser.frame(:id, "ns2").flash(:id,'clickcolors').click
    assert_equal("BLUE", @browser.frame(:id, "ns2").flash(:id,'clickcolors').getColor)
    @browser.frame(:id, "ns2").flash(:id,'clickcolors').click
    assert_equal("RED", @browser.frame(:id, "ns2").flash(:id,'clickcolors').getColor)
  end
  def test_should_validate_all_the_default_methods
    @browser.goto "http://localhost/wtrFlash/colors.html"
    assert_equal("100",@browser.flash(:id, "clickcolors").percent_loaded)
    assert_equal(false, @browser.flash(:id, "clickcolors").is_playing?)
  end
  def test_should_throw_exceptions
    @browser.goto "http://localhost/wtrFlash/colors.html"
    assert_raise(UnknownObjectException){@browser.flash(:id,"nonexistant").percent_loaded}
    assert_raise(NoMethodError){@browser.flash(:id,"clickcolors").no_method_available}
  end
  def test_should_check_if_flash_element_exist
    @browser.goto "http://localhost/wtrFlash/colors.html"
    assert_equal(true,@browser.flash(:id,"clickcolors").exist?)
    assert_equal(false,@browser.flash(:id,"noflash").exist?)
  end
  def teardown
    @browser.close
  end  
end