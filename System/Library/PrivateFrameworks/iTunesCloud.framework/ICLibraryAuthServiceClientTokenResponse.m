@implementation ICLibraryAuthServiceClientTokenResponse

- (ICLibraryAuthServiceClientTokenResponse)initWithResponseDictionary:(id)a3
{
  id v4;
  ICLibraryAuthServiceClientTokenResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  ICLibraryAuthServiceClientTokenResult *v12;
  ICLibraryAuthServiceClientTokenResult *tokenResult;

  v4 = a3;
  v5 = -[ICLibraryAuthServiceClientTokenResponse init](self, "init");
  if (!v5)
    goto LABEL_16;
  objc_msgSend(v4, "objectForKey:", CFSTR("resultCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v5->_resultCode = objc_msgSend(v6, "intValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("serverHostName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSString())
    objc_storeStrong((id *)&v5->_serverHostName, v7);
  objc_msgSend(v4, "objectForKey:", CFSTR("serverInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
    v5->_serverInstance = objc_msgSend(v8, "longLongValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("success"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
  {
    v10 = objc_msgSend(v9, "BOOLValue");
LABEL_12:
    v5->_success = v10;
    goto LABEL_13;
  }
  if (_NSIsNSString())
  {
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("true"));
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v4, "objectForKey:", CFSTR("result"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSDictionary())
  {
    v12 = -[ICLibraryAuthServiceClientTokenResult initWithResponseDictionary:]([ICLibraryAuthServiceClientTokenResult alloc], "initWithResponseDictionary:", v11);
    tokenResult = v5->_tokenResult;
    v5->_tokenResult = v12;

  }
LABEL_16:

  return v5;
}

- (ICLibraryAuthServiceClientTokenResponse)initWithResultCode:(int)a3
{
  ICLibraryAuthServiceClientTokenResponse *result;

  result = -[ICLibraryAuthServiceClientTokenResponse init](self, "init");
  if (result)
  {
    result->_resultCode = a3;
    result->_success = a3 == 200;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ICLibraryAuthServiceClientTokenResponse;
  -[ICLibraryAuthServiceClientTokenResponse description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ resultCode=%d token=%@"), v4, -[ICLibraryAuthServiceClientTokenResponse resultCode](self, "resultCode"), self->_tokenResult);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)resultCode
{
  return self->_resultCode;
}

- (NSString)serverHostName
{
  return self->_serverHostName;
}

- (int64_t)serverInstance
{
  return self->_serverInstance;
}

- (BOOL)isSuccess
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (ICLibraryAuthServiceClientTokenResult)tokenResult
{
  return self->_tokenResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenResult, 0);
  objc_storeStrong((id *)&self->_serverHostName, 0);
}

@end
