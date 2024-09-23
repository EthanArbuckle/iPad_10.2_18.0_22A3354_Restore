@implementation SSVSAPSignatureComponent

- (SSVSAPSignatureComponent)initWithComponentType:(int64_t)a3 key:(id)a4
{
  id v6;
  SSVSAPSignatureComponent *v7;
  SSVSAPSignatureComponent *v8;
  uint64_t v9;
  NSString *key;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSVSAPSignatureComponent;
  v7 = -[SSVSAPSignatureComponent init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_componentType = a3;
    v9 = objc_msgSend(v6, "copy");
    key = v8->_key;
    v8->_key = (NSString *)v9;

  }
  return v8;
}

- (id)dataToSignWithRequestProperties:(id)a3
{
  id v4;
  SSVSAPSignatureDataSource *v5;
  void *v6;

  v4 = a3;
  v5 = -[SSVSAPSignatureDataSource initWithURLRequestProperties:]([SSVSAPSignatureDataSource alloc], "initWithURLRequestProperties:", v4);

  -[SSVSAPSignatureComponent _dataToSignWithDataSource:](self, "_dataToSignWithDataSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataToSignWithURLRequest:(id)a3
{
  id v4;
  SSVSAPSignatureDataSource *v5;
  void *v6;

  v4 = a3;
  v5 = -[SSVSAPSignatureDataSource initWithURLRequest:]([SSVSAPSignatureDataSource alloc], "initWithURLRequest:", v4);

  -[SSVSAPSignatureComponent _dataToSignWithDataSource:](self, "_dataToSignWithDataSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataToSignWithURLResponse:(id)a3 responseData:(id)a4
{
  id v6;
  id v7;
  SSVSAPSignatureDataSource *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[SSVSAPSignatureDataSource initWithURLResponse:bodyData:]([SSVSAPSignatureDataSource alloc], "initWithURLResponse:bodyData:", v7, v6);

  -[SSVSAPSignatureComponent _dataToSignWithDataSource:](self, "_dataToSignWithDataSource:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dataToSignWithDataSource:(id)a3
{
  id v4;
  void *v5;
  int64_t componentType;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  componentType = self->_componentType;
  if (componentType == 2)
  {
    objc_msgSend(v4, "valueForQueryParameter:", self->_key);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (componentType != 1)
    {
      if (componentType)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v4, "HTTPBody");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_12;
    }
    objc_msgSend(v4, "valueForHTTPHeader:", self->_key);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

LABEL_12:
  return v7;
}

- (int64_t)componentType
{
  return self->_componentType;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
