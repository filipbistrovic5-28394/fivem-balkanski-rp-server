Config = {}

Config.GatheringZones = {
    {
        name = "Skupljanje Trave",
        item = "trava",
        coords = vector3(100.5, 200.3, 70.0),
        requiredPlayers = 3,
        weaponRequired = true,
        duration = 5000,
        reward = 50,
        blip = true,
        markerColor = {0, 255, 0, 100}
    },
    {
        name = "Skupljanje Zlata",
        item = "zlato",
        coords = vector3(200.5, 150.3, 75.0),
        requiredPlayers = 2,
        weaponRequired = false,
        duration = 7000,
        reward = 100,
        blip = true,
        markerColor = {255, 215, 0, 100}
    },
    {
        name = "Skupljanje Droga",
        item = "kokain",
        coords = vector3(300.5, 250.3, 80.0),
        requiredPlayers = 4,
        weaponRequired = true,
        duration = 8000,
        reward = 150,
        blip = true,
        markerColor = {255, 0, 0, 100}
    },
    {
        name = "Rudarenje",
        item = "mineral",
        coords = vector3(400.5, 300.3, 85.0),
        requiredPlayers = 1,
        weaponRequired = false,
        duration = 6000,
        reward = 75,
        blip = true,
        markerColor = {128, 128, 128, 100}
    },
    {
        name = "Ribarenje",
        item = "riba",
        coords = vector3(500.5, 350.3, 5.0),
        requiredPlayers = 1,
        weaponRequired = false,
        duration = 5000,
        reward = 60,
        blip = true,
        markerColor = {0, 0, 255, 100}
    }
}

Config.Items = {
    trava = { label = "Trava", weight = 100 },
    zlato = { label = "Zlato", weight = 50 },
    kokain = { label = "Kokain", weight = 80 },
    mineral = { label = "Mineral", weight = 150 },
    riba = { label = "Riba", weight = 120 }
}