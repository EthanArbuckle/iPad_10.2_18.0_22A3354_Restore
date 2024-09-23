@implementation VSApplicationControllerResponse

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
  -[VSApplicationControllerResponse authenticationScheme](self, "authenticationScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("authenticationScheme"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[VSApplicationControllerResponse responseStatusCode](self, "responseStatusCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("responseStatusCode"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[VSApplicationControllerResponse responseString](self, "responseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("responseString"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[VSApplicationControllerResponse expectedAction](self, "expectedAction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("expectedAction"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[VSApplicationControllerResponse accountAuthentication](self, "accountAuthentication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("accountAuthentication"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)MEMORY[0x24BDD17C8];
  -[VSApplicationControllerResponse accountChannelIDs](self, "accountChannelIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("accountChannelIDs"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  -[VSApplicationControllerResponse subscriptionsToAdd](self, "subscriptionsToAdd");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("subscriptionsToAdd"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  v25 = (void *)MEMORY[0x24BDD17C8];
  -[VSApplicationControllerResponse subscriptionsToRemoveByBundleID](self, "subscriptionsToRemoveByBundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("subscriptionsToRemoveByBundleID"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)MEMORY[0x24BDD17C8];
  -[VSApplicationControllerResponse applicationUserAccounts](self, "applicationUserAccounts");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("applicationUserAccounts"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  v31 = (void *)MEMORY[0x24BDD17C8];
  v36.receiver = self;
  v36.super_class = (Class)VSApplicationControllerResponse;
  -[VSApplicationControllerResponse description](&v36, sel_description);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@ %@>"), v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (NSString)authenticationScheme
{
  return self->_authenticationScheme;
}

- (void)setAuthenticationScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)responseStatusCode
{
  return self->_responseStatusCode;
}

- (void)setResponseStatusCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)responseString
{
  return self->_responseString;
}

- (void)setResponseString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)expectedAction
{
  return self->_expectedAction;
}

- (void)setExpectedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (VSAccountAuthentication)accountAuthentication
{
  return self->_accountAuthentication;
}

- (void)setAccountAuthentication:(id)a3
{
  objc_storeStrong((id *)&self->_accountAuthentication, a3);
}

- (NSSet)accountChannelIDs
{
  return self->_accountChannelIDs;
}

- (void)setAccountChannelIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)subscriptionsToAdd
{
  return self->_subscriptionsToAdd;
}

- (void)setSubscriptionsToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)subscriptionsToRemoveByBundleID
{
  return self->_subscriptionsToRemoveByBundleID;
}

- (void)setSubscriptionsToRemoveByBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)applicationUserAccounts
{
  return self->_applicationUserAccounts;
}

- (void)setApplicationUserAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationUserAccounts, 0);
  objc_storeStrong((id *)&self->_subscriptionsToRemoveByBundleID, 0);
  objc_storeStrong((id *)&self->_subscriptionsToAdd, 0);
  objc_storeStrong((id *)&self->_accountChannelIDs, 0);
  objc_storeStrong((id *)&self->_accountAuthentication, 0);
  objc_storeStrong((id *)&self->_expectedAction, 0);
  objc_storeStrong((id *)&self->_responseString, 0);
  objc_storeStrong((id *)&self->_responseStatusCode, 0);
  objc_storeStrong((id *)&self->_authenticationScheme, 0);
}

@end
