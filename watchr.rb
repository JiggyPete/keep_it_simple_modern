# to run:
# watchr watchr.rb

def alert(msg)
  puts msg
end

watch('lib/.*\.rb')  do |md|
  file_path = md[0]
  alert "Changed: #{file_path}"
  file_path.gsub!( 'lib/', 'spec/' )
  file_path.gsub!( '.rb', '_spec.rb' )
  file_path
  run_spec file_path
end

watch( 'spec/.*_spec\.rb' )  {|md| run_spec md[0] }

def run_spec( file_path )
  start_time = Time.now
  system("clear")
  alert start_time
  alert "Running: #{file_path}"
  system("bundle exec rspec -c #{file_path}")
  alert "Took: #{Time.now - start_time}"
end
