@implementation MSDServerResponse

- (MSDServerResponse)initWithError:(id)a3
{
  id v4;
  MSDServerResponse *v5;
  MSDServerResponse *v6;
  MSDServerResponse *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDServerResponse;
  v5 = -[MSDServerResponse init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDServerResponse setError:](v5, "setError:", v4);
    -[MSDServerResponse setData:](v6, "setData:", 0);
    v7 = v6;
  }

  return v6;
}

- (NSString)getName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
