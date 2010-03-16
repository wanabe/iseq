files = `git diff master@{-1}..HEAD --name-only`.split("\n")
files.delete_if do |name|
  case name 
  when $0, /\.gem(spec)?$/, ".gitignore"
    true
  else
    false
  end
end
open("files", "w") do |w|
  w.puts files
end
