@implementation ISBiometricStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_sharedInstance;
}

void __34__ISBiometricStore_sharedInstance__block_invoke()
{
  ISBiometricStore *v0;
  void *v1;

  v0 = objc_alloc_init(ISBiometricStore);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (ISBiometricStore)init
{
  ISBiometricStore *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSCache *v10;
  NSCache *contextCache;
  NSLock *v12;
  NSLock *lock;
  uint64_t v15;
  objc_super v16;
  int v17;
  void *v18;
  __int16 v19;
  ISBiometricStore *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)ISBiometricStore;
  v2 = -[ISBiometricStore init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      v5 &= 2u;
    if (v5)
    {
      v7 = (void *)objc_opt_class();
      v17 = 138543618;
      v18 = v7;
      v19 = 2050;
      v20 = v2;
      v8 = v7;
      LODWORD(v15) = 22;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_13:

        v10 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
        contextCache = v2->_contextCache;
        v2->_contextCache = v10;

        -[NSCache setCountLimit:](v2->_contextCache, "setCountLimit:", 5);
        v12 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
        lock = v2->_lock;
        v2->_lock = v12;

        return v2;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v17, v15);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog();
    }

    goto LABEL_13;
  }
  return v2;
}

- (void)addContextToCache:(id)a3 withToken:(id)a4
{
  NSLock *lock;
  id v7;
  id v8;

  lock = self->_lock;
  v7 = a4;
  v8 = a3;
  -[NSLock lock](lock, "lock");
  -[NSCache setObject:forKey:](self->_contextCache, "setObject:forKey:", v8, v7);

  -[NSLock unlock](self->_lock, "unlock");
}

+ (id)applePayClassicNetworks
{
  ISLoadURLBagOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ISLoadURLBagOperation);
  +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperations:waitUntilFinished:", v5, 1);

  if (!-[ISOperation success](v3, "success"))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v11 |= 2u;
    objc_msgSend(v7, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      v26 = 138543362;
      v27 = (id)objc_opt_class();
      v12 = v27;
      LODWORD(v22) = 12;
      v21 = &v26;
      v10 = (id)_os_log_send_and_compose_impl();

      if (!v10)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v26, v22);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v10);
      v21 = (int *)v9;
      SSFileLog();
    }
    v10 = 0;
    goto LABEL_14;
  }
  -[ISLoadURLBagOperation URLBag](v3, "URLBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("apple-pay-classic-networks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __43__ISBiometricStore_applePayClassicNetworks__block_invoke;
    v23[3] = &unk_24C43BF70;
    v24 = v8;
    v25 = a1;
    v9 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v23);
    v10 = -[NSObject copy](v9, "copy");

LABEL_14:
    goto LABEL_16;
  }
  v10 = 0;
LABEL_16:

  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = objc_msgSend(v13, "shouldLog", v21);
  if (objc_msgSend(v13, "shouldLogToDisk"))
    v15 = v14 | 2;
  else
    v15 = v14;
  objc_msgSend(v13, "OSLogObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    v15 &= 2u;
  if (!v15)
    goto LABEL_26;
  v17 = (void *)objc_opt_class();
  v26 = 138543618;
  v27 = v17;
  v28 = 2114;
  v29 = v10;
  v18 = v17;
  LODWORD(v22) = 22;
  v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v26, v22);
    v16 = objc_claimAutoreleasedReturnValue();
    free(v19);
    SSFileLog();
LABEL_26:

  }
  return v10;
}

void __43__ISBiometricStore_applePayClassicNetworks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  const char *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("visa")) & 1) == 0)
  {
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("Visa"));

    if ((v5 & 1) != 0)
      goto LABEL_4;
    objc_msgSend(v3, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("discover")) & 1) != 0)
    {

LABEL_8:
      v6 = "PKPaymentNetworkDiscover";
      goto LABEL_17;
    }
    v8 = objc_msgSend(v3, "isEqualToString:", CFSTR("Discover"));

    if ((v8 & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v3, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("mastercard")) & 1) != 0)
    {

LABEL_12:
      v6 = "PKPaymentNetworkMasterCard";
      goto LABEL_17;
    }
    v10 = objc_msgSend(v3, "isEqualToString:", CFSTR("MasterCard"));

    if ((v10 & 1) != 0)
      goto LABEL_12;
    objc_msgSend(v3, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("american express")) & 1) != 0)
    {

LABEL_16:
      v6 = "PKPaymentNetworkAmex";
      goto LABEL_17;
    }
    v12 = objc_msgSend(v3, "isEqualToString:", CFSTR("AmEx"));

    if ((v12 & 1) != 0)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      v16 &= 2u;
    if (v16)
    {
      *(_DWORD *)v21 = 138543618;
      *(_QWORD *)&v21[4] = objc_opt_class();
      *(_WORD *)&v21[12] = 2114;
      *(_QWORD *)&v21[14] = v3;
      v18 = *(id *)&v21[4];
      LODWORD(v20) = 22;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_30:

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, v21, v20, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog();
    }

    goto LABEL_30;
  }

LABEL_4:
  v6 = "PKPaymentNetworkVisa";
LABEL_17:
  ISWeakLinkedStringConstantForString(v6, (const void *)0x26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

LABEL_18:
}

- (int64_t)biometricState
{
  CFIndex AppIntegerValue;

  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("AMSDeviceBiometricsState"), CFSTR("com.apple.AppleMediaServices"), 0);
  if (AppIntegerValue == 2)
    return 1;
  else
    return 2 * (AppIntegerValue == 1);
}

- (int64_t)biometricAvailabilityForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  int64_t v15;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v15 = 4;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPasscodeSet");

  if (!v6 || !-[ISBiometricStore identityMapCount](self, "identityMapCount"))
  {
    v15 = 3;
    goto LABEL_22;
  }
  if (!-[ISBiometricStore isIdentityMapValidForAccountIdentifier:](self, "isIdentityMapValidForAccountIdentifier:", v4))
  {
    v15 = 2;
    goto LABEL_22;
  }
  -[ISBiometricStore lastRegisteredAccountIdentifier](self, "lastRegisteredAccountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", v4);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v11 &= 2u;
    if (v11)
    {
      LODWORD(v18) = 138543362;
      *(_QWORD *)((char *)&v18 + 4) = objc_opt_class();
      v13 = *(id *)((char *)&v18 + 4);
      LODWORD(v17) = 12;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v18, v17, v18);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog();
    }

    goto LABEL_17;
  }
LABEL_18:
  v15 = 0;
LABEL_22:

  return v15;
}

- (BOOL)canPerformBiometricOptIn
{
  unint64_t v2;
  void *v3;
  char v4;

  v2 = -[ISBiometricStore identityMapCount](self, "identityMapCount");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPasscodeSet");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)canPerformExtendedBiometricActionsForAccountIdentifier:(id)a3
{
  int64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = -[ISBiometricStore biometricAvailabilityForAccountIdentifier:](self, "biometricAvailabilityForAccountIdentifier:", a3);
  v5 = -[ISBiometricStore biometricState](self, "biometricState");
  v6 = v5;
  if (!v4 || v5 != 2)
    return !v4 && v6 == 2;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    v9 &= 2u;
  if (!v9)
    goto LABEL_13;
  v11 = (void *)objc_opt_class();
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = v11;
  objc_msgSend(v12, "numberWithInteger:", v4);
  v18 = 138543618;
  v19 = v11;
  v20 = 2114;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v18, v17);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_13:

  }
  return !v4 && v6 == 2;
}

- (void)clearLastRegisteredAccountIdentifier
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  LODWORD(v9) = 138543362;
  *(_QWORD *)((char *)&v9 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v9 + 4);
  LODWORD(v8) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog();
LABEL_11:

  }
  CFPreferencesSetAppValue(CFSTR("BiometricAccountID"), 0, (CFStringRef)*MEMORY[0x24BEB2C88]);
}

