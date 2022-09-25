fx_version 'cerulean'
game 'gta5'
description "Advanced OCR System Build-In"
dependencies {
    "yarn",
    "webpack"
}

server_script "server.lua"
client_script "client.lua"

ui_page 'index.html'

files {
	'index.html'
}