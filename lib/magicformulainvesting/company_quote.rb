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

    def table_row
      [name, ticker, market_cap, price_from, most_recent_quarter_data, overview_link]
    end

  end
end
