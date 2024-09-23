@implementation OspreyConnectionConfiguration

- (BOOL)isEqual:(id)a3
{
  OspreyConnectionConfiguration *v4;
  OspreyConnectionConfiguration *v5;
  NSURL *connectionUrl;
  NSURL *v7;
  BOOL v8;
  NSURLSessionConfiguration *urlSessionConfiguration;
  NSURLSessionConfiguration *v10;

  v4 = (OspreyConnectionConfiguration *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      connectionUrl = self->_connectionUrl;
      -[OspreyConnectionConfiguration connectionUrl](v5, "connectionUrl");
      v7 = (NSURL *)objc_claimAutoreleasedReturnValue();

      if (connectionUrl == v7)
      {
        urlSessionConfiguration = self->_urlSessionConfiguration;
        -[OspreyConnectionConfiguration urlSessionConfiguration](v5, "urlSessionConfiguration");
        v10 = (NSURLSessionConfiguration *)objc_claimAutoreleasedReturnValue();
        v8 = urlSessionConfiguration == v10;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_connectionUrl, "hash");
  return -[NSURLSessionConfiguration hash](self->_urlSessionConfiguration, "hash") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  OspreyConnectionConfiguration *v4;

  v4 = objc_alloc_init(OspreyConnectionConfiguration);
  -[OspreyConnectionConfiguration setConnectionUrl:](v4, "setConnectionUrl:", self->_connectionUrl);
  -[OspreyConnectionConfiguration setUrlSessionConfiguration:](v4, "setUrlSessionConfiguration:", self->_urlSessionConfiguration);
  return v4;
}

- (NSURL)connectionUrl
{
  return self->_connectionUrl;
}

- (void)setConnectionUrl:(id)a3
{
  objc_storeStrong((id *)&self->_connectionUrl, a3);
}

- (NSURLSessionConfiguration)urlSessionConfiguration
{
  return self->_urlSessionConfiguration;
}

- (void)setUrlSessionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_urlSessionConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_connectionUrl, 0);
}

@end
