@implementation CheckIDSRegistrationMonitor

- (BOOL)isKTKeyDifferent:(id)a3
{
  return 0;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
