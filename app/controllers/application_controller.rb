class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :prepare_meta_tags, if: "request.get?"
  
  def prepare_meta_tags(options={})
    site_name   = "website"
    title       = [controller_name, action_name].join(" ")
    description = "website description"
    image       = options[:image] || "https://via.placeholder.com/80x80"
    current_url = request.url

    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[web software development mobile app],
      twitter: {
        site_name: site_name,
        site: '@xxxxxxxxx',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
  
end
