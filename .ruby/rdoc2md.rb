#https://gist.github.com/teeparham/8a99e308884e1c32735a

require 'rdoc'

converter = RDoc::Markup::ToMarkdown.new
rdoc = File.read(ARGV[0] || 'README.rdoc')
puts converter.convert(rdoc)

