fx_version 'cerulean'
author 'D3sTeptu'
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
