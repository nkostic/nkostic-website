module MetaHelpers
  def site_host
    'http://nenadkostic.com'
  end

  def canonical_url
    host = site_host + '/'
    path = current_page.url.gsub('index.html', '')
    host + path
  end

  def current_type
    if @current_article
      :article
    else
      :page
    end
  end

  def page_title
    separator = ''
    title = ''

    if current_page.path == 'index.html'
      title += current_page.data.title
    else
      title += current_page.data.title + separator if current_page.data.title
    end
  end

  def page_description
    if current_page.data.description
      current_page.data.description
    else
      data.nenad.description
    end
  end

  def og_image
    if current_page.data.share_image
      "http://nenadkostic.com#{current_page.data.share_image}"
    else
      'http://nenadkostic.com/media/images/nenad.jpg'
    end
  end

  def og_type
    if current_type === :article
      'article'
    else
      'website'
    end
  end

  def twitter_image
    if current_page.data.share_image
      "http://nenadkostic.com#{current_page.data.share_image}"
    else
      'http://nenadkostic.com/media/images/nenad.jpg'
    end
  end

  def android_icon(icon)
    image_path(icon).gsub!('/', '\/')
  end
end
