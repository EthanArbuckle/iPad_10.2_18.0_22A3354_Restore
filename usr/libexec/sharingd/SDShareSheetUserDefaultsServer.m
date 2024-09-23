@implementation SDShareSheetUserDefaultsServer

- (void)activate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDShareSheetUserDefaultsServer;
  -[SDXPCDaemon _activate](&v2, "_activate");
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDShareSheetUserDefaultsServer;
  -[SDXPCDaemon _invalidate](&v2, "_invalidate");
}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.sharesheetuserdefaults");
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  NSObject *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.sharesheet.userdefaults")));
  v6 = objc_opt_class(NSNumber, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100030310(v3, v9);

    v7 = 0;
  }

  return v7;
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____UIActivityUserDefaultsInterface);
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____UIActivityUserDefaultsInterface);
}

- (void)requestFavoritesForActivityCategory:(int64_t)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void (**)(id, void *))a4;
  v6 = objc_alloc((Class)_UIActivityUserDefaults);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIActivity _stringFromActivityCategory:](UIActivity, "_stringFromActivityCategory:", a3));
  v10 = objc_msgSend(v6, "initWithUnderlyingUserDefaults:activityDefaultsKey:", v7, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityIdentifiersInUserOrder"));
  v5[2](v5, v9);

}

@end
