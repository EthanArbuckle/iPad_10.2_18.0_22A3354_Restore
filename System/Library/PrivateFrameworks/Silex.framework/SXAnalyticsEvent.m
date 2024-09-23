@implementation SXAnalyticsEvent

- (SXAnalyticsEvent)init
{
  SXAnalyticsEvent *v2;
  uint64_t v3;
  NSDate *startDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXAnalyticsEvent;
  v2 = -[SXAnalyticsEvent init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v3;

  }
  return v2;
}

- (void)determineEndDate
{
  NSDate *v3;
  NSDate *endDate;

  if (!self->_endDate)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v3;

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAnalyticsEvent endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXAnalyticsEvent endDate](self, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = v6;
    -[SXAnalyticsEvent startDate](self, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "appendFormat:", CFSTR("; duration: %f"), v7 - v9);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("; duration: undetermined"));
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
