def check_for(program)
  installed = command?(program)
  
  unless installed
    puts ">>> #{program} was not found in your PATH."
    
    locate_output = `locate '*/#{program}'`
    bin_re = Regexp.new("\S*\/bin\/\S*\/#{program}")
    
    puts "    However, the following executables were found that may help:"
    puts "    \t#{locate_output.match(bin_re).to_s}"
    puts
    puts ">>> If no executables were found then you probably haven't"
    puts "    installed something. To Google!"
  end
  
  installed
end

desc "Check your system for missing dependencies"
task :doctor do
  ok = true
  
  ok && check_for(:xelatex)
  ok && check_for(:bibtex)
  ok && check_for(:aspell)
  ok && check_for(:lacheck)
  ok && check_for(:perl)
  
  puts ">>> Looks like you're ready to go!" if ok
end