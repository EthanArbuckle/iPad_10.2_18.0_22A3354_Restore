@implementation CLSPotentialLandmarkModel

- (CLSPotentialLandmarkModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSPotentialLandmarkModel *v4;
  CLSPotentialLandmarkModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSPotentialLandmarkModel;
  v4 = -[CLSPotentialLandmarkModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x21)
    {
      if (a3 == 32)
      {
        -[CLSPotentialLandmarkModel setupVersion32](v4, "setupVersion32");
      }
      else
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
    }
    else
    {
      -[CLSPotentialLandmarkModel setupVersion33](v4, "setupVersion33");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSPotentialLandmarkModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 33);
}

- (void)setupVersion32
{
  CLSSignalNode *v3;
  CLSSignalNode *landmarkNode;

  self->_version = 32;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483135, CFSTR("PL - Landmark"), 0.98, 0.98, 0.98);
  landmarkNode = self->_landmarkNode;
  self->_landmarkNode = v3;

}

- (void)setupVersion33
{
  CLSSignalNode *v3;
  CLSSignalNode *landmarkNode;

  self->_version = 33;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483135, CFSTR("PL - Landmark"), 0.61, 0.91, 0.4);
  landmarkNode = self->_landmarkNode;
  self->_landmarkNode = v3;

}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  CLSSignalNode *v4;
  void *v5;

  if ((_DWORD)a3 == 2147483135)
  {
    v4 = self->_landmarkNode;
  }
  else if (-[CLSPotentialLandmarkModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:", a3))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PL - Unknown (%X)"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", a3, v5, 0.0, 0.0, 0.0);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147482880;
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
  v8[2] = __38__CLSPotentialLandmarkModel_modelInfo__block_invoke;
  v8[3] = &unk_25149B6C8;
  v4 = v3;
  v9 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495071CC](v8);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_landmarkNode, 0);
  v6 = v4;

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)landmarkNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landmarkNode, 0);
}

void __38__CLSPotentialLandmarkModel_modelInfo__block_invoke(uint64_t a1, void *a2)
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
    return 32 * (a3 == 32);
}

+ (NSString)name
{
  return (NSString *)CFSTR("Potential Landmark");
}

+ (unint64_t)latestVersion
{
  return 33;
}

@end
