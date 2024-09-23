@implementation MOPerformanceMetric

- (MOPerformanceMetric)initWithDisplayName:(id)a3 pcMetricID:(unint64_t)a4 unit:(id)a5 denominator:(double)a6
{
  id v11;
  id v12;
  MOPerformanceMetric *v13;
  MOPerformanceMetric *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MOPerformanceMetric;
  v13 = -[MOPerformanceMetric init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_displayName, a3);
    objc_storeStrong((id *)&v14->_unit, a5);
    v14->_denominator = a6;
    v14->_pcMetricID = a4;
    v14->_initializedWithValue = 0;
    v14->_rawValue = 0.0;
  }

  return v14;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("MOPerformanceMetricName");
  -[MOPerformanceMetric displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("MOPerformanceMetricUnit");
  -[MOPerformanceMetric unit](self, "unit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("MOPerformanceMetricValue");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[MOPerformanceMetric value](self, "value");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MOPerformanceMetric displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPerformanceMetric unit](self, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPerformanceMetric value](self, "value");
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" Metric Name: %@, Metric Unit: %@, Value: %.2f"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOPerformanceMetric *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  MOPerformanceMetric *v8;

  v4 = [MOPerformanceMetric alloc];
  -[MOPerformanceMetric displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOPerformanceMetric pcMetricID](self, "pcMetricID");
  -[MOPerformanceMetric unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPerformanceMetric denominator](self, "denominator");
  v8 = -[MOPerformanceMetric initWithDisplayName:pcMetricID:unit:denominator:](v4, "initWithDisplayName:pcMetricID:unit:denominator:", v5, v6, v7);

  return v8;
}

- (void)setRawValue:(double)a3
{
  self->_rawValue = a3;
  self->_initializedWithValue = 1;
}

- (double)rawValue
{
  return self->_rawValue;
}

- (double)value
{
  if (self->_initializedWithValue)
    return self->_rawValue / self->_denominator;
  else
    return -1.0;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)unit
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUnit:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (double)denominator
{
  return self->_denominator;
}

- (void)setDenominator:(double)a3
{
  self->_denominator = a3;
}

- (unint64_t)pcMetricID
{
  return self->_pcMetricID;
}

- (void)setPcMetricID:(unint64_t)a3
{
  self->_pcMetricID = a3;
}

- (BOOL)initializedWithValue
{
  return self->_initializedWithValue;
}

- (void)setInitializedWithValue:(BOOL)a3
{
  self->_initializedWithValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
