require 'bundler'
Bundler.require
require 'sqlite3'
require_relative '../lib/song.rb'

require_relative '../lib/student.rb'

DB = {:conn => SQLite3::Database.new("db/students.db")}
