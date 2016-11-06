require "net/http"
require "uri"
require "json"

module MagicFormulaInvesting
  class CompanyQuote
    attr_accessor :name
    attr_accessor :ticker
    attr_accessor :market_cap
    attr_accessor :price_from
    attr_accessor :most_recent_quarter_data

    def overview_link
      "https://finance.yahoo.com/quote/#{ticker}"
    end

    def statistics_link
      "https://finance.yahoo.com/quote/#{ticker}/key-statistics?p=#{ticker}"
    end

    def simplywallst_api
      "https://simplywall.st/api/snowflake/US:#{ticker}"
    end

    def simplywallst_weblink
      uri = URI.parse(simplywallst_api)
      response = Net::HTTP.get_response(uri)
      if response.code.to_s == "200"
        if simplywallst_symbol = JSON.parse(response.body)["uniqueSymbol"]
          return "https://simplywall.st/#{simplywallst_symbol}"
        else
          $stderr.puts "API for #{ticker} contained: #{response.body}"
        end
      else
        $stderr.puts "No simplywall.st symbol found for #{ticker}: status #{response.code} for url #{simplywallst_api}"
      end
      ""
    end

    def table_row
      [name, ticker, market_cap, price_from, most_recent_quarter_data, simplywallst_weblink]
    end

  end
end
