@implementation VSJSResponsePayload

- (VSJSResponsePayload)init
{
  void *v3;
  VSJSResponsePayload *v4;
  NSString *authN;
  NSString *userMetadata;
  NSString *logout;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BE51928], "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)VSJSResponsePayload;
  v4 = -[IKJSObject initWithAppContext:](&v9, sel_initWithAppContext_, v3);

  if (v4)
  {
    authN = v4->_authN;
    v4->_authN = (NSString *)&stru_24FE1B848;

    userMetadata = v4->_userMetadata;
    v4->_userMetadata = (NSString *)&stru_24FE1B848;

    logout = v4->_logout;
    v4->_logout = (NSString *)&stru_24FE1B848;

    objc_storeStrong((id *)&v4->_authenticationScheme, (id)*MEMORY[0x24BDF8DD8]);
    v4->_synchronizable = 1;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSJSResponsePayload *v4;
  void *v5;
  VSJSResponsePayload *v6;
  uint64_t v7;
  NSString *authN;
  uint64_t v9;
  NSString *username;
  uint64_t v11;
  NSDate *expirationDate;
  uint64_t v13;
  NSString *userMetadata;
  uint64_t v15;
  NSString *logout;
  uint64_t v17;
  NSArray *userChannelList;
  uint64_t v19;
  NSString *authenticationScheme;
  uint64_t v21;
  NSString *statusCode;
  uint64_t v23;
  NSNumber *expectedAction;
  uint64_t v25;
  NSArray *subscriptions;
  uint64_t v27;
  NSArray *clearSubscriptions;
  uint64_t v29;
  NSArray *userAccounts;
  uint64_t v31;
  NSString *appBundleIdentifier;

  v4 = +[VSJSResponsePayload allocWithZone:](VSJSResponsePayload, "allocWithZone:", a3);
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v4, "initWithAppContext:", v5);

  v7 = -[NSString copy](self->_authN, "copy");
  authN = v6->_authN;
  v6->_authN = (NSString *)v7;

  v9 = -[NSString copy](self->_username, "copy");
  username = v6->_username;
  v6->_username = (NSString *)v9;

  v11 = -[NSDate copy](self->_expirationDate, "copy");
  expirationDate = v6->_expirationDate;
  v6->_expirationDate = (NSDate *)v11;

  v13 = -[NSString copy](self->_userMetadata, "copy");
  userMetadata = v6->_userMetadata;
  v6->_userMetadata = (NSString *)v13;

  v15 = -[NSString copy](self->_logout, "copy");
  logout = v6->_logout;
  v6->_logout = (NSString *)v15;

  v17 = -[NSArray copy](self->_userChannelList, "copy");
  userChannelList = v6->_userChannelList;
  v6->_userChannelList = (NSArray *)v17;

  v19 = -[NSString copy](self->_authenticationScheme, "copy");
  authenticationScheme = v6->_authenticationScheme;
  v6->_authenticationScheme = (NSString *)v19;

  v21 = -[NSString copy](self->_statusCode, "copy");
  statusCode = v6->_statusCode;
  v6->_statusCode = (NSString *)v21;

  v23 = -[NSNumber copy](self->_expectedAction, "copy");
  expectedAction = v6->_expectedAction;
  v6->_expectedAction = (NSNumber *)v23;

  v25 = -[NSArray copy](self->_subscriptions, "copy");
  subscriptions = v6->_subscriptions;
  v6->_subscriptions = (NSArray *)v25;

  v27 = -[NSArray copy](self->_clearSubscriptions, "copy");
  clearSubscriptions = v6->_clearSubscriptions;
  v6->_clearSubscriptions = (NSArray *)v27;

  v29 = -[NSArray copy](self->_userAccounts, "copy");
  userAccounts = v6->_userAccounts;
  v6->_userAccounts = (NSArray *)v29;

  v31 = -[NSString copy](self->_appBundleIdentifier, "copy");
  appBundleIdentifier = v6->_appBundleIdentifier;
  v6->_appBundleIdentifier = (NSString *)v31;

  return v6;
}

- (NSString)authN
{
  return self->_authN;
}

- (void)setAuthN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)userMetadata
{
  return self->_userMetadata;
}

- (void)setUserMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)logout
{
  return self->_logout;
}

- (void)setLogout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)userChannelList
{
  return self->_userChannelList;
}

- (void)setUserChannelList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)authenticationScheme
{
  return self->_authenticationScheme;
}

- (void)setAuthenticationScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)expectedAction
{
  return self->_expectedAction;
}

- (void)setExpectedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)clearSubscriptions
{
  return self->_clearSubscriptions;
}

- (void)setClearSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)userAccounts
{
  return self->_userAccounts;
}

- (void)setUserAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isSynchronizable
{
  return self->_synchronizable;
}

- (void)setSynchronizable:(BOOL)a3
{
  self->_synchronizable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userAccounts, 0);
  objc_storeStrong((id *)&self->_clearSubscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_expectedAction, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_authenticationScheme, 0);
  objc_storeStrong((id *)&self->_userChannelList, 0);
  objc_storeStrong((id *)&self->_logout, 0);
  objc_storeStrong((id *)&self->_userMetadata, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_authN, 0);
}

@end
