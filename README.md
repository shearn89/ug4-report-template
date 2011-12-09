# UG4 Project Report Template

![Lazy College Senior Report](http://i.qkme.me/35g76w.jpg)

## Motivation

Hello Informaticians,

I imagine that a lot of you will be procrastinating actually writing your report because you don't want to have to set up all of the LaTeX kerfuffle that comes with it. I can imagine this because I'm in exactly the same situation and, as such, have procrastinated so much that I've made a report template (based on the one present on the course website). The template also contains related tools to make your report writing that much more fun.

Feel free to fork this project and start adding your wonderful words to the report. I'll be updating the template up until the last procrastination-able moment so be sure to rebase off this branch if you want to get the latest updates. On that note, feel free to contribute back any fixes or changes you'd like to make to the template. There's no license on any of the stuff written so you don't have to do this but I'll be kind of sad if you don't.

Thanks,
Chris

## Rake Commands

* `rake` - This will build the document and clean up any temporary files.
* `rake build` - This will build the document into a PDF.
* `rake view ` - Display the document.

### Checker Tasks

* `rake check` - Check the document for common errors.
* `rake check:duplicates` - Check the document for accidental duplicate words.
* `rake check:passive` - Check the document for passive speech.
* `rake check:spell` - Spell check the document.
* `rake check:syntax` - Check the document for syntax errors.
* `rake check:weasel` - Check the document for words which aren't useful.

### Misc. Tasks

* `rake clean` - Remove any temporary products.
* `rake clobber` - Remove any generated file.
* `rake count` - Count the number of words in the document.