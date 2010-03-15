Gem::Specification.new do |s|
  s.name = "iseq"
  s.version = "0.0.1"
  s.required_ruby_version = ">= 1.9"
  s.platform = $built || "ruby"
  s.summary = "a library for ISeq freaks"

  s.description = <<-EOF
This is a library, by the ISeq freaks, for the ISeq freaks, of the ISeq freaks.
(will be in the future)
  EOF
  s.files = ["README", "README.ja", "LICENSE", "LICENSE.ja", 
             "ext/iseq.c", "ext/extconf.rb"]
  if $built
    s.files += ["#{$libdir}/iseq.so"]
    #s.require_paths = ["ext"]
  else
    s.extensions = ["ext/extconf.rb"]
  end
end
