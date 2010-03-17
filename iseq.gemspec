Kernel.load "mkfiles.rb"

Gem::Specification.new do |s|
  s.name = "iseq"
  s.version = "0.0.2"
  s.author = "wanabe"
  s.email = "s.wanabe@gmail.com"
  s.homepage = "http://github.com/wanabe/iseq"
  s.rubyforge_project = "iseq" # TODO: register rubyforge
  s.required_ruby_version = ">= 1.9"
  s.platform = $built || "ruby"
  s.summary = "a library for ISeq freaks"
  s.has_rdoc = false

  s.description = <<-EOF
This is a library, by the ISeq freaks, for the ISeq freaks, of the ISeq freaks.
(will be in the future)
  EOF
  s.files = IO.readlines("files").each {|name| name.chomp!}

  if $built
    s.files += ["#{$libdir}/iseq.so"]
    #s.require_paths = ["ext"]
  else
    s.extensions = ["ext/extconf.rb"]
  end
end
