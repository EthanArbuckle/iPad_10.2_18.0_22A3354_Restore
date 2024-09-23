@implementation NESMVPNSessionRetryCounter

- (NESMVPNSessionRetryCounter)init
{
  NESMVPNSessionRetryCounter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionRetryCounter;
  result = -[NESMVPNSessionRetryCounter init](&v3, "init");
  if (result)
  {
    result->_interval = 0;
    result->_retryCount = 0;
  }
  return result;
}

@end
