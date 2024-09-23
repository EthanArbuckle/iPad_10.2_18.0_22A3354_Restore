@implementation PPSMetricSample

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (PPSMetricSample)sampleWithValue:(id)a3 timestamp:(id)a4
{
  id v5;
  id v6;
  PPSMetricSample *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PPSMetricSample initWithValue:timestamp:]([PPSMetricSample alloc], "initWithValue:timestamp:", v6, v5);

  return v7;
}

- (PPSMetricSample)initWithValue:(id)a3 timestamp:(id)a4
{
  id v7;
  id v8;
  PPSMetricSample *v9;
  id *p_isa;
  PPSMetricSample *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)PPSMetricSample;
    v9 = -[PPSMetricSample init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_value, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PPSMetricSample)initWithCoder:(id)a3
{
  id v4;
  PPSMetricSample *v5;
  uint64_t v6;
  NSNumber *value;
  uint64_t v8;
  NSDate *timestamp;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSMetricSample;
  v5 = -[PPSMetricSample init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PPSMetricSample value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("value"));

  -[PPSMetricSample timestamp](self, "timestamp");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("timestamp"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PPSMetricSample *v5;
  uint64_t v6;
  NSNumber *value;
  uint64_t v8;
  NSDate *timestamp;

  v5 = -[PPSMetricSample init](+[PPSMetricSample allocWithZone:](PPSMetricSample, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_value, "copyWithZone:", a3);
  value = v5->_value;
  v5->_value = (NSNumber *)v6;

  v8 = -[NSDate copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v8;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PPSMetricSample value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricSample timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PPSMetric value: %@ timestamp: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)BOOLValue
{
  void *v2;
  char v3;

  -[PPSMetricSample value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int)intValue
{
  void *v2;
  int v3;

  -[PPSMetricSample value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (double)doubleValue
{
  void *v2;
  double v3;
  double v4;

  -[PPSMetricSample value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (NSNumber)value
{
  return self->_value;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
