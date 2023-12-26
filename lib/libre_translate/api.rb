require_relative "error"

module LibreTranslate
  class Api
    def self.get(path)
      uri = uri_from_path(path)
      body = Net::HTTP.get(uri)
      JSON.parse(body)
    end

    def self.post(path, params = {})
      uri = uri_from_path(path)
      params.merge!({ api_key: LibreTranslate.api_key })

      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
        request = Net::HTTP::Post.new(uri)
        request["Content-Type"] = "application/json"
        request.body = params.to_json
        http.request(request)
      end

      raise_error(response) unless response.code == "200"
      JSON.parse(response.body)
    end

    private

    def self.raise_error(response)
      error_message = JSON.parse(response.body)["error"]
      raise LibreTranslate::Error.new(response.code.to_i, error_message)
    end

    def self.uri_from_path(path)
      URI(LibreTranslate.base_url + path)
    end
  end
end