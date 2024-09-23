@implementation TransparencyResponse

- (TransparencyResponse)initWithRequest:(id)a3 responseData:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  TransparencyResponse *v11;
  TransparencyResponse *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TransparencyResponse;
  v11 = -[TransparencyResponse init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[TransparencyResponse setRequest:](v11, "setRequest:", v8);
    -[TransparencyResponse setData:](v12, "setData:", v9);
    -[TransparencyResponse setMetadata:](v12, "setMetadata:", v10);
  }

  return v12;
}

- (id)serverHint
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyResponse metadata](self, "metadata"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyResponse metadata](self, "metadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", kTransparencyResponseMetadataKeyServerHint));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (TransparencyNetworkRequest)request
{
  return (TransparencyNetworkRequest *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
