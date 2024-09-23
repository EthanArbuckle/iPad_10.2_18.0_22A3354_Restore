@implementation APMescalSignSetupRequester

- (Class)responseClass
{
  return (Class)objc_opt_class(APPBMescalSignSAPSetupResponse, a2);
}

- (id)protoBuffer
{
  APPBMescalSignSAPSetupRequest *v3;
  void *v4;

  v3 = objc_alloc_init(APPBMescalSignSAPSetupRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMescalSignSetupRequester data](self, "data"));
  -[APPBMescalSignSAPSetupRequest setBuffer:](v3, "setBuffer:", v4);

  return v3;
}

- (id)headers
{
  NSDictionary *v2;
  void *v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APMescalSignSetupRequester;
  v2 = -[APServerRequester headers](&v7, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKey:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
