@implementation IKJSAccountInfo

- (IKJSAccountInfo)initWithAppContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IKJSAccountInfo;
  return -[VUIJSObject initWithAppContext:](&v4, sel_initWithAppContext_, a3);
}

- (NSString)storefrontId
{
  return (NSString *)+[VUIAuthenticationManager storefrontId](VUIAuthenticationManager, "storefrontId");
}

- (NSString)DSID
{
  void *v2;
  void *v3;

  +[VUIAuthenticationManager DSID](VUIAuthenticationManager, "DSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)appleId
{
  return (NSString *)+[VUIAuthenticationManager userAccountName](VUIAuthenticationManager, "userAccountName");
}

@end
