@implementation MSDServerRetryPolicyContext

- (BOOL)tryCachingHub
{
  return self->_tryCachingHub;
}

- (void)setTryCachingHub:(BOOL)a3
{
  self->_tryCachingHub = a3;
}

- (MSDFileDownloadCredentials)fdc
{
  return (MSDFileDownloadCredentials *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFdc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)cachedLocalURL
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedLocalURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)originServer
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOriginServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originServer, 0);
  objc_storeStrong((id *)&self->_cachedLocalURL, 0);
  objc_storeStrong((id *)&self->_fdc, 0);
}

@end
