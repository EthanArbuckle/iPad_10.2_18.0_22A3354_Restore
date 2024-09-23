@implementation WBSPasswordBreachStore

- (WBSPasswordBreachStore)initWithBackingStoreURL:(id)a3
{
  id v4;
  WBSPasswordBreachStore *v5;
  WBSPersistentPropertyListStore *v6;
  void *v7;
  uint64_t v8;
  WBSPersistentPropertyListStore *store;
  WBSPasswordBreachStore *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSPasswordBreachStore;
  v5 = -[WBSPasswordBreachStore init](&v17, sel_init);
  if (v5)
  {
    v6 = [WBSPersistentPropertyListStore alloc];
    v18 = *MEMORY[0x1E0C999D8];
    v19[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WBSPersistentPropertyListStore initWithBackingStoreURL:fileResourceValues:](v6, "initWithBackingStoreURL:fileResourceValues:", v4, v7);
    store = v5->_store;
    v5->_store = (WBSPersistentPropertyListStore *)v8;

    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke;
    v15 = &unk_1E649DD98;
    v16 = v4;
    -[WBSPersistentPropertyListStore setCreateEmptyStoreHandler:](v5->_store, "setCreateEmptyStoreHandler:", &v12);
    -[WBSPersistentPropertyListStore setValidateLoadedStoreHandler:](v5->_store, "setValidateLoadedStoreHandler:", &__block_literal_global_38, v12, v13, v14, v15);
    v10 = v5;

  }
  return v5;
}

id __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("Version");
  v10[0] = &unk_1E64CE430;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_4;
  +[WBSPasswordBreachStore _createPersistentIdentifierCanary](WBSPasswordBreachStore, "_createPersistentIdentifierCanary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("KeychainPersistentIdentifierCanaryPersistentIdentifier"));

    objc_msgSend(v5, "second");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("KeychainPersistentIdentifierCanaryValue"));

LABEL_4:
    v5 = v3;
  }

  return v5;
}

