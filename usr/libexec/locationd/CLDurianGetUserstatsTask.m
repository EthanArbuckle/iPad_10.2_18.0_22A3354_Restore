@implementation CLDurianGetUserstatsTask

- (CLDurianGetUserstatsTask)initWithPersistence:(BOOL)a3
{
  CLDurianGetUserstatsTask *v3;
  objc_super v5;
  BOOL v6;

  v6 = !a3;
  v5.receiver = self;
  v5.super_class = (Class)CLDurianGetUserstatsTask;
  v3 = -[CLDurianTask initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:](&v5, "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 23, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 1)), -6, 1, 0, 0);
  if (v3)
  {
    v3->_userStatsData = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    v3->_lastFragmentReceived = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianGetUserstatsTask;
  -[CLDurianTask dealloc](&v3, "dealloc");
}

- (BOOL)isComplete
{
  return self->_lastFragmentReceived;
}

- (void)appendUserStatsData:(id)a3
{
  if (*(char *)objc_msgSend(a3, "bytes") < 0)
    self->_lastFragmentReceived = 1;
  -[NSMutableData appendData:](self->_userStatsData, "appendData:", objc_msgSend(a3, "subdataWithRange:", 1, (char *)objc_msgSend(a3, "length") - 1));
}

- (NSMutableData)userStatsData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUserStatsData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)lastFragmentReceived
{
  return self->_lastFragmentReceived;
}

- (void)setLastFragmentReceived:(BOOL)a3
{
  self->_lastFragmentReceived = a3;
}

@end
