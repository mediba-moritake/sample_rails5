require 'octokit'

# branch = "bundle_update_#{Time.now.strftime('%Y_%m_%d')}"
# branch = 'feature/bundle_update'
title = "bundle update #{Time.now.strftime('%Y-%m-%d')}"
body  = 'Auto generated by [TravisCI]'
puts ENV['BRANCH']

client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
client.create_pull_request(
    'mediba-moritake/sample_rails5',
    'master',
    ENV['BRANCH'],
    title,
    body
)
