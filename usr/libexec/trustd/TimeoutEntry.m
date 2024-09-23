@implementation TimeoutEntry

- (TimeoutEntry)init
{
  TimeoutEntry *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TimeoutEntry;
  v2 = -[TimeoutEntry init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[TimeoutEntry setLastAttemptDate:](v2, "setLastAttemptDate:", v3);

    -[TimeoutEntry setTimeoutCounter:](v2, "setTimeoutCounter:", 1);
  }
  return v2;
}

- (NSDate)lastAttemptDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastAttemptDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)timeoutCounter
{
  return self->_timeoutCounter;
}

- (void)setTimeoutCounter:(unint64_t)a3
{
  self->_timeoutCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
}

@end
