@implementation STSCASessionStats

- (STSCASessionStats)init
{
  STSCASessionStats *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSCASessionStats;
  result = -[STSCASessionStats init](&v3, sel_init);
  if (result)
  {
    result->_totalTransactionsInSession = 0;
    result->_totalSuccessfulTransactionsInSession = 0;
  }
  return result;
}

- (void)postReaderSessionEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = 0x24D3A9E00;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_totalTransactionsInSession);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = 0x24D3A9E20;
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_totalSuccessfulTransactionsInSession);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[STSReaderAnalyticsLogger sharedCALogger](STSReaderAnalyticsLogger, "sharedCALogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postReaderSessionEvent:", v5);

}

- (int64_t)totalTransactionsInSession
{
  return self->_totalTransactionsInSession;
}

- (void)setTotalTransactionsInSession:(int64_t)a3
{
  self->_totalTransactionsInSession = a3;
}

- (int64_t)totalSuccessfulTransactionsInSession
{
  return self->_totalSuccessfulTransactionsInSession;
}

- (void)setTotalSuccessfulTransactionsInSession:(int64_t)a3
{
  self->_totalSuccessfulTransactionsInSession = a3;
}

@end
