@implementation MSDFMHResponse

- (NSNumber)retryAfter
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRetryAfter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)fmhDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFmhDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmhDict, 0);
  objc_storeStrong((id *)&self->_retryAfter, 0);
}

@end
