@implementation CLSWallpaperScoreModel

- (CLSWallpaperScoreModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSWallpaperScoreModel *v4;
  CLSWallpaperScoreModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSWallpaperScoreModel;
  v4 = -[CLSWallpaperScoreModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x58)
    {
      if (a3 < 0x4D)
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
        -[CLSWallpaperScoreModel setupVersion77](v4, "setupVersion77");
      }
    }
    else
    {
      -[CLSWallpaperScoreModel setupVersion88](v4, "setupVersion88");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSWallpaperScoreModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 88);
}

- (void)setupVersion77
{
  CLSSignalNode *v3;
  CLSSignalNode *cityscapeNode;
  CLSSignalNode *v5;
  CLSSignalNode *landscapeNode;
  CLSSignalNode *v7;
  CLSSignalNode *catNode;
  CLSSignalNode *v9;
  CLSSignalNode *dogNode;
  double v11;
  double v12;
  double v13;
  CLSSignalNode *v14;
  CLSSignalNode *petNode;
  CLSSignalNode *v16;
  CLSSignalNode *peopleNode;
  CLSSignalNode *v18;
  CLSSignalNode *minimumWallpaperScoreNode;

  self->_version = 77;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Cityscape"), 0.43, 0.43, 0.43);
  cityscapeNode = self->_cityscapeNode;
  self->_cityscapeNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Landscape"), 0.53, 0.53, 0.53);
  landscapeNode = self->_landscapeNode;
  self->_landscapeNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Cat"), 0.5, 0.5, 0.5);
  catNode = self->_catNode;
  self->_catNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Dog"), 0.6, 0.6, 0.6);
  dogNode = self->_dogNode;
  self->_dogNode = v9;

  -[CLSSignalNode operatingPoint](self->_catNode, "operatingPoint");
  v12 = v11;
  -[CLSSignalNode operatingPoint](self->_dogNode, "operatingPoint");
  if (v12 < v13)
    v12 = v13;
  v14 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Pet"), v12, v12, v12);
  petNode = self->_petNode;
  self->_petNode = v14;

  v16 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - People"), 0.43, 0.43, 0.43);
  peopleNode = self->_peopleNode;
  self->_peopleNode = v16;

  v18 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - MinimumWallpaperScore"), 0.24, 0.24, 0.24);
  minimumWallpaperScoreNode = self->_minimumWallpaperScoreNode;
  self->_minimumWallpaperScoreNode = v18;

}

- (void)setupVersion88
{
  CLSSignalNode *v3;
  CLSSignalNode *cityscapeNode;
  CLSSignalNode *v5;
  CLSSignalNode *landscapeNode;
  CLSSignalNode *v7;
  CLSSignalNode *catNode;
  CLSSignalNode *v9;
  CLSSignalNode *dogNode;
  CLSSignalNode *v11;
  CLSSignalNode *petNode;
  CLSSignalNode *v13;
  CLSSignalNode *peopleNode;
  CLSSignalNode *v15;
  CLSSignalNode *minimumWallpaperScoreNode;

  self->_version = 88;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Cityscape"), 0.68, 0.7, 0.6);
  cityscapeNode = self->_cityscapeNode;
  self->_cityscapeNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Landscape"), 0.58, 0.6, 0.4);
  landscapeNode = self->_landscapeNode;
  self->_landscapeNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Cat"), 0.52, 0.56, 0.41);
  catNode = self->_catNode;
  self->_catNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Dog"), 0.61, 0.71, 0.31);
  dogNode = self->_dogNode;
  self->_dogNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - Pet"), 0.52, 0.56, 0.31);
  petNode = self->_petNode;
  self->_petNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - People"), 0.27, 0.4, 0.2);
  peopleNode = self->_peopleNode;
  self->_peopleNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Wallpaper - MinimumWallpaperScore"), 0.24, 0.24, 0.24);
  minimumWallpaperScoreNode = self->_minimumWallpaperScoreNode;
  self->_minimumWallpaperScoreNode = v15;

}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)cityscapeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)landscapeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)catNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)dogNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)petNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)peopleNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)minimumWallpaperScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumWallpaperScoreNode, 0);
  objc_storeStrong((id *)&self->_peopleNode, 0);
  objc_storeStrong((id *)&self->_petNode, 0);
  objc_storeStrong((id *)&self->_dogNode, 0);
  objc_storeStrong((id *)&self->_catNode, 0);
  objc_storeStrong((id *)&self->_landscapeNode, 0);
  objc_storeStrong((id *)&self->_cityscapeNode, 0);
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;

  v3 = 77;
  if (a3 < 0x4D)
    v3 = 0;
  if (a3 >= 0x58)
    return 88;
  else
    return v3;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Wallpaper Score");
}

+ (unint64_t)latestVersion
{
  return 88;
}

@end
