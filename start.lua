sudo_LEWN = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local LEWN_dev = io.open("LEWN_online.lua")
if LEWN_dev then
LEWN_on = {string.match(LEWN_dev:read('*all'), "^(.*)/(%d+)")}
local LEWN_file = io.open("sudo.lua", 'w')
LEWN_file:write("token = '" ..LEWN_on[1].."'\n\nsudo_add = "..LEWN_on[2].."" )
LEWN_file:close()
https.request("https://api.telegram.org/bot"..LEWN_on[1].."/sendMessage?chat_id="..LEWN_on[2].."&text=Bot_LEWN_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf LEWN_online.lua')  
os.execute('./tg -s ./LEWN.lua $@ --bot='..LEWN_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ تم\27[m \27[1;34m»»ارسل ايدي المبرمج الاساسي««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ تم\27[m")
local LEWN_file = io.open("sudo.lua", 'w')
LEWN_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
LEWN_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./LEWN.lua $@ --bot='..tokenCk)
else
print("\27[31m»»التوكن غير صحيح , اعد ارسال التوكن««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»ارسل توكن البوت««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_LEWN = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('./tg -s ./LEWN.lua $@ --bot='..token)
else
print("\27[31mالتوكن غير صيح , اعد ارسال التوكن««\27[m")
local token_send = io.read()
chack(token_send)
end
end
