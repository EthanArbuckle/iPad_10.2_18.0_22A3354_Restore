@implementation PLDuetState

- (PLDuetState)init
{
  PLDuetState *v2;
  uint64_t v3;
  NSMutableArray *overlappingStates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLDuetState;
  v2 = -[PLDuetState init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    overlappingStates = v2->_overlappingStates;
    v2->_overlappingStates = (NSMutableArray *)v3;

  }
  return v2;
}

- (double)duration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[PLDuetState startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLDuetState endDate](self, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PLDuetState endDate](self, "endDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuetState startDate](self, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      v8 = v7;

    }
    else
    {
      v8 = 0.0;
    }

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLDuetState startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuetState endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuetState cpuSeconds](self, "cpuSeconds");
  v7 = v6;
  -[PLDuetState info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("startDate=%@, endDate=%@, cpuSeconds=%f, info=%@"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)cpuSeconds
{
  return self->_cpuSeconds;
}

- (void)setCpuSeconds:(double)a3
{
  self->_cpuSeconds = a3;
}

- (NSMutableArray)overlappingStates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOverlappingStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_overlappingStates, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
