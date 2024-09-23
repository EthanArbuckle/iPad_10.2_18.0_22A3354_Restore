@implementation JSAAccount

+ (BOOL)isMultiUser
{
  return +[BLLibraryUtility _isMultiUser](BLLibraryUtility, "_isMultiUser");
}

- (JSAAccount)initWithDelegate:(id)a3
{
  id v4;
  JSAAccount *v5;
  JSAAccount *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JSAAccount;
  v5 = -[JSAAccount init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (NSString)uniqueIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeStoreAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_DSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));

  return (NSString *)v5;
}

- (NSString)accountName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeStoreAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "username"));

  return (NSString *)v4;
}

- (NSString)firstName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeStoreAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_firstName"));

  return (NSString *)v4;
}

- (NSString)lastName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeStoreAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_lastName"));

  return (NSString *)v4;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeStoreAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_fullName"));

  return (NSString *)v4;
}

- (BOOL)isManagedAppleID
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = objc_msgSend(v2, "isStoreAccountManagedAppleID");

  return v3;
}

- (BOOL)isSignedInToiCloudAccount
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = objc_msgSend(v2, "isUserSignedInToiCloud");

  return v3;
}

- (BOOL)hasiCloudDriveEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = objc_msgSend(v2, "isGlobalICloudDriveSyncOptedIn");

  return v3;
}

- (BOOL)hasRecommendationsEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = objc_msgSend(v2, "hasRecommendationsEnabled");

  return v3;
}

- (void)signOut:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1221C;
  v5[3] = &unk_9E590;
  v6 = a3;
  v4 = v6;
  -[JSAAccount signOutWithCompletion:](self, "signOutWithCompletion:", v5);

}

- (void)signOutWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeStoreAccount"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[JSAAccount delegate](self, "delegate"));
    objc_msgSend(v7, "accountWillAttemptSignOut:", self);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bu_signOut"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_12438;
    v11[3] = &unk_9E5B8;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v8, "addFinishBlock:", v11);

  }
  else
  {
    v9 = objc_retainBlock(v4);
    v10 = v9;
    if (v9)
      (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);

  }
}

- (JSAAccountDelegate)delegate
{
  return (JSAAccountDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
