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


+--- 				Fuzzing and Vulnerability Assessment Suite 			---+
+--- 		    Find   Commons | OWASP | XSS | CSRF | SSRF | Template Injection 		---+



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
    sleep(4)
    if browser.alert.exists?
        puts "[+] Reflection Found - Payload was : #{line}, at URL: #{testurl}"
        browser.alert.close
    end
  end
end
browser.close
