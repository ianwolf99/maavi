require "watir"
usage = <<TEXT


          .         .                                                                             
         ,8.       ,8.                   .8.                   .8. `8.`888b           ,8'  8 8888 
        ,888.     ,888.                 .888.                 .888. `8.`888b         ,8'   8 8888 
       .`8888.   .`8888.               :88888.               :88888. `8.`888b       ,8'    8 8888 
      ,8.`8888. ,8.`8888.             . `88888.             . `88888. `8.`888b     ,8'     8 8888 
     ,8'8.`8888,8^8.`8888.           .8. `88888.           .8. `88888. `8.`888b   ,8'      8 8888 
    ,8' `8.`8888' `8.`8888.         .8`8. `88888.         .8`8. `88888. `8.`888b ,8'       8 8888 
   ,8'   `8.`88'   `8.`8888.       .8' `8. `88888.       .8' `8. `88888. `8.`888b8'        8 8888 
  ,8'     `8.`'     `8.`8888.     .8'   `8. `88888.     .8'   `8. `88888. `8.`888'         8 8888 
 ,8'       `8        `8.`8888.   .888888888. `88888.   .888888888. `88888. `8.`8'          8 8888 
,8'         `         `8.`8888. .8'       `8. `88888. .8'       `8. `88888. `8.`           8 8888 


+--- 				Fuzzing and Vulnerabilities Assessment Suite 			---+
+--- 		    Find   Commons | OWASP | PHP | XSS | CSRF | SSRF | Template Injection	---+
+--- 				Programmer: Haroon Awan / mrharoonawan@gmail.com 		---+
+---						::::Usage::::					---+
+---				  'fuzz' is a string for payload to inject  			---+
+--- 		    Usage1: ruby maavi.rb fuzzpayloads https://www.example.com/?id=fuzz		---+
+--- 		    Usage2: ruby maavi.rb fuzzpayloads https://www.example.com/fuzz	        ---+
+--- 		    Usage3: ruby maavi.rb fuzzpayloads https://www.example.com/index.php/fuzz   ---+
+--- 		    Usage4: ruby maavi.rb fuzzpayloads https://www.example.com/index.php#fuzz   ---+



TEXT
if ARGV.empty?
  puts usage
  exit
end
browser = Watir::Browser.new :firefox
domxssfile = ARGV[0]
victim = ARGV[1]
File.open(domxssfile, "r") do |f|
  f.each_line do |line|
    testurl = victim.sub 'fuzz', line 
    browser.goto testurl
    sleep(2)
    if browser.alert.exists?
        puts "[+] Reflection Found - Payload was : #{line}, at URL: #{testurl}"
        browser.alert.close
    end
  end
end
browser.close
