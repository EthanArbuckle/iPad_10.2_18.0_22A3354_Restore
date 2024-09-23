@implementation CLSFaceModel

- (CLSFaceModel)initWithFaceAnalysisVersion:(unint64_t)a3
{
  CLSFaceModel *v4;
  CLSFaceModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSFaceModel;
  v4 = -[CLSFaceModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0xC)
    {
      if (a3)
      {
        -[CLSFaceModel setupVersion1](v4, "setupVersion1");
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v6 = objc_opt_class();
          *(_DWORD *)buf = 67109378;
          v10 = 0;
          v11 = 2112;
          v12 = v6;
          _os_log_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
        }

        return 0;
      }
    }
    else
    {
      -[CLSFaceModel setupVersion12](v4, "setupVersion12");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSFaceModel initWithFaceAnalysisVersion:](self, "initWithFaceAnalysisVersion:", 12);
}

- (void)setupVersion1
{
  CLSSignalNode *v3;
  CLSSignalNode *qualityNode;
  CLSSignalNode *v5;
  CLSSignalNode *distanceNode;

  self->_version = 1;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Quality"), 0.2, 0.4, 0.2);
  qualityNode = self->_qualityNode;
  self->_qualityNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Distance"), 0.05, 0.05, 0.05);
  distanceNode = self->_distanceNode;
  self->_distanceNode = v5;

}

- (void)setupVersion12
{
  CLSSignalNode *v3;
  CLSSignalNode *qualityNode;
  CLSSignalNode *v5;
  CLSSignalNode *distanceNode;

  self->_version = 12;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Quality"), 0.35, 0.5, 0.35);
  qualityNode = self->_qualityNode;
  self->_qualityNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Distance"), 0.02, 0.02, 0.02);
  distanceNode = self->_distanceNode;
  self->_distanceNode = v5;

}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)qualityNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)distanceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceNode, 0);
  objc_storeStrong((id *)&self->_qualityNode, 0);
}

+ (unint64_t)baseFaceAnalysisVersionWithFaceAnalysisVersion:(unint64_t)a3
{
  if (a3 >= 0xC)
    return 12;
  else
    return a3 != 0;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Face");
}

+ (unint64_t)latestVersion
{
  return 12;
}

@end
