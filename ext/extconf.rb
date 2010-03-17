require "mkmf"

# $defs = ["-D_MSC_VER=1200"]
# $LDFLAGS += " msvcrt_winxp.obj"

if RUBY_VERSION >= "1.9.0" && 
   defined?(RUBY_ENGINE) &&
   RUBY_ENGINE == "ruby"
  #$defs ||= []
  load_api = \
  if RUBY_VERSION < "1.9.1"
    $CFLAGS += " -DOLD_ISEQ_LOAD"
    "rb_iseq_load"
  elsif RUBY_VERSION < "1.9.2"
    "ruby_iseq_load"
  else
    "rb_iseq_load"
  end
  $CFLAGS += " -DISEQ_LOAD=#{load_api}"
  create_makefile("iseq")
end
