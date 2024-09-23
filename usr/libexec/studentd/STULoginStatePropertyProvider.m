@implementation STULoginStatePropertyProvider

- (STULoginStatePropertyProvider)init
{
  STULoginStatePropertyProvider *v2;
  STULoginStatePropertyProvider *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STULoginStatePropertyProvider;
  v2 = -[STULoginStatePropertyProvider init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[STULoginStatePropertyProvider loginState](v2, "loginState")));
    -[STUDevicePropertyProvider setValue:](v3, "setValue:", v4);

  }
  return v3;
}

- (id)key
{
  return CRKDeviceLoginStateKey;
}

- (unint64_t)loginState
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUser"));
  if (objc_msgSend(v3, "isLoginUser"))
    v4 = 3;
  else
    v4 = 0;

  return v4;
}

@end
