@implementation TRSetupAuthenticationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSSet *unauthenticatedAccountServices;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupAuthenticationResponse;
  -[TRMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  unauthenticatedAccountServices = self->_unauthenticatedAccountServices;
  if (unauthenticatedAccountServices)
  {
    objc_msgSend(v4, "encodeObject:forKey:", unauthenticatedAccountServices, CFSTR("TRSetupAuthenticationMessages_uAS"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_error, CFSTR("TRSetupAuthenticationMessages_err"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_authenticationResults, CFSTR("TRSetupAuthenticationMessages_ar"));
  }

}

- (TRSetupAuthenticationResponse)initWithCoder:(id)a3
{
  id v4;
  TRSetupAuthenticationResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *unauthenticatedAccountServices;
  uint64_t v11;
  NSError *error;
  uint64_t v13;
  NSDictionary *authenticationResults;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRSetupAuthenticationResponse;
  v5 = -[TRMessage initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("TRSetupAuthenticationMessages_uAS"));
    v9 = objc_claimAutoreleasedReturnValue();
    unauthenticatedAccountServices = v5->_unauthenticatedAccountServices;
    v5->_unauthenticatedAccountServices = (NSSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRSetupAuthenticationMessages_err"));
    v11 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v11;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("TRSetupAuthenticationMessages_ar"));
    v13 = objc_claimAutoreleasedReturnValue();
    authenticationResults = v5->_authenticationResults;
    v5->_authenticationResults = (NSDictionary *)v13;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  _StringFromAccountServices(self->_unauthenticatedAccountServices);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("unauthenticatedAccountServices:%@ error:%@ authResults:%@"), v4, self->_error, self->_authenticationResults);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)TRSetupAuthenticationResponse;
  -[TRMessage description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)unauthenticatedAccountServices
{
  return self->_unauthenticatedAccountServices;
}

- (void)setUnauthenticatedAccountServices:(id)a3
{
  objc_storeStrong((id *)&self->_unauthenticatedAccountServices, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void)setAuthenticationResults:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationResults, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_unauthenticatedAccountServices, 0);
}

@end