id __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;

  v2 = a2;
  objc_msgSend(v2, "safari_numberForKey:", CFSTR("Version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  if (v4 == 1)
  {
    objc_msgSend(v2, "safari_dataForKey:", CFSTR("KeychainPersistentIdentifierCanaryPersistentIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {
      v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_21_cold_1();
      v9 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v2, "safari_stringForKey:", CFSTR("KeychainPersistentIdentifierCanaryValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      if (+[WBSPasswordBreachStore _readAndValidatePersistentIdentifierCanaryWithPersistentIdentifier:expectedValue:](WBSPasswordBreachStore, "_readAndValidatePersistentIdentifierCanaryWithPersistentIdentifier:expectedValue:", v5, v6))
      {
        objc_msgSend(v2, "valueForKey:", CFSTR("PasswordEvaluationResults"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v8 = (void *)objc_msgSend(v2, "mutableCopy");
          objc_msgSend(v8, "removeObjectForKey:", CFSTR("PasswordEvaluationResults"));

          v2 = v8;
        }
        v2 = v2;
        v9 = v2;
        goto LABEL_19;
      }
      v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_21_cold_3();
    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_21_cold_2();
    }
    v9 = 0;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_21_cold_4(v4, v10, v11);
  v9 = 0;
LABEL_21:

  return v9;
}

- (NSDictionary)queuedPasswordBagManagerState
{
  return (NSDictionary *)-[WBSPersistentPropertyListStore dictionaryForKey:](self->_store, "dictionaryForKey:", CFSTR("QueuedPasswordBagManagerState"));
}

- (void)setQueuedPasswordBagManagerState:(id)a3
{
  -[WBSPersistentPropertyListStore setObject:forKey:](self->_store, "setObject:forKey:", a3, CFSTR("QueuedPasswordBagManagerState"));
}

- (NSArray)resultRecords
{
  return (NSArray *)-[WBSPersistentPropertyListStore arrayForKey:](self->_store, "arrayForKey:", CFSTR("CheckerResultsState"));
}

- (void)setResultRecords:(id)a3
{
  -[WBSPersistentPropertyListStore setObject:forKey:](self->_store, "setObject:forKey:", a3, CFSTR("CheckerResultsState"));
}

- (NSArray)recentlyBreachedPersistentIdentifiers
{
  return (NSArray *)-[WBSPersistentPropertyListStore arrayForKey:](self->_store, "arrayForKey:", CFSTR("CheckerRecentlyBreachedResultIdentifiers"));
}

- (void)setRecentlyBreachedPersistentIdentifiers:(id)a3
{
  -[WBSPersistentPropertyListStore setObject:forKey:](self->_store, "setObject:forKey:", a3, CFSTR("CheckerRecentlyBreachedResultIdentifiers"));
}

- (unint64_t)rampIdentifier
{
  void *v2;
  unint64_t v3;

  -[WBSPersistentPropertyListStore numberForKey:](self->_store, "numberForKey:", CFSTR("RampIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setRampIdentifier:(unint64_t)a3
{
  WBSPersistentPropertyListStore *store;
  id v4;

  store = self->_store;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSPersistentPropertyListStore setObject:forKey:](store, "setObject:forKey:", v4, CFSTR("RampIdentifier"));

}

- (NSDate)lastSessionCompletionDate
{
  return (NSDate *)-[WBSPersistentPropertyListStore dateForKey:](self->_store, "dateForKey:", CFSTR("LastSessionCompletionDate"));
}

- (void)setLastSessionCompletionDate:(id)a3
{
  -[WBSPersistentPropertyListStore setObject:forKey:](self->_store, "setObject:forKey:", a3, CFSTR("LastSessionCompletionDate"));
}

- (void)saveStoreSynchronously
{
  -[WBSPersistentPropertyListStore saveStoreSynchronously](self->_store, "saveStoreSynchronously");
}

- (void)saveAndCloseStoreSynchronously
{
  -[WBSPersistentPropertyListStore saveAndCloseStoreSynchronously](self->_store, "saveAndCloseStoreSynchronously");
}

+ (id)_createPersistentIdentifierCanary
{
  SecAccessControlRef v2;
  SecAccessControlRef v3;
  void *v4;
  __CFError *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  OSStatus v16;
  int v17;
  void *v18;
  CFErrorRef v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  WBSPair *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  const __CFDictionary *v31;
  uint64_t v32;
  __CFError *v33;
  CFTypeRef result;
  CFErrorRef error;
  uint64_t v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[6];
  _QWORD v41[8];

  v41[6] = *MEMORY[0x1E0C80C00];
  error = 0;
  v2 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E0CD68B0], 0, &error);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (__CFError *)objc_claimAutoreleasedReturnValue();

    v6 = *MEMORY[0x1E0CD6C98];
    v7 = *MEMORY[0x1E0CD6CA8];
    v8 = *MEMORY[0x1E0CD6B58];
    v40[0] = *MEMORY[0x1E0CD6C98];
    v40[1] = v8;
    v41[0] = v7;
    v41[1] = CFSTR("KeychainPersistentIdentifierCanaryPersistentIdentifier");
    v9 = *MEMORY[0x1E0CD70D8];
    v40[2] = *MEMORY[0x1E0CD70D8];
    v33 = v5;
    -[__CFError dataUsingEncoding:](v5, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CD7020];
    v12 = *MEMORY[0x1E0C9AE50];
    v41[2] = v10;
    v41[3] = v12;
    v13 = *MEMORY[0x1E0CD6890];
    v32 = v11;
    v40[3] = v11;
    v40[4] = v13;
    v14 = *MEMORY[0x1E0CD6898];
    v40[5] = *MEMORY[0x1E0CD6898];
    v41[4] = v3;
    v41[5] = CFSTR("com.apple.cfnetwork");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 6);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    result = 0;
    v16 = SecItemAdd(v15, &result);
    if (v16)
    {
      v17 = v16;
      if (v16 != -25299)
      {
        v25 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          +[WBSPasswordBreachStore _createPersistentIdentifierCanary].cold.2(v17, v25);
        v24 = 0;
        v19 = v33;
        goto LABEL_25;
      }
      v31 = v15;
      v38[0] = v6;
      v38[1] = v8;
      v39[0] = v7;
      v39[1] = CFSTR("KeychainPersistentIdentifierCanaryPersistentIdentifier");
      v38[2] = v14;
      v39[2] = CFSTR("com.apple.cfnetwork");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v9;
      v19 = v33;
      -[__CFError dataUsingEncoding:](v33, "dataUsingEncoding:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (SecItemUpdate((CFDictionaryRef)v18, (CFDictionaryRef)v21))
      {
        v22 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          +[WBSPasswordBreachStore _createPersistentIdentifierCanary].cold.5();
LABEL_17:

        v24 = 0;
        v15 = v31;
LABEL_25:

        goto LABEL_26;
      }
      v26 = (void *)objc_msgSend(v18, "mutableCopy");
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v12, v32);
      if (SecItemCopyMatching((CFDictionaryRef)v26, &result))
      {
        v27 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          +[WBSPasswordBreachStore _createPersistentIdentifierCanary].cold.4();

        goto LABEL_17;
      }

      v15 = v31;
    }
    v28 = (void *)result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v33;
      v24 = -[WBSPair initWithFirst:second:]([WBSPair alloc], "initWithFirst:second:", v28, v33);
    }
    else
    {
      v29 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      v19 = v33;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        +[WBSPasswordBreachStore _createPersistentIdentifierCanary].cold.3();
      v24 = 0;
    }

    goto LABEL_25;
  }
  v19 = error;
  v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    +[WBSPasswordBreachStore _createPersistentIdentifierCanary].cold.1(v23, v19);
  v24 = 0;
LABEL_26:

  return v24;
}

+ (BOOL)_readAndValidatePersistentIdentifierCanaryWithPersistentIdentifier:(id)a3 expectedValue:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  const __CFDictionary *v8;
  OSStatus v9;
  OSStatus v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v17;
  CFTypeRef v18[2];
  uint8_t buf[4];
  OSStatus v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0CD70E0];
  v21[0] = *MEMORY[0x1E0CD6C98];
  v21[1] = v7;
  v22[0] = *MEMORY[0x1E0CD6CA8];
  v22[1] = v5;
  v21[2] = *MEMORY[0x1E0CD7018];
  v22[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v9 = SecItemCopyMatching(v8, v18);
  if (v9)
  {
    v10 = v9;
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v10;
      _os_log_impl(&dword_1B2621000, v11, OS_LOG_TYPE_DEFAULT, "Could not find canary in keychain: %d", buf, 8u);
    }
LABEL_10:

    v13 = 0;
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v12 = (void *)v18[0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v15, OS_LOG_TYPE_DEFAULT, "Canary item in keychain had unexpected type", buf, 2u);
    }

    goto LABEL_10;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);

  if ((objc_msgSend(v13, "isEqualToString:", v6) & 1) == 0)
  {
    v17 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl(&dword_1B2621000, v17, OS_LOG_TYPE_DEFAULT, "Canary item in keychain did not match plist value.", (uint8_t *)v18, 2u);
    }
    goto LABEL_11;
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

void __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Store is missing canary identifier; resetting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_21_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Store is missing canary value; resetting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_21_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Canary is invalid; resetting store.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __50__WBSPasswordBreachStore_initWithBackingStoreURL___block_invoke_21_cold_4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134349056;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, a2, a3, "Unexpected store version %{public}lu, resetting store.", (uint8_t *)&v3);
}

+ (void)_createPersistentIdentifierCanary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Could not update existing canary value in keychain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
