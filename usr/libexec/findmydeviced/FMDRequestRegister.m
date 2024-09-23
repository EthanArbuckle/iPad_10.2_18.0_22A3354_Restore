@implementation FMDRequestRegister

- (id)urlTemplateType
{
  return CFSTR("register");
}

- (double)maxRetryInterval
{
  return 3600.0;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return -1;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return -1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (NSString)digestKey
{
  return self->_digestKey;
}

- (void)setDigestKey:(id)a3
{
  objc_storeStrong((id *)&self->_digestKey, a3);
}

- (NSData)digestData
{
  return self->_digestData;
}

- (void)setDigestData:(id)a3
{
  objc_storeStrong((id *)&self->_digestData, a3);
}

- (NSString)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
  objc_storeStrong((id *)&self->_cause, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cause, 0);
  objc_storeStrong((id *)&self->_digestData, 0);
  objc_storeStrong((id *)&self->_digestKey, 0);
}

@end
