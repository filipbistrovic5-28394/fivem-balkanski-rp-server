Config = {}

Config.PoliceStation = vector3(425.4, -979.5, 29.4)
Config.PoliceBlip = true

Config.PoliceGarage = {
    coords = vector3(425.4, -979.5, 29.4),
    vehicles = {
        {model = 'police', label = 'Police Car'},
        {model = 'police2', label = 'Police Interceptor'},
    }
}

Config.PoliceArmory = {
    coords = vector3(425.4, -979.5, 29.4),
    weapons = {
        {model = 'WEAPON_PISTOL', label = 'Pistol', ammo = 100},
        {model = 'WEAPON_SMG', label = 'SMG', ammo = 250},
        {model = 'WEAPON_CARBINERIFLE', label = 'Carbine Rifle', ammo = 500},
    }
}