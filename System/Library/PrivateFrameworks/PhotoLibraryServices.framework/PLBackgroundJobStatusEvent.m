@implementation PLBackgroundJobStatusEvent

- (NSString)statusDump
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 1);
  objc_msgSend(v3, "setTimeStyle:", 2);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PLBackgroundJobStatusEvent eventTimestamp](self, "eventTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSDate)eventTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTimestamp, 0);
}

@end
