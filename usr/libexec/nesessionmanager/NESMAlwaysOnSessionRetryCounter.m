@implementation NESMAlwaysOnSessionRetryCounter

- (NESMAlwaysOnSessionRetryCounter)init
{
  NESMAlwaysOnSessionRetryCounter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMAlwaysOnSessionRetryCounter;
  result = -[NESMAlwaysOnSessionRetryCounter init](&v3, "init");
  if (result)
  {
    result->_interval = 0;
    result->_retryCount = 0;
  }
  return result;
}

@end
