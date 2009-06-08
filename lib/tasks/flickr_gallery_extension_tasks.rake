namespace :radiant do
  namespace :extensions do
    namespace :flickr_gallery do
      
      desc "Runs the migration of the Flickr Gallery extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          FlickrGalleryExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          FlickrGalleryExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Flickr Gallery to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from FlickrGalleryExtension"
        Dir[FlickrGalleryExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(FlickrGalleryExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