+ (id)countryCode
{
  ISLoadURLBagOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  __int128 v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(ISLoadURLBagOperation);
  +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperations:waitUntilFinished:", v4, 1);

  if (!-[ISOperation success](v2, "success"))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v6, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      LODWORD(v14) = 138543362;
      *(_QWORD *)((char *)&v14 + 4) = objc_opt_class();
      v11 = *(id *)((char *)&v14 + 4);
      LODWORD(v13) = 12;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v14, v13, v14);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v7);
      SSFileLog();
    }

LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  -[ISLoadURLBagOperation URLBag](v2, "URLBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("countryCode"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  v6 = v6;
  v7 = v6;
LABEL_16:

  return v7;
}

+ (id)diskBasedPaymentSheet
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  if (!SSDebugShouldUseFileBasedPaymentSheetProxy())
    return 0;
  CPSharedResourcesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1580]);
    v28[0] = v2;
    v28[1] = CFSTR("paymentSheet.plist");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") && objc_msgSend(v3, "fileExistsAtPath:", v5))
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F48]), "initWithServerResponse:", v6);
LABEL_42:

        goto LABEL_43;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v18 = -[NSObject shouldLog](v11, "shouldLog");
      if (-[NSObject shouldLogToDisk](v11, "shouldLogToDisk"))
        v19 = v18 | 2;
      else
        v19 = v18;
      -[NSObject OSLogObject](v11, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        v19 &= 2u;
      if (!v19)
        goto LABEL_40;
      v24 = 138543618;
      v25 = (id)objc_opt_class();
      v26 = 2114;
      v27 = v5;
      v23 = v25;
      LODWORD(v22) = 22;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (v21)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v24, v22);
        v20 = objc_claimAutoreleasedReturnValue();
        free(v21);
        SSFileLog();
LABEL_40:

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      objc_msgSend(v6, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        v10 &= 2u;
      if (v10)
      {
        v24 = 138543618;
        v25 = (id)objc_opt_class();
        v26 = 2114;
        v27 = v5;
        v12 = v25;
        LODWORD(v22) = 22;
        v7 = (void *)_os_log_send_and_compose_impl();

        if (!v7)
          goto LABEL_42;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v24, v22);
        v11 = objc_claimAutoreleasedReturnValue();
        free(v7);
        SSFileLog();
      }
    }

    v7 = 0;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  objc_msgSend(v3, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    v14 &= 2u;
  if (!v14)
    goto LABEL_28;
  v24 = 138543362;
  v25 = (id)objc_opt_class();
  v16 = v25;
  LODWORD(v22) = 12;
  v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v24, v22);
    v15 = objc_claimAutoreleasedReturnValue();
    free(v17);
    SSFileLog();
LABEL_28:

  }
  v7 = 0;
LABEL_43:

  return v7;
}

- (id)fetchContextFromCacheWithToken:(id)a3 evict:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  -[NSCache objectForKey:](self->_contextCache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSCache removeObjectForKey:](self->_contextCache, "removeObjectForKey:", v6);
  -[NSLock unlock](self->_lock, "unlock");

  return v7;
}

- (unint64_t)identityMapCount
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  dispatch_semaphore_t v6;
  dispatch_time_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, void *);
  void *v22;
  ISBiometricStore *v23;
  NSObject *v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__0;
  v27[4] = __Block_byref_object_dispose__0;
  v28 = 0;
  if (!SSIsDaemon())
  {
    v6 = dispatch_semaphore_create(0);
    v4 = (void *)objc_opt_new();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __36__ISBiometricStore_identityMapCount__block_invoke;
    v22 = &unk_24C43BF98;
    v25 = v27;
    v23 = self;
    v26 = &v29;
    v3 = v6;
    v24 = v3;
    objc_msgSend(v4, "getIdentityMapCountWithCompletionBlock:", &v19);
    v7 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v3, v7))
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    v10 = objc_msgSend(v8, "shouldLogToDisk");
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v9 |= 2u;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v13 = (void *)objc_opt_class();
      v33 = 138543362;
      v34 = v13;
      v14 = v13;
      LODWORD(v18) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v33, v18, v19, v20, v21, v22, v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog();
    }

    goto LABEL_14;
  }
  NSClassFromString(CFSTR("DaemonBiometricStore"));
  v3 = objc_opt_new();
  -[NSObject identityMap](v3, "identityMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v30[3] = v5;
LABEL_16:

  v16 = v30[3];
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(&v29, 8);
  return v16;
}

void __36__ISBiometricStore_identityMapCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    goto LABEL_15;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    v9 &= 2u;
  if (!v9)
    goto LABEL_12;
  v11 = (void *)objc_opt_class();
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  *(_DWORD *)v16 = 138543618;
  *(_QWORD *)&v16[4] = v11;
  *(_WORD *)&v16[12] = 2114;
  *(_QWORD *)&v16[14] = v12;
  v13 = v11;
  LODWORD(v15) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, v16, v15, *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_12:

  }
LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (BOOL)isBiometricStateEnabled
{
  return CFPreferencesGetAppIntegerValue(CFSTR("BiometricStateEnabled"), (CFStringRef)*MEMORY[0x24BEB2C88], 0) == 2;
}

+ (BOOL)isActionSupported:(int64_t)a3 withBiometricAuthenticationContext:(id)a4
{
  id v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  char v10;
  dispatch_semaphore_t v11;
  id v12;
  dispatch_time_t v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, void *);
  void *v34;
  NSObject *v35;
  _BYTE *v36;
  id v37;
  id v38;
  int v39;
  void *v40;
  _BYTE v41[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (SSIsDaemon())
  {
    -[objc_class sharedInstance](NSClassFromString(CFSTR("DaemonBiometricKeychain")), "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v8 = (const void *)objc_msgSend(v7, "copyAccessControlListForPrivateKeyWithBiometricAuthenticationContext:error:", v6, &v38);
    v9 = v38;

    if (v8)
    {
      v10 = objc_msgSend(MEMORY[0x24BE08080], "isActionSupported:withAccessControl:", a3, v8);
      CFRelease(v8);
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    objc_msgSend(v22, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      v24 &= 2u;
    if (v24)
    {
      v26 = (void *)objc_opt_class();
      *(_DWORD *)v41 = 138543618;
      *(_QWORD *)&v41[4] = v26;
      *(_WORD *)&v41[12] = 2114;
      *(_QWORD *)&v41[14] = v9;
      v27 = v26;
      LODWORD(v30) = 22;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_29:

        v10 = 0;
        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, v41, v30);
      v25 = objc_claimAutoreleasedReturnValue();
      free(v28);
      SSFileLog();
    }

    goto LABEL_29;
  }
  v11 = dispatch_semaphore_create(0);
  *(_QWORD *)v41 = 0;
  *(_QWORD *)&v41[8] = v41;
  *(_QWORD *)&v41[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  v12 = objc_alloc_init(MEMORY[0x24BEB1DD8]);
  v31 = MEMORY[0x24BDAC760];
  v32 = 3221225472;
  v33 = __73__ISBiometricStore_isActionSupported_withBiometricAuthenticationContext___block_invoke;
  v34 = &unk_24C43BFC0;
  v36 = v41;
  v37 = a1;
  v9 = v11;
  v35 = v9;
  objc_msgSend(v12, "getConstraintsDictionaryForPurpose:completion:", a3 > 99, &v31);
  v13 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v9, v13))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    v16 = objc_msgSend(v14, "shouldLogToDisk");
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
      v15 |= 2u;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v15 &= 2u;
    if (v15)
    {
      v19 = (void *)objc_opt_class();
      v39 = 138543362;
      v40 = v19;
      v20 = v19;
      LODWORD(v30) = 12;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v39, v30, v31, v32, v33, v34);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:
  if (*(_QWORD *)(*(_QWORD *)&v41[8] + 40))
    v10 = objc_msgSend(MEMORY[0x24BE08080], "isActionSupported:withConstraints:", a3);
  else
    v10 = 0;

  _Block_object_dispose(v41, 8);
LABEL_32:

  return v10;
}

void __73__ISBiometricStore_isActionSupported_withBiometricAuthenticationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (!v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    v10 &= 2u;
  if (!v10)
    goto LABEL_12;
  *(_DWORD *)v15 = 138543618;
  *(_QWORD *)&v15[4] = objc_opt_class();
  *(_WORD *)&v15[12] = 2114;
  *(_QWORD *)&v15[14] = v7;
  v12 = *(id *)&v15[4];
  LODWORD(v14) = 22;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, v15, v14, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog();
LABEL_12:

  }
LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)isIdentityMapValidForAccountIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  dispatch_semaphore_t v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  NSObject *v23;
  _QWORD *v24;
  uint64_t *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  v27 = 0;
  if (!SSIsDaemon())
  {
    v7 = dispatch_semaphore_create(0);
    v8 = (void *)objc_opt_new();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __59__ISBiometricStore_isIdentityMapValidForAccountIdentifier___block_invoke;
    v21[3] = &unk_24C43BFE8;
    v24 = v26;
    v21[4] = self;
    v22 = v4;
    v25 = &v28;
    v5 = v7;
    v23 = v5;
    objc_msgSend(v8, "isIdentityMapValidForAccountIdentifier:completionBlock:", v22, v21);
    v9 = dispatch_time(0, 5000000000);
    if (!dispatch_semaphore_wait(v5, v9))
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    v12 = objc_msgSend(v10, "shouldLogToDisk");
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      v11 |= 2u;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      v15 = (void *)objc_opt_class();
      v32 = 138543362;
      v33 = v15;
      v16 = v15;
      LODWORD(v20) = 12;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v32, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      free(v17);
      SSFileLog();
    }

    goto LABEL_14;
  }
  NSClassFromString(CFSTR("DaemonBiometricStore"));
  v5 = objc_opt_new();
  v6 = -[NSObject isIdentityMapValidForAccountIdentifier:](v5, "isIdentityMapValidForAccountIdentifier:", v4);
  *((_BYTE *)v29 + 24) = v6;
LABEL_16:

  v18 = *((_BYTE *)v29 + 24) != 0;
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(&v28, 8);
  return v18;
}

void __59__ISBiometricStore_isIdentityMapValidForAccountIdentifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)v17 = 138543874;
      *(_QWORD *)&v17[4] = v11;
      *(_WORD *)&v17[12] = 2112;
      *(_QWORD *)&v17[14] = v12;
      *(_WORD *)&v17[22] = 2114;
      v18 = v13;
      v14 = v11;
      LODWORD(v16) = 32;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, v17, v16, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (unint64_t)keyCountForAccountIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  dispatch_semaphore_t v7;
  id v8;
  dispatch_time_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unint64_t v18;
  uint64_t v20;
  _QWORD v21[5];
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  if (!SSIsDaemon())
  {
    v7 = dispatch_semaphore_create(0);
    v8 = objc_alloc_init(MEMORY[0x24BEB1E80]);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __49__ISBiometricStore_keyCountForAccountIdentifier___block_invoke;
    v21[3] = &unk_24C43C010;
    v21[4] = self;
    v23 = &v24;
    v5 = v7;
    v22 = v5;
    objc_msgSend(v8, "keyCountForAccountIdentifier:completionBlock:", v4, v21);
    v9 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v5, v9))
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    v12 = objc_msgSend(v10, "shouldLogToDisk");
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      v11 |= 2u;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      v15 = (void *)objc_opt_class();
      v28 = 138543362;
      v29 = v15;
      v16 = v15;
      LODWORD(v20) = 12;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v28, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      free(v17);
      SSFileLog();
    }

    goto LABEL_14;
  }
  NSClassFromString(CFSTR("DaemonBiometricStore"));
  v5 = objc_opt_new();
  v6 = -[NSObject keyCountForAccountIdentifier:](v5, "keyCountForAccountIdentifier:", v4);
  v25[3] = v6;
LABEL_16:

  v18 = v25[3];
  _Block_object_dispose(&v24, 8);

  return v18;
}

void __49__ISBiometricStore_keyCountForAccountIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      *(_DWORD *)v13 = 138543618;
      *(_QWORD *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2114;
      *(_QWORD *)&v13[14] = v5;
      v10 = *(id *)&v13[4];
      LODWORD(v12) = 22;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, v13, v12, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (NSNumber)lastRegisteredAccountIdentifier
{
  return (NSNumber *)(id)CFPreferencesCopyAppValue(CFSTR("BiometricAccountID"), (CFStringRef)*MEMORY[0x24BEB2C88]);
}

- (void)registerAccountIdentifier:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  *(_DWORD *)v12 = 138543618;
  *(_QWORD *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2114;
  *(_QWORD *)&v12[14] = v3;
  v8 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, v12, v11, *(_OWORD *)v12, *(_QWORD *)&v12[16], v13);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_11:

  }
  v10 = (const __CFString *)*MEMORY[0x24BEB2C88];
  CFPreferencesSetAppValue(CFSTR("BiometricAccountID"), v3, (CFStringRef)*MEMORY[0x24BEB2C88]);
  CFPreferencesAppSynchronize(v10);

}

- (void)saveIdentityMapForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  NSObject *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (SSIsDaemon())
  {
    NSClassFromString(CFSTR("DaemonBiometricStore"));
    v18 = (id)objc_opt_new();
    objc_msgSend(v18, "identityMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "saveIdentityMap:forAccountIdentifier:", v5, v4);

    return;
  }
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)objc_opt_new();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__ISBiometricStore_saveIdentityMapForAccountIdentifier___block_invoke;
  v19[3] = &unk_24C43C038;
  v19[4] = self;
  v8 = v6;
  v20 = v8;
  objc_msgSend(v7, "saveIdentityMapForAccountIdentifier:completionBlock:", v4, v19);

  v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      v14 = (void *)objc_opt_class();
      v21 = 138543362;
      v22 = v14;
      v15 = v14;
      LODWORD(v17) = 12;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v21, v17);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:

}

void __56__ISBiometricStore_saveIdentityMapForAccountIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      *(_DWORD *)v23 = 138543618;
      *(_QWORD *)&v23[4] = objc_opt_class();
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v5;
      v10 = *(id *)&v23[4];
      LODWORD(v22) = 22;
      v21 = v23;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, v23, v22, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      v21 = v9;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  objc_msgSend(v12, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    v14 &= 2u;
  if (!v14)
    goto LABEL_24;
  v16 = (void *)objc_opt_class();
  v17 = (void *)MEMORY[0x24BDD16E0];
  v18 = v16;
  objc_msgSend(v17, "numberWithBool:", a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v23 = 138543618;
  *(_QWORD *)&v23[4] = v16;
  *(_WORD *)&v23[12] = 2114;
  *(_QWORD *)&v23[14] = v19;
  LODWORD(v22) = 22;
  v20 = (void *)_os_log_send_and_compose_impl();

  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, v23, v22);
    v15 = objc_claimAutoreleasedReturnValue();
    free(v20);
    SSFileLog();
LABEL_24:

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)setBiometricState:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  BOOL v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  int *v32;
  uint64_t v33;
  id v34;
  id v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (-[ISBiometricStore biometricState](self, "biometricState") != a3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
    v6 = (const __CFString *)*MEMORY[0x24BEB2C88];
    CFPreferencesSetAppValue(CFSTR("BiometricState"), v5, (CFStringRef)*MEMORY[0x24BEB2C88]);
    if ((unint64_t)(a3 - 1) <= 1)
      CFPreferencesSetAppValue(CFSTR("BiometricStateEnabled"), v5, v6);
    CFPreferencesAppSynchronize(v6);
    if (!a3)
    {
      v7 = (void *)MEMORY[0x24BE08118];
      v8 = 0;
      goto LABEL_9;
    }
    if (a3 != 1)
    {
      if (a3 != 2)
      {
LABEL_29:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BEB2C30], 0, 0, 1u);

        return;
      }
      v7 = (void *)MEMORY[0x24BE08118];
      v8 = 1;
LABEL_9:
      objc_msgSend(v7, "setBiometricState:", v8);
      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x24BE08118], "setBiometricState:", 2);
    -[ISBiometricStore lastRegisteredAccountIdentifier](self, "lastRegisteredAccountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v11 = 0;
      goto LABEL_25;
    }
    v35 = 0;
    v10 = -[ISBiometricStore deleteKeychainTokensForAccountIdentifier:error:](self, "deleteKeychainTokensForAccountIdentifier:error:", v9, &v35);
    v11 = v35;
    if (v10)
    {
LABEL_25:
      objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore", v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activeAccount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21 || (objc_msgSend(v21, "isEqualToNumber:", v9) & 1) != 0)
      {
        v22 = v11;
LABEL_28:

        goto LABEL_29;
      }
      v34 = v11;
      v24 = -[ISBiometricStore deleteKeychainTokensForAccountIdentifier:error:](self, "deleteKeychainTokensForAccountIdentifier:error:", v21, &v34);
      v22 = v34;

      if (v24)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v26 = objc_msgSend(v25, "shouldLog");
      if (objc_msgSend(v25, "shouldLogToDisk"))
        v27 = v26 | 2;
      else
        v27 = v26;
      objc_msgSend(v25, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        v27 &= 2u;
      if (v27)
      {
        v29 = (void *)objc_opt_class();
        v36 = 138543874;
        v37 = v29;
        v38 = 2112;
        v39 = v9;
        v40 = 2114;
        v41 = v22;
        v30 = v29;
        LODWORD(v33) = 32;
        v31 = (void *)_os_log_send_and_compose_impl();

        if (!v31)
        {
LABEL_43:

          goto LABEL_28;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v36, v33);
        v28 = objc_claimAutoreleasedReturnValue();
        free(v31);
        SSFileLog();
      }

      goto LABEL_43;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      v14 &= 2u;
    if (v14)
    {
      v16 = (void *)objc_opt_class();
      v36 = 138543874;
      v37 = v16;
      v38 = 2112;
      v39 = v9;
      v40 = 2114;
      v41 = v11;
      v17 = v16;
      LODWORD(v33) = 32;
      v32 = &v36;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_23:

        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v36, v33);
      v15 = objc_claimAutoreleasedReturnValue();
      free(v18);
      v32 = (int *)v15;
      SSFileLog();
    }

    goto LABEL_23;
  }
}

+ (void)tokenUpdateDidFinishWithLogKey:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id location;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!SSIsDaemon())
  {
    objc_initWeak(&location, a1);
    v5 = dispatch_semaphore_create(0);
    v6 = objc_alloc_init(MEMORY[0x24BEB1DD8]);
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __51__ISBiometricStore_tokenUpdateDidFinishWithLogKey___block_invoke;
    v22 = &unk_24C43C060;
    objc_copyWeak(&v25, &location);
    v7 = v4;
    v23 = v7;
    v8 = v5;
    v24 = v8;
    objc_msgSend(v6, "tokenUpdateDidFinishWithLogKey:completion:", v7, &v19);
    v9 = dispatch_time(0, 2500000000);
    if (!dispatch_semaphore_wait(v8, v9))
    {
LABEL_15:

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    v12 = objc_msgSend(v10, "shouldLogToDisk");
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      v11 |= 2u;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      v15 = (void *)objc_opt_class();
      v27 = 138543618;
      v28 = v15;
      v29 = 2114;
      v30 = v7;
      v16 = v15;
      LODWORD(v18) = 22;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v27, v18, v19, v20, v21, v22, v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      free(v17);
      SSFileLog();
    }

    goto LABEL_14;
  }
  -[objc_class tokenUpdateDidFinishWithLogKey:](NSClassFromString(CFSTR("DaemonBiometricStore")), "tokenUpdateDidFinishWithLogKey:", v4);
LABEL_16:

}

void __51__ISBiometricStore_tokenUpdateDidFinishWithLogKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  _BYTE v14[24];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      v7 &= 2u;
    if (v7)
    {
      v9 = (void *)objc_opt_class();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v14 = 138543874;
      *(_QWORD *)&v14[4] = v9;
      *(_WORD *)&v14[12] = 2114;
      *(_QWORD *)&v14[14] = v10;
      *(_WORD *)&v14[22] = 2114;
      v15 = v3;
      v11 = v9;
      LODWORD(v13) = 32;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (BOOL)tokenUpdateShouldStartWithLogKey:(id)a3
{
  id v4;
  char v5;
  dispatch_semaphore_t v6;
  id v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  NSObject *v23;
  uint64_t *v24;
  id v25;
  id location;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  if (!SSIsDaemon())
  {
    objc_initWeak(&location, a1);
    v6 = dispatch_semaphore_create(0);
    v7 = objc_alloc_init(MEMORY[0x24BEB1DD8]);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __53__ISBiometricStore_tokenUpdateShouldStartWithLogKey___block_invoke;
    v21[3] = &unk_24C43C088;
    objc_copyWeak(&v25, &location);
    v8 = v4;
    v22 = v8;
    v24 = &v27;
    v9 = v6;
    v23 = v9;
    objc_msgSend(v7, "tokenUpdateShouldStartWithLogKey:completion:", v8, v21);
    v10 = dispatch_time(0, 2500000000);
    if (!dispatch_semaphore_wait(v9, v10))
    {
LABEL_15:

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      v5 = *((_BYTE *)v28 + 24) != 0;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    v13 = objc_msgSend(v11, "shouldLogToDisk");
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
      v12 |= 2u;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      v16 = (void *)objc_opt_class();
      v31 = 138543618;
      v32 = v16;
      v33 = 2114;
      v34 = v8;
      v17 = v16;
      LODWORD(v20) = 22;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v31, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v5 = -[objc_class tokenUpdateShouldStartWithLogKey:](NSClassFromString(CFSTR("DaemonBiometricStore")), "tokenUpdateShouldStartWithLogKey:", v4);
  *((_BYTE *)v28 + 24) = v5;
LABEL_16:
  _Block_object_dispose(&v27, 8);

  return v5;
}

void __53__ISBiometricStore_tokenUpdateShouldStartWithLogKey___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _BYTE v16[24];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    v9 &= 2u;
  if (!v9)
    goto LABEL_12;
  v11 = (void *)objc_opt_class();
  v12 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v16 = 138543874;
  *(_QWORD *)&v16[4] = v11;
  *(_WORD *)&v16[12] = 2114;
  *(_QWORD *)&v16[14] = v12;
  *(_WORD *)&v16[22] = 2114;
  v17 = v5;
  v13 = v11;
  LODWORD(v15) = 32;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, v16, v15, *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_12:

  }
LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (int64_t)tokenUpdateState
{
  uint64_t v3;
  dispatch_semaphore_t v4;
  id v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, void *);
  void *v22;
  NSObject *v23;
  uint64_t *v24;
  id v25;
  id location;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (!SSIsDaemon())
  {
    objc_initWeak(&location, a1);
    v4 = dispatch_semaphore_create(0);
    v5 = objc_alloc_init(MEMORY[0x24BEB1DD8]);
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __36__ISBiometricStore_tokenUpdateState__block_invoke;
    v22 = &unk_24C43C0B0;
    objc_copyWeak(&v25, &location);
    v24 = &v27;
    v6 = v4;
    v23 = v6;
    objc_msgSend(v5, "tokenUpdateStateWithCompletionBlock:", &v19);
    v7 = dispatch_time(0, 2500000000);
    if (!dispatch_semaphore_wait(v6, v7))
    {
LABEL_17:

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    v10 = objc_msgSend(v8, "shouldLogToDisk");
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v9 |= 2u;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v13 = (void *)objc_opt_class();
      v31 = 138543362;
      v32 = v13;
      v14 = v13;
      LODWORD(v18) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v31, v18, v19, v20, v21, v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog();
    }

    goto LABEL_16;
  }
  v3 = -[objc_class tokenUpdateState](NSClassFromString(CFSTR("DaemonBiometricStore")), "tokenUpdateState");
  if (v3)
  {
    if (v3 == 1)
      v28[3] = 1;
  }
  else
  {
    v28[3] = 0;
  }
LABEL_19:
  v16 = v28[3];
  _Block_object_dispose(&v27, 8);
  return v16;
}

void __36__ISBiometricStore_tokenUpdateState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      *(_DWORD *)v14 = 138543618;
      *(_QWORD *)&v14[4] = objc_opt_class();
      *(_WORD *)&v14[12] = 2114;
      *(_QWORD *)&v14[14] = v5;
      v11 = *(id *)&v14[4];
      LODWORD(v13) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
  if (a2 == 1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (!a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)keychainLabelForAccountID:(id)a3 purpose:(int64_t)a4
{
  return +[ISBiometricStore keychainLabelForKeyWithAccountID:purpose:](ISBiometricStore, "keychainLabelForKeyWithAccountID:purpose:", a3, a4);
}

+ (id)keychainLabelForKeyWithAccountID:(id)a3 purpose:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[ISClient currentClient](ISClient, "currentClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    if (a4 != 1)
      goto LABEL_6;
    v8 = CFSTR("%@:%@-ext");
  }
  else
  {
    v8 = CFSTR("%@:%@");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v17 = 138412546;
      v18 = v5;
      v19 = 2114;
      v20 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_17:

        v9 = 0;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v17, v16);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog();
    }

    goto LABEL_17;
  }
LABEL_18:

  return v9;
}

+ (id)keychainLabelForCertWithAccountID:(id)a3 purpose:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[ISBiometricStore keychainLabelForKeyWithAccountID:purpose:](ISBiometricStore, "keychainLabelForKeyWithAccountID:purpose:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-cert"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v15 = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v15, v14);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (id)createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  dispatch_semaphore_t v13;
  dispatch_time_t v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  ISBiometricStore *v32;
  id v33;
  NSObject *v34;
  uint64_t *v35;
  uint64_t *v36;
  id obj;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  int v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  if (SSIsDaemon())
  {
    -[objc_class sharedInstance](NSClassFromString(CFSTR("DaemonBiometricKeychain")), "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (id *)(v39 + 5);
    obj = (id)v39[5];
    -[NSObject createAttestationDataForAccountIdentifier_:purpose:error:](v9, "createAttestationDataForAccountIdentifier_:purpose:error:", v8, a4, &obj);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, obj);
    v12 = (void *)v45[5];
    v45[5] = v11;
    goto LABEL_16;
  }
  v13 = dispatch_semaphore_create(0);
  v12 = (void *)objc_opt_new();
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __76__ISBiometricStore_createAttestationDataForAccountIdentifier_purpose_error___block_invoke;
  v31 = &unk_24C43C0D8;
  v35 = &v38;
  v32 = self;
  v33 = v8;
  v36 = &v44;
  v9 = v13;
  v34 = v9;
  objc_msgSend(v12, "createAttestationDataForAccountIdentifier:purpose:completionBlock:", v33, a4, &v28);
  v14 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v9, v14))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "shouldLog");
    v17 = objc_msgSend(v15, "shouldLogToDisk");
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
      v16 |= 2u;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (v16)
    {
      v20 = (void *)objc_opt_class();
      v50 = 138543362;
      v51 = v20;
      v21 = v20;
      LODWORD(v27) = 12;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_14:

        SSError();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v39[5];
        v39[5] = v23;

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v50, v27, v28, v29, v30, v31, v32, v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a5)
    *a5 = objc_retainAutorelease((id)v39[5]);
  v25 = (id)v45[5];
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v25;
}

void __76__ISBiometricStore_createAttestationDataForAccountIdentifier_purpose_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[24];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (!v10)
      goto LABEL_13;
    v12 = (void *)objc_opt_class();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)v22 = 138543874;
    *(_QWORD *)&v22[4] = v12;
    *(_WORD *)&v22[12] = 2112;
    *(_QWORD *)&v22[14] = v13;
    *(_WORD *)&v22[22] = 2114;
    v23 = v14;
    v15 = v12;
    LODWORD(v21) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v18 &= 2u;
    if (!v18)
      goto LABEL_13;
    v19 = (void *)objc_opt_class();
    v20 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v22 = 138543618;
    *(_QWORD *)&v22[4] = v19;
    *(_WORD *)&v22[12] = 2112;
    *(_QWORD *)&v22[14] = v20;
    v15 = v19;
    LODWORD(v21) = 22;
  }
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, v22, v21, *(_OWORD *)v22, *(_QWORD *)&v22[16]);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog();
LABEL_13:

  }
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (id)createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id *v10;
  uint64_t v11;
  id v12;
  dispatch_semaphore_t v13;
  dispatch_time_t v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  ISBiometricStore *v32;
  id v33;
  NSObject *v34;
  uint64_t *v35;
  uint64_t *v36;
  id obj;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  int v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  if (SSIsDaemon())
  {
    -[objc_class sharedInstance](NSClassFromString(CFSTR("DaemonBiometricKeychain")), "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (id *)(v39 + 5);
    obj = (id)v39[5];
    -[NSObject createX509CertChainDataForAccountIdentifier_:purpose:error:](v9, "createX509CertChainDataForAccountIdentifier_:purpose:error:", v8, a4, &obj);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, obj);
    v12 = (id)v45[5];
    v45[5] = v11;
    goto LABEL_16;
  }
  v13 = dispatch_semaphore_create(0);
  v12 = objc_alloc_init(MEMORY[0x24BEB1E80]);
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __78__ISBiometricStore_createX509CertChainDataForAccountIdentifier_purpose_error___block_invoke;
  v31 = &unk_24C43C100;
  v35 = &v38;
  v32 = self;
  v33 = v8;
  v36 = &v44;
  v9 = v13;
  v34 = v9;
  objc_msgSend(v12, "createX509CertChainDataForAccountIdentifier:purpose:completionBlock:", v33, a4, &v28);
  v14 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v14))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "shouldLog");
    v17 = objc_msgSend(v15, "shouldLogToDisk");
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
      v16 |= 2u;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (v16)
    {
      v20 = (void *)objc_opt_class();
      v50 = 138543362;
      v51 = v20;
      v21 = v20;
      LODWORD(v27) = 12;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_14:

        SSError();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v39[5];
        v39[5] = v23;

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v50, v27, v28, v29, v30, v31, v32, v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a5)
    *a5 = objc_retainAutorelease((id)v39[5]);
  v25 = (id)v45[5];
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v25;
}

void __78__ISBiometricStore_createX509CertChainDataForAccountIdentifier_purpose_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[24];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (!v10)
      goto LABEL_13;
    v12 = (void *)objc_opt_class();
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v21 = 138543874;
    *(_QWORD *)&v21[4] = v12;
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2114;
    v22 = v7;
    v14 = v12;
    LODWORD(v20) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (!v17)
      goto LABEL_13;
    v18 = (void *)objc_opt_class();
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v21 = 138543618;
    *(_QWORD *)&v21[4] = v18;
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v19;
    v14 = v18;
    LODWORD(v20) = 22;
  }
  v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, v21, v20, *(_OWORD *)v21, *(_QWORD *)&v21[16]);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v15);
    SSFileLog();
LABEL_13:

  }
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (BOOL)deleteKeychainTokensForAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id *v8;
  char v9;
  dispatch_semaphore_t v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, char, void *);
  void *v29;
  ISBiometricStore *v30;
  id v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  id obj;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  int v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  if (SSIsDaemon())
  {
    -[objc_class sharedInstance](NSClassFromString(CFSTR("DaemonBiometricKeychain")), "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (id *)(v37 + 5);
    obj = (id)v37[5];
    v9 = -[NSObject deleteKeychainTokensForAccountIdentifier_:error:](v7, "deleteKeychainTokensForAccountIdentifier_:error:", v6, &obj);
    objc_storeStrong(v8, obj);
    *((_BYTE *)v43 + 24) = v9;
    goto LABEL_16;
  }
  v10 = dispatch_semaphore_create(0);
  v11 = (void *)objc_opt_new();
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __67__ISBiometricStore_deleteKeychainTokensForAccountIdentifier_error___block_invoke;
  v29 = &unk_24C43BFE8;
  v33 = &v36;
  v30 = self;
  v31 = v6;
  v34 = &v42;
  v7 = v10;
  v32 = v7;
  objc_msgSend(v11, "deleteKeychainTokensForAccountIdentifier:completionBlock:", v31, &v26);
  v12 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v7, v12))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    v15 = objc_msgSend(v13, "shouldLogToDisk");
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
      v14 |= 2u;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      v14 &= 2u;
    if (v14)
    {
      v18 = (void *)objc_opt_class();
      v46 = 138543362;
      v47 = v18;
      v19 = v18;
      LODWORD(v25) = 12;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_14:

        SSError();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v37[5];
        v37[5] = v21;

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v46, v25, v26, v27, v28, v29, v30, v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a4)
    *a4 = objc_retainAutorelease((id)v37[5]);
  v23 = *((_BYTE *)v43 + 24) != 0;
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v23;
}

void __67__ISBiometricStore_deleteKeychainTokensForAccountIdentifier_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (!v9)
      goto LABEL_23;
    v11 = (void *)objc_opt_class();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)v21 = 138543874;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v12;
    *(_WORD *)&v21[22] = 2114;
    v22 = v13;
    v14 = v11;
    LODWORD(v20) = 32;
LABEL_21:
    v19 = (void *)_os_log_send_and_compose_impl();

    if (!v19)
    {
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, v21, v20, *(_OWORD *)v21, *(_QWORD *)&v21[16]);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v19);
    SSFileLog();
LABEL_23:

    goto LABEL_24;
  }
  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (!v16)
      goto LABEL_23;
    v17 = (void *)objc_opt_class();
    v18 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v21 = 138543618;
    *(_QWORD *)&v21[4] = v17;
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v18;
    v14 = v17;
    LODWORD(v20) = 22;
    goto LABEL_21;
  }
LABEL_25:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (id)publicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  dispatch_semaphore_t v13;
  dispatch_time_t v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  ISBiometricStore *v32;
  id v33;
  NSObject *v34;
  uint64_t *v35;
  uint64_t *v36;
  id obj;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  int v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  if (SSIsDaemon())
  {
    -[objc_class sharedInstance](NSClassFromString(CFSTR("DaemonBiometricKeychain")), "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (id *)(v39 + 5);
    obj = (id)v39[5];
    -[NSObject publicKeyDataForAccountIdentifier_:purpose:error:](v9, "publicKeyDataForAccountIdentifier_:purpose:error:", v8, a4, &obj);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, obj);
    v12 = (void *)v45[5];
    v45[5] = v11;
    goto LABEL_16;
  }
  v13 = dispatch_semaphore_create(0);
  v12 = (void *)objc_opt_new();
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __68__ISBiometricStore_publicKeyDataForAccountIdentifier_purpose_error___block_invoke;
  v31 = &unk_24C43C0D8;
  v35 = &v38;
  v32 = self;
  v33 = v8;
  v36 = &v44;
  v9 = v13;
  v34 = v9;
  objc_msgSend(v12, "getPublicKeyDataForAccountIdentifier:purpose:completionBlock:", v33, a4, &v28);
  v14 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v9, v14))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "shouldLog");
    v17 = objc_msgSend(v15, "shouldLogToDisk");
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
      v16 |= 2u;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (v16)
    {
      v20 = (void *)objc_opt_class();
      v50 = 138543362;
      v51 = v20;
      v21 = v20;
      LODWORD(v27) = 12;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_14:

        SSError();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v39[5];
        v39[5] = v23;

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v50, v27, v28, v29, v30, v31, v32, v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a5)
    *a5 = objc_retainAutorelease((id)v39[5]);
  v25 = (id)v45[5];
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v25;
}

void __68__ISBiometricStore_publicKeyDataForAccountIdentifier_purpose_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[24];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (!v10)
      goto LABEL_13;
    v12 = (void *)objc_opt_class();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)v22 = 138543874;
    *(_QWORD *)&v22[4] = v12;
    *(_WORD *)&v22[12] = 2112;
    *(_QWORD *)&v22[14] = v13;
    *(_WORD *)&v22[22] = 2114;
    v23 = v14;
    v15 = v12;
    LODWORD(v21) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v18 &= 2u;
    if (!v18)
      goto LABEL_13;
    v19 = (void *)objc_opt_class();
    v20 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v22 = 138543618;
    *(_QWORD *)&v22[4] = v19;
    *(_WORD *)&v22[12] = 2112;
    *(_QWORD *)&v22[14] = v20;
    v15 = v19;
    LODWORD(v21) = 22;
  }
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, v22, v21, *(_OWORD *)v22, *(_QWORD *)&v22[16]);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog();
LABEL_13:

  }
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

+ (BOOL)shouldUseApplePayClassic
{
  uint64_t v2;
  ISLoadURLBagOperation *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  int v26;
  int v27;
  NSObject *v28;
  id v29;
  int *v30;
  uint64_t v31;
  ISLoadURLBagOperation *v32;
  int v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(MEMORY[0x24BEB1DE8], "deviceIsInternalBuild"))
    goto LABEL_29;
  v2 = objc_msgSend(MEMORY[0x24BE08100], "applePayClassic");
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v12 &= 2u;
    if (v12)
    {
      v33 = 138543362;
      v34 = (id)objc_opt_class();
      v14 = v34;
      LODWORD(v31) = 12;
      v30 = &v33;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v33, v31);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      v30 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_28;
  }
  if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
    }
    v26 = -[ISLoadURLBagOperation shouldLog](v3, "shouldLog");
    if (-[ISLoadURLBagOperation shouldLogToDisk](v3, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    -[ISLoadURLBagOperation OSLogObject](v3, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      v27 &= 2u;
    if (v27)
    {
      v33 = 138543362;
      v34 = (id)objc_opt_class();
      v29 = v34;
      LODWORD(v31) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
        goto LABEL_45;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v33, v31);
      v28 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog();
    }

    LOBYTE(v9) = 0;
    goto LABEL_45;
  }
  if (v2 != 1)
  {
LABEL_29:
    v3 = objc_alloc_init(ISLoadURLBagOperation);
    +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperations:waitUntilFinished:", v17, 1);

    if (-[ISOperation success](v3, "success"))
    {
      -[ISLoadURLBagOperation URLBag](v3, "URLBag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForKey:", CFSTR("use-apple-pay-classic"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        LOBYTE(v9) = objc_msgSend(v19, "BOOLValue");
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v20 = objc_msgSend(v19, "shouldLog", v30);
      if (objc_msgSend(v19, "shouldLogToDisk"))
        v21 = v20 | 2;
      else
        v21 = v20;
      objc_msgSend(v19, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        v21 &= 2u;
      if (v21)
      {
        v23 = (void *)objc_opt_class();
        v33 = 138543362;
        v34 = v23;
        v24 = v23;
        LODWORD(v31) = 12;
        v9 = (void *)_os_log_send_and_compose_impl();

        if (!v9)
          goto LABEL_44;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v33, v31);
        v22 = objc_claimAutoreleasedReturnValue();
        free(v9);
        SSFileLog();
      }

    }
    LOBYTE(v9) = 0;
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
  v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
  }
  v4 = -[ISLoadURLBagOperation shouldLog](v3, "shouldLog");
  if (-[ISLoadURLBagOperation shouldLogToDisk](v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  -[ISLoadURLBagOperation OSLogObject](v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_15;
  v33 = 138543362;
  v34 = (id)objc_opt_class();
  v7 = v34;
  LODWORD(v31) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v33, v31);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_15:

  }
  LOBYTE(v9) = 1;
LABEL_45:

  return (char)v9;
}

+ (BOOL)shouldUseAutoEnrollment
{
  uint64_t v2;
  ISLoadURLBagOperation *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  int v27;
  int v28;
  id v29;
  int *v30;
  uint64_t v31;
  ISLoadURLBagOperation *v32;
  int v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(MEMORY[0x24BEB1DE8], "deviceIsInternalBuild"))
    goto LABEL_29;
  v2 = objc_msgSend(MEMORY[0x24BE08100], "cardEnrollmentAutomatic");
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v12 &= 2u;
    if (v12)
    {
      v33 = 138543362;
      v34 = (id)objc_opt_class();
      v14 = v34;
      LODWORD(v31) = 12;
      v30 = &v33;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v33, v31);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      v30 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_28;
  }
  if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
    }
    v27 = -[ISLoadURLBagOperation shouldLog](v3, "shouldLog");
    if (-[ISLoadURLBagOperation shouldLogToDisk](v3, "shouldLogToDisk"))
      v28 = v27 | 2;
    else
      v28 = v27;
    -[ISLoadURLBagOperation OSLogObject](v3, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      v28 &= 2u;
    if (v28)
    {
      v33 = 138543362;
      v34 = (id)objc_opt_class();
      v29 = v34;
      LODWORD(v31) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
        goto LABEL_46;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v33, v31);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog();
    }
    goto LABEL_45;
  }
  if (v2 != 1)
  {
LABEL_29:
    v3 = objc_alloc_init(ISLoadURLBagOperation);
    +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperations:waitUntilFinished:", v17, 1);

    if (-[ISOperation success](v3, "success"))
    {
      -[ISLoadURLBagOperation URLBag](v3, "URLBag");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject valueForKey:](v18, "valueForKey:", CFSTR("auto-enrollment-percentage"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v19, "doubleValue");
      -[NSObject valueForKey:](v18, "valueForKey:", CFSTR("auto-enrollment-session-duration"), v30);
      v20 = objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject integerValue](v20, "integerValue");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v18 = objc_claimAutoreleasedReturnValue();
      }
      v21 = -[NSObject shouldLog](v18, "shouldLog", v30);
      if (-[NSObject shouldLogToDisk](v18, "shouldLogToDisk"))
        v22 = v21 | 2;
      else
        v22 = v21;
      -[NSObject OSLogObject](v18, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        v22 &= 2u;
      if (v22)
      {
        v23 = (void *)objc_opt_class();
        v33 = 138543362;
        v34 = v23;
        v24 = v23;
        LODWORD(v31) = 12;
        v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25)
        {
LABEL_45:

          LOBYTE(v9) = 0;
          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4, &v33, v31);
        v20 = objc_claimAutoreleasedReturnValue();
        free(v25);
        SSFileLog();
      }
    }

    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
  v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
  }
  v4 = -[ISLoadURLBagOperation shouldLog](v3, "shouldLog");
  if (-[ISLoadURLBagOperation shouldLogToDisk](v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  -[ISLoadURLBagOperation OSLogObject](v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_15;
  v33 = 138543362;
  v34 = (id)objc_opt_class();
  v7 = v34;
  LODWORD(v31) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v33, v31);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_15:

  }
  LOBYTE(v9) = 1;
LABEL_46:

  return (char)v9;
}

+ (BOOL)shouldUseExtendedEnrollment
{
  uint64_t v2;
  ISLoadURLBagOperation *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  int v26;
  int v27;
  NSObject *v28;
  id v29;
  int *v30;
  uint64_t v31;
  ISLoadURLBagOperation *v32;
  int v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(MEMORY[0x24BEB1DE8], "deviceIsInternalBuild"))
    goto LABEL_29;
  v2 = objc_msgSend(MEMORY[0x24BE08100], "cardEnrollmentManual");
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v12 &= 2u;
    if (v12)
    {
      v33 = 138543362;
      v34 = (id)objc_opt_class();
      v14 = v34;
      LODWORD(v31) = 12;
      v30 = &v33;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v33, v31);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      v30 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_28;
  }
  if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
    }
    v26 = -[ISLoadURLBagOperation shouldLog](v3, "shouldLog");
    if (-[ISLoadURLBagOperation shouldLogToDisk](v3, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    -[ISLoadURLBagOperation OSLogObject](v3, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      v27 &= 2u;
    if (v27)
    {
      v33 = 138543362;
      v34 = (id)objc_opt_class();
      v29 = v34;
      LODWORD(v31) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
        goto LABEL_45;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v33, v31);
      v28 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog();
    }

    LOBYTE(v9) = 0;
    goto LABEL_45;
  }
  if (v2 != 1)
  {
LABEL_29:
    v3 = objc_alloc_init(ISLoadURLBagOperation);
    +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperations:waitUntilFinished:", v17, 1);

    if (-[ISOperation success](v3, "success"))
    {
      -[ISLoadURLBagOperation URLBag](v3, "URLBag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForKey:", CFSTR("use-extended-enrollment"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        LOBYTE(v9) = objc_msgSend(v19, "BOOLValue");
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v20 = objc_msgSend(v19, "shouldLog", v30);
      if (objc_msgSend(v19, "shouldLogToDisk"))
        v21 = v20 | 2;
      else
        v21 = v20;
      objc_msgSend(v19, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        v21 &= 2u;
      if (v21)
      {
        v23 = (void *)objc_opt_class();
        v33 = 138543362;
        v34 = v23;
        v24 = v23;
        LODWORD(v31) = 12;
        v9 = (void *)_os_log_send_and_compose_impl();

        if (!v9)
          goto LABEL_44;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v33, v31);
        v22 = objc_claimAutoreleasedReturnValue();
        free(v9);
        SSFileLog();
      }

    }
    LOBYTE(v9) = 0;
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
  v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
  }
  v4 = -[ISLoadURLBagOperation shouldLog](v3, "shouldLog");
  if (-[ISLoadURLBagOperation shouldLogToDisk](v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  -[ISLoadURLBagOperation OSLogObject](v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_15;
  v33 = 138543362;
  v34 = (id)objc_opt_class();
  v7 = v34;
  LODWORD(v31) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v33, v31);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_15:

  }
  LOBYTE(v9) = 1;
LABEL_45:

  return (char)v9;
}

+ (BOOL)shouldUseUpsellEnrollment
{
  uint64_t v2;
  ISLoadURLBagOperation *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  int v26;
  int v27;
  NSObject *v28;
  id v29;
  int *v30;
  uint64_t v31;
  ISLoadURLBagOperation *v32;
  int v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(MEMORY[0x24BEB1DE8], "deviceIsInternalBuild"))
    goto LABEL_29;
  v2 = objc_msgSend(MEMORY[0x24BE08100], "cardEnrollmentUpsell");
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v12 &= 2u;
    if (v12)
    {
      v33 = 138543362;
      v34 = (id)objc_opt_class();
      v14 = v34;
      LODWORD(v31) = 12;
      v30 = &v33;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v33, v31);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      v30 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_28;
  }
  if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
    }
    v26 = -[ISLoadURLBagOperation shouldLog](v3, "shouldLog");
    if (-[ISLoadURLBagOperation shouldLogToDisk](v3, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    -[ISLoadURLBagOperation OSLogObject](v3, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      v27 &= 2u;
    if (v27)
    {
      v33 = 138543362;
      v34 = (id)objc_opt_class();
      v29 = v34;
      LODWORD(v31) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
        goto LABEL_45;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v33, v31);
      v28 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog();
    }

    LOBYTE(v9) = 0;
    goto LABEL_45;
  }
  if (v2 != 1)
  {
LABEL_29:
    v3 = objc_alloc_init(ISLoadURLBagOperation);
    +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperations:waitUntilFinished:", v17, 1);

    if (-[ISOperation success](v3, "success"))
    {
      -[ISLoadURLBagOperation URLBag](v3, "URLBag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForKey:", CFSTR("use-enrollment-upsell"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        LOBYTE(v9) = objc_msgSend(v19, "BOOLValue");
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v20 = objc_msgSend(v19, "shouldLog", v30);
      if (objc_msgSend(v19, "shouldLogToDisk"))
        v21 = v20 | 2;
      else
        v21 = v20;
      objc_msgSend(v19, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        v21 &= 2u;
      if (v21)
      {
        v23 = (void *)objc_opt_class();
        v33 = 138543362;
        v34 = v23;
        v24 = v23;
        LODWORD(v31) = 12;
        v9 = (void *)_os_log_send_and_compose_impl();

        if (!v9)
          goto LABEL_44;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v33, v31);
        v22 = objc_claimAutoreleasedReturnValue();
        free(v9);
        SSFileLog();
      }

    }
    LOBYTE(v9) = 0;
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
  v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (ISLoadURLBagOperation *)objc_claimAutoreleasedReturnValue();
  }
  v4 = -[ISLoadURLBagOperation shouldLog](v3, "shouldLog");
  if (-[ISLoadURLBagOperation shouldLogToDisk](v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  -[ISLoadURLBagOperation OSLogObject](v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_15;
  v33 = 138543362;
  v34 = (id)objc_opt_class();
  v7 = v34;
  LODWORD(v31) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v33, v31);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_15:

  }
  LOBYTE(v9) = 1;
LABEL_45:

  return (char)v9;
}

+ (BOOL)shouldUseX509
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  int *v22;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x24BE08118], "hardwarePlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  v8 = (void *)objc_opt_class();
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = v8;
  objc_msgSend(v9, "numberWithBool:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 138543874;
  v25 = v8;
  v26 = 2114;
  v27 = v3;
  v28 = 2114;
  v29 = v11;
  LODWORD(v23) = 32;
  v22 = &v24;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v24, v23);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v12);
    v22 = (int *)v7;
    SSFileLog();
LABEL_11:

  }
  if ((_DWORD)v2 && (objc_msgSend(v3, "isEqualToString:", CFSTR("t8015")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog", v22);
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      v16 &= 2u;
    if (v16)
    {
      v18 = (void *)objc_opt_class();
      v24 = 138543362;
      v25 = v18;
      v19 = v18;
      LODWORD(v23) = 12;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_26:

        v13 = 1;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v24, v23);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog();
    }

    goto LABEL_26;
  }
  v13 = 0;
LABEL_27:

  return v13;
}

- (id)signData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id *v11;
  uint64_t v12;
  id v13;
  dispatch_semaphore_t v14;
  dispatch_time_t v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  ISBiometricStore *v33;
  id v34;
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  id obj;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  int v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  if (SSIsDaemon())
  {
    -[objc_class sharedInstance](NSClassFromString(CFSTR("DaemonBiometricKeychain")), "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (id *)(v40 + 5);
    obj = (id)v40[5];
    -[NSObject signData_:context:error:](v10, "signData_:context:error:", v8, v9, &obj);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11, obj);
    v13 = (id)v46[5];
    v46[5] = v12;
    goto LABEL_16;
  }
  v14 = dispatch_semaphore_create(0);
  v13 = objc_alloc_init(MEMORY[0x24BEB1E80]);
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __43__ISBiometricStore_signData_context_error___block_invoke;
  v32 = &unk_24C43C0D8;
  v36 = &v39;
  v33 = self;
  v34 = v9;
  v37 = &v45;
  v10 = v14;
  v35 = v10;
  objc_msgSend(v13, "signData:context:completionBlock:", v8, v34, &v29);
  v15 = dispatch_time(0, 180000000000);
  if (dispatch_semaphore_wait(v10, v15))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v16, "shouldLog");
    v18 = objc_msgSend(v16, "shouldLogToDisk");
    objc_msgSend(v16, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
      v17 |= 2u;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (v17)
    {
      v21 = (void *)objc_opt_class();
      v51 = 138543362;
      v52 = v21;
      v22 = v21;
      LODWORD(v28) = 12;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_14:

        SSError();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v40[5];
        v40[5] = v24;

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v51, v28, v29, v30, v31, v32, v33, v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      free(v23);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a5)
    *a5 = objc_retainAutorelease((id)v40[5]);
  v26 = (id)v46[5];
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v26;
}

void __43__ISBiometricStore_signData_context_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BYTE v22[24];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (!v10)
      goto LABEL_11;
    v12 = (void *)objc_opt_class();
    v13 = *(void **)(a1 + 40);
    v14 = v12;
    objc_msgSend(v13, "accountIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v22 = 138412802;
    *(_QWORD *)&v22[4] = v12;
    *(_WORD *)&v22[12] = 2112;
    *(_QWORD *)&v22[14] = v15;
    *(_WORD *)&v22[22] = 2114;
    v23 = v7;
    LODWORD(v21) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v18 &= 2u;
    if (!v18)
      goto LABEL_11;
    v19 = (void *)objc_opt_class();
    v20 = *(void **)(a1 + 40);
    v14 = v19;
    objc_msgSend(v20, "accountIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v22 = 138543618;
    *(_QWORD *)&v22[4] = v19;
    *(_WORD *)&v22[12] = 2112;
    *(_QWORD *)&v22[14] = v15;
    LODWORD(v21) = 22;
  }
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, v22, v21, *(_OWORD *)v22, *(_QWORD *)&v22[16]);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog();
LABEL_11:

  }
LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (id)x509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  id *v12;
  uint64_t v13;
  id v14;
  dispatch_semaphore_t v15;
  dispatch_time_t v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  ISBiometricStore *v34;
  id v35;
  NSObject *v36;
  uint64_t *v37;
  uint64_t *v38;
  id obj;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  int v52;
  void *v53;
  uint64_t v54;

  v7 = a5;
  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  v45 = 0;
  if (SSIsDaemon())
  {
    -[objc_class sharedInstance](NSClassFromString(CFSTR("DaemonBiometricKeychain")), "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (id *)(v41 + 5);
    obj = (id)v41[5];
    -[NSObject x509CertChainDataForAccountIdentifier_:purpose:regenerateCerts:error:](v11, "x509CertChainDataForAccountIdentifier_:purpose:regenerateCerts:error:", v10, a4, v7, &obj);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12, obj);
    v14 = (id)v47[5];
    v47[5] = v13;
    goto LABEL_16;
  }
  v15 = dispatch_semaphore_create(0);
  v14 = objc_alloc_init(MEMORY[0x24BEB1E80]);
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __88__ISBiometricStore_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_error___block_invoke;
  v33 = &unk_24C43C100;
  v37 = &v40;
  v34 = self;
  v35 = v10;
  v38 = &v46;
  v11 = v15;
  v36 = v11;
  objc_msgSend(v14, "x509CertChainDataForAccountIdentifier:purpose:regenerateCerts:completionBlock:", v35, a4, v7, &v30);
  v16 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v11, v16))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = objc_msgSend(v17, "shouldLog");
    v19 = objc_msgSend(v17, "shouldLogToDisk");
    objc_msgSend(v17, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
      v18 |= 2u;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      v18 &= 2u;
    if (v18)
    {
      v22 = (void *)objc_opt_class();
      v52 = 138543362;
      v53 = v22;
      v23 = v22;
      LODWORD(v29) = 12;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_14:

        SSError();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v41[5];
        v41[5] = v25;

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v52, v29, v30, v31, v32, v33, v34, v35);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      free(v24);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  if (a6)
    *a6 = objc_retainAutorelease((id)v41[5]);
  v27 = (id)v47[5];
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v27;
}

void __88__ISBiometricStore_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[24];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (!v10)
      goto LABEL_13;
    v12 = (void *)objc_opt_class();
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v21 = 138543874;
    *(_QWORD *)&v21[4] = v12;
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2114;
    v22 = v7;
    v14 = v12;
    LODWORD(v20) = 32;
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (!v17)
      goto LABEL_13;
    v18 = (void *)objc_opt_class();
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v21 = 138543618;
    *(_QWORD *)&v21[4] = v18;
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v19;
    v14 = v18;
    LODWORD(v20) = 22;
  }
  v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, v21, v20, *(_OWORD *)v21, *(_QWORD *)&v21[16]);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v15);
    SSFileLog();
LABEL_13:

  }
LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_contextCache, 0);
}

@end
