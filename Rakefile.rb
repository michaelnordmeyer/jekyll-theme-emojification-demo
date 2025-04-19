# frozen_string_literal: true

## Deployment settings
base_url = `yq '.url += .baseurl' _config.yml | grep -E '^url:' | cut -d' ' -f2 | cut -c9- | tr -d '\n'`
if base_url == ""
  puts "Error: base_url cannot be determined"
  exit!(1)
end
ssh_domain = "michaelnordmeyer.com"
ssh_port = 1111
ssh_user = "root"
ssh_path = "/var/www/#{base_url}/"

task :default => ["build"]

desc "Creates a draft from a template with an UUID"
task :draft do
  puts "==> Creating draft..."
  sh 'sed "s/uuid:/uuid: $(uuidgen)/" _drafts/_.md > _drafts/$(date +%Y-%m-%d-%H-%M-%S).md'
end

desc "Builds the robots.txt"
task :robots do
  puts "==> Building #{base_url} robots.txt..."
  sh "printf 'Sitemap: https://#{base_url}/sitemap.xml\\n\\n' > robots.txt"
  sh "cat ../../../michaelnordmeyer.com/robots.txt >> robots.txt"
end

desc "Builds the feed icon"
task :feedicon do
  puts "==> Building #{base_url} feed icon..."
  sh "cp _site/assets/icons/$(yq '.favicon' < _config.yml) _site/assets/icons/$(yq '.feed.icon' < _config.yml)"
end

desc "Beautifies kramdown output"
task :beautify do
  puts "==> Beautifying #{base_url} kramdown output..."
  sh "for file in _site/*.html _site/**/*.html; do sed -i '' -E 's,<((br|hr|img|link|meta).*) />,<\\1>,g' ${file}; done"
  sh "for file in _site/*.html _site/**/*.html; do sed -i '' -E 's/ class=\"footnotes?\"//g' ${file}; done"
  sh "for file in _site/*.html _site/**/*.html; do sed -i '' 's/ class=\"reversefootnote\"//g' ${file}; done"
end

desc "Builds the site for deployment"
task :build do
  Rake::Task[:robots].invoke
  puts "==> Building #{base_url}..."
  sh "JEKYLL_ENV=\"production\" bundle exec jekyll build"
  Rake::Task[:feedicon].invoke
  Rake::Task[:beautify].invoke
end

desc "Serves the site locally"
task :serve do
  Rake::Task[:robots].invoke
  puts "==> Building and serving #{base_url} locally..."
  sh "bundle exec jekyll serve"
end

desc "Syncs the content of ./_site to the server via rsync"
task :rsync do
  puts "==> Rsyncing #{base_url}'s content to SSH host #{ssh_domain}"
  sh "rsync -e 'ssh -p #{ssh_port}' -vcrlptDShP --delete --rsync-path 'sudo -u root rsync' --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r \
    --exclude=.DS_Store \
    --exclude=._* \
    --exclude=.git \
    --exclude=.gitignore \
    _site/ \
    #{ssh_user}@#{ssh_domain}:#{ssh_path}"
end

desc "Copies robots.txt to the server via scp"
task :scprobots do
  puts "==> Scp’ing #{base_url} robots.txt to SSH host #{ssh_domain}"
  sh "scp -P #{ssh_port} robots.txt #{ssh_user}@#{ssh_domain}:#{ssh_path}"
end

desc "Gzips the site via SSH"
task :gzip do
  puts "==> Gzip'ing #{base_url} via SSH..."
  sh "ssh -p #{ssh_port} #{ssh_user}@#{ssh_domain} 'for file in $(find #{ssh_path} -type f -name \"*.html\" -o -name \"*.css\" -o -name \"*.css.map\" -o -name \"*.js\" -o -name \"*.svg\" -o -name \"*.xml\" -o -name \"*.xsl\" -o -name \"*.xslt\" -o -name \"*.json\" -o -name \"*.txt\"); do printf . && gzip -kf \"${file}\"; done; echo'"
end

desc "Gzips robots.txt via SSH"
task :gziprobots do
  puts "==> Gzip'ing #{base_url} robots.txt via SSH..."
  sh "ssh -p #{ssh_port} #{ssh_user}@#{ssh_domain} 'gzip -kf #{ssh_path}robots.txt'"
end

desc "Builds and deploys the site"
task :deploy do
  puts "==> Building and deploying #{base_url}..."
  Rake::Task[:build].invoke
  Rake::Task[:rsync].invoke
  Rake::Task[:gzip].invoke
  Rake::Task[:clean].invoke
end

desc "Builds and deploys the robots.txt"
task :deployrobots do
  puts "==> Building and deploying #{base_url} robots.txt..."
  Rake::Task[:robots].invoke
  Rake::Task[:scprobots].invoke
  Rake::Task[:gziprobots].invoke
end

desc "Cleans the source dir"
task :clean do
  puts "==> Cleaning #{base_url}..."
  sh "bundle exec jekyll clean"
end
