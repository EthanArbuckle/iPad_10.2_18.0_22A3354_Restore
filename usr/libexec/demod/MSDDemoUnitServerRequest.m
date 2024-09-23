@implementation MSDDemoUnitServerRequest

- (MSDDemoUnitServerRequest)init
{
  MSDDemoUnitServerRequest *v2;
  MSDDemoUnitServerRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDDemoUnitServerRequest;
  v2 = -[MSDDemoUnitServerRequest init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDCommandServerRequest setServer:](v2, "setServer:", CFSTR("api.demounit.net"));
    -[MSDCommandServerRequest setPort:](v3, "setPort:", CFSTR("443"));
  }
  return v3;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest server](self, "server"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest port](self, "port"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)useBAAAuthentication
{
  return self->_useBAAAuthentication;
}

- (void)setUseBAAAuthentication:(BOOL)a3
{
  self->_useBAAAuthentication = a3;
}

- (NSURL)urlOverride
{
  return self->_urlOverride;
}

- (void)setUrlOverride:(id)a3
{
  objc_storeStrong((id *)&self->_urlOverride, a3);
}

- (NSString)getUrl
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_urlOverride, 0);
}

@end
