require File.dirname(__FILE__) + '/../spec_helper'

describe 'FlickrGallery' do
  dataset :pages

  describe '<r:flickr_gallery />' do
    
    it 'should render the correct HTML' do
      tag = '<r:flickr_gallery api_key="17e5530ad1cdc6af8dee1d05e91639c9" user_id="31777893@N05" per_page="1" />'

      expected = %{<div class="photoset"><h3>The Original Musical- THE STORY</h3><ul class="gallery"><li><a href="http://farm3.static.flickr.com/2018/3545043442_5705a09a2e.jpg?v=0" class="thickbox" rel="72157618475548626"><img src="http://farm3.static.flickr.com/2018/3545043442_5705a09a2e_s.jpg" alt="p956628810" /></a></li></ul></div>}

      pages(:home).should render(tag).as(expected)
    end
    
    it 'should show a warning if the api_key and user_id are missing' do
      tag = '<r:flickr_gallery />'

      expected = %{<div class="photoset">Missing Flickr API key and/or user ID.</div>}

      pages(:home).should render(tag).as(expected)
    end
    
    
  end
end