namespace :application do
  desc 'Rebuilds the whole cache of agreement between members'
  task :update_member_distances_cache => :environment do
    MemberDistance.update_all!
  end

  desc 'Reloads members, offices and electorates from XML files'
  task :reload_member_data, [:xml_data_directory] => :environment do |t, args|
    Rails.logger = ActiveSupport::Logger.new(STDOUT)
    Rails.logger.level = 1
    loader = XMLDataLoader.new(args[:xml_data_directory])
    loader.load_all
  end
end

class PHPEscaping
  # Urgh, add extra HTML escaping that's done in PHP but not Ruby
  def self.escape_html(text)
    text = CGI::escape_html(text)
    text.gsub!('’', '&rsquo;')
    text.gsub('‘', '&lsquo;')
  end
end