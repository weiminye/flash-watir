module FireWatir
  class Flash
    TAG = "OBJECT"
    def initialize(container,how,what)
      @container = container
      @how = how
      @what = what
    end
    
    # standard flash methods and properties
    
    #Used for assert_flash_exist. So this method will have duplication
    def percent_loaded()
      @container.assert_exist unless @container.is_a? FireWatir::Firefox
      code_to_execute = ScriptUtils.jsForFunction(@what,"PercentLoaded")
      begin
        @container.js_eval(code_to_execute)
      rescue TypeError => ex
        raise Watir::Exception::UnknownObjectException.new(
                                       Watir::Exception.message_for_unable_to_locate(@how, @what))
      end
    end
    
    def is_playing?
      result = process_request("IsPlaying")
      return true if result.eql? "true"
      return false if result.eql? "false"
      return result
    end
    
    def get_variable(varName)
      return process_request("GetVariable", varName)
    end
    
    def goto_frame(value)
      return process_request("GotoFrame", value)
    end
    
    def load_movie(layerNumber, url)
      return process_request("LoadMovie", layerNumber, url)
    end
    
    def pan(x, y, mode)
      return process_request("Pan", x, y, mode)
    end
    
    def play()
      return process_request("Play")
    end
    
    def rewind()
      return process_request("Rewind")
    end
    
    def set_variable(name, value)
      return process_request("SetVariable", name, value)
    end
    
    def set_zoom_rect(left, top, right, bottom)
      return process_request("SetZoomRect", left, top, right, bottom)
    end
    
    def stop_play()
      return process_request("StopPlay")
    end
    
    def total_frames()
      return process_request("TotalFrames")
    end
    
    def zoom(percent)
      return process_request("Zoom", percent)
    end
    
    # For executing custom methods in flash exposed through ExternalInterface
    def method_missing(method,*args)
      return process_request(method,*args)
    end
    
    def process_request(method,*args)
       code_to_execute = ScriptUtils.jsForFunction(@what,method.to_s,*args)
       return execute(code_to_execute)      
     end
    
    def execute(code)
      @container.assert_exist unless @container.is_a? FireWatir::Firefox #Hack -- Else it fails on the javascript execution. Need to investigate
      assert_flash_exist
      begin
        return_value = @container.js_eval(code)
      rescue TypeError => ex
        raise NoMethodError.new("Unable to execute the method on flash #{code}")
      end
    end
    
    def assert_flash_exist
      self.percent_loaded
    end
    
    #Check if flash element exists.
    def exist?
      begin
        assert_flash_exist
      rescue
        return false
      end
      return true
    end
  end
end