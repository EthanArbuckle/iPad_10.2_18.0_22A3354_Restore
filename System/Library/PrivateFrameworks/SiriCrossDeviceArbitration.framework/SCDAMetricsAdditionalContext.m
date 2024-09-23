@implementation SCDAMetricsAdditionalContext

- (SCDAMetricsAdditionalContext)initWithRawGoodnessScore:(unsigned __int8)a3 goodnessScore:(unsigned __int8)a4 deviceClass:(unsigned __int8)a5 deviceProductType:(unsigned __int8)a6
{
  SCDAMetricsAdditionalContext *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCDAMetricsAdditionalContext;
  result = -[SCDAMetricsAdditionalContext init](&v11, sel_init);
  if (result)
  {
    result->_rawGoodnessScore = a3;
    result->_goodnessScore = a4;
    result->_deviceClass = a5;
    result->_deviceProductType = a6;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("raw Goodness = %d, boosted goodness = %d  class = %d, product type = %d"), -[SCDAMetricsAdditionalContext rawGoodnessScore](self, "rawGoodnessScore"), -[SCDAMetricsAdditionalContext goodnessScore](self, "goodnessScore"), -[SCDAMetricsAdditionalContext deviceClass](self, "deviceClass"), -[SCDAMetricsAdditionalContext deviceProductType](self, "deviceProductType"));
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)deviceProductType
{
  return self->_deviceProductType;
}

@end
