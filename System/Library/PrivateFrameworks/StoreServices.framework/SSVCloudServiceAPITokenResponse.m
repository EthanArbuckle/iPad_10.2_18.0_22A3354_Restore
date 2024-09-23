@implementation SSVCloudServiceAPITokenResponse

- (SSVCloudServiceAPITokenResponse)initWithToken:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SSVCloudServiceAPITokenResponse *v8;
  uint64_t v9;
  NSString *apiToken;
  uint64_t v11;
  NSError *error;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSVCloudServiceAPITokenResponse;
  v8 = -[SSVCloudServiceAPITokenResponse init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    apiToken = v8->_apiToken;
    v8->_apiToken = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    error = v8->_error;
    v8->_error = (NSError *)v11;

  }
  return v8;
}

- (SSVCloudServiceAPITokenResponse)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVCloudServiceAPITokenResponse *v6;
  CFArrayRef v8;
  NSString *apiToken;
  id v10;
  void *v11;
  uint64_t v12;
  NSError *error;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSVCloudServiceAPITokenResponse;
    v6 = -[SSVCloudServiceAPITokenResponse init](&v14, sel_init);
    if (v6)
    {
      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      apiToken = v6->_apiToken;
      v6->_apiToken = (NSString *)v8;

      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v5, "1");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithXPCEncoding:", v11);
      error = v6->_error;
      v6->_error = (NSError *)v12;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_apiToken);
  SSXPCDictionarySetObject(v3, "1", self->_error);
  return v3;
}

- (NSString)apiToken
{
  return self->_apiToken;
}

- (void)setApiToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_apiToken, 0);
}

@end
