name              'chef_repo'
maintainer        'Granics Inc.'
maintainer_email  'Nathan Holland <nathanh@granicus.com>'
license           'All Rights Reserved'
description       'Installs/Configures chef_repo'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'
depends           'application', '>= 3.0.0'
depends           'git'
depends           'ruby_build'
depends           'bundler'
depends           'hipchat'