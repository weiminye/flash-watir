Gem::Specification.new do |s|
  s.name = %q{flash_watir}
  s.version = "1.1.0"

  s.specification_version = 1.2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sai Venkatakrishnan"]
  s.date = %q{2008-12-12}
  s.description = %q{An extension for watir to test flash applications.}
  s.email = %q{saidesertrose2004@gmail.com}
  libs = Dir.glob(["lib/*.rb","lib/*/*.rb"])
  tests = Dir.glob("test/*.rb")
  common_files = Dir.glob("*.rb")
  files = libs << tests << common_files
  s.files = files.flatten
  s.has_rdoc = true
  s.rdoc_options = ["-x", "test", "-x", "lib","--main", "README.rb", "History.rb"]
  s.homepage = %q{http://code.google.com/p/flash-watir/}
  s.require_paths = ["lib","."]
  s.summary = %q{n extension for watir to test flash applications in firefox.}
  s.add_dependency(%q<watir>, [">= 1.6.2"])
end
 
