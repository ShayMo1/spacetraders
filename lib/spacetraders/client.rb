# frozen_string_literal: true

require "faraday"
require "oj"

module Spacetraders
  class Client
    API_ENDPOINT = 'https://api.spacetraders.io/v2/'

    def status
      get
    end

    private

    def conn
      @conn ||= Faraday.new(
        url: API_ENDPOINT,
        headers: {'Content-Type': 'application/json'}
      )
    end

    def get(endpoint: nil, params: {})
      response = conn.get(endpoint, params)
      Oj.load(response.body)
    end
  end
end