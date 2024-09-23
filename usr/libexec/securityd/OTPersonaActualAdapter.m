@implementation OTPersonaActualAdapter

- (OTPersonaActualAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OTPersonaActualAdapter;
  return -[OTPersonaActualAdapter init](&v3, "init");
}

- (id)currentThreadPersonaUniqueString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentPersona"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userPersonaUniqueString"));
  return v4;
}

- (BOOL)currentThreadIsForPrimaryiCloudAccount
{
  void *v2;
  void *v3;
  unint64_t v4;
  BOOL v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  unsigned int v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentPersona"));

  v4 = (unint64_t)objc_msgSend(v3, "userPersonaType");
  v5 = 1;
  if (v4 <= 6)
  {
    if (((1 << v4) & 0x29) != 0)
      goto LABEL_9;
    if (((1 << v4) & 0x44) != 0)
    {
LABEL_8:
      v5 = 0;
      goto LABEL_9;
    }
  }
  if (v4 != 1000)
  {
    v6 = sub_10000EF14("persona");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userPersonaUniqueString"));
      v10 = 138412546;
      v11 = v8;
      v12 = 1024;
      v13 = objc_msgSend(v3, "userPersonaType");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received unexpected Universal/Managed/other persona; treating as not for primary account: %@(%d)",
        (uint8_t *)&v10,
        0x12u);

    }
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (void)prepareThreadForKeychainAPIUseForPersonaIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](UMUserPersona, "currentPersona"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "generateAndRestorePersonaContextWithPersonaUniqueString:", v3));

  v6 = sub_10000EF14("ckks-persona");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to adopt persona %@: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Adopted persona for id '%@'", (uint8_t *)&v9, 0xCu);
  }

}

- (void)performBlockWithPersonaIdentifier:(id)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPersonaActualAdapter currentThreadPersonaUniqueString](self, "currentThreadPersonaUniqueString"));
  if (objc_msgSend(v8, "isEqualToString:", v7))
  {
    v6[2](v6);
  }
  else
  {
    -[OTPersonaActualAdapter prepareThreadForKeychainAPIUseForPersonaIdentifier:](self, "prepareThreadForKeychainAPIUseForPersonaIdentifier:", v8);
    v6[2](v6);
    -[OTPersonaActualAdapter prepareThreadForKeychainAPIUseForPersonaIdentifier:](self, "prepareThreadForKeychainAPIUseForPersonaIdentifier:", v7);
  }

}

@end
