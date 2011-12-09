require 'rake/clean'

NAME = "report"
PDF_NAME = "#{NAME}.pdf"
TEX_NAME = "#{NAME}.tex"
TEX_EXEC = "xelatex"

# Cleaning FileLists
CLEAN.include(['**/*.aux', '*.log', '*.out', '*.pyg', '*.bak', '*.toc', '*.bbl', '*.blg', '*.toc'])
CLOBBER.include('*.pdf')

# Dependency FileLists
IMAGES = FileList["images/**/*"]

# Empty file lists shouldn't kill the application.
task "" do end

file PDF_NAME => [TEX_NAME, IMAGES] do
  puts "Building the PDF... [#{TEX_NAME} => #{PDF_NAME}]"
  latex "-shell-escape", "-interaction=nonstopmode", TEX_NAME
  `bibtex #{NAME}`
  latex "-shell-escape", "-interaction=nonstopmode", TEX_NAME
  latex "-shell-escape", "-interaction=nonstopmode", TEX_NAME
end

task :default => [:build, :clean]

desc "Build the document"
task :build => [PDF_NAME]

# Check the document for common errors
task :check => ['check:all']

namespace :check do
  desc "Check the document for common errors"
  task :all => [:duplicates, :passive, :weasel, :syntax, :spell]

  desc "Check the document for syntax errors"
  task :syntax do
    puts "Checking the file for syntax errors... [#{TEX_NAME}]"
    print `lacheck #{TEX_NAME}`
  end

  desc "Check the document for accidental duplicate words"
  task :duplicates do
    puts "Checking the file for duplicate words... [#{TEX_NAME}]"
    print perl "tools/illusion.pl", TEX_NAME
  end

  desc "Check the document for passive speech"
  task :passive do
    puts "Checking the file for passive speech... [#{TEX_NAME}]"
    print bash "tools/passive.sh", TEX_NAME
  end

  desc "Check the document for words which are not useful"
  task :weasel do
    puts "Checking the file for words that aren't needed... [#{TEX_NAME}]"
    print bash "tools/weasel.sh", TEX_NAME
  end

  desc "Spell check the document"
  task :spell do
    puts "Checking the file for spelling mistakes... [#{TEX_NAME}]"
    if command? :aspell
      aspell "check", "--mode=tex", TEX_NAME
    else
      puts ">> aspell not installed, please install it with a useful dictionary."
      puts
      puts "    $ brew install aspell --lang=en"
    end
  end
end

desc "Count the number of words in the document"
task :word_count do
  puts "Counting the words in the document... [#{TEX_NAME}]"
  perl "tools/texcount.pl", TEX_NAME
end
task :count => [:word_count]

desc "Show the document"
task :view => [PDF_NAME] do
  puts "Opening the PDF... [#{PDF_NAME}]"
  ["open", "okular", "kpdf", "acroread"].find do |viewer|
    command viewer, PDF_NAME
  end or
  puts "Unable to find any pdf viewer."
end

# Helper Functions
def command(command_name, *arguments)
  args = arguments.flatten.join(' ')
  `#{command_name} #{args}`
end

def command?(name)
  `which #{name}`
  $?.success?
end

def latex(*args)
  command TEX_EXEC, args
end

def perl(*args)
  sh "perl #{args.flatten.join " "}"
end

def aspell(*args)
  sh "aspell #{args.flatten.join " "}"
end

def bash(*args)
  command "bash", args
end

def os?
  case RUBY_PLATFORM
    when /darwin/i
      :osx
    when /linux/i
      :linux
  end
end

def full_name
  case os?
  when :osx then `osascript -e "long user name of (system info)"`.chomp
  when :linux then `getent passwd $USER | cut -d ":" -f 5 | tr -d ","`.chomp
  end
end

