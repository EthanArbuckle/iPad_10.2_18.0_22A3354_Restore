@implementation CLSCityNatureModel

- (CLSCityNatureModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSCityNatureModel *v4;
  CLSCityNatureModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSCityNatureModel;
  v4 = -[CLSCityNatureModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x55)
    {
      if (a3 < 0x52)
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
        -[CLSCityNatureModel setupVersion82](v4, "setupVersion82");
      }
    }
    else
    {
      -[CLSCityNatureModel setupVersion85](v4, "setupVersion85");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSCityNatureModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 85);
}

- (void)setupVersion82
{
  CLSSignalNode *v3;
  CLSSignalNode *natureNode;
  CLSSignalNode *v5;
  CLSSignalNode *cityNode;
  CLSSignalNode *v7;
  CLSSignalNode *cityNatureishNode;

  self->_version = 82;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481597, CFSTR("City Nature - Nature"), 0.248, 0.676, 0.06);
  natureNode = self->_natureNode;
  self->_natureNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481598, CFSTR("City Nature - City"), 0.225, 0.459, 0.052);
  cityNode = self->_cityNode;
  self->_cityNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481599, CFSTR("City Nature - City Natureish"), 0.341, 0.551, 0.088);
  cityNatureishNode = self->_cityNatureishNode;
  self->_cityNatureishNode = v7;

}

- (void)setupVersion85
{
  CLSSignalNode *v3;
  CLSSignalNode *natureNode;
  CLSSignalNode *v5;
  CLSSignalNode *cityNode;
  CLSSignalNode *v7;
  CLSSignalNode *cityNatureishNode;

  self->_version = 85;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481597, CFSTR("City Nature - Nature"), 0.704, 0.969, 0.307);
  natureNode = self->_natureNode;
  self->_natureNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481598, CFSTR("City Nature - City"), 0.347, 0.684, 0.081);
  cityNode = self->_cityNode;
  self->_cityNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481599, CFSTR("City Nature - City Natureish"), 0.0192, 0.141, 0.005);
  cityNatureishNode = self->_cityNatureishNode;
  self->_cityNatureishNode = v7;

  self->_cityscapeWallpaperSuggestionCityThreshold = 0.9;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  CLSSignalNode *cityNatureishNode;
  CLSSignalNode *v5;
  void *v7;

  switch((_DWORD)a3)
  {
    case 0x7FFFF7FF:
      cityNatureishNode = self->_cityNatureishNode;
      goto LABEL_7;
    case 0x7FFFF7FE:
      cityNatureishNode = self->_cityNode;
      goto LABEL_7;
    case 0x7FFFF7FD:
      cityNatureishNode = self->_natureNode;
LABEL_7:
      v5 = cityNatureishNode;
      return v5;
  }
  if (-[CLSCityNatureModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:", a3))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("City Nature - Unknown (%X)"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", a3, v7, 0.0, 0.0, 0.0);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147481344;
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
  v8[2] = __31__CLSCityNatureModel_modelInfo__block_invoke;
  v8[3] = &unk_25149B6C8;
  v4 = v3;
  v9 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495071CC](v8);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_natureNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_cityNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_cityNatureishNode, 0);
  v6 = v4;

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)natureNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)cityNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)cityNatureishNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (double)cityscapeWallpaperSuggestionCityThreshold
{
  return self->_cityscapeWallpaperSuggestionCityThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNatureishNode, 0);
  objc_storeStrong((id *)&self->_cityNode, 0);
  objc_storeStrong((id *)&self->_natureNode, 0);
}

void __31__CLSCityNatureModel_modelInfo__block_invoke(uint64_t a1, void *a2)
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
  unint64_t v3;

  v3 = 82;
  if (a3 < 0x52)
    v3 = 0;
  if (a3 >= 0x55)
    return 85;
  else
    return v3;
}

+ (void)enumerateModelsAscending:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL4 v4;
  void (**v5)(id, _QWORD);
  CLSCityNatureModel *v6;
  CLSCityNatureModel *v7;
  CLSCityNatureModel *v8;
  CLSCityNatureModel *v9;

  v4 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  v9 = -[CLSCityNatureModel initWithSceneAnalysisVersion:]([CLSCityNatureModel alloc], "initWithSceneAnalysisVersion:", 82);
  v6 = -[CLSCityNatureModel initWithSceneAnalysisVersion:]([CLSCityNatureModel alloc], "initWithSceneAnalysisVersion:", 85);
  if (v4)
    v7 = v9;
  else
    v7 = v6;
  if (v4)
    v8 = v6;
  else
    v8 = v9;
  ((void (**)(id, CLSCityNatureModel *))v5)[2](v5, v7);
  ((void (**)(id, CLSCityNatureModel *))v5)[2](v5, v8);

}

+ (NSString)name
{
  return (NSString *)CFSTR("CityNature");
}

+ (unint64_t)latestVersion
{
  return 85;
}

@end
