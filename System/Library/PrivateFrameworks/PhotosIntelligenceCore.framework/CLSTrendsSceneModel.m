@implementation CLSTrendsSceneModel

- (CLSTrendsSceneModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSTrendsSceneModel *v4;
  CLSTrendsSceneModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSTrendsSceneModel;
  v4 = -[CLSTrendsSceneModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x54)
    {
      if (a3 < 0x50)
      {
        if (a3 < 0x21)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v6 = objc_opt_class();
            *(_DWORD *)buf = 67109378;
            v10 = a3;
            v11 = 2112;
            v12 = v6;
            _os_log_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
          }

          return 0;
        }
        else
        {
          -[CLSTrendsSceneModel setupVersion33](v4, "setupVersion33");
        }
      }
      else
      {
        -[CLSTrendsSceneModel setupVersion80](v4, "setupVersion80");
      }
    }
    else
    {
      -[CLSTrendsSceneModel setupVersion84](v4, "setupVersion84");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSTrendsSceneModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 84);
}

- (void)setupVersion33
{
  CLSSignalNode *v3;
  CLSSignalNode *aircraftNode;
  CLSSignalNode *v5;
  CLSSignalNode *airplaneNode;
  CLSSignalNode *v7;
  CLSSignalNode *birdNode;
  CLSSignalNode *v9;
  CLSSignalNode *flowerNode;
  CLSSignalNode *v11;
  CLSSignalNode *forestNode;
  CLSSignalNode *v13;
  CLSSignalNode *rainbowNode;
  CLSSignalNode *v15;
  CLSSignalNode *skateboardingNode;
  CLSSignalNode *v17;
  CLSSignalNode *skyscraperNode;
  CLSSignalNode *v19;
  CLSSignalNode *snowNode;
  CLSSignalNode *v21;
  CLSSignalNode *sunsetSunriseNode;

  self->_version = 33;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 106, CFSTR("Trend - Aircraft"), 0.64, 0.64, 0.64);
  aircraftNode = self->_aircraftNode;
  self->_aircraftNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 107, CFSTR("Trend - Airplane"), 0.71, 0.71, 0.71);
  airplaneNode = self->_airplaneNode;
  self->_airplaneNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 213, CFSTR("Trend - Bird"), 0.86, 0.86, 0.86);
  birdNode = self->_birdNode;
  self->_birdNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 569, CFSTR("Trend - Flower"), 0.37, 0.37, 0.37);
  flowerNode = self->_flowerNode;
  self->_flowerNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 16, CFSTR("Trend - Forest"), 0.49, 0.49, 0.49);
  forestNode = self->_forestNode;
  self->_forestNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1072, CFSTR("Trend - Rainbow"), 0.85, 0.85, 0.85);
  rainbowNode = self->_rainbowNode;
  self->_rainbowNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1215, CFSTR("Trend - Skateboarding"), 0.87, 0.87, 0.87);
  skateboardingNode = self->_skateboardingNode;
  self->_skateboardingNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 36, CFSTR("Trend - Skyscraper"), 0.54, 0.54, 0.54);
  skyscraperNode = self->_skyscraperNode;
  self->_skyscraperNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1238, CFSTR("Trend - Snow"), 0.85, 0.85, 0.85);
  snowNode = self->_snowNode;
  self->_snowNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1765, CFSTR("Trend - SunsetSunrise"), 0.63, 0.63, 0.63);
  sunsetSunriseNode = self->_sunsetSunriseNode;
  self->_sunsetSunriseNode = v21;

}

- (void)setupVersion80
{
  CLSSignalNode *v3;
  CLSSignalNode *aircraftNode;
  CLSSignalNode *v5;
  CLSSignalNode *airplaneNode;
  CLSSignalNode *v7;
  CLSSignalNode *birdNode;
  CLSSignalNode *v9;
  CLSSignalNode *flowerNode;
  CLSSignalNode *v11;
  CLSSignalNode *forestNode;
  CLSSignalNode *v13;
  CLSSignalNode *rainbowNode;
  CLSSignalNode *v15;
  CLSSignalNode *skateboardingNode;
  CLSSignalNode *v17;
  CLSSignalNode *skyscraperNode;
  CLSSignalNode *v19;
  CLSSignalNode *snowNode;
  CLSSignalNode *v21;
  CLSSignalNode *sunsetSunriseNode;

  self->_version = 80;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 106, CFSTR("Trend - Aircraft"), 0.44, 0.44, 0.44);
  aircraftNode = self->_aircraftNode;
  self->_aircraftNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 107, CFSTR("Trend - Airplane"), 0.55, 0.55, 0.55);
  airplaneNode = self->_airplaneNode;
  self->_airplaneNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 213, CFSTR("Trend - Bird"), 0.43, 0.43, 0.43);
  birdNode = self->_birdNode;
  self->_birdNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 569, CFSTR("Trend - Flower"), 0.23, 0.23, 0.23);
  flowerNode = self->_flowerNode;
  self->_flowerNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 16, CFSTR("Trend - Forest"), 0.68, 0.68, 0.68);
  forestNode = self->_forestNode;
  self->_forestNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1072, CFSTR("Trend - Rainbow"), 0.64, 0.64, 0.64);
  rainbowNode = self->_rainbowNode;
  self->_rainbowNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1215, CFSTR("Trend - Skateboarding"), 0.72, 0.72, 0.72);
  skateboardingNode = self->_skateboardingNode;
  self->_skateboardingNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 36, CFSTR("Trend - Skyscraper"), 0.43, 0.43, 0.43);
  skyscraperNode = self->_skyscraperNode;
  self->_skyscraperNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1238, CFSTR("Trend - Snow"), 0.85, 0.85, 0.85);
  snowNode = self->_snowNode;
  self->_snowNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1765, CFSTR("Trend - SunsetSunrise"), 0.62, 0.62, 0.62);
  sunsetSunriseNode = self->_sunsetSunriseNode;
  self->_sunsetSunriseNode = v21;

}

