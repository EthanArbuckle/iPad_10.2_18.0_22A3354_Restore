@implementation SOSIntervalEvent

- (id)getDate
{
  return -[NSUserDefaults valueForKey:](self->_defaults, "valueForKey:", self->_dateDescription);
}

- (BOOL)checkDate
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSIntervalEvent getDate](self, "getDate"));
  v3 = v2;
  v5 = 0;
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    if (v4 <= 0.0)
      v5 = 1;
  }

  return v5;
}

- (void)followup
{
  uint64_t v3;
  id v4;

  v3 = SOSCreateRandomDateBetweenNowPlus(self->_earliestDate, self->_latestDate);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[NSUserDefaults setValue:forKey:](self->_defaults, "setValue:forKey:", v4, self->_dateDescription);

}

- (void)schedule
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSIntervalEvent getDate](self, "getDate"));
  if (!v3)
  {
    -[SOSIntervalEvent followup](self, "followup");
    v3 = 0;
  }

}

- (SOSIntervalEvent)initWithDefaults:(id)a3 dateDescription:(id)a4 earliest:(double)a5 latest:(double)a6
{
  id v11;
  id v12;
  SOSIntervalEvent *v13;
  SOSIntervalEvent *v14;
  void **p_defaults;
  id v16;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SOSIntervalEvent;
  v13 = -[SOSIntervalEvent init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    p_defaults = (void **)&v13->_defaults;
    objc_storeStrong((id *)&v13->_defaults, a3);
    if (!v14->_defaults)
    {
      v16 = objc_alloc_init((Class)NSUserDefaults);
      v17 = *p_defaults;
      *p_defaults = v16;

    }
    objc_storeStrong((id *)&v14->_dateDescription, a4);
    v14->_earliestDate = a5;
    v14->_latestDate = a6;
    -[SOSIntervalEvent schedule](v14, "schedule");
  }

  return v14;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSString)dateDescription
{
  return self->_dateDescription;
}

- (void)setDateDescription:(id)a3
{
  objc_storeStrong((id *)&self->_dateDescription, a3);
}

- (double)earliestDate
{
  return self->_earliestDate;
}

- (void)setEarliestDate:(double)a3
{
  self->_earliestDate = a3;
}

- (double)latestDate
{
  return self->_latestDate;
}

- (void)setLatestDate:(double)a3
{
  self->_latestDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateDescription, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
