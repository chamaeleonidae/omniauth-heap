require 'bundler/gem_tasks'

desc "Build the gem"
task :build do
  system "gem build omniauth-heap.gemspec"
end

desc "Build and release the gem"
task :release => :build do
  system "gem push omniauth-heap-#{OmniAuth::Heap::VERSION}.gem"
end
