files = `git diff first --name-only`.split("\n")
files.delete_if do |name|
  case name 
  when __FILE__, /\.gem(spec)?$/, ".gitignore"
    true
  else
    false
  end
end
open("files", "w") do |w|
  w.puts files
end
