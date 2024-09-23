@implementation CRPerformanceMetric

+ (id)metricWithDisplayName:(id)a3 unit:(id)a4 denominator:(double)a5 serializationKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  CRPerformanceMetric *v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[CRPerformanceMetric initWithDisplayName:unit:denominator:serializationKey:]([CRPerformanceMetric alloc], "initWithDisplayName:unit:denominator:serializationKey:", v11, v10, v9, a5);

  return v12;
}

+ (id)pcMetricWithDisplayName:(id)a3 pcMetricID:(unint64_t)a4 unit:(id)a5 denominator:(double)a6 serializationKey:(id)a7
{
  id v11;
  id v12;
  id v13;
  CRPerformanceMetric *v14;

  v11 = a7;
  v12 = a5;
  v13 = a3;
  v14 = -[CRPerformanceMetric initWithDisplayName:unit:denominator:serializationKey:]([CRPerformanceMetric alloc], "initWithDisplayName:unit:denominator:serializationKey:", v13, v12, v11, a6);

  -[CRPerformanceMetric setPcMetricID:](v14, "setPcMetricID:", a4);
  return v14;
}

- (CRPerformanceMetric)initWithDisplayName:(id)a3 unit:(id)a4 denominator:(double)a5 serializationKey:(id)a6
{
  id v11;
  id v12;
  id v13;
  CRPerformanceMetric *v14;
  CRPerformanceMetric *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CRPerformanceMetric;
  v14 = -[CRPerformanceMetric init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayName, a3);
    objc_storeStrong((id *)&v15->_unit, a4);
    v15->_denominator = a5;
    objc_storeStrong((id *)&v15->_serializationKey, a6);
    v15->_M2 = 0.0;
    *(_OWORD *)&v15->_pcMetricID = 0u;
    *(_OWORD *)&v15->_min = 0u;
    *(_OWORD *)&v15->_sumX = 0u;
  }

  return v15;
}

