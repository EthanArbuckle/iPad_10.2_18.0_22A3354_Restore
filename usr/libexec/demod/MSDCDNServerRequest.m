@implementation MSDCDNServerRequest

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDCDNServerRequest;
  if (!-[MSDServerRequest isValid](&v6, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNServerRequest downloadCredentials](self, "downloadCredentials"));
  v4 = v3 != 0;

  return v4;
}

- (MSDFileDownloadCredentials)downloadCredentials
{
  return (MSDFileDownloadCredentials *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDownloadCredentials:(id)a3
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
  objc_storeStrong((id *)&self->_downloadCredentials, 0);
}

@end
