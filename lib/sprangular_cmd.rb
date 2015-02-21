require "sprangular_cmd/version"
require 'thor'
require 'thor/group'

case ARGV.first
  when nil, 'help', '-h', '--help', '-?'
    puts <<-EOS
sprangular - a tool for creating sprangular gems

version:\t display version (alias: -v, --version)
help:\t\t display help (alias: -h, --help)
extension:\t create an extension (arguments: <extension-name>)
install:\t install sprangular (arguments: <site-name>)
EOS
  when 'version', '-v', '--version'
    puts SprangularCmd::VERSION
  when 'extension'
    ARGV.shift
    require 'sprangular_cmd/extension'
    SprangularCmd::Extension.start
  else
    ARGV.shift
    require 'sprangular_cmd/installer'
    SprangularCmd::Installer.start
end
