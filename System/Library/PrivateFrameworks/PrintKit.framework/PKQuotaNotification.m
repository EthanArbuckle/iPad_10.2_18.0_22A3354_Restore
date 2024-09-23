@implementation PKQuotaNotification

- (void)_interpretResult:(unint64_t)a3 responseDict:(id)a4
{
  NSLog(CFSTR("quota result here"), a2, a3, a4);
}

- (NSURL)quotaURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setQuotaURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quotaURL, 0);
}

@end