- (CRPerformanceMetric)initWithDictionary:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  CRPerformanceMetric *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricUnit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricDenominator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricPCMetricID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "longLongValue");

  v15 = -[CRPerformanceMetric initWithDisplayName:unit:denominator:serializationKey:](self, "initWithDisplayName:unit:denominator:serializationKey:", v8, v9, v7, v12);
  if (v15)
  {
    -[CRPerformanceMetric setPcMetricID:](v15, "setPcMetricID:", v14);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricNumSamples"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRPerformanceMetric setNumSamples:](v15, "setNumSamples:", objc_msgSend(v16, "integerValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricFirst"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    -[CRPerformanceMetric setFirst:](v15, "setFirst:");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricMin"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    -[CRPerformanceMetric setMin:](v15, "setMin:");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricMax"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    -[CRPerformanceMetric setMax:](v15, "setMax:");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricMean"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRPerformanceMetricStdDev"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    -[CRPerformanceMetric setSumX:](v15, "setSumX:", v22 * (double)-[CRPerformanceMetric numSamples](v15, "numSamples"));
    v26 = -[CRPerformanceMetric numSamples](v15, "numSamples");
    v27 = 1.0;
    if (v26 >= 2)
      v27 = (double)(-[CRPerformanceMetric numSamples](v15, "numSamples", 1.0) - 1);
    -[CRPerformanceMetric setM2:](v15, "setM2:", v25 * v25 * v27);
  }

  return v15;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[9];
  _QWORD v21[11];

  v21[9] = *MEMORY[0x1E0C80C00];
  -[CRPerformanceMetric displayName](self, "displayName", CFSTR("CRPerformanceMetricName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  v20[1] = CFSTR("CRPerformanceMetricNumSamples");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CRPerformanceMetric numSamples](self, "numSamples"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v20[2] = CFSTR("CRPerformanceMetricFirst");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[CRPerformanceMetric first](self, "first");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v6;
  v20[3] = CFSTR("CRPerformanceMetricMin");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CRPerformanceMetric min](self, "min");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v8;
  v20[4] = CFSTR("CRPerformanceMetricMax");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CRPerformanceMetric max](self, "max");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v10;
  v20[5] = CFSTR("CRPerformanceMetricMean");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[CRPerformanceMetric mean](self, "mean");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v12;
  v20[6] = CFSTR("CRPerformanceMetricStdDev");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[CRPerformanceMetric stdDev](self, "stdDev");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v14;
  v20[7] = CFSTR("CRPerformanceMetricUnit");
  -[CRPerformanceMetric unit](self, "unit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v15;
  v20[8] = CFSTR("CRPerformanceMetricDenominator");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[CRPerformanceMetric denominator](self, "denominator");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[8] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRPerformanceMetric *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  CRPerformanceMetric *v10;

  v4 = +[CRPerformanceMetric allocWithZone:](CRPerformanceMetric, "allocWithZone:", a3);
  -[CRPerformanceMetric displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRPerformanceMetric unit](self, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRPerformanceMetric denominator](self, "denominator");
  v8 = v7;
  -[CRPerformanceMetric serializationKey](self, "serializationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRPerformanceMetric initWithDisplayName:unit:denominator:serializationKey:](v4, "initWithDisplayName:unit:denominator:serializationKey:", v5, v6, v9, v8);

  -[CRPerformanceMetric setNumSamples:](v10, "setNumSamples:", -[CRPerformanceMetric numSamples](self, "numSamples"));
  -[CRPerformanceMetric first](self, "first");
  -[CRPerformanceMetric setFirst:](v10, "setFirst:");
  -[CRPerformanceMetric min](self, "min");
  -[CRPerformanceMetric setMin:](v10, "setMin:");
  -[CRPerformanceMetric max](self, "max");
  -[CRPerformanceMetric setMax:](v10, "setMax:");
  -[CRPerformanceMetric sumX](self, "sumX");
  -[CRPerformanceMetric setSumX:](v10, "setSumX:");
  -[CRPerformanceMetric setPcMetricID:](v10, "setPcMetricID:", -[CRPerformanceMetric pcMetricID](self, "pcMetricID"));
  -[CRPerformanceMetric M2](self, "M2");
  -[CRPerformanceMetric setM2:](v10, "setM2:");
  return v10;
}

- (void)addSample:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[CRPerformanceMetric setNumSamples:](self, "setNumSamples:", -[CRPerformanceMetric numSamples](self, "numSamples") + 1);
  -[CRPerformanceMetric sumX](self, "sumX");
  -[CRPerformanceMetric setSumX:](self, "setSumX:", v5 + a3);
  if (-[CRPerformanceMetric numSamples](self, "numSamples") == 1)
  {
    -[CRPerformanceMetric setFirst:](self, "setFirst:", a3);
    -[CRPerformanceMetric setMin:](self, "setMin:", a3);
    -[CRPerformanceMetric setMax:](self, "setMax:", a3);
    -[CRPerformanceMetric setM2:](self, "setM2:", 0.0);
    -[CRPerformanceMetric setWelfordMean:](self, "setWelfordMean:", a3);
  }
  else
  {
    -[CRPerformanceMetric min](self, "min");
    -[CRPerformanceMetric setMin:](self, "setMin:", fmin(v6, a3));
    -[CRPerformanceMetric max](self, "max");
    -[CRPerformanceMetric setMax:](self, "setMax:", fmax(v7, a3));
    -[CRPerformanceMetric welfordMean](self, "welfordMean");
    v9 = a3 - v8;
    v10 = (a3 - v8) / (double)-[CRPerformanceMetric numSamples](self, "numSamples");
    -[CRPerformanceMetric welfordMean](self, "welfordMean");
    -[CRPerformanceMetric setWelfordMean:](self, "setWelfordMean:", v11 + v10);
    -[CRPerformanceMetric welfordMean](self, "welfordMean");
    v13 = a3 - v12;
    -[CRPerformanceMetric M2](self, "M2");
    -[CRPerformanceMetric setM2:](self, "setM2:", v14 + v9 * v13);
  }
}

