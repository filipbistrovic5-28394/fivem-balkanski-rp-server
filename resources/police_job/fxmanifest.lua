fx_version 'cerulean'
game 'gta5'

author 'Balkanski RP Team'
description 'Police Job System'
version '1.0.0'

shared_scripts {
    '@es_Extended/locale.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

client_scripts {
    'client.lua'
}