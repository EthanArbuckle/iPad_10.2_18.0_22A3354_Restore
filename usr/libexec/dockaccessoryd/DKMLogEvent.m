@implementation DKMLogEvent

+ (id)alloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___DKMLogEvent;
  return objc_msgSendSuper2(&v3, "alloc");
}

- (DKMLogEvent)init
{
  DKMLogEvent *v2;
  DKMLogEvent *v3;
  uint64_t v4;
  NSDate *startDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DKMLogEvent;
  v2 = -[DKMLogEvent init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_submitted = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    startDate = v3->_startDate;
    v3->_startDate = (NSDate *)v4;

  }
  return v3;
}

- (BOOL)shouldSubmit
{
  return 1;
}

- (void)submitAtDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DKMLogEvent setSubmitted:](self, "setSubmitted:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DKMLogEvent startDate](self, "startDate"));
  v5 = objc_msgSend(v7, "compare:", v4);

  if (v5 == (id)-1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DKMLogEvent startDate](self, "startDate"));
    -[DKMLogEvent setEndDate:](self, "setEndDate:", v6);

  }
  else
  {
    -[DKMLogEvent setEndDate:](self, "setEndDate:", v7);
  }

}

- (double)durationInMilliseconds
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DKMLogEvent endDate](self, "endDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DKMLogEvent startDate](self, "startDate"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5 * 1000.0;

  return v6;
}

- (BOOL)isSubmitted
{
  return self->_submitted;
}

- (void)setSubmitted:(BOOL)a3
{
  self->_submitted = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
