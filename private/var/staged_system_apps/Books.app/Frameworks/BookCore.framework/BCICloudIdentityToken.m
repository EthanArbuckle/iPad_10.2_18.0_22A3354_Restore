@implementation BCICloudIdentityToken

+ (id)tokenForCurrentIdentityIfICloudDriveEnabled
{
  void *v2;
  unsigned __int8 v3;
  BCICloudIdentityToken *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint8_t *v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v21[16];
  uint8_t buf[2];
  __int16 v23;
  __int16 v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = objc_msgSend(v2, "isUserSignedInToiCloud");

  if ((v3 & 1) == 0)
  {
    v8 = BCUbiquityEnabledLog();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v24 = 0;
    v9 = "BCICloudIdentityToken: isUserSignedInToiCloud=NO. Returning nil";
    v10 = (uint8_t *)&v24;
LABEL_13:
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    goto LABEL_14;
  }
  if (!+[BCSyncUserDefaults isICloudDriveSyncOptedIn](BCSyncUserDefaults, "isICloudDriveSyncOptedIn"))
  {
    v11 = BCUbiquityEnabledLog();
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v23 = 0;
    v9 = "BCICloudIdentityToken: isICloudDriveSyncOptedIn=NO. Returning nil";
    v10 = (uint8_t *)&v23;
    goto LABEL_13;
  }
  if (!+[BCSyncUserDefaults isGlobalICloudDriveSyncOptedIn](BCSyncUserDefaults, "isGlobalICloudDriveSyncOptedIn"))
  {
    v12 = BCUbiquityEnabledLog();
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "BCICloudIdentityToken: isGlobalICloudDriveSyncOptedIn=NO. Returning nil";
      v10 = buf;
      goto LABEL_13;
    }
LABEL_14:
    v4 = 0;
    goto LABEL_15;
  }
  v4 = -[BCICloudIdentityToken initWithCurrentIdentity]([BCICloudIdentityToken alloc], "initWithCurrentIdentity");
  v5 = BCUbiquityEnabledLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "BCICloudIdentityToken: new token generated", v21, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1B71E0(v7, v14, v15, v16, v17, v18, v19, v20);
  }
LABEL_15:

  return v4;
}

- (BCICloudIdentityToken)initWithToken:(id)a3
{
  id v4;
  BCICloudIdentityToken *v5;
  NSString *v6;
  NSString *token;
  BCICloudIdentityToken *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)BCICloudIdentityToken;
    v5 = -[BCICloudIdentityToken init](&v10, "init");
    if (v5)
    {
      v6 = (NSString *)objc_msgSend(v4, "copy");
      token = v5->_token;
      v5->_token = v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)initFromArchive:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BCICloudIdentityToken *v8;

  v4 = a3;
  v5 = objc_opt_class(NSString);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = -[BCICloudIdentityToken initWithToken:](self, "initWithToken:", v7);
  return v8;
}

- (BCICloudIdentityToken)initWithCurrentIdentity
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  BCICloudIdentityToken *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iCloudIdentity"));

  v5 = BCUbiquityEnabledLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 141558274;
    v11 = 1752392040;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "BCICloudIdentityToken: initWithCurrentIdentity: %{mask.hash}@", (uint8_t *)&v10, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCICloudIdentityToken _hashFor:](self, "_hashFor:", v4));
  v8 = -[BCICloudIdentityToken initWithToken:](self, "initWithToken:", v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  if (self == a3)
    return 1;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCICloudIdentityToken token](self, "token"));
  v6 = objc_opt_class(BCICloudIdentityToken);
  v7 = BUDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "token"));
  v10 = objc_msgSend(v5, "isEqualToString:", v9);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_alloc((Class)objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCICloudIdentityToken token](self, "token"));
  v6 = objc_msgSend(v4, "initWithToken:", v5);

  return v6;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCICloudIdentityToken token](self, "token"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6));

  return v7;
}

- (id)_hashFor:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bu_md5UpperCase"));

  return v4;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
