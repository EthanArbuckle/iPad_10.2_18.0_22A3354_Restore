@implementation TISKRateMetricSample

- (TISKRateMetricSample)init
{
  TISKRateMetricSample *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TISKRateMetricSample;
  result = -[TISKRateMetricSample init](&v3, sel_init);
  if (result)
  {
    result->_durationFactor = 0.0;
    result->_countFactor = 0;
  }
  return result;
}

- (void)addToCounter:(int)a3
{
  self->_countFactor += a3;
}

- (void)addToDuration:(double)a3
{
  self->_durationFactor = self->_durationFactor + a3;
}

- (id)rate
{
  double durationFactor;
  int countFactor;
  void *v4;

  durationFactor = self->_durationFactor;
  if (durationFactor <= 0.0 || (countFactor = self->_countFactor, countFactor < 1))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)countFactor / durationFactor);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)merge:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double durationFactor;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    IXADefaultLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [SensorKit] [rateMetricSample merge: other doesn't respond to countFactor selector %d : %d"), "-[TISKRateMetricSample merge:]", self->_countFactor, objc_msgSend(v4, "countFactor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_error_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  -[TISKRateMetricSample setCountFactor:](self, "setCountFactor:", objc_msgSend(v4, "countFactor") + -[TISKRateMetricSample countFactor](self, "countFactor"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    IXADefaultLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      durationFactor = self->_durationFactor;
      objc_msgSend(v4, "durationFactor");
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%s [SensorKit] [rateMetricSample merge: other doesn't respond to durationFactor selector %f : %f"), "-[TISKRateMetricSample merge:]", *(_QWORD *)&durationFactor, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  -[TISKRateMetricSample durationFactor](self, "durationFactor");
  v8 = v7;
  objc_msgSend(v4, "durationFactor");
  -[TISKRateMetricSample setDurationFactor:](self, "setDurationFactor:", v8 + v9);

}

- (BOOL)isEqual:(id)a3
{
  TISKRateMetricSample *v4;
  TISKRateMetricSample *v5;
  int countFactor;
  double durationFactor;
  double v8;
  BOOL v9;

  v4 = (TISKRateMetricSample *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    countFactor = self->_countFactor;
    if (countFactor == -[TISKRateMetricSample countFactor](v4, "countFactor"))
    {
      durationFactor = self->_durationFactor;
      -[TISKRateMetricSample durationFactor](v5, "durationFactor");
      v9 = durationFactor == v8;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d/%f"), self->_countFactor, *(_QWORD *)&self->_durationFactor);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[TISKRateMetricSample countFactor](self, "countFactor"), CFSTR("RateMetricSampleCounter"));
  -[TISKRateMetricSample durationFactor](self, "durationFactor");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("RateMetricSampleDuration"));

}

- (TISKRateMetricSample)initWithCoder:(id)a3
{
  id v4;
  TISKRateMetricSample *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TISKRateMetricSample;
  v5 = -[TISKRateMetricSample init](&v8, sel_init);
  if (v5)
  {
    v5->_countFactor = objc_msgSend(v4, "decodeIntForKey:", CFSTR("RateMetricSampleCounter"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("RateMetricSampleDuration"));
    v5->_durationFactor = v6;
  }

  return v5;
}

- (int)countFactor
{
  return self->_countFactor;
}

- (void)setCountFactor:(int)a3
{
  self->_countFactor = a3;
}

- (double)durationFactor
{
  return self->_durationFactor;
}

- (void)setDurationFactor:(double)a3
{
  self->_durationFactor = a3;
}

+ (id)makeMetric
{
  return objc_alloc_init(TISKRateMetricSample);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
