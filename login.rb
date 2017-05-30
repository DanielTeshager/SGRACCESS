require 'rubygems'
require 'mechanize'
require 'csv'


$result = []

  def getWeb
    a = Mechanize.new
    page = a.get('https://sgr.starwoodhotels.com/sgr/home.jsp')
    # Click the login link
    #login_page = a.click(page.link_with(:text => /Log In/))

    # Submit the login form

    form = page.form_with(:action => '/sgr/responseLogin.do')

    form.fields[0].value  = "dteshage"
    form.fields[1].value  = "Kassanesh67"
    $result=form.submit
    sleep(2)

      # res = result.links[32..39]
      # puts res
  end

getWeb()
if $result.links.length>0

  CSV.open("myfile.csv", "w") do |csv|
    csv << $result.links[32..39]
    # ...
  end
  puts $result.links[32..39]

end





# "
#   my_page.links.each do |link|
#     text = link.text.strip
#     next unless text.length > 0
#     puts text
#   end
# end
# "
