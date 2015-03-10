require 'sinatra'
require 'rss'
require 'open-uri'

get '/' do
  required = %w(JENKINS_HOST JENKINS_USER JENKINS_KEY)
  required.each do |req|
    raise RuntimeError.new("Required ENV variables: #{required}") if ENV[req].nil?
    return
  end

  @result = {
    jobs: [],
    unstable: 0,
    stable: 0,
    broken: 0,
    unknown: 0
  }

  open(
    "#{ENV['JENKINS_HOST']}/rssLatest",
    http_basic_authentication: [ENV['JENKINS_USER'], ENV['JENKINS_KEY']]
  ) do |rss|
    feed = RSS::Parser.parse(rss)

    @result[:title] = 'Latest Build Statuses'

    feed.items.each do |item|
      matches = /^(.+)\s(#\d+)\s\((.+)\)$/.match(item.title.content)
      next unless matches

      job_name     = matches[1]
      build_no     = matches[2]
      build_status = matches[3]

      case build_status
      when /unstable/
        colour = 'yellow'
        @result[:unstable] += 1
      when /stable/
        colour = 'green'
        @result[:stable] += 1
      when /back to normal/
        colour = 'blue'
        @result[:stable] += 1
      when /broken/
        colour = 'red'
        @result[:broken] += 1
      else
        colour = 'unknown'
        @result[:unknown] += 1
      end

      @result[:jobs] << {
        job_name: job_name,
        build_status: build_status,
        build_no: build_no,
        klass: colour
      }
    end

    @result[:result_string] = [
      "Stable: #{@result[:stable]}",
      "Broken: #{@result[:broken]} (#{@result[:unstable]} Unstable)",
      "Unknown: #{@result[:unknown]}"
    ].join(', ')

    erb :main
  end
end

error do
  @message = env['sinatra.error'].message
  erb :error
end
