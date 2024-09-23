@implementation UNCPushRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenIdentifier, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCPushRegistration environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, CFSTR("Environment"));

  -[UNCPushRegistration token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, CFSTR("Token"));

  -[UNCPushRegistration tokenIdentifier](self, "tokenIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, CFSTR("TokenIdentifier"));

  return v3;
}

- (NSData)token
{
  return self->_token;
}

- (NSString)tokenIdentifier
{
  return self->_tokenIdentifier;
}

- (NSString)environment
{
  return self->_environment;
}

+ (id)pushRegistrationWithEnvironment:(id)a3 tokenIdentifier:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEnvironment:tokenIdentifier:token:", v10, v9, v8);

  return v11;
}

- (UNCPushRegistration)initWithEnvironment:(id)a3 tokenIdentifier:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  UNCPushRegistration *v11;
  uint64_t v12;
  NSString *environment;
  uint64_t v14;
  NSString *tokenIdentifier;
  uint64_t v16;
  NSData *token;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNCPushRegistration;
  v11 = -[UNCPushRegistration init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    environment = v11->_environment;
    v11->_environment = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    tokenIdentifier = v11->_tokenIdentifier;
    v11->_tokenIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    token = v11->_token;
    v11->_token = (NSData *)v16;

  }
  return v11;
}

- (UNCPushRegistration)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UNCPushRegistration *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("Environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("TokenIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Token"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UNCPushRegistration initWithEnvironment:tokenIdentifier:token:](self, "initWithEnvironment:tokenIdentifier:token:", v5, v6, v7);
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCPushRegistration environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("Environment"));

  -[UNCPushRegistration tokenIdentifier](self, "tokenIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("TokenIdentifier"));

  -[UNCPushRegistration token](self, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("Token"));

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_6;
  -[UNCPushRegistration environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = UNEqualObjects();

  if (!v8)
    goto LABEL_6;
  -[UNCPushRegistration token](self, "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = UNEqualObjects();

  if (v11)
  {
    -[UNCPushRegistration tokenIdentifier](self, "tokenIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = UNEqualObjects();

  }
  else
  {
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCPushRegistration environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[UNCPushRegistration token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[UNCPushRegistration tokenIdentifier](self, "tokenIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = objc_msgSend(v3, "hash");
  return v10;
}

@end
