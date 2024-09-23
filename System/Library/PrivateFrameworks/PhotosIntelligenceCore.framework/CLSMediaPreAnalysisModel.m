@implementation CLSMediaPreAnalysisModel

- (CLSMediaPreAnalysisModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSMediaPreAnalysisModel *v4;
  CLSMediaPreAnalysisModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSMediaPreAnalysisModel;
  v4 = -[CLSMediaPreAnalysisModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x39)
    {
      if (a3 < 0x2D)
      {
        if (a3 < 0x1F)
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
          -[CLSMediaPreAnalysisModel setupVersion31](v4, "setupVersion31");
        }
      }
      else
      {
        -[CLSMediaPreAnalysisModel setupVersion45](v4, "setupVersion45");
      }
    }
    else
    {
      -[CLSMediaPreAnalysisModel setupVersion57](v4, "setupVersion57");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSMediaPreAnalysisModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 57);
}

- (void)setupVersion31
{
  CLSSignalNode *v3;
  CLSSignalNode *sharpnessNode;
  CLSSignalNode *v5;
  CLSSignalNode *exposureNode;

  self->_version = 31;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Sharpness"), 0.01, 0.3, 0.01);
  sharpnessNode = self->_sharpnessNode;
  self->_sharpnessNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Exposure"), 0.0, 0.0, 0.0);
  exposureNode = self->_exposureNode;
  self->_exposureNode = v5;

}

- (void)setupVersion45
{
  CLSSignalNode *v3;
  CLSSignalNode *sharpnessNode;
  CLSSignalNode *v5;
  CLSSignalNode *exposureNode;

  self->_version = 45;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Sharpness"), 0.25, 0.7, 0.25);
  sharpnessNode = self->_sharpnessNode;
  self->_sharpnessNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Exposure"), 0.0, 0.0, 0.0);
  exposureNode = self->_exposureNode;
  self->_exposureNode = v5;

}

- (void)setupVersion57
{
  CLSSignalNode *v3;
  CLSSignalNode *probableRotationDirection0DegreesConfidenceNode;
  CLSSignalNode *v5;
  CLSSignalNode *probableRotationDirection90DegreesConfidenceNode;
  CLSSignalNode *v7;
  CLSSignalNode *probableRotationDirection180DegreesConfidenceNode;
  CLSSignalNode *v9;
  CLSSignalNode *probableRotationDirection270DegreesConfidenceNode;

  -[CLSMediaPreAnalysisModel setupVersion45](self, "setupVersion45");
  self->_version = 57;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Probable Rotation Direction Confidence"), 0.05, 0.05, 0.05);
  probableRotationDirection0DegreesConfidenceNode = self->_probableRotationDirection0DegreesConfidenceNode;
  self->_probableRotationDirection0DegreesConfidenceNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Probable Rotation Direction Confidence"), 0.1, 0.1, 0.1);
  probableRotationDirection90DegreesConfidenceNode = self->_probableRotationDirection90DegreesConfidenceNode;
  self->_probableRotationDirection90DegreesConfidenceNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Probable Rotation Direction Confidence"), 0.1, 0.1, 0.1);
  probableRotationDirection180DegreesConfidenceNode = self->_probableRotationDirection180DegreesConfidenceNode;
  self->_probableRotationDirection180DegreesConfidenceNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Probable Rotation Direction Confidence"), 0.1, 0.1, 0.1);
  probableRotationDirection270DegreesConfidenceNode = self->_probableRotationDirection270DegreesConfidenceNode;
  self->_probableRotationDirection270DegreesConfidenceNode = v9;

}

- (BOOL)isWronglyRotatedForDirection:(signed __int16)a3 confidence:(double)a4
{
  if ((a3 - 2) > 2)
    return 0;
  else
    return objc_msgSend(*((id *)&self->_probableRotationDirection90DegreesConfidenceNode + (a3 - 2)), "passesWithConfidence:", a4);
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)sharpnessNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)exposureNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureNode, 0);
  objc_storeStrong((id *)&self->_sharpnessNode, 0);
  objc_storeStrong((id *)&self->_probableRotationDirection270DegreesConfidenceNode, 0);
  objc_storeStrong((id *)&self->_probableRotationDirection180DegreesConfidenceNode, 0);
  objc_storeStrong((id *)&self->_probableRotationDirection90DegreesConfidenceNode, 0);
  objc_storeStrong((id *)&self->_probableRotationDirection0DegreesConfidenceNode, 0);
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = 45;
  v4 = 31;
  if (a3 < 0x1F)
    v4 = 0;
  if (a3 <= 0x2C)
    v3 = v4;
  if (a3 <= 0x38)
    return v3;
  else
    return 57;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Media PreAnalysis");
}

+ (unint64_t)latestVersion
{
  return 57;
}

@end
