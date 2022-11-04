files = [
  "ftdetect/haml.vim",
  "ftplugin/haml.vim",
  "ftplugin/sass.vim",
  "ftplugin/scss.vim",
  "indent/haml.vim",
  "indent/sass.vim",
  "indent/scss.vim",
  "syntax/haml.vim",
  "syntax/sass.vim",
  "syntax/scss.vim",
]

desc "Install"
task :install do
  vimfiles = ENV['VIMFILES'] if ENV['VIMFILES']
  vimfiles ||= File.expand_path("~/vimfiles") if RUBY_PLATFORM =~ /(win|w)32$/
  vimfiles ||= File.expand_path("~/.vim")

  puts "Installing haml.vim"
  files.each do |file|
    target_file = File.join(vimfiles, file)
    FileUtils.mkdir_p(File.dirname(target_file))
    FileUtils.cp(file, target_file)
    puts " Copied #{file} to #{target_file}"
  end
end
