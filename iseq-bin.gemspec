require "rbconfig"
Dir.chdir "ext"
Kernel.load("extconf.rb")
system("make")

Dir.chdir ".."
$built = RbConfig::CONFIG["arch"]
Kernel.load("iseq.gemspec")
