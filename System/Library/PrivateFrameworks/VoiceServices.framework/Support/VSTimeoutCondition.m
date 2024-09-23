@implementation VSTimeoutCondition

- (VSTimeoutCondition)initWithTimeoutValue:(double)a3
{
  VSTimeoutCondition *v4;
  VSTimeoutCondition *v5;
  NSCondition *v6;
  NSCondition *refreshTimeoutCondition;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VSTimeoutCondition;
  v4 = -[VSTimeoutCondition init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_timeoutValue = a3;
    v6 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    refreshTimeoutCondition = v5->_refreshTimeoutCondition;
    v5->_refreshTimeoutCondition = v6;

    v5->_shouldStop = 0;
  }
  return v5;
}

- (BOOL)_waitForTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  -[VSTimeoutCondition refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[VSTimeoutCondition refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "waitUntilDate:", v7);

  -[VSTimeoutCondition refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  return v8;
}

- (void)refresh
{
  void *v3;
  void *v4;
  id v5;

  -[VSTimeoutCondition refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[VSTimeoutCondition refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signal");

  -[VSTimeoutCondition refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (void)stop
{
  void *v3;
  void *v4;
  id v5;

  -[VSTimeoutCondition refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  self->_shouldStop = 1;
  -[VSTimeoutCondition refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signal");

  -[VSTimeoutCondition refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (BOOL)wait
{
  _BOOL4 v3;

  do
  {
    -[VSTimeoutCondition timeoutValue](self, "timeoutValue");
    v3 = -[VSTimeoutCondition _waitForTimeInterval:](self, "_waitForTimeInterval:");
  }
  while (v3 && !-[VSTimeoutCondition shouldStop](self, "shouldStop"));
  return v3;
}

- (double)timeoutValue
{
  return self->_timeoutValue;
}

- (void)setTimeoutValue:(double)a3
{
  self->_timeoutValue = a3;
}

- (NSCondition)refreshTimeoutCondition
{
  return self->_refreshTimeoutCondition;
}

- (void)setRefreshTimeoutCondition:(id)a3
{
  objc_storeStrong((id *)&self->_refreshTimeoutCondition, a3);
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshTimeoutCondition, 0);
}

@end
