@implementation CLSSignalNode

- (CLSSignalNode)initWithIdentifier:(unint64_t)a3 name:(id)a4 operatingPoint:(double)a5 highPrecisionOperatingPoint:(double)a6 highRecallOperatingPoint:(double)a7
{
  id v13;
  CLSSignalNode *v14;
  CLSSignalNode *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CLSSignalNode;
  v14 = -[CLSSignalNode init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_identifier = a3;
    objc_storeStrong((id *)&v14->_name, a4);
    v15->_operatingPoint = a5;
    v15->_highPrecisionOperatingPoint = a6;
    v15->_highRecallOperatingPoint = a7;
    if (a5 > a6)
      __assert_rtn("-[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]", "CLSSignalModel.m", 31, "_operatingPoint <= _highPrecisionOperatingPoint");
    if (a5 < a7)
      __assert_rtn("-[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]", "CLSSignalModel.m", 32, "_operatingPoint >= _highRecallOperatingPoint");
  }

  return v15;
}

- (BOOL)passesWithSignal:(id)a3
{
  id v4;
  double v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "sceneIdentifier") == self->_identifier)
  {
    objc_msgSend(v4, "confidence");
    v6 = v5 >= self->_operatingPoint;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)passesHighPrecisionWithSignal:(id)a3
{
  id v4;
  double v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "sceneIdentifier") == self->_identifier)
  {
    objc_msgSend(v4, "confidence");
    v6 = v5 >= self->_highPrecisionOperatingPoint;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)passesHighRecallWithSignal:(id)a3
{
  id v4;
  double v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "sceneIdentifier") == self->_identifier)
  {
    objc_msgSend(v4, "confidence");
    v6 = v5 >= self->_highRecallOperatingPoint;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)failsWithSignal:(id)a3
{
  id v4;
  double v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "sceneIdentifier") == self->_identifier)
  {
    objc_msgSend(v4, "confidence");
    v6 = v5 < self->_operatingPoint;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)failsHighPrecisionWithSignal:(id)a3
{
  id v4;
  double v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "sceneIdentifier") == self->_identifier)
  {
    objc_msgSend(v4, "confidence");
    v6 = v5 < self->_highPrecisionOperatingPoint;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)failsHighRecallWithSignal:(id)a3
{
  id v4;
  double v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "sceneIdentifier") == self->_identifier)
  {
    objc_msgSend(v4, "confidence");
    v6 = v5 < self->_highRecallOperatingPoint;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)passesWithConfidence:(double)a3
{
  return self->_operatingPoint <= a3;
}

- (BOOL)passesHighPrecisionWithConfidence:(double)a3
{
  return self->_highPrecisionOperatingPoint <= a3;
}

- (BOOL)passesHighRecallWithConfidence:(double)a3
{
  return self->_highRecallOperatingPoint <= a3;
}

- (BOOL)failsWithConfidence:(double)a3
{
  return self->_operatingPoint > a3;
}

- (BOOL)failsHighPrecisionWithConfidence:(double)a3
{
  return self->_highPrecisionOperatingPoint > a3;
}

- (BOOL)failsHighRecallWithConfidence:(double)a3
{
  return self->_highRecallOperatingPoint > a3;
}

- (id)signalInfoWithIsHierarchical:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSString *name;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v3 = a3;
  v14[6] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v14[0] = v5;
  v14[1] = name;
  v13[1] = CFSTR("name");
  v13[2] = CFSTR("operatingPoint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_operatingPoint);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("highPrecisionOperatingPoint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_highPrecisionOperatingPoint);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("highRecallOperatingPoint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_highRecallOperatingPoint);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  v13[5] = CFSTR("isHierarchical");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)operatingPoint
{
  return self->_operatingPoint;
}

- (double)highPrecisionOperatingPoint
{
  return self->_highPrecisionOperatingPoint;
}

- (double)highRecallOperatingPoint
{
  return self->_highRecallOperatingPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
