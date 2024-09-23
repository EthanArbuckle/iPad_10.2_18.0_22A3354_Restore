@implementation SSAuthenticateResponse

- (NSError)error
{
  SSAuthenticateResponse *v2;
  NSError *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSError *v11;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_error;
  -[NSError domain](v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFD9A0]);

  if (v5)
  {
    if (-[NSError code](v3, "code") == 5001)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      -[NSError userInfo](v3, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("SSServerErrorDomain"), 5001, v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v11 = (NSError *)v8;

      v3 = v11;
      goto LABEL_9;
    }
    if (-[NSError code](v3, "code") == 5304)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      -[NSError userInfo](v3, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SSServerErrorDomain"), 5304, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (-[NSError code](v3, "code") == -5000)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      -[NSError userInfo](v3, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SSServerErrorDomain"), -5000, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
LABEL_9:
  objc_sync_exit(v2);

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)SSAuthenticateResponse;
  -[SSAuthenticateResponse description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:\n"), v4);

  -[SSAuthenticateResponse authenticatedAccount](self, "authenticatedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  authenticatedAccount = %@\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("  authenticateResponseType = %ld\n"), -[SSAuthenticateResponse authenticateResponseType](self, "authenticateResponseType"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  credentialSource = %ld\n"), -[SSAuthenticateResponse credentialSource](self, "credentialSource"));
  -[SSAuthenticateResponse error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  error = %@\n"), v6);

  -[SSAuthenticateResponse responseDictionary](self, "responseDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  responseDictionary = %@"), v7);

  return (NSString *)v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)-[SSAccount uniqueIdentifier](self->_authenticatedAccount, "uniqueIdentifier"));
  xpc_dictionary_set_int64(v3, "4", self->_credentialSource);
  xpc_dictionary_set_int64(v3, "3", self->_authenticateResponseType);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_error);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_responseDictionary);
  return v3;
}

- (SSAuthenticateResponse)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSAuthenticateResponse *v6;
  SSAuthenticateResponse *v7;
  CFArrayRef v8;
  void *v9;
  uint64_t v10;
  SSAccount *authenticatedAccount;
  id v12;
  void *v13;
  uint64_t v14;
  NSError *error;
  CFArrayRef v16;
  NSDictionary *responseDictionary;
  objc_super v19;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v19.receiver = self;
    v19.super_class = (Class)SSAuthenticateResponse;
    v7 = -[SSAuthenticateResponse init](&v19, sel_init);
    if (v7)
    {
      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accountWithUniqueIdentifier:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
      authenticatedAccount = v7->_authenticatedAccount;
      v7->_authenticatedAccount = (SSAccount *)v10;

      v7->_authenticateResponseType = xpc_dictionary_get_int64(v5, "3");
      v7->_credentialSource = xpc_dictionary_get_int64(v5, "4");
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v5, "1");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "initWithXPCEncoding:", v13);
      error = v7->_error;
      v7->_error = (NSError *)v14;

      objc_opt_class();
      v16 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
      responseDictionary = v7->_responseDictionary;
      v7->_responseDictionary = (NSDictionary *)v16;

    }
    self = v7;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SSAccount)authenticatedAccount
{
  return self->_authenticatedAccount;
}

- (void)setAuthenticatedAccount:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedAccount, a3);
}

- (int64_t)authenticateResponseType
{
  return self->_authenticateResponseType;
}

- (void)setAuthenticateResponseType:(int64_t)a3
{
  self->_authenticateResponseType = a3;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)credentialSource
{
  return self->_credentialSource;
}

- (void)setCredentialSource:(unint64_t)a3
{
  self->_credentialSource = a3;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_authenticatedAccount, 0);
}

@end
