@implementation ICQDaemonPersisted

- (NSDictionary)serverDictionary
{
  return self->_serverDictionary;
}

- (ICQDaemonPersisted)initWithDictionary:(id)a3
{
  id v4;
  ICQDaemonPersisted *v5;
  void *v6;
  NSDate *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  NSString *accountAltDSID;
  void *v15;
  NSDictionary *v16;
  NSObject *p_super;
  NSObject *v18;
  uint64_t v19;
  NSDictionary *failureDetails;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQDaemonPersisted;
  v5 = -[ICQDaemonPersisted init](&v22, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = v5;
      v5 = 0;
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("retrievalDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _ICQGetLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v6;
          _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "bad retrieval date %@", buf, 0xCu);
        }
LABEL_9:

        objc_msgSend(v4, "objectForKey:", CFSTR("callbackInterval"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            _ICQGetLogSystem();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v10;
              _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "bad callbackInterval %@", buf, 0xCu);
            }

            goto LABEL_17;
          }
          objc_msgSend(v10, "doubleValue");
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "defaultCallbackInterval");
        }
        v5->_callbackInterval = v11;
LABEL_17:
        _ICQStringFromDictionaryKey(v4, CFSTR("altDSID"), &stru_1E8B3C468);
        v13 = objc_claimAutoreleasedReturnValue();
        accountAltDSID = v5->_accountAltDSID;
        v5->_accountAltDSID = (NSString *)v13;

        objc_msgSend(v4, "objectForKey:", CFSTR("serverDict"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v15;
          p_super = &v5->_serverDictionary->super;
          v5->_serverDictionary = v16;
        }
        else
        {
          _ICQGetLogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          p_super = v18;
          if (v15)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              -[ICQDaemonPersisted initWithDictionary:].cold.1((uint64_t)v15, p_super);
          }
          else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CDEBD000, p_super, OS_LOG_TYPE_DEFAULT, "persisted offer missing server dict", buf, 2u);
          }
        }

        v5->_failedToFetchFromServer = _ICQIntegerFromDictionaryKey(v4, CFSTR("failedToFetchFromServer"), 0) != 0;
        objc_msgSend(v4, "objectForKey:", CFSTR("failureDetails"));
        v19 = objc_claimAutoreleasedReturnValue();
        failureDetails = v5->_failureDetails;
        v5->_failureDetails = (NSDictionary *)v19;

        if (!v5->_retrievalDate || !v5->_serverDictionary)
        {

          v5 = 0;
        }

        goto LABEL_30;
      }
      v8 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = &v5->_retrievalDate->super;
    v5->_retrievalDate = v7;
    goto LABEL_9;
  }
LABEL_31:

  return v5;
}

+ (void)clearPersistedObject
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "Clearing persisted object for %{public}@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(a1, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "persistenceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICQDaemonOfferPersistedNotificationName"), 0);

}

+ (id)persistedObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "persistenceKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v5);
  else
    v6 = 0;

  return v6;
}

+ (id)userDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ICQDaemonPersisted_userDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userDefaults_onceToken != -1)
    dispatch_once(&userDefaults_onceToken, block);
  return (id)userDefaults_defaults;
}

void __34__ICQDaemonPersisted_userDefaults__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  objc_msgSend(*(id *)(a1 + 32), "persistenceDomain");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithSuiteName:", v5);
  v4 = (void *)userDefaults_defaults;
  userDefaults_defaults = v3;

}

- (NSDictionary)_persistenceDictionary
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ICQDaemonPersisted _mutablePersistenceDictionary](self, "_mutablePersistenceDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v4, 200);
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "validated persistence dictionary", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    if (v7)
    {
      v14 = 138412290;
      v15 = (uint64_t)v4;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "persistence dictionary is invalid: %@", (uint8_t *)&v14, 0xCu);
    }

    v8 = objc_alloc((Class)objc_opt_class());
    -[ICQDaemonPersisted accountAltDSID](self, "accountAltDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "_initWithAccountAltDSID:error:", v9, 0);
    objc_msgSend(v10, "_mutablePersistenceDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");

    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "returning failure dictionary: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v4 = (void *)v12;
  }

  return (NSDictionary *)v4;
}

- (NSDate)retrievalDate
{
  return self->_retrievalDate;
}

