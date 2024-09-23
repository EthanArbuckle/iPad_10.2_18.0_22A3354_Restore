@implementation RTLocationStoreMetricOptions

- (RTLocationStoreMetricOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDateInterval_uncertaintyThreshold_);
}

- (RTLocationStoreMetricOptions)initWithDateInterval:(id)a3 uncertaintyThreshold:(double)a4
{
  id v7;
  RTLocationStoreMetricOptions *v8;
  RTLocationStoreMetricOptions *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTLocationStoreMetricOptions;
  v8 = -[RTLocationStoreMetricOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateInterval, a3);
    v9->_uncertaintyThreshold = a4;
  }

  return v9;
}

- (RTLocationStoreMetricOptions)initWithDateInterval:(id)a3 uncertaintyThreshold:(double)a4 includeFixMetrics:(BOOL)a5 includeSignalEnvironment:(BOOL)a6
{
  RTLocationStoreMetricOptions *result;

  result = -[RTLocationStoreMetricOptions initWithDateInterval:uncertaintyThreshold:](self, "initWithDateInterval:uncertaintyThreshold:", a3, a4);
  if (result)
  {
    result->_includeFixMetrics = a5;
    result->_includeSignalEnvironment = a6;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("YES");
  if (self->_includeFixMetrics)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (!self->_includeSignalEnvironment)
    v9 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("startDate, %@, endDate, %@, uncertaintyThreshold, %.2f, includeFixMetrics, %@, includeSignalEnvironment, %@"), v5, v7, *(_QWORD *)&self->_uncertaintyThreshold, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)uncertaintyThreshold
{
  return self->_uncertaintyThreshold;
}

- (BOOL)includeFixMetrics
{
  return self->_includeFixMetrics;
}

- (BOOL)includeSignalEnvironment
{
  return self->_includeSignalEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
