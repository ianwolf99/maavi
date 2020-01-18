require 'colorize'
require "watir"

puts ""
puts "           .         .                                                                             ".cyan
puts "          ,8.       ,8.                   .8.                   .8. `8.`888b           ,8'  8 8888 ".cyan
puts "         ,888.     ,888.                 .888.                 .888. `8.`888b         ,8'   8 8888 ".cyan
puts "        .`8888.   .`8888.               :88888.               :88888. `8.`888b       ,8'    8 8888 ".cyan
puts "       ,8.`8888. ,8.`8888.             . `88888.             . `88888. `8.`888b     ,8'     8 8888 ".cyan
puts "      ,8'8.`8888,8^8.`8888.           .8. `88888.           .8. `88888. `8.`888b   ,8'      8 8888 ".cyan
puts "     ,8' `8.`8888' `8.`8888.         .8`8. `88888.         .8`8. `88888. `8.`888b ,8'       8 8888 ".cyan
puts "    ,8'   `8.`88'   `8.`8888.       .8' `8. `88888.       .8' `8. `88888. `8.`888b8'        8 8888 ".cyan
puts "   ,8'     `8.`'     `8.`8888.     .8'   `8. `88888.     .8'   `8. `88888. `8.`888'         8 8888 ".cyan
puts "  ,8'       `8        `8.`8888.   .888888888. `88888.   .888888888. `88888. `8.`8'          8 8888 ".cyan
puts " .8'         `         `8.`8888. .8'       `8. `88888. .8'       `8. `88888. `8.`           8 8888 ".cyan
puts ""
puts "				Fuzzing and Vulnerabilities Assessment Suite			".underline
puts "		Find Anything Anywhere. Programmer: Haroon Awan / mrharoonawan@gmail.com	".underline
puts ""
puts " ::::Usage::::					".cyan
puts "[>]  Fuzz     : 'fuzz' is a string for payload to inject  			".cyan
puts "[>]  Usage(s) : ruby maavi.rb fuzzpayloads https://www.example.com/?id=fuzz	".cyan
puts "[>]  Usage(s) : ruby maavi.rb fuzzpayloads https://www.example.com/fuzz	        ".cyan
puts "[>]  Usage(s) : ruby maavi.rb fuzzpayloads https://www.example.com/index.php/fuzz ".cyan
puts "[>]  Usage(s) : ruby maavi.rb fuzzpayloads https://www.example.com/index.php#fuzz ".cyan

puts ""
if ARGV.empty?
puts "[>]  Help displayed ".cyan
puts ""
  exit
end

puts "[>]  Starting Auto Injections ".cyan
browser = Watir::Browser.new :firefox
domxssfile = ARGV[0]
victim = ARGV[1]
File.open(domxssfile, "r") do |f|
  f.each_line do |line|
    testurl = victim.sub 'fuzz', line 
    browser.goto testurl
    sleep(2)
	puts "[>]  Saving Assessments Injections Screenshots ".cyan
        screenshot_file = "assessment/assessment-results-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
        browser.driver.save_screenshot(screenshot_file)        
    if browser.alert.exists?
        puts "[+] Reflection Found - Payload was : #{line}, at URL: #{testurl}"
	puts "[>]  Saving XSS Injections Screenshots ".cyan
        screenshot_file = "xss/xss-results-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
        browser.driver.save_screenshot(screenshot_file)        
        browser.alert.close
    end
  end
end
browser.close
