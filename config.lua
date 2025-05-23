Config = {}

Config.NPCLocation = vector4(-19.64, -1086.52, 25.6, 338.4)
Config.DeliveryPoint = vector3(-15.53, -1081.59, 26.67)

Config.Vehicles = {
    {
        car = "sultan",
        label = "Sultan",
        reward = 5000,
        image = "https://cdn.discordapp.com/attachments/965224075914002482/1370121180127952917/image.png?ex=681e5848&is=681d06c8&hm=84d5e891224bb3d59c9278b92de67556114d19f150254cf89c364659dd95231b&"
    },
    {
        car = "kuruma",
        label = "Kuruma",
        reward = 6000,
        image = "https://cdn.discordapp.com/attachments/965224075914002482/1370121054546296842/image.png?ex=681e582b&is=681d06ab&hm=f3c096d7c89d9635f3d45901ab0423185e96d24b68b9157fbb0dbf119b0f2645&"
    },
    {
        car = "banshee",
        label = "Banshee",
        reward = 8000,
        image = "https://cdn.discordapp.com/attachments/965224075914002482/1370120844260544552/image.png?ex=681e57f8&is=681d0678&hm=4e94d4e8befef1d1f7322396255b468b458000bfc84b10b151d4ac03ad83f1ae&"
    },
}


Config.RandomSpawns = {
    vector4(250.0, -800.0, 30.0, 180.0),
    vector4(-400.0, 1200.0, 325.0, 270.0),
    vector4(-1000.0, -200.0, 37.0, 0.0),
    -- Add more as desired
}


-- DO NOT TOUCH ANYTHING BELOW THIS POINT

Config.Colors = {
    [0] = "Metallic Black", [1] = "Metallic Graphite Black", [2] = "Metallic Black Steal", [3] = "Metallic Dark Silver",
    [4] = "Metallic Silver", [5] = "Metallic Blue Silver", [6] = "Metallic Steel Gray", [7] = "Metallic Shadow Silver",
    [8] = "Metallic Stone Silver", [9] = "Metallic Midnight Silver", [10] = "Metallic Gun Metal", [11] = "Metallic Anthracite Grey",
    [12] = "Matte Black", [13] = "Matte Gray", [14] = "Matte Light Grey", [15] = "Util Black", [16] = "Util Black Poly",
    [17] = "Util Dark Silver", [18] = "Util Silver", [19] = "Util Gun Metal", [20] = "Util Shadow Silver", [21] = "Worn Black",
    [22] = "Worn Graphite", [23] = "Worn Silver Grey", [24] = "Worn Silver", [25] = "Worn Blue Silver", [26] = "Worn Shadow Silver",
    [27] = "Metallic Red", [28] = "Metallic Torino Red", [29] = "Metallic Formula Red", [30] = "Metallic Blaze Red",
    [31] = "Metallic Graceful Red", [32] = "Metallic Garnet Red", [33] = "Metallic Desert Red", [34] = "Metallic Cabernet Red",
    [35] = "Metallic Candy Red", [36] = "Metallic Sunrise Orange", [37] = "Metallic Classic Gold", [38] = "Metallic Orange",
    [39] = "Matte Red", [40] = "Matte Dark Red", [41] = "Matte Orange", [42] = "Matte Yellow", [43] = "Util Red",
    [44] = "Util Bright Red", [45] = "Util Garnet Red", [46] = "Worn Red", [47] = "Worn Golden Red", [48] = "Worn Dark Red",
    [49] = "Metallic Dark Green", [50] = "Metallic Racing Green", [51] = "Metallic Sea Green", [52] = "Metallic Olive Green",
    [53] = "Metallic Green", [54] = "Metallic Gasoline Blue Green", [55] = "Matte Lime Green", [56] = "Util Dark Green",
    [57] = "Util Green", [58] = "Worn Dark Green", [59] = "Worn Green", [60] = "Worn Sea Wash", [61] = "Metallic Midnight Blue",
    [62] = "Metallic Dark Blue", [63] = "Metallic Saxony Blue", [64] = "Metallic Blue", [65] = "Metallic Mariner Blue",
    [66] = "Metallic Harbor Blue", [67] = "Metallic Diamond Blue", [68] = "Metallic Surf Blue", [69] = "Metallic Nautical Blue",
    [70] = "Metallic Bright Blue", [71] = "Metallic Purple Blue", [72] = "Metallic Spinnaker Blue", [73] = "Metallic Ultra Blue",
    [74] = "Metallic Bright Blue", [75] = "Util Dark Blue", [76] = "Util Midnight Blue", [77] = "Util Blue", [78] = "Util Sea Foam Blue",
    [79] = "Util Lightning blue", [80] = "Util Maui Blue Poly", [81] = "Util Bright Blue", [82] = "Matte Dark Blue", [83] = "Matte Blue",
    [84] = "Matte Midnight Blue", [85] = "Worn Dark blue", [86] = "Worn Blue", [87] = "Worn Light blue", [88] = "Metallic Taxi Yellow",
    [89] = "Metallic Race Yellow", [90] = "Metallic Bronze", [91] = "Metallic Yellow Bird", [92] = "Metallic Lime",
    [93] = "Metallic Champagne", [94] = "Metallic Pueblo Beige", [95] = "Metallic Dark Ivory", [96] = "Metallic Choco Brown",
    [97] = "Metallic Golden Brown", [98] = "Metallic Light Brown", [99] = "Metallic Straw Beige", [100] = "Metallic Moss Brown",
    [101] = "Metallic Biston Brown", [102] = "Metallic Beechwood", [103] = "Metallic Dark Beechwood", [104] = "Metallic Choco Orange",
    [105] = "Metallic Beach Sand", [106] = "Metallic Sun Bleeched Sand", [107] = "Metallic Cream", [108] = "Util Brown",
    [109] = "Util Medium Brown", [110] = "Util Light Brown", [111] = "Metallic White", [112] = "Metallic Frost White",
    [113] = "Worn Honey Beige", [114] = "Worn Brown", [115] = "Worn Dark Brown", [116] = "Worn straw beige", [117] = "Brushed Steel",
    [118] = "Brushed Black steel", [119] = "Brushed Aluminium", [120] = "Chrome", [121] = "Worn Off White", [122] = "Util Off White",
    [123] = "Worn Orange", [124] = "Worn Light Orange", [125] = "Metallic Securicor Green", [126] = "Worn Taxi Yellow",
    [127] = "police car blue", [128] = "Matte Green", [129] = "Matte Brown", [130] = "Worn Orange", [131] = "Matte White",
    [132] = "Worn White", [133] = "Worn Olive Army Green", [134] = "Pure White", [135] = "Hot Pink", [136] = "Salmon pink",
    [137] = "Metallic Vermillion Pink", [138] = "Orange", [139] = "Green", [140] = "Blue", [141] = "Metalic Black Blue",
    [142] = "Metallic Black Purple", [143] = "Metallic Black Red", [144] = "hunter green", [145] = "Metallic Purple",
    [146] = "Metaillic V Dark Blue", [147] = "MODSHOP BLACK1", [148] = "Matte Purple", [149] = "Matte Dark Purple",
    [150] = "Metallic Lava Red", [151] = "Matte Forest Green", [152] = "Matte Olive Drab", [153] = "Matte Desert Brown",
    [154] = "Matte Desert Tan", [155] = "Matte Foilage Green", [156] = "DEFAULT ALLOY COLOR", [157] = "Epsilon Blue",
    [158] = "Pure Gold", [159] = "Brushed Gold"
}

