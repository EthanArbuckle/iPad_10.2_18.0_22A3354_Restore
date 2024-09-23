@implementation RTAccountManagerNotificationAccountChanged

- (RTAccountManagerNotificationAccountChanged)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLatestAccount_oldAccount_);
}

- (RTAccountManagerNotificationAccountChanged)initWithLatestAccount:(id)a3 oldAccount:(id)a4
{
  id v7;
  id v8;
  RTAccountManagerNotificationAccountChanged *v9;
  RTAccountManagerNotificationAccountChanged *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTAccountManagerNotificationAccountChanged;
  v9 = -[RTNotification init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_latestAccount, a3);
    objc_storeStrong((id *)&v10->_oldAccount, a4);
  }

  return v10;
}

- (RTAccount)latestAccount
{
  return self->_latestAccount;
}

- (RTAccount)oldAccount
{
  return self->_oldAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldAccount, 0);
  objc_storeStrong((id *)&self->_latestAccount, 0);
}

@end