- (void)setupVersion84
{
  CLSSignalNode *v3;
  CLSSignalNode *aircraftNode;
  CLSSignalNode *v5;
  CLSSignalNode *airplaneNode;
  CLSSignalNode *v7;
  CLSSignalNode *birdNode;
  CLSSignalNode *v9;
  CLSSignalNode *flowerNode;
  CLSSignalNode *v11;
  CLSSignalNode *forestNode;
  CLSSignalNode *v13;
  CLSSignalNode *rainbowNode;
  CLSSignalNode *v15;
  CLSSignalNode *skateboardingNode;
  CLSSignalNode *v17;
  CLSSignalNode *skyscraperNode;
  CLSSignalNode *v19;
  CLSSignalNode *snowNode;
  CLSSignalNode *v21;
  CLSSignalNode *sunsetSunriseNode;

  self->_version = 84;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 106, CFSTR("Trend - Aircraft"), 0.35, 0.35, 0.35);
  aircraftNode = self->_aircraftNode;
  self->_aircraftNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 107, CFSTR("Trend - Airplane"), 0.58, 0.58, 0.58);
  airplaneNode = self->_airplaneNode;
  self->_airplaneNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 213, CFSTR("Trend - Bird"), 0.35, 0.35, 0.35);
  birdNode = self->_birdNode;
  self->_birdNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 569, CFSTR("Trend - Flower"), 0.25, 0.25, 0.25);
  flowerNode = self->_flowerNode;
  self->_flowerNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 16, CFSTR("Trend - Forest"), 0.57, 0.57, 0.57);
  forestNode = self->_forestNode;
  self->_forestNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1072, CFSTR("Trend - Rainbow"), 0.51, 0.51, 0.51);
  rainbowNode = self->_rainbowNode;
  self->_rainbowNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1215, CFSTR("Trend - Skateboarding"), 0.69, 0.69, 0.69);
  skateboardingNode = self->_skateboardingNode;
  self->_skateboardingNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 36, CFSTR("Trend - Skyscraper"), 0.41, 0.41, 0.41);
  skyscraperNode = self->_skyscraperNode;
  self->_skyscraperNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1238, CFSTR("Trend - Snow"), 0.62, 0.62, 0.62);
  snowNode = self->_snowNode;
  self->_snowNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 1765, CFSTR("Trend - SunsetSunrise"), 0.57, 0.57, 0.57);
  sunsetSunriseNode = self->_sunsetSunriseNode;
  self->_sunsetSunriseNode = v21;

}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  id v3;
  uint64_t v4;

  v3 = 0;
  if ((uint64_t)a3 > 568)
  {
    if ((uint64_t)a3 <= 1214)
    {
      if (a3 == 569)
      {
        v4 = 40;
        goto LABEL_24;
      }
      if (a3 == 1072)
      {
        v4 = 56;
        goto LABEL_24;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4BFuLL:
          v4 = 64;
          goto LABEL_24;
        case 0x4D6uLL:
          v4 = 80;
          goto LABEL_24;
        case 0x6E5uLL:
          v4 = 88;
          goto LABEL_24;
      }
    }
  }
  else if ((uint64_t)a3 <= 105)
  {
    if (a3 == 16)
    {
      v4 = 48;
      goto LABEL_24;
    }
    if (a3 == 36)
    {
      v4 = 72;
      goto LABEL_24;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x6AuLL:
        v4 = 16;
        goto LABEL_24;
      case 0x6BuLL:
        v4 = 24;
        goto LABEL_24;
      case 0xD5uLL:
        v4 = 32;
LABEL_24:
        v3 = *(id *)((char *)&self->super.isa + v4);
        break;
    }
  }
  return v3;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return a3 >> 4 < 0x271 || (a3 & 0x80000000) != 0;
}

- (id)modelInfo
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __32__CLSTrendsSceneModel_modelInfo__block_invoke;
  v8[3] = &unk_25149B6C8;
  v4 = v3;
  v9 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495071CC](v8);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_aircraftNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_airplaneNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_birdNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_flowerNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_forestNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_rainbowNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_skateboardingNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_skyscraperNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_snowNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_sunsetSunriseNode, 0);
  v6 = v4;

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)aircraftNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)airplaneNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)birdNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)flowerNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)forestNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)rainbowNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)skateboardingNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)skyscraperNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)snowNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (CLSSignalNode)sunsetSunriseNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sunsetSunriseNode, 0);
  objc_storeStrong((id *)&self->_snowNode, 0);
  objc_storeStrong((id *)&self->_skyscraperNode, 0);
  objc_storeStrong((id *)&self->_skateboardingNode, 0);
  objc_storeStrong((id *)&self->_rainbowNode, 0);
  objc_storeStrong((id *)&self->_forestNode, 0);
  objc_storeStrong((id *)&self->_flowerNode, 0);
  objc_storeStrong((id *)&self->_birdNode, 0);
  objc_storeStrong((id *)&self->_airplaneNode, 0);
  objc_storeStrong((id *)&self->_aircraftNode, 0);
}

void __32__CLSTrendsSceneModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  if (a3 >= 0x21)
    return 33;
  else
    return 0;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Trend");
}

+ (unint64_t)latestVersion
{
  return 84;
}

@end
