#encoding: utf-8
# Ruby Script to translate input.svg into a Raphaël
require 'rexml/document'

file = File.new("input.svg")
xml = REXML::Document.new(file)

puts "spainMap ="
xml.elements.to_a("//path").each { |p| puts "  #{p.attributes["id"]}: \"#{p.attributes["d"].gsub(/\s+/,'')}\""}
xml.elements.to_a("//polygon").each { |p| puts "  #{p.attributes["id"]}: \"M#{p.attributes["points"].strip.gsub(/\s+/,'L')}\"" }
xml.elements.to_a("//polyline").each { |p| puts "  #{p.attributes["id"]}: \"M#{p.attributes["points"].strip.gsub(/\s+/,'L')}\"" }