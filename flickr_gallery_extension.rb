# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

require 'open-uri'
require 'activesupport'

class FlickrGalleryExtension < Radiant::Extension
  version "1.0"
  description "Builds a gallery page from Flickr photosets. For use with Thickbox."
  url "http://jon.bandedartists.com/flickr"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :flickr_gallery
  #   end
  # end
  
  def activate
    # admin.tabs.add "Flickr Gallery", "/admin/flickr_gallery", :after => "Layouts", :visibility => [:all]
    Page.send :include, FlickrGallery
  end
  
  def deactivate
    # admin.tabs.remove "Flickr Gallery"
  end
  
end
