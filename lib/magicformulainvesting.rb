require "magicformulainvesting/version"
require "magicformulainvesting/company_quote"

require "mechanize"
require "terminal-table"

module MagicFormulaInvesting
  extend self
  def run
    company_quotes = []

    agent = Mechanize.new
    agent.get('https://www.magicformulainvesting.com/Account/LogOn') do |login_page|
      page = login_page.form_with(action: '/Account/Logon') do |f|
        f.Email    = ENV['MAGICFORMULA_EMAIL']
        f.Password = ENV['MAGICFORMULA_PASSWORD']
      end.submit

      results_page = page.form_with(action: '/Screening/StockScreening') do |f|
        f.MinimumMarketCap = ENV['MAGICFORMULA_MARKETCAP'] || '50'
        f.radiobuttons_with(name: 'Select30')[0].check
      end.submit

      require "pp"
      results_table = results_page.search("table")[-1]
      results_rows = results_table.search("tbody tr")

      results_rows.each do |row|
        data = row.search("td")
        quote = MagicFormulaInvesting::CompanyQuote.new
        quote.name = data[0].text
        quote.ticket = data[1].text
        quote.market_cap = data[2].text
        quote.price_from = data[3].text
        quote.most_recent_quarter_data = data[4].text
        company_quotes << quote
      end
    end

    table = Terminal::Table.new :headings => ['Name', 'Ticket', 'Market Cap', 'Price From', 'Most Recent Quarter Data']
    company_quotes.each do |quote|
      table << [quote.name, quote.ticket, quote.market_cap, quote.price_from, quote.most_recent_quarter_data]
    end
    puts table
  end
end
