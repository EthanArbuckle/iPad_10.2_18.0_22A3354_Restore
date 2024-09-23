@implementation TUVouchingEnablementImpl

- (TUVouchingEnablementImpl)init
{
  void *v3;
  void *v4;
  TUVouchingEnablementImpl *v5;

  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUVouchingEnablementImpl initWithUserDefaults:serverBag:](self, "initWithUserDefaults:serverBag:", v4, v3);

  return v5;
}

- (TUVouchingEnablementImpl)initWithUserDefaults:(id)a3 serverBag:(id)a4
{
  id v7;
  id v8;
  TUVouchingEnablementImpl *v9;
  TUVouchingEnablementImpl *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUVouchingEnablementImpl;
  v9 = -[TUVouchingEnablementImpl init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_serverBag, a4);
  }

  return v10;
}

- (BOOL)isEnabled
{
  return -[TUVouchingEnablementImpl serverBagValueForKey:withDefault:](self, "serverBagValueForKey:withDefault:", CFSTR("vouching-enabled"), 1);
}

- (BOOL)shouldForceVerificationFailures
{
  int v3;

  v3 = _TUIsInternalInstall();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:withDefault:](self->_userDefaults, "BOOLForKey:withDefault:", CFSTR("ForceVoucherVerificationFailures"), 0);
  return v3;
}

- (BOOL)serverBagValueForKey:(id)a3 withDefault:(BOOL)a4
{
  void *v5;
  void *v6;

  -[FTServerBag objectForKey:](self->_serverBag, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (FTServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
  objc_storeStrong((id *)&self->_serverBag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
