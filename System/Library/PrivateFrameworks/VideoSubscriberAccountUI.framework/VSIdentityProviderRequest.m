@implementation VSIdentityProviderRequest

+ (id)makeAccountRequestWithStorage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[VSIdentityProviderRequest _initWithRequestType:account:storage:]([VSIdentityProviderRequest alloc], "_initWithRequestType:account:storage:", 1, 0, v3);

  return v4;
}

+ (id)silentMakeAccountRequestWithStorage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[VSIdentityProviderRequest _initWithRequestType:account:storage:]([VSIdentityProviderRequest alloc], "_initWithRequestType:account:storage:", 4, 0, v3);

  return v4;
}

+ (id)accountMetadataRequestWithAccount:(id)a3 storage:(id)a4 accountMetadataRequest:(id)a5 requestingAppDisplayName:(id)a6 requestingAppAdamID:(id)a7 accountProviderAuthenticationToken:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v15)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The accountMetadataRequest parameter must not be nil."));
  v19 = -[VSIdentityProviderRequest _initWithRequestType:account:storage:]([VSIdentityProviderRequest alloc], "_initWithRequestType:account:storage:", 3, v13, v14);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccountMetadataRequest:", v20);

  v21 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v19, "setRequestingAppDisplayName:", v21);

  v22 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v19, "setRequestingAppAdamID:", v22);

  v23 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v19, "setAccountProviderAuthenticationToken:", v23);

  return v19;
}

+ (id)deleteAccountRequestWithAccount:(id)a3 storage:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The account parameter must not be nil."));
  v7 = -[VSIdentityProviderRequest _initWithRequestType:account:storage:]([VSIdentityProviderRequest alloc], "_initWithRequestType:account:storage:", 2, v5, v6);

  return v7;
}

+ (id)STBOptOutRequestWithStorage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[VSIdentityProviderRequest _initWithRequestType:account:storage:]([VSIdentityProviderRequest alloc], "_initWithRequestType:account:storage:", 5, 0, v3);

  objc_msgSend(v4, "setType:", 5);
  return v4;
}

- (VSIdentityProviderRequest)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (BOOL)allowsUI
{
  void *v4;
  void *v5;
  char v6;

  if (-[VSIdentityProviderRequest requiresUI](self, "requiresUI"))
    return 1;
  if (-[VSIdentityProviderRequest type](self, "type") != 3)
    return 0;
  -[VSIdentityProviderRequest accountMetadataRequest](self, "accountMetadataRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceUnwrapObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInterruptionAllowed");

  return v6;
}

- (BOOL)requiresUI
{
  return -[VSIdentityProviderRequest type](self, "type") == 1;
}

- (id)_initWithRequestType:(int64_t)a3 account:(id)a4 storage:(id)a5
{
  id v9;
  id v10;
  VSIdentityProviderRequest *v11;
  VSIdentityProviderRequest *v12;
  VSOptional *v13;
  VSOptional *accountMetadataRequest;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  if (!v10)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The storage parameter must not be nil."));
  v16.receiver = self;
  v16.super_class = (Class)VSIdentityProviderRequest;
  v11 = -[VSIdentityProviderRequest init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_account, a4);
    objc_storeStrong((id *)&v12->_storage, a5);
    v13 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    accountMetadataRequest = v12->_accountMetadataRequest;
    v12->_accountMetadataRequest = v13;

  }
  return v12;
}

- (BOOL)forceAuthentication
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[VSIdentityProviderRequest accountMetadataRequest](self, "accountMetadataRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__VSIdentityProviderRequest_forceAuthentication__block_invoke;
  v4[3] = &unk_24FE1A7E8;
  v4[4] = &v5;
  objc_msgSend(v2, "conditionallyUnwrapObject:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __48__VSIdentityProviderRequest_forceAuthentication__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "forceAuthentication");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[VSIdentityProviderRequest type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("type"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[VSIdentityProviderRequest requestingAppDisplayName](self, "requestingAppDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("requestingAppDisplayName"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[VSIdentityProviderRequest requestingAppAdamID](self, "requestingAppAdamID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("requestingAppAdamID"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[VSIdentityProviderRequest account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("account"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[VSIdentityProviderRequest storage](self, "storage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("storage"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)MEMORY[0x24BDD17C8];
  -[VSIdentityProviderRequest accountMetadataRequest](self, "accountMetadataRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("accountMetadataRequest"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "vs_yesNoStringValueFromBool:", -[VSIdentityProviderRequest forceAuthentication](self, "forceAuthentication"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("forceAuthentication"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  v25 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "vs_yesNoStringValueFromBool:", -[VSIdentityProviderRequest allowsUI](self, "allowsUI"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("allowsUI"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "vs_yesNoStringValueFromBool:", -[VSIdentityProviderRequest requiresUI](self, "requiresUI"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("requiresUI"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  v31 = (void *)MEMORY[0x24BDD17C8];
  v36.receiver = self;
  v36.super_class = (Class)VSIdentityProviderRequest;
  -[VSIdentityProviderRequest description](&v36, sel_description);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@ %@>"), v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)requestingAppDisplayName
{
  return self->_requestingAppDisplayName;
}

- (void)setRequestingAppDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)requestingAppAdamID
{
  return self->_requestingAppAdamID;
}

- (void)setRequestingAppAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (VSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (VSOptional)accountMetadataRequest
{
  return self->_accountMetadataRequest;
}

- (void)setAccountMetadataRequest:(id)a3
{
  objc_storeStrong((id *)&self->_accountMetadataRequest, a3);
}

- (NSString)accountProviderAuthenticationToken
{
  return self->_accountProviderAuthenticationToken;
}

- (void)setAccountProviderAuthenticationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountProviderAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_accountMetadataRequest, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_requestingAppAdamID, 0);
  objc_storeStrong((id *)&self->_requestingAppDisplayName, 0);
}

@end
