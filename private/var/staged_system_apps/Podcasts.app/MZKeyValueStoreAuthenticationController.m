@implementation MZKeyValueStoreAuthenticationController

- (MZKeyValueStoreAuthenticationController)init
{
  MZKeyValueStoreAuthenticationController *v2;
  NSString *v3;
  NSString *acceptedDSIDUserDefaultsKey;
  NSString *v5;
  NSString *acceptedDSIDTextUserDefaultsKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MZKeyValueStoreAuthenticationController;
  v2 = -[MZKeyValueStoreAuthenticationController init](&v8, "init");
  if (v2)
  {
    v3 = (NSString *)objc_msgSend(CFSTR("MZKeyValueStore.LastDsid"), "copy");
    acceptedDSIDUserDefaultsKey = v2->_acceptedDSIDUserDefaultsKey;
    v2->_acceptedDSIDUserDefaultsKey = v3;

    v5 = (NSString *)objc_msgSend(CFSTR("MZKeyValueStore.LastDsidText"), "copy");
    acceptedDSIDTextUserDefaultsKey = v2->_acceptedDSIDTextUserDefaultsKey;
    v2->_acceptedDSIDTextUserDefaultsKey = v5;

  }
  return v2;
}

- (BOOL)isAuthenticationValidForTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSID](self, "DSID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSID](self, "acceptedDSID"));
  if (-[MZKeyValueStoreAuthenticationController shouldAuthenticate](self, "shouldAuthenticate")
    || v7 && v8 && (objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0
    || -[MZKeyValueStoreAuthenticationController shouldForceAuthenticationForTransaction:](self, "shouldForceAuthenticationForTransaction:", v6))
  {
    v9 = 1;
  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController authenticationErrorsForTransaction:](self, "authenticationErrorsForTransaction:", v6));
    v9 = 0;
    *a4 = v10;
  }

  return v9;
}

- (BOOL)shouldForceAuthenticationForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (-[MZKeyValueStoreAuthenticationController shouldAuthenticate](self, "shouldAuthenticate"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController authenticationErrorsForTransaction:](self, "authenticationErrorsForTransaction:", v4));
    v6 = v5;
    if (v5)
      v7 = ((unint64_t)objc_msgSend(v5, "code") & 0xFFFFFFFFFFFFFFFDLL) == -1004;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)authenticationErrorsForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSIDText](self, "DSIDText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSID](self, "DSID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSID](self, "acceptedDSID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSIDText](self, "acceptedDSIDText"));
  if (v7)
  {
    if (v6)
      v9 = objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError storeAccountMismatchErrorWithPreviousStoreAccountText:currentStoreAccontText:transaction:underlyingError:](MZKeyValueStoreError, "storeAccountMismatchErrorWithPreviousStoreAccountText:currentStoreAccontText:transaction:underlyingError:", v8, v5, v4, 0));
    else
      v9 = objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError storeLoggedOutErrorWithPreviousStoreAccountText:transaction:underlyingError:](MZKeyValueStoreError, "storeLoggedOutErrorWithPreviousStoreAccountText:transaction:underlyingError:", v7, v4, 0));
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError noStoreAccountErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "noStoreAccountErrorWithTransaction:underlyingError:", v4, 0));
  }
  v10 = (void *)v9;

  return v10;
}

- (void)resetAcceptedCredentials
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](MZPreferences, "storeBookkeeperPreferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSID](self, "DSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSIDUserDefaultsKey](self, "acceptedDSIDUserDefaultsKey"));
  objc_msgSend(v3, "setObject:forKey:", v4, v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](MZPreferences, "storeBookkeeperPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSIDText](self, "DSIDText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSIDTextUserDefaultsKey](self, "acceptedDSIDTextUserDefaultsKey"));
  objc_msgSend(v8, "setObject:forKey:", v6, v7);

}

- (NSString)acceptedDSID
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](MZPreferences, "storeBookkeeperPreferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSIDUserDefaultsKey](self, "acceptedDSIDUserDefaultsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:withDefaultValue:", v4, 0));

  return (NSString *)v5;
}

- (NSString)acceptedDSIDText
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](MZPreferences, "storeBookkeeperPreferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSIDTextUserDefaultsKey](self, "acceptedDSIDTextUserDefaultsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:withDefaultValue:", v4, 0));

  return (NSString *)v5;
}

- (NSString)DSID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeDsid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));

  return (NSString *)v4;
}

- (NSString)DSIDText
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "username"));

  return (NSString *)v4;
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (NSString)acceptedDSIDUserDefaultsKey
{
  return self->_acceptedDSIDUserDefaultsKey;
}

- (void)setAcceptedDSIDUserDefaultsKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)acceptedDSIDTextUserDefaultsKey
{
  return self->_acceptedDSIDTextUserDefaultsKey;
}

- (void)setAcceptedDSIDTextUserDefaultsKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedDSIDTextUserDefaultsKey, 0);
  objc_storeStrong((id *)&self->_acceptedDSIDUserDefaultsKey, 0);
}

@end
