@implementation SBKStoreAuthenticationController

- (SBKStoreAuthenticationController)initWithStoreAccount:(id)a3
{
  id v5;
  SBKStoreAuthenticationController *v6;
  SBKStoreAuthenticationController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKStoreAuthenticationController;
  v6 = -[SBKStoreAuthenticationController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storeAccount, a3);

  return v7;
}

- (BOOL)isAuthenticationValidForTransaction:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[SBKStoreAuthenticationController shouldAuthenticate](self, "shouldAuthenticate"))
  {
    v7 = os_log_create("com.apple.amp.StoreBookkeeper", "Store");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21E4FD000, v7, OS_LOG_TYPE_DEFAULT, "Doesn't matter what the DISD is set to since authentication is forced for transaction: %@", (uint8_t *)&v14, 0xCu);
    }

    v8 = 1;
  }
  else
  {
    -[SBKStoreAuthenticationController storeAccount](self, "storeAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "lastSyncedAccountIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10 && v11 && (objc_msgSend(v10, "isEqual:", v11) & 1) != 0
      || -[SBKStoreAuthenticationController shouldForceAuthenticationForTransaction:](self, "shouldForceAuthenticationForTransaction:", v6))
    {
      v8 = 1;
    }
    else if (a4)
    {
      -[SBKStoreAuthenticationController authenticationErrorsForTransaction:](self, "authenticationErrorsForTransaction:", v6);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)shouldForceAuthenticationForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[SBKStoreAuthenticationController shouldAuthenticate](self, "shouldAuthenticate"))
  {
    -[SBKStoreAuthenticationController authenticationErrorsForTransaction:](self, "authenticationErrorsForTransaction:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "code") & 0xFFFFFFFFFFFFFFFDLL) == 0xFFFFFFFFFFFFFC14)
        v7 = -1;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (id)authenticationErrorsForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBKStoreAuthenticationController storeAccount](self, "storeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBKStoreAuthenticationController storeAccount](self, "storeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "lastSyncedAccountName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lastSyncedAccountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = os_log_create("com.apple.amp.StoreBookkeeper", "Store");
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        v17 = 138412802;
        v18 = v10;
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_21E4FD000, v11, OS_LOG_TYPE_DEFAULT, "AccountIdentifier mismatch: %@ vs %@ [transaction = %@]", (uint8_t *)&v17, 0x20u);
      }

      +[SBKStoreError storeAccountMismatchErrorWithPreviousStoreAccountName:currentStoreAccountName:transaction:underlyingError:](SBKStoreError, "storeAccountMismatchErrorWithPreviousStoreAccountName:currentStoreAccountName:transaction:underlyingError:", v9, v6, v4, 0);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12)
      {
        v17 = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_21E4FD000, v11, OS_LOG_TYPE_DEFAULT, "No longer logged in Use Alert %@ [transaction = %@]", (uint8_t *)&v17, 0x16u);
      }

      +[SBKStoreError storeLoggedOutErrorWithPreviousStoreAccountName:transaction:underlyingError:](SBKStoreError, "storeLoggedOutErrorWithPreviousStoreAccountName:transaction:underlyingError:", v9, v4, 0);
      v13 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = os_log_create("com.apple.amp.StoreBookkeeper", "Store");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_21E4FD000, v14, OS_LOG_TYPE_DEFAULT, "First Use Alert %@ [transaction = %@]", (uint8_t *)&v17, 0x16u);
    }

    +[SBKStoreError noStoreAccountErrorWithTransaction:underlyingError:](SBKStoreError, "noStoreAccountErrorWithTransaction:underlyingError:", v4, 0);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v13;

  return v15;
}

- (void)saveAccountToLastSyncedDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKStoreAuthenticationController storeAccount](self, "storeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("SBKSync.LastAccountName"));

  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBKStoreAuthenticationController storeAccount](self, "storeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("SBKSync.LastAccountIdentifier"));

}

- (void)saveAccountToLastFailedSyncDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKStoreAuthenticationController storeAccount](self, "storeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("SBKSync.SyncFailureLastAccountName"));

  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBKStoreAuthenticationController storeAccount](self, "storeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("SBKSync.SyncFailureLastAccountIdentifier"));

}

- (SSAccount)storeAccount
{
  return self->_storeAccount;
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccount, 0);
}

+ (void)clearLastSyncnedAccount
{
  void *v2;
  id v3;

  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", 0, CFSTR("SBKSync.LastAccountName"));

  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", 0, CFSTR("SBKSync.LastAccountIdentifier"));

}

+ (id)lastSyncedAccountIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:withDefaultValue:", CFSTR("SBKSync.LastAccountIdentifier"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)lastSyncedAccountName
{
  void *v2;
  void *v3;

  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:withDefaultValue:", CFSTR("SBKSync.LastAccountName"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)lastFailedSyncAccountIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:withDefaultValue:", CFSTR("SBKSync.SyncFailureLastAccountIdentifier"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)lastFailedSyncAccountName
{
  void *v2;
  void *v3;

  +[SBKPreferences storeBookkeeperPreferences](SBKPreferences, "storeBookkeeperPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:withDefaultValue:", CFSTR("SBKSync.SyncFailureLastAccountName"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
