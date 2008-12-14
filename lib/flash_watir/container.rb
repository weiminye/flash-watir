module FireWatir
  module Container
    def flash(how,what)
      return Flash.new(self,how,what)
    end
  end
end