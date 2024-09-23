@implementation ICSTimeZoneChange

- (ICSTimeZoneChange)initWithTimeInterval:(double)a3 tzOffsetTo:(int64_t)a4
{
  ICSTimeZoneChange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSTimeZoneChange;
  result = -[ICSTimeZoneChange init](&v7, sel_init);
  result->_interval = a3;
  result->_tzOffsetTo = a4;
  return result;
}

- (double)interval
{
  return self->_interval;
}

- (int64_t)tzOffsetTo
{
  return self->_tzOffsetTo;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double interval;
  double v6;
  int64_t tzOffsetTo;
  BOOL v8;

  v4 = a3;
  interval = self->_interval;
  objc_msgSend(v4, "interval");
  if (vabdd_f64(interval, v6) >= 2.22044605e-16)
  {
    v8 = 0;
  }
  else
  {
    tzOffsetTo = self->_tzOffsetTo;
    v8 = tzOffsetTo == objc_msgSend(v4, "tzOffsetTo");
  }

  return v8;
}

- (BOOL)isCloseTo:(id)a3
{
  id v4;
  double interval;
  double v6;
  int64_t tzOffsetTo;
  BOOL v8;

  v4 = a3;
  interval = self->_interval;
  objc_msgSend(v4, "interval");
  if (vabdd_f64(interval, v6) >= 86400.0)
  {
    v8 = 0;
  }
  else
  {
    tzOffsetTo = self->_tzOffsetTo;
    v8 = tzOffsetTo == objc_msgSend(v4, "tzOffsetTo");
  }

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", self->_tzOffsetTo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_interval);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("interval: %@, offset: %ld"), v7, self->_tzOffsetTo);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[ICSTimeZoneChange interval](self, "interval");
  v6 = v5;
  objc_msgSend(v4, "interval");
  if (v6 >= v7)
  {
    -[ICSTimeZoneChange interval](self, "interval");
    v10 = v9;
    objc_msgSend(v4, "interval");
    v8 = v10 > v11;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

@end
