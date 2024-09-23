@implementation VSIdentityProviderResponse

- (VSIdentityProviderResponse)init
{
  VSIdentityProviderResponse *v2;
  VSOptional *v3;
  VSOptional *logoLoadOperation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderResponse;
  v2 = -[VSIdentityProviderResponse init](&v6, sel_init);
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    logoLoadOperation = v2->_logoLoadOperation;
    v2->_logoLoadOperation = v3;

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[VSIdentityProviderResponse accountMetadata](self, "accountMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("accountMetadata"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[VSIdentityProviderResponse account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("account"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "vs_yesNoStringValueFromBool:", -[VSIdentityProviderResponse didCreateAccount](self, "didCreateAccount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("didCreateAccount"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[VSIdentityProviderResponse logoLoadOperation](self, "logoLoadOperation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("logoLoadOperation"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  v21.receiver = self;
  v21.super_class = (Class)VSIdentityProviderResponse;
  -[VSIdentityProviderResponse description](&v21, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %@>"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (VSAccountMetadata)accountMetadata
{
  return self->_accountMetadata;
}

- (void)setAccountMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (VSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)didCreateAccount
{
  return self->_didCreateAccount;
}

- (void)setDidCreateAccount:(BOOL)a3
{
  self->_didCreateAccount = a3;
}

- (VSOptional)logoLoadOperation
{
  return self->_logoLoadOperation;
}

- (void)setLogoLoadOperation:(id)a3
{
  objc_storeStrong((id *)&self->_logoLoadOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoLoadOperation, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountMetadata, 0);
}

@end
