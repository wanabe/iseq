Gem::Specification.new do |s|
  s.name = "iseq"
  s.version = "0.0.1"
  s.platform = "ruby"
  s.summary = "a library for ISeq freaks"

  s.description = <<-EOF
This is a library, by the ISeq freaks, for the ISeq freaks, of the ISeq freaks.
(will be in the future)
  EOF
  s.files = ["README", "README.ja", "LICENSE", "LICENSE.ja", 
             "ext/iseq.c", "ext/extconf.rb"]
  s.extensions = ["ext/extconf.rb"]
end
