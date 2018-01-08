require 'rake/testtask'
require 'rubygems/tasks'

Gem::Tasks.new

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*test.rb']
end
desc "Run tests"

task default: :test
