Dir["#{RAILS_ROOT}/app/workers/*.rb"].each { |file| require file }