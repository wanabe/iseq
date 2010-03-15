require "mkmf"
if RUBY_VERSION >= "1.9.0" && 
   defined?(RUBY_ENGINE) &&
   RUBY_ENGINE == "ruby"
  create_makefile("iseq")
end
