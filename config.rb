require 'slim'

compass_config do |config|
  config.output_style = :compact
end
::Compass.configuration.sass_options = { :line_comments => false }

activate :livereload
activate :directory_indexes

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

set :markdown_engine, :redcarpet
set :markdown, :tables => true, :autolink => true, :fenced_code_blocks => true

ignore "assets/img/*.psd"

# Build-specific configuration
configure :build do
  activate :relative_assets
end


activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = "chadzilla"
  deploy.host = "chadzilla.com"
  deploy.path = "/home/chadzilla/ar.chadzilla.com/"
  deploy.after_build = true
end