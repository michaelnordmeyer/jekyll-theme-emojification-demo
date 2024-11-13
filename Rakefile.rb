# frozen_string_literal: true

## Deployment settings
domain = "jekyll-theme-emojification.michaelnordmeyer.com"
ssh_domain = "michaelnordmeyer.com"
ssh_port = 1111
ssh_user = "root"
ssh_path = "/var/www/#{domain}/"

task :default => ["build"]

desc "Generate previews"
task :generate do
  puts "==> Generating previews for #{domain}..."
  system "./generate-previews.sh"
end

desc "Creates a draft from a template with an UUID"
task :draft do
  puts "==> Creating draft..."
  system "sed \"s/uuid:/uuid: $(uuidgen)/\" _drafts/_.md > _drafts/$(date +%Y-%m-%d_%H-%M-%S).md"
end

desc "Builds the site"
task :build do
  puts "==> Building #{domain}..."
  system "JEKYLL_ENV=\"production\" bundle exec jekyll build"
  system "cat ../../../michaelnordmeyer.com/robots.txt >> _site/robots.txt"
end

desc "Serves the site locally"
task :serve do
  puts "==> Building and serving #{domain} locally..."
  system "bundle exec jekyll serve"
end

desc "Deploys the content of ./_site to the server via rsync"
task :rsync do
  puts "==> Rsyncing #{domain}'s content to SSH host #{ssh_domain}"
  system "rsync -e 'ssh -p #{ssh_port}' -vcrlptDShP --delete --rsync-path 'sudo -u root rsync' --chmod=Du=rwx,Dgo=rx,Fu=rw,Fgo=r \
    --exclude=.DS_Store \
    --exclude=._* \
    --exclude=.git \
    --exclude=.gitignore \
    _site/ \
    #{ssh_user}@#{ssh_domain}:#{ssh_path}"
  system 'rm -rf _site'
end

desc "Gzips the site via SSH"
task :gzip do
  puts "==> Gzip'ing #{domain} via SSH..."
  system "ssh -p #{ssh_port} #{ssh_user}@#{ssh_domain} 'for file in $(find #{ssh_path} -type f -name \"*.html\" -o -name \"*.css\" -o -name \"*.css.map\" -o -name \"*.js\" -o -name \"*.svg\" -o -name \"*.xml\" -o -name \"*.xsl\" -o -name \"*.xslt\" -o -name \"*.json\" -o -name \"*.txt\"); do printf . && gzip -kf \"${file}\"; done; echo'"
end
