@implementation CLSSDModel

- (CLSSDModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSSDModel *v4;
  CLSSDModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSSDModel;
  v4 = -[CLSSDModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x55)
    {
      if (a3 < 0x33)
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
          -[CLSSDModel setupVersion33](v4, "setupVersion33");
        }
      }
      else
      {
        -[CLSSDModel setupVersion51](v4, "setupVersion51");
      }
    }
    else
    {
      -[CLSSDModel setupVersion85](v4, "setupVersion85");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSSDModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 85);
}

- (void)setupVersion33
{
  CLSSignalNode *v3;
  CLSSignalNode *foodDrinkNode;
  CLSSignalNode *v5;
  CLSSignalNode *landscapeCityscapeNode;
  CLSSignalNode *v7;
  CLSSignalNode *foodDrinkFoodieNode;

  self->_version = 33;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482622, CFSTR("SD - Food Drink"), 0.99, 0.997, 0.96);
  foodDrinkNode = self->_foodDrinkNode;
  self->_foodDrinkNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482623, CFSTR("SD - Landscape Cityscape"), 0.995, 0.999, 0.98);
  landscapeCityscapeNode = self->_landscapeCityscapeNode;
  self->_landscapeCityscapeNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482622, CFSTR("Food Drink Foodie"), 0.99, 0.99, 0.99);
  foodDrinkFoodieNode = self->_foodDrinkFoodieNode;
  self->_foodDrinkFoodieNode = v7;

}

- (void)setupVersion51_4
{
  CLSSignalNode *v3;
  CLSSignalNode *foodDrinkNode;
  CLSSignalNode *v5;
  CLSSignalNode *landscapeCityscapeNode;
  CLSSignalNode *v7;
  CLSSignalNode *foodDrinkFoodieNode;

  self->_version = 51;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482622, CFSTR("SD - Food Drink"), 0.99, 0.997, 0.97);
  foodDrinkNode = self->_foodDrinkNode;
  self->_foodDrinkNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482623, CFSTR("SD - Landscape Cityscape"), 0.995, 0.999, 0.98);
  landscapeCityscapeNode = self->_landscapeCityscapeNode;
  self->_landscapeCityscapeNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482622, CFSTR("Food Drink Foodie"), 0.99, 0.99, 0.99);
  foodDrinkFoodieNode = self->_foodDrinkFoodieNode;
  self->_foodDrinkFoodieNode = v7;

}

- (void)setupVersion85
{
  CLSSignalNode *v3;
  CLSSignalNode *foodDrinkNode;
  CLSSignalNode *v5;
  CLSSignalNode *landscapeCityscapeNode;
  CLSSignalNode *v7;
  CLSSignalNode *foodDrinkFoodieNode;

  self->_version = 85;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482622, CFSTR("SD - Food Drink"), 0.818, 0.939, 0.58);
  foodDrinkNode = self->_foodDrinkNode;
  self->_foodDrinkNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482623, CFSTR("SD - Landscape Cityscape"), 0.706, 0.897, 0.457);
  landscapeCityscapeNode = self->_landscapeCityscapeNode;
  self->_landscapeCityscapeNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482622, CFSTR("Food Drink Foodie"), 0.962, 0.962, 0.962);
  foodDrinkFoodieNode = self->_foodDrinkFoodieNode;
  self->_foodDrinkFoodieNode = v7;

}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  CLSSignalNode *landscapeCityscapeNode;
  CLSSignalNode *v5;
  void *v6;

  if ((_DWORD)a3 == 2147482623)
  {
    landscapeCityscapeNode = self->_landscapeCityscapeNode;
    goto LABEL_5;
  }
  if ((_DWORD)a3 == 2147482622)
  {
    landscapeCityscapeNode = self->_foodDrinkNode;
LABEL_5:
    v5 = landscapeCityscapeNode;
    return v5;
  }
  if (-[CLSSDModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:", a3))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SD - Unknown (%X)"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", a3, v6, 0.0, 0.0, 0.0);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147482368;
}

- (void)processSignals:(id)a3 intoProcessedSignals:(id)a4
{
  void *v6;
  double v7;
  double v8;
  unint64_t version;
  double v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", &unk_2514A1A08);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  version = self->_version;
  if (version > 0x54)
  {
    v10 = 0.962;
    v11 = v12;
LABEL_5:
    objc_msgSend(v11, "setIsShowcasingFood:", v8 >= v10);
    v11 = v12;
    goto LABEL_6;
  }
  v11 = v12;
  if (version >= 0x21)
  {
    v10 = 0.99;
    goto LABEL_5;
  }
LABEL_6:

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
  v8[2] = __23__CLSSDModel_modelInfo__block_invoke;
  v8[3] = &unk_25149B6C8;
  v4 = v3;
  v9 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495071CC](v8);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_foodDrinkNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_landscapeCityscapeNode, 0);
  v6 = v4;

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)foodDrinkNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)foodDrinkFoodieNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)landscapeCityscapeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeCityscapeNode, 0);
  objc_storeStrong((id *)&self->_foodDrinkFoodieNode, 0);
  objc_storeStrong((id *)&self->_foodDrinkNode, 0);
}

void __23__CLSSDModel_modelInfo__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v4;

  v3 = 51;
  v4 = 33;
  if (a3 < 0x21)
    v4 = 0;
  if (a3 <= 0x32)
    v3 = v4;
  if (a3 <= 0x54)
    return v3;
  else
    return 85;
}

+ (NSString)name
{
  return (NSString *)CFSTR("SD");
}

+ (unint64_t)latestVersion
{
  return 85;
}

@end