- (void)mergeMetric:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v21 = a3;
  if (objc_msgSend(v21, "numSamples"))
  {
    if (-[CRPerformanceMetric numSamples](self, "numSamples"))
    {
      objc_msgSend(v21, "mean");
      v5 = v4;
      -[CRPerformanceMetric mean](self, "mean");
      v7 = v5 - v6;
      -[CRPerformanceMetric M2](self, "M2");
      v9 = v8;
      objc_msgSend(v21, "M2");
      -[CRPerformanceMetric setM2:](self, "setM2:", v9+ v10+ v7* v7* (double)-[CRPerformanceMetric numSamples](self, "numSamples")* (double)objc_msgSend(v21, "numSamples")/ (double)(objc_msgSend(v21, "numSamples") + -[CRPerformanceMetric numSamples](self, "numSamples")));
      -[CRPerformanceMetric min](self, "min");
      v12 = v11;
      objc_msgSend(v21, "min");
      -[CRPerformanceMetric setMin:](self, "setMin:", fmin(v12, v13));
      -[CRPerformanceMetric max](self, "max");
      v15 = v14;
      objc_msgSend(v21, "max");
      v17 = fmax(v15, v16);
    }
    else
    {
      objc_msgSend(v21, "M2");
      -[CRPerformanceMetric setM2:](self, "setM2:");
      objc_msgSend(v21, "first");
      -[CRPerformanceMetric setFirst:](self, "setFirst:");
      objc_msgSend(v21, "min");
      -[CRPerformanceMetric setMin:](self, "setMin:");
      objc_msgSend(v21, "max");
    }
    -[CRPerformanceMetric setMax:](self, "setMax:", v17);
    -[CRPerformanceMetric setNumSamples:](self, "setNumSamples:", -[CRPerformanceMetric numSamples](self, "numSamples") + objc_msgSend(v21, "numSamples"));
    objc_msgSend(v21, "sumX");
    v19 = v18;
    -[CRPerformanceMetric sumX](self, "sumX");
    -[CRPerformanceMetric setSumX:](self, "setSumX:", v19 + v20);
  }

}

- (double)mean
{
  double v3;

  if (!-[CRPerformanceMetric numSamples](self, "numSamples"))
    return 0.0;
  -[CRPerformanceMetric sumX](self, "sumX");
  return v3 / (double)-[CRPerformanceMetric numSamples](self, "numSamples");
}

- (double)variance
{
  uint64_t v3;
  double result;
  double v5;

  v3 = -[CRPerformanceMetric numSamples](self, "numSamples");
  result = 0.0;
  if (v3 >= 2)
  {
    -[CRPerformanceMetric M2](self, "M2", 0.0);
    return v5 / (double)(-[CRPerformanceMetric numSamples](self, "numSamples") - 1);
  }
  return result;
}

- (double)stdDev
{
  double v2;

  -[CRPerformanceMetric variance](self, "variance");
  return sqrt(v2);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)unit
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUnit:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)serializationKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerializationKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (double)denominator
{
  return self->_denominator;
}

- (void)setDenominator:(double)a3
{
  self->_denominator = a3;
}

- (double)sumX
{
  return self->_sumX;
}

- (void)setSumX:(double)a3
{
  self->_sumX = a3;
}

- (double)first
{
  return self->_first;
}

- (void)setFirst:(double)a3
{
  self->_first = a3;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (unint64_t)pcMetricID
{
  return self->_pcMetricID;
}

- (void)setPcMetricID:(unint64_t)a3
{
  self->_pcMetricID = a3;
}

- (int64_t)numSamples
{
  return self->_numSamples;
}

- (void)setNumSamples:(int64_t)a3
{
  self->_numSamples = a3;
}

- (double)M2
{
  return self->_M2;
}

- (void)setM2:(double)a3
{
  self->_M2 = a3;
}

- (double)welfordMean
{
  return self->_welfordMean;
}

- (void)setWelfordMean:(double)a3
{
  self->_welfordMean = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationKey, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
