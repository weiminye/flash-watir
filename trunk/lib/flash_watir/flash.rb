module FireWatir
  class Flash
    def initialize(container,how,what)
      @container = container
      @how = how
      @what = what
    end
    
    # standard flash methods and properties
    def percent_loaded()
      return process_request("PercentLoaded")
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
    
    # Custom methods in flash exposed through ExternalInterface
    def method_missing(method,*args)
      return process_request(method,*args)
    end
    
    def process_request(method,*args)
       code_to_execute = ScriptUtils.jsForFunction(@what,method.to_s,*args)
       return execute(code_to_execute)      
    end
    
    def execute(code)
      @container.assert_exist unless @container.is_a? FireWatir::Firefox #Hack -- Else it fails on the javascript execution. Need to investigate
      return @container.js_eval(code)
    end     
  end
end