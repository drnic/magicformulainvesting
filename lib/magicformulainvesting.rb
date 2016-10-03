require "magicformulainvesting/version"

require "mechanize"

module MagicFormulaInvesting
  extend self
  def run
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

      pp results_rows
      puts results_rows.to_html
    end
  end
end