- (BOOL)isValidForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICQDaemonPersisted accountAltDSID](self, "accountAltDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ICQDaemonPersisted expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

- (NSDictionary)failureDetails
{
  return self->_failureDetails;
}

- (BOOL)failedToFetchFromServer
{
  return self->_failedToFetchFromServer;
}

- (NSDate)expirationDate
{
  void *v3;
  void *v4;

  -[ICQDaemonPersisted retrievalDate](self, "retrievalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQDaemonPersisted callbackInterval](self, "callbackInterval");
  objc_msgSend(v3, "dateByAddingTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (double)callbackInterval
{
  return self->_callbackInterval;
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (NSMutableDictionary)_mutablePersistenceDictionary
{
  uint64_t v3;
  void *v4;
  const __CFString *accountAltDSID;
  NSDictionary *serverDictionary;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *failureDetails;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  if (self->_retrievalDate && self->_serverDictionary)
  {
    v13[0] = self->_retrievalDate;
    v12[0] = CFSTR("retrievalDate");
    v12[1] = CFSTR("callbackInterval");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callbackInterval);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    accountAltDSID = CFSTR("invalid");
    serverDictionary = self->_serverDictionary;
    if (self->_accountAltDSID)
      accountAltDSID = (const __CFString *)self->_accountAltDSID;
    v13[1] = v3;
    v13[2] = accountAltDSID;
    v12[2] = CFSTR("altDSID");
    v12[3] = CFSTR("serverDict");
    v13[3] = serverDictionary;
    v12[4] = CFSTR("failedToFetchFromServer");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_failedToFetchFromServer);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    failureDetails = self->_failureDetails;
    if (failureDetails)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", failureDetails, CFSTR("failureDetails"));
  }
  else
  {
    v9 = 0;
  }
  return (NSMutableDictionary *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureDetails, 0);
  objc_storeStrong((id *)&self->_serverDictionary, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
  objc_storeStrong((id *)&self->_retrievalDate, 0);
}

+ (NSString)persistenceDomain
{
  return (NSString *)CFSTR("com.apple.cloud.quota");
}

+ (id)_placeholderObject
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_placeholderPersistenceDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  return v5;
}

- (void)persistObject
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    objc_msgSend((id)objc_opt_class(), "persistenceKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "persistenceDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "Persisting %{public}@ using key %@ at location %@", (uint8_t *)&v12, 0x20u);

  }
  -[ICQDaemonPersisted _persistenceDictionary](self, "_persistenceDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "persistenceKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("ICQDaemonOfferPersistedNotificationName"), 0);

}

+ (double)defaultCallbackInterval
{
  return 86400.0;
}

- (id)_initWithAccount:(id)a3 serverDictionary:(id)a4
{
  id v6;
  id v7;
  ICQDaemonPersisted *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQDaemonPersisted;
  v8 = -[ICQDaemonPersisted init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQDaemonPersisted setRetrievalDate:](v8, "setRetrievalDate:", v9);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("callbackInterval"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQDaemonPersisted _callbackIntervalFromServerObject:](v8, "_callbackIntervalFromServerObject:", v10);
    -[ICQDaemonPersisted setCallbackInterval:](v8, "setCallbackInterval:");

    objc_msgSend(v6, "aa_altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQDaemonPersisted setAccountAltDSID:](v8, "setAccountAltDSID:", v11);

    -[ICQDaemonPersisted setServerDictionary:](v8, "setServerDictionary:", v7);
  }

  return v8;
}

- (id)_initWithAccount:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "aa_altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICQDaemonPersisted _initWithAccountAltDSID:error:](self, "_initWithAccountAltDSID:error:", v7, v6);

  return v8;
}

- (id)_initWithAccountAltDSID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  ICQDaemonPersisted *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICQDaemonPersisted;
  v8 = -[ICQDaemonPersisted init](&v20, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQDaemonPersisted setRetrievalDate:](v8, "setRetrievalDate:", v9);

    objc_msgSend((id)objc_opt_class(), "defaultCallbackInterval");
    -[ICQDaemonPersisted setCallbackInterval:](v8, "setCallbackInterval:");
    -[ICQDaemonPersisted setAccountAltDSID:](v8, "setAccountAltDSID:", v6);
    objc_msgSend((id)objc_opt_class(), "_placeholderPersistenceDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQDaemonPersisted setServerDictionary:](v8, "setServerDictionary:", v10);

    -[ICQDaemonPersisted setFailedToFetchFromServer:](v8, "setFailedToFetchFromServer:", 1);
    if (v7)
    {
      v21[0] = CFSTR("ErrorDomain");
      objc_msgSend(v7, "domain");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = (const __CFString *)v11;
      else
        v13 = &stru_1E8B3C468;
      v22[0] = v13;
      v21[1] = CFSTR("ErrorCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "code"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v14;
      v21[2] = CFSTR("ErrorDescription");
      objc_msgSend(v7, "localizedDescription");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (const __CFString *)v15;
      else
        v17 = &stru_1E8B3C468;
      v22[2] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQDaemonPersisted setFailureDetails:](v8, "setFailureDetails:", v18);

    }
  }

  return v8;
}

+ (NSMutableDictionary)_mutablePlaceholderPersistanceDictionary
{
  return (NSMutableDictionary *)(id)objc_msgSend(&unk_1E8B53F68, "mutableCopy");
}

- (double)_callbackIntervalFromServerObject:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultCallbackInterval");
  v5 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    if (fabs(v6) != INFINITY)
    {
      objc_msgSend(v3, "doubleValue");
      v5 = 3600.0;
      if (v7 >= 3600.0)
      {
        v5 = v7;
        if (v7 > 2592000.0)
          v5 = 2592000.0;
      }
    }
  }

  return v5;
}

- (NSNumber)_cachedQuotaAvailable
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[ICQDaemonPersisted serverDictionary](self, "serverDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("quotaInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("totalAvailable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    v4 = (void *)v5;
  }
  return (NSNumber *)v4;
}

- (void)setRetrievalDate:(id)a3
{
  objc_storeStrong((id *)&self->_retrievalDate, a3);
}

- (void)setCallbackInterval:(double)a3
{
  self->_callbackInterval = a3;
}

- (void)setAccountAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setServerDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_serverDictionary, a3);
}

- (void)setFailedToFetchFromServer:(BOOL)a3
{
  self->_failedToFetchFromServer = a3;
}

- (void)setFailureDetails:(id)a3
{
  objc_storeStrong((id *)&self->_failureDetails, a3);
}

+ (NSDictionary)_placeholderPersistenceDictionary
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_mutablePlaceholderPersistanceDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (void)initWithDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_DEBUG, "bad server dict %@", (uint8_t *)&v2, 0xCu);
}

@end
