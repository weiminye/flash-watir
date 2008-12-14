module FireWatir
  class ScriptUtils
    class << self
      def createJSPrefix_document(flashObjectId)
        return "document[\'" + flashObjectId + "\'].";
      end
      
      def jsForFunction(what,functionName, *args)
        flashJSStringPrefix = createJSPrefix_document(what)
        functionArgs = ""
        if args.empty?
          return flashJSStringPrefix + functionName + "();"
        end
        args.each do | arg |
          functionArgs = functionArgs + "'" + arg.to_s + "',"
        end
        functionArgs = functionArgs[0..(functionArgs.length - 2)]
        return flashJSStringPrefix + functionName + "(" + functionArgs + ");"
      end    
    end
  end
end