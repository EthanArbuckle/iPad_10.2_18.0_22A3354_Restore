@implementation RMGenericAuthenticationCredential

- (RMGenericAuthenticationCredential)initWithAuthenticationScheme:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  RMGenericAuthenticationCredential *v8;
  uint64_t v9;
  NSString *authenticationScheme;
  uint64_t v11;
  NSDictionary *properties;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RMGenericAuthenticationCredential;
  v8 = -[RMGenericAuthenticationCredential init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    authenticationScheme = v8->_authenticationScheme;
    v8->_authenticationScheme = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    properties = v8->_properties;
    v8->_properties = (NSDictionary *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMGenericAuthenticationCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  RMGenericAuthenticationCredential *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationScheme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("properties"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v5 && v12)
  {
    self = -[RMGenericAuthenticationCredential initWithAuthenticationScheme:properties:](self, "initWithAuthenticationScheme:properties:", v5, v12);
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("authenticationScheme"));

  -[RMGenericAuthenticationCredential properties](self, "properties");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("properties"));

}

- (BOOL)isEqual:(id)a3
{
  RMGenericAuthenticationCredential *v4;
  BOOL v5;

  v4 = (RMGenericAuthenticationCredential *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMGenericAuthenticationCredential isEqualToAuthenticationCredential:](self, "isEqualToAuthenticationCredential:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAuthenticationCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticationScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[RMGenericAuthenticationCredential properties](self, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Generic Authentication Credential (%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMGenericAuthenticationCredential properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { authenticationScheme = %@, %@ }>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)authenticationScheme
{
  return self->_authenticationScheme;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_authenticationScheme, 0);
}

@end
