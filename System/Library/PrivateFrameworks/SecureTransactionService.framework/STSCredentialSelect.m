@implementation STSCredentialSelect

- (void)encodeWithCoder:(id)a3
{
  NSData *authData;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentifier, CFSTR("credentialIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_elementsByNamespace, CFSTR("elementsByNamespace"));
  authData = self->_authData;
  if (authData)
    objc_msgSend(v5, "encodeObject:forKey:", authData, CFSTR("authData"));

}

- (STSCredentialSelect)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *credentialIdentifier;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *elementsByNamespace;
  NSData *v13;
  NSData *authData;

  if (self)
  {
    v4 = a3;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    credentialIdentifier = self->_credentialIdentifier;
    self->_credentialIdentifier = v5;

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("elementsByNamespace"));
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    elementsByNamespace = self->_elementsByNamespace;
    self->_elementsByNamespace = v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authData"));
    v13 = (NSData *)objc_claimAutoreleasedReturnValue();

    authData = self->_authData;
    self->_authData = v13;

  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authData, 0);
  objc_storeStrong((id *)&self->_elementsByNamespace, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end
