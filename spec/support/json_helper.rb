# spec/support/request_helpers.rb
def json
  JSON.parse(response.body)
end