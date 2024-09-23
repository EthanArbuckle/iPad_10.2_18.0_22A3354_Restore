@implementation ICURLBag

- (BOOL)isExpired
{
  NSDate *expirationDate;
  void *v3;

  expirationDate = self->_expirationDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(expirationDate) = -[NSDate compare:](expirationDate, "compare:", v3) == NSOrderedAscending;

  return (char)expirationDate;
}

- (AMSSnapshotBag)amsBag
{
  return self->_amsBag;
}

void __32__ICURLBag_dictionaryForBagKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (_NSIsNSString() && objc_msgSend(v5, "hasPrefix:", CFSTR("http")))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_urlStringFromBagStringValue:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v8);
  }

}

- (id)_urlStringFromBagStringValue:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSNumber *sourceAccountDSID;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  __int128 v28;
  void *v29;
  uint8_t buf[4];
  ICURLBag *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("{"));
  v29 = v3;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    *(_QWORD *)&v5 = 138543874;
    v28 = v5;
    v7 = v3;
    while (1)
    {
      v8 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR("}"), 0, v6 + 1, objc_msgSend(v7, "length", v28) + ~v6);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v9 = v8 - v6;
      objc_msgSend(v7, "substringWithRange:", v6 + 1, v8 - v6 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("$"));
      if (v11 == 0x7FFFFFFFFFFFFFFFLL
        || (v12 = v11,
            v13 = v11 + 1,
            v14 = objc_msgSend(v10, "rangeOfString:options:range:", CFSTR("$"), 0, v11 + 1, objc_msgSend(v10, "length") + ~v11), v14 == 0x7FFFFFFFFFFFFFFFLL))
      {

        break;
      }
      v15 = v14 - v12;
      objc_msgSend(v10, "substringWithRange:", v13, v14 - v12 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICHTTPCookieStore sharedCookieStore](ICHTTPCookieStore, "sharedCookieStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (self->_sourceAccountDSID)
        sourceAccountDSID = self->_sourceAccountDSID;
      else
        sourceAccountDSID = (NSNumber *)&unk_1E43E68B0;
      objc_msgSend(v17, "getCookieWithName:userIdentifier:", v16, sourceAccountDSID);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v28;
          v32 = self;
          v33 = 2114;
          v34 = v16;
          v35 = 2114;
          v36 = v29;
          _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find value for variable '%{public}@' in url '%{public}@'", buf, 0x20u);
        }

      }
      objc_msgSend(v20, "value");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = &stru_1E4391778;
      if (v22)
        v24 = (__CFString *)v22;
      v25 = v24;

      objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v12, v15 + 1, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v6, v9 + 1, v26);
      v3 = (id)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v3, "rangeOfString:", CFSTR("{"));
      v7 = v3;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_19;
    }
    v3 = v7;
  }
LABEL_19:

  return v3;
}

- (BOOL)isTrustedHostForURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  char v19;
  BOOL v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    v20 = 0;
    goto LABEL_25;
  }
  -[ICURLBag arrayForBagKey:](self, "arrayForBagKey:", CFSTR("trustedDomains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_NSIsNSArray())
  {
    v20 = 0;
    goto LABEL_24;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v7)
  {
    v20 = 0;
    goto LABEL_23;
  }
  v8 = v7;
  v22 = v5;
  v9 = *(_QWORD *)v24;
  v10 = CFSTR(".");
  v11 = CFSTR("*");
LABEL_5:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v9)
      objc_enumerationMutation(v6);
    v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
    if (_NSIsNSString())
      break;
LABEL_14:
    if (v8 == ++v12)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        goto LABEL_5;
      v20 = 0;
      goto LABEL_20;
    }
  }
  if (objc_msgSend(v13, "hasPrefix:", v10) && (objc_msgSend(v4, "hasSuffix:", v13) & 1) != 0)
  {
LABEL_19:
    v20 = 1;
LABEL_20:
    v5 = v22;
    goto LABEL_23;
  }
  if (!objc_msgSend(v13, "hasPrefix:", v11))
    goto LABEL_13;
  objc_msgSend(v13, "substringFromIndex:", 1);
  v14 = v9;
  v15 = v6;
  v16 = v10;
  v17 = v11;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v4, "hasSuffix:", v18);

  v11 = v17;
  v10 = v16;
  v6 = v15;
  v9 = v14;
  if ((v19 & 1) == 0)
  {
LABEL_13:
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", v13))
      goto LABEL_19;
    goto LABEL_14;
  }
  v5 = v22;
  v20 = 1;
LABEL_23:

LABEL_24:
LABEL_25:

  return v20;
}

- (BOOL)shouldAppendMachineDataHeadersForURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  void *v13;
  char v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICURLBag arrayForBagKey:](self, "arrayForBagKey:", CFSTR("amd-domains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v16 = v5;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (_NSIsNSString())
          {
            if (objc_msgSend(v11, "hasPrefix:", CFSTR(".")))
            {
              if ((objc_msgSend(v4, "hasSuffix:", v11) & 1) != 0)
                goto LABEL_19;
            }
            else if (objc_msgSend(v11, "hasPrefix:", CFSTR("*")))
            {
              v12 = 1;
              objc_msgSend(v11, "substringFromIndex:", 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v4, "hasSuffix:", v13);

              if ((v14 & 1) != 0)
                goto LABEL_20;
            }
            else if (!objc_msgSend(v11, "caseInsensitiveCompare:", v4))
            {
LABEL_19:
              v12 = 1;
              goto LABEL_20;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
      v12 = 0;
LABEL_20:
      v5 = v16;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_initWithPropertyListRepresentation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  ICURLBag *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ic_dictionaryValueForKey:", CFSTR("bag_dictionary"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_numberValueForKey:", CFSTR("request_time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_numberValueForKey:", CFSTR("expiration_time"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("server_correlation_key"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("server_environment"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("profile_name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("profile_version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_numberValueForKey:", CFSTR("aource_account_dsid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_dataValueForKey:", CFSTR("ams_bag_data"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC38]), "initWithData:", v14);
  if (!v15)
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = self;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create ams bag from data", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  v18 = -[ICURLBag _initWithDictionary:amsBag:requestDate:expirationDate:serverCorrelationKey:serverEnvironment:profileName:profileVersion:sourceAccountDSID:](self, "_initWithDictionary:amsBag:requestDate:expirationDate:serverCorrelationKey:serverEnvironment:profileName:profileVersion:sourceAccountDSID:", v23, v15, v22, v21, v20, v19, v11, v12, v13);

  return v18;
}

- (id)_initWithDictionary:(id)a3 amsBag:(id)a4 requestDate:(id)a5 expirationDate:(id)a6 serverCorrelationKey:(id)a7 serverEnvironment:(id)a8 profileName:(id)a9 profileVersion:(id)a10 sourceAccountDSID:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ICURLBag *v25;
  uint64_t v26;
  NSDictionary *bagValues;
  uint64_t v28;
  NSDate *requestDate;
  uint64_t v30;
  NSDate *expirationDate;
  uint64_t v32;
  NSString *serverCorrelationKey;
  uint64_t v34;
  NSString *serverEnvironment;
  uint64_t v36;
  NSString *profileName;
  uint64_t v38;
  NSString *profileVersion;
  uint64_t v40;
  NSNumber *sourceAccountDSID;
  NSMutableDictionary *v42;
  NSMutableDictionary *convertedActionsCache;
  id v45;
  objc_super v46;

  v17 = a3;
  v45 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v46.receiver = self;
  v46.super_class = (Class)ICURLBag;
  v25 = -[ICURLBag init](&v46, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v17, "copy");
    bagValues = v25->_bagValues;
    v25->_bagValues = (NSDictionary *)v26;

    objc_storeStrong((id *)&v25->_amsBag, a4);
    v28 = objc_msgSend(v18, "copy");
    requestDate = v25->_requestDate;
    v25->_requestDate = (NSDate *)v28;

    v30 = objc_msgSend(v19, "copy");
    expirationDate = v25->_expirationDate;
    v25->_expirationDate = (NSDate *)v30;

    v32 = objc_msgSend(v20, "copy");
    serverCorrelationKey = v25->_serverCorrelationKey;
    v25->_serverCorrelationKey = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    serverEnvironment = v25->_serverEnvironment;
    v25->_serverEnvironment = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    profileName = v25->_profileName;
    v25->_profileName = (NSString *)v36;

    v38 = objc_msgSend(v23, "copy");
    profileVersion = v25->_profileVersion;
    v25->_profileVersion = (NSString *)v38;

    v40 = objc_msgSend(v24, "copy");
    sourceAccountDSID = v25->_sourceAccountDSID;
    v25->_sourceAccountDSID = (NSNumber *)v40;

    v25->_lock._os_unfair_lock_opaque = 0;
    v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    convertedActionsCache = v25->_convertedActionsCache;
    v25->_convertedActionsCache = v42;

  }
  return v25;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (id)numberForBagKey:(id)a3
{
  id v4;
  AMSSnapshotBag *amsBag;
  void *v6;
  void *v7;
  NSString *v8;
  NSObject *v9;
  NSObject *v10;
  NSString *profileName;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  ICURLBag *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  amsBag = self->_amsBag;
  if (amsBag)
  {
    -[AMSSnapshotBag integerForKey:](amsBag, "integerForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v6, "valueWithError:", &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)v18;

    if (v8)
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v20 = self;
        v21 = 2114;
        v22 = v4;
        v23 = 2114;
        v24 = v8;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
      }

    }
    if (v7)
      goto LABEL_10;
  }
  else
  {
    v8 = 0;
  }
  -[ICURLBag _valueForBagKey:](self, "_valueForBagKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[ICURLBag _logMissingKey:](self, "_logMissingKey:", v4);
    goto LABEL_15;
  }
LABEL_10:
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      profileName = self->_profileName;
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v20 = self;
      v21 = 2114;
      v22 = v4;
      v23 = 2114;
      v24 = profileName;
      v25 = 2114;
      v26 = v12;
      v13 = v12;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected Number)", buf, 0x2Au);

    }
    v14 = (void *)MEMORY[0x1E0D4D030];
    v15 = *MEMORY[0x1E0D4CE48];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found unexpected type for bag key '%@' in profile '%@': '%@' (expected Number)"), v4, self->_profileName, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v15, CFSTR("Bug"), CFSTR("ICURLBag"), v16, &stru_1E4391778, 0, 0);

    v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)_valueForBagKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICURLBag bagValues](self, "bagValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)bagValues
{
  return self->_bagValues;
}

- (id)arrayForBagKey:(id)a3
{
  id v4;
  AMSSnapshotBag *amsBag;
  void *v6;
  void *v7;
  NSString *v8;
  NSObject *v9;
  NSObject *v10;
  NSString *profileName;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  ICURLBag *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  amsBag = self->_amsBag;
  if (amsBag)
  {
    -[AMSSnapshotBag arrayForKey:](amsBag, "arrayForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v6, "valueWithError:", &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)v18;

    if (v8)
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v20 = self;
        v21 = 2114;
        v22 = v4;
        v23 = 2114;
        v24 = v8;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
      }

    }
    if (v7)
      goto LABEL_10;
  }
  else
  {
    v8 = 0;
  }
  -[ICURLBag _valueForBagKey:](self, "_valueForBagKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[ICURLBag _logMissingKey:](self, "_logMissingKey:", v4);
    goto LABEL_15;
  }
LABEL_10:
  if ((_NSIsNSArray() & 1) == 0)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      profileName = self->_profileName;
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v20 = self;
      v21 = 2114;
      v22 = v4;
      v23 = 2114;
      v24 = profileName;
      v25 = 2114;
      v26 = v12;
      v13 = v12;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected Array)", buf, 0x2Au);

    }
    v14 = (void *)MEMORY[0x1E0D4D030];
    v15 = *MEMORY[0x1E0D4CE48];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found unexpected type for bag key '%@' in profile '%@': '%@' (expected Array)"), v4, self->_profileName, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v15, CFSTR("Bug"), CFSTR("ICURLBag"), v16, &stru_1E4391778, 0, 0);

    v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)dictionaryForBagKey:(id)a3
{
  id v4;
  AMSSnapshotBag *amsBag;
  void *v6;
  void *v7;
  NSString *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSString *profileName;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  ICURLBag *v23;
  id v24;
  uint8_t buf[4];
  ICURLBag *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  amsBag = self->_amsBag;
  if (!amsBag)
  {
    v8 = 0;
LABEL_9:
    -[ICURLBag _valueForBagKey:](self, "_valueForBagKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[AMSSnapshotBag dictionaryForKey:](amsBag, "dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v6, "valueWithError:", &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)v24;

  if (v8)
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v26 = self;
      v27 = 2114;
      v28 = v4;
      v29 = 2114;
      v30 = v8;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
    }

  }
  if (!v7)
    goto LABEL_9;
LABEL_10:
  if (_NSIsNSDictionary())
  {
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __32__ICURLBag_dictionaryForBagKey___block_invoke;
    v21[3] = &unk_1E438FA60;
    v22 = v10;
    v23 = self;
    v11 = v10;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v21);
    v12 = objc_msgSend(v11, "copy");

    v7 = (void *)v12;
  }
  if (v7)
  {
    if ((_NSIsNSDictionary() & 1) == 0)
    {
      v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        profileName = self->_profileName;
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138544130;
        v26 = self;
        v27 = 2114;
        v28 = v4;
        v29 = 2114;
        v30 = profileName;
        v31 = 2114;
        v32 = v15;
        v16 = v15;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected Dictionary)", buf, 0x2Au);

      }
      v17 = (void *)MEMORY[0x1E0D4D030];
      v18 = *MEMORY[0x1E0D4CE48];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found unexpected type for bag key '%@' in profile '%@': '%@' (expected Dictionary)"), v4, self->_profileName, objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v18, CFSTR("Bug"), CFSTR("ICURLBag"), v19, &stru_1E4391778, 0, 0);

      v7 = 0;
    }
  }
  else
  {
    -[ICURLBag _logMissingKey:](self, "_logMissingKey:", v4);
  }

  return v7;
}

- (id)stringForBagKey:(id)a3
{
  id v4;
  AMSSnapshotBag *amsBag;
  void *v6;
  void *v7;
  NSString *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSString *profileName;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  ICURLBag *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  amsBag = self->_amsBag;
  if (!amsBag)
  {
    v8 = 0;
LABEL_9:
    -[ICURLBag _valueForBagKey:](self, "_valueForBagKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[AMSSnapshotBag stringForKey:](amsBag, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v6, "valueWithError:", &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)v19;

  if (v8)
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v21 = self;
      v22 = 2114;
      v23 = v4;
      v24 = 2114;
      v25 = v8;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
    }

  }
  if (!v7)
    goto LABEL_9;
LABEL_10:
  if (_NSIsNSString() && objc_msgSend(v7, "hasPrefix:", CFSTR("http")))
  {
    -[ICURLBag _urlStringFromBagStringValue:](self, "_urlStringFromBagStringValue:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  if (v7)
  {
    if ((_NSIsNSString() & 1) == 0)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        profileName = self->_profileName;
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138544130;
        v21 = self;
        v22 = 2114;
        v23 = v4;
        v24 = 2114;
        v25 = profileName;
        v26 = 2114;
        v27 = v13;
        v14 = v13;
        _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected String)", buf, 0x2Au);

      }
      v15 = (void *)MEMORY[0x1E0D4D030];
      v16 = *MEMORY[0x1E0D4CE48];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found unexpected type for bag key '%@' in profile '%@': '%@' (expected String)"), v4, self->_profileName, objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v16, CFSTR("Bug"), CFSTR("ICURLBag"), v17, &stru_1E4391778, 0, 0);

      v7 = 0;
    }
  }
  else
  {
    -[ICURLBag _logMissingKey:](self, "_logMissingKey:", v4);
  }

  return v7;
}

- (void)_logMissingKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *profileName;
  NSString *profileVersion;
  int v9;
  ICURLBag *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICURLBag _knownOptionalBagKeys](self, "_knownOptionalBagKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      profileName = self->_profileName;
      profileVersion = self->_profileVersion;
      v9 = 138544130;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      v13 = 2114;
      v14 = profileName;
      v15 = 2114;
      v16 = profileVersion;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Encountered missing bag key '%{public}@' in profile '%{public}@/%{public}@'", (uint8_t *)&v9, 0x2Au);
    }

  }
}

- (id)_knownOptionalBagKeys
{
  if (_knownOptionalBagKeys_sOptionalKeysOnceToken != -1)
    dispatch_once(&_knownOptionalBagKeys_sOptionalKeysOnceToken, &__block_literal_global_391);
  return (id)_knownOptionalBagKeys_sKnownOptionalBagKeys;
}

- (NSString)storefrontHeaderSuffix
{
  void *v3;

  -[ICURLBag stringForBagKey:](self, "stringForBagKey:", CFSTR("subscription-storefront-header-suffix"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ICURLBag stringForBagKey:](self, "stringForBagKey:", CFSTR("storefront-header-suffix"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)urlForBagKey:(id)a3
{
  id v4;
  AMSSnapshotBag *amsBag;
  void *v6;
  void *v7;
  NSString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSString *profileName;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  ICURLBag *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  amsBag = self->_amsBag;
  if (!amsBag)
  {
    v8 = 0;
    goto LABEL_9;
  }
  -[AMSSnapshotBag URLForKey:](amsBag, "URLForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v6, "valueWithError:", &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)v26;

  if (v8)
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v28 = self;
      v29 = 2114;
      v30 = v4;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
    }

  }
  if (!v7)
  {
LABEL_9:
    -[ICURLBag _valueForBagKey:](self, "_valueForBagKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0C99E98];
      -[ICURLBag _urlStringFromBagStringValue:](self, "_urlStringFromBagStringValue:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLWithString:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {

        goto LABEL_12;
      }
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        profileName = self->_profileName;
        *(_DWORD *)buf = 138544130;
        v28 = self;
        v29 = 2114;
        v30 = v4;
        v31 = 2114;
        v32 = profileName;
        v33 = 2114;
        v34 = v10;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create url for bag key '%{public}@' in profile '%{public}@': '%{public}@'", buf, 0x2Au);
      }

      v22 = (void *)MEMORY[0x1E0D4D030];
      v23 = *MEMORY[0x1E0D4CE48];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create url for bag key '%@' in profile '%@': '%@'"), v4, self->_profileName, v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v23, CFSTR("Bug"), CFSTR("ICURLBag"), v24, &stru_1E4391778, 0, 0);

    }
    -[ICURLBag _logMissingKey:](self, "_logMissingKey:", v4);
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = self->_profileName;
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v28 = self;
      v29 = 2114;
      v30 = v4;
      v31 = 2114;
      v32 = v14;
      v33 = 2114;
      v34 = v15;
      v16 = v15;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected URL)", buf, 0x2Au);

    }
    v17 = (void *)MEMORY[0x1E0D4D030];
    v18 = *MEMORY[0x1E0D4CE48];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found unexpected type for bag key '%@' in profile '%@': '%@' (expected URL)"), v4, self->_profileName, objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v18, CFSTR("Bug"), CFSTR("ICURLBag"), v19, &stru_1E4391778, 0, 0);

    goto LABEL_20;
  }
LABEL_21:

  return v7;
}

- (ICURLBagRadioConfiguration)radioConfiguration
{
  void *v2;
  ICURLBagRadioConfiguration *v3;

  -[ICURLBag dictionaryForBagKey:](self, "dictionaryForBagKey:", CFSTR("radio"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = -[ICURLBagRadioConfiguration initWithBagRadioDictionary:]([ICURLBagRadioConfiguration alloc], "initWithBagRadioDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

- (void)_validateGUIDURLConfigIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[ICURLBag GUIDURLRegexPatterns](self, "GUIDURLRegexPatterns");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[ICURLBag GUIDURLSchemes](self, "GUIDURLSchemes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    -[ICURLBag dictionaryForBagKey:](self, "dictionaryForBagKey:", CFSTR("guid-urls"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v6, "objectForKey:", CFSTR("regex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSArray())
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v30;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13);
              if (_NSIsNSString())
              {
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v14, 1, 0);
                if (v15)
                  objc_msgSend(v7, "addObject:", v15);

              }
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          }
          while (v11);
        }

      }
      -[ICURLBag setGUIDURLRegexPatterns:](self, "setGUIDURLRegexPatterns:", v7);
      objc_msgSend(v6, "objectForKey:", CFSTR("schemes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      if (_NSIsNSArray())
      {
        v24 = v8;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v18 = v16;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v26;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v26 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22);
              if (_NSIsNSString())
                objc_msgSend(v17, "addObject:", v23);
              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v20);
        }

        v8 = v24;
      }
      if ((objc_msgSend(v17, "containsObject:", CFSTR("https")) & 1) == 0)
        objc_msgSend(v17, "addObject:", CFSTR("https"));
      -[ICURLBag setGUIDURLSchemes:](self, "setGUIDURLSchemes:", v17);

    }
  }
}

- (BOOL)shouldAppendDeviceGUIDForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICURLBag _validateGUIDURLConfigIfNeeded](self, "_validateGUIDURLConfigIfNeeded");
  -[ICURLBag GUIDURLRegexPatterns](self, "GUIDURLRegexPatterns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

    goto LABEL_13;
  }
  -[ICURLBag GUIDURLSchemes](self, "GUIDURLSchemes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (!v8)
  {
LABEL_13:
    v16 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v4, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ICURLBag GUIDURLRegexPatterns](self, "GUIDURLRegexPatterns", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "rangeOfFirstMatchInString:options:range:", v9, 0, 0, v10) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = 1;
          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

LABEL_16:
  return v16;
}

- (NSArray)GUIDURLRegexPatterns
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_GUIDURLRegexPatterns;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSSet)GUIDURLSchemes
{
  os_unfair_lock_s *p_lock;
  NSSet *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_GUIDURLSchemes;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setGUIDURLSchemes:(id)a3
{
  NSSet *v4;
  NSSet *GUIDURLSchemes;

  v4 = (NSSet *)a3;
  os_unfair_lock_lock(&self->_lock);
  GUIDURLSchemes = self->_GUIDURLSchemes;
  self->_GUIDURLSchemes = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setGUIDURLRegexPatterns:(id)a3
{
  NSArray *v4;
  NSArray *GUIDURLRegexPatterns;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  GUIDURLRegexPatterns = self->_GUIDURLRegexPatterns;
  self->_GUIDURLRegexPatterns = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)mescalConfigurationForResponse:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  ICURLBagMescalConfiguration *v7;

  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[ICURLBag dictionaryForBagKey:](self, "dictionaryForBagKey:", CFSTR("sign-sap-response")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[ICURLBag _shouldMescalSignBodyForURL:withSignatureConfiguration:](self, "_shouldMescalSignBodyForURL:withSignatureConfiguration:", v4, v5), v5, v6))
  {
    v7 = objc_alloc_init(ICURLBagMescalConfiguration);
    -[ICURLBagMescalConfiguration setShouldSignBody:](v7, "setShouldSignBody:", 1);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)mescalConfigurationForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  int v49;
  ICURLBagMescalConfiguration *v50;
  id v51;
  id v52;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICURLBag dictionaryForBagKey:](self, "dictionaryForBagKey:", CFSTR("sign-sap-request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[ICURLBag _shouldMescalSignBodyForURL:withSignatureConfiguration:](self, "_shouldMescalSignBodyForURL:withSignatureConfiguration:", v5, v10);

  -[ICURLBag dictionaryForBagKey:](self, "dictionaryForBagKey:", CFSTR("signed-actions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v11;
  if (_NSIsNSDictionary())
  {
    v63 = v9;
    v65 = v5;
    v61 = v4;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v87;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v87 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
          if (_NSIsNSString() && objc_msgSend(v8, "rangeOfString:", v17) != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v12, "objectForKey:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSDictionary())
            {
              objc_msgSend(v19, "objectForKey:", v9);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = v65;
              if (_NSIsNSDictionary())
              {
                objc_msgSend(v20, "objectForKey:", CFSTR("fields"));
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = v20;
                v55 = v19;
                if (_NSIsNSArray())
                {
                  v84 = 0u;
                  v85 = 0u;
                  v82 = 0u;
                  v83 = 0u;
                  v21 = v59;
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
                  if (v22)
                  {
                    v23 = v22;
                    v24 = *(_QWORD *)v83;
                    do
                    {
                      for (j = 0; j != v23; ++j)
                      {
                        if (*(_QWORD *)v83 != v24)
                          objc_enumerationMutation(v21);
                        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j));
                      }
                      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
                    }
                    while (v23);
                  }

                  v9 = v63;
                  v5 = v65;
                  v20 = v54;
                  v19 = v55;
                }
                objc_msgSend(v20, "objectForKey:", CFSTR("headers"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                if (_NSIsNSArray())
                {
                  v80 = 0u;
                  v81 = 0u;
                  v78 = 0u;
                  v79 = 0u;
                  v26 = v57;
                  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
                  if (v27)
                  {
                    v28 = v27;
                    v29 = *(_QWORD *)v79;
                    do
                    {
                      for (k = 0; k != v28; ++k)
                      {
                        if (*(_QWORD *)v79 != v29)
                          objc_enumerationMutation(v26);
                        objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k));
                      }
                      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
                    }
                    while (v28);
                  }

                  v9 = v63;
                  v5 = v65;
                  v20 = v54;
                  v19 = v55;
                }
                v31 = v20;
                v32 = objc_msgSend(v20, "ic_BOOLValueForKey:", CFSTR("path"));

              }
              else
              {
                v31 = v20;
                v32 = 0;
              }

              v4 = v61;
            }
            else
            {
              v32 = 0;
              v4 = v61;
              v5 = v65;
            }

            v18 = v32 != 0;
            goto LABEL_38;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
        if (v14)
          continue;
        break;
      }
    }

    v18 = 0;
    v4 = v61;
    v5 = v65;
  }
  else
  {
    v18 = 0;
  }
LABEL_38:
  -[ICURLBag dictionaryForBagKey:](self, "dictionaryForBagKey:", CFSTR("musicCommon"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("musicMescal"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v34, "objectForKey:", CFSTR("actions"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSArray() && objc_msgSend(v35, "containsObject:", v9))
      {
        v60 = v35;
        if (v67)
        {
          v58 = 1;
        }
        else
        {
          objc_msgSend(v4, "HTTPMethod");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v37, "isEqualToString:", CFSTR("POST"));

          v35 = v60;
        }
        objc_msgSend(v34, "objectForKey:", CFSTR("fields"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v4;
        v64 = v9;
        v66 = v5;
        if (_NSIsNSArray())
        {
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v38 = v68;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v75;
            do
            {
              for (m = 0; m != v40; ++m)
              {
                if (*(_QWORD *)v75 != v41)
                  objc_enumerationMutation(v38);
                objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * m));
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
            }
            while (v40);
          }

          v4 = v62;
          v9 = v64;
          v5 = v66;
          v35 = v60;
        }
        v56 = v18;
        objc_msgSend(v34, "objectForKey:", CFSTR("headers"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSArray())
        {
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v44 = v43;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v71;
            do
            {
              for (n = 0; n != v46; ++n)
              {
                if (*(_QWORD *)v71 != v47)
                  objc_enumerationMutation(v44);
                objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * n));
              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v90, 16);
            }
            while (v46);
          }

          v4 = v62;
          v9 = v64;
          v5 = v66;
          v35 = v60;
        }

        v18 = v56;
        if ((v58 & 1) == 0)
          goto LABEL_68;
LABEL_47:
        v36 = 1;
        goto LABEL_74;
      }

    }
  }
  if (v67)
    goto LABEL_47;
LABEL_68:
  if (!objc_msgSend(v6, "count"))
  {
    v49 = objc_msgSend(v7, "count") ? 1 : v18;
    if (v49 != 1)
    {
      v50 = 0;
      goto LABEL_81;
    }
  }
  v36 = 0;
LABEL_74:
  v50 = objc_alloc_init(ICURLBagMescalConfiguration);
  -[ICURLBagMescalConfiguration setShouldSignBody:](v50, "setShouldSignBody:", v36);
  if (objc_msgSend(v6, "count"))
    v51 = v6;
  else
    v51 = 0;
  -[ICURLBagMescalConfiguration setFields:](v50, "setFields:", v51);
  if (objc_msgSend(v7, "count"))
    v52 = v7;
  else
    v52 = 0;
  -[ICURLBagMescalConfiguration setHeaders:](v50, "setHeaders:", v52);
  -[ICURLBagMescalConfiguration setShouldIncludePath:](v50, "setShouldIncludePath:", v18);
LABEL_81:

  return v50;
}

- (BOOL)_shouldMescalSignBodyForURL:(id)a3 withSignatureConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  os_unfair_lock_s *p_lock;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v33 = v7;
      v34 = v5;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v45;
        p_lock = &self->_lock;
        v37 = v10;
        v38 = v9;
        v35 = *(_QWORD *)v45;
        v36 = v11;
        while (2)
        {
          v17 = 0;
          v40 = v13;
          do
          {
            if (*(_QWORD *)v45 != v15)
              objc_enumerationMutation(v11);
            v43 = v17;
            v18 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v17);
            if (_NSIsNSString() && objc_msgSend(v9, "rangeOfString:", v18) != 0x7FFFFFFFFFFFFFFFLL)
            {
              v42 = v18;
              objc_msgSend(v11, "objectForKey:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (_NSIsNSArray())
              {
                if (objc_msgSend(v19, "containsObject:", v10))
                {

LABEL_34:
                  v8 = 1;
                  goto LABEL_35;
                }
                os_unfair_lock_lock(p_lock);
                -[NSMutableDictionary objectForKey:](self->_convertedActionsCache, "objectForKey:", v42);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v20)
                {
                  v39 = v19;
                  v21 = v19;
                  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
                  objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = 0u;
                  v49 = 0u;
                  v50 = 0u;
                  v51 = 0u;
                  v23 = v21;
                  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
                  if (v24)
                  {
                    v25 = v24;
                    v26 = *(_QWORD *)v49;
                    do
                    {
                      for (i = 0; i != v25; ++i)
                      {
                        if (*(_QWORD *)v49 != v26)
                          objc_enumerationMutation(v23);
                        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "mutableCopy", v33, v34);
                        v29 = objc_msgSend(v28, "rangeOfCharacterFromSet:options:range:", v22, 0, 0, objc_msgSend(v28, "length"));
                        if (v29 != 0x7FFFFFFFFFFFFFFFLL)
                        {
                          for (j = v29;
                                j != 0x7FFFFFFFFFFFFFFFLL;
                                j = objc_msgSend(v28, "rangeOfCharacterFromSet:options:range:", v22, 0, j + 2, objc_msgSend(v28, "length") - (j + 2)))
                          {
                            objc_msgSend(v28, "insertString:atIndex:", CFSTR("-"), j);
                          }
                        }
                        objc_msgSend(v28, "lowercaseString");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v20, "addObject:", v31);

                      }
                      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
                    }
                    while (v25);
                  }

                  -[NSMutableDictionary setObject:forKey:](self->_convertedActionsCache, "setObject:forKey:", v20, v42);
                  v10 = v37;
                  v9 = v38;
                  v15 = v35;
                  v11 = v36;
                  p_lock = &self->_lock;
                  v19 = v39;
                }
                os_unfair_lock_unlock(p_lock);
                v14 = objc_msgSend(v20, "containsObject:", v10);

                v13 = v40;
              }

              if ((v14 & 1) != 0)
                goto LABEL_34;
            }
            v17 = v43 + 1;
          }
          while (v43 + 1 != v13);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v13)
            continue;
          break;
        }
      }
      else
      {
        v14 = 0;
      }

      v8 = v14 & 1;
LABEL_35:
      v7 = v33;
      v5 = v34;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsBag, 0);
  objc_storeStrong((id *)&self->_sourceAccountDSID, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profileName, 0);
  objc_storeStrong((id *)&self->_serverEnvironment, 0);
  objc_storeStrong((id *)&self->_serverCorrelationKey, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_GUIDURLSchemes, 0);
  objc_storeStrong((id *)&self->_GUIDURLRegexPatterns, 0);
  objc_storeStrong((id *)&self->_convertedActionsCache, 0);
  objc_storeStrong((id *)&self->_bagValues, 0);
}

- (BOOL)BOOLValueForBagKey:(id)a3
{
  id v4;
  AMSSnapshotBag *amsBag;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSString *profileName;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v21;
  id v22;
  uint8_t buf[4];
  ICURLBag *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  amsBag = self->_amsBag;
  if (amsBag)
  {
    -[AMSSnapshotBag BOOLForKey:](amsBag, "BOOLForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v6, "valueWithError:", &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;

    if (v8)
    {

      -[AMSSnapshotBag stringForKey:](self->_amsBag, "stringForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v9, "valueWithError:", &v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v21;

      if (v8)
      {
        v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v24 = self;
          v25 = 2114;
          v26 = v4;
          v27 = 2114;
          v28 = (NSString *)v8;
          _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load value for bag key '%{public}@'. err=%{public}@", buf, 0x20u);
        }

      }
      if (v10)
        goto LABEL_13;
    }
    else
    {
      v10 = v7;
      if (v7)
        goto LABEL_13;
    }
  }
  else
  {
    v8 = 0;
  }
  -[ICURLBag _valueForBagKey:](self, "_valueForBagKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[ICURLBag _logMissingKey:](self, "_logMissingKey:", v4);
    goto LABEL_17;
  }
LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      profileName = self->_profileName;
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v24 = self;
      v25 = 2114;
      v26 = v4;
      v27 = 2114;
      v28 = profileName;
      v29 = 2114;
      v30 = v14;
      v15 = v14;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Found unexpected type for bag key '%{public}@' in profile '%{public}@: '%{public}@ (expected Number)", buf, 0x2Au);

    }
    v16 = (void *)MEMORY[0x1E0D4D030];
    v17 = *MEMORY[0x1E0D4CE48];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found unexpected type for bag key '%@' in profile '%@': '%@' (expected Number)"), v4, self->_profileName, objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v17, CFSTR("Bug"), CFSTR("ICURLBag"), v18, &stru_1E4391778, 0, 0);

    v10 = 0;
  }
LABEL_17:
  v19 = objc_msgSend(v10, "BOOLValue");

  return v19;
}

void __33__ICURLBag__knownOptionalBagKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("auth-can-post"), CFSTR("isExplicitContentAgeVerificationRequired"), CFSTR("ExplicitContentBadgeTreatment"), CFSTR("ios-app-url"), CFSTR("storefront-header-suffix"), CFSTR("subscription-storefront-header-suffix"), CFSTR("aps-sampling-percentage"), CFSTR("clientIDDomains"), CFSTR("ios-app-download-retry-count"), CFSTR("lyricsOnByDefaultDisabled"), CFSTR("md-domains"), CFSTR("min-artist-update-polling-frequency-secs"), CFSTR("ratingWarningThreshold"), CFSTR("ratingWarningTitle"), CFSTR("ratingWarningText"), CFSTR("TLSSamplingPercentage"), CFSTR("TLSSamplingSessionDuration"),
    CFSTR("TFOSamplingPercentage"),
    CFSTR("TFOSamplingSessionDuration"),
    CFSTR("fuseHeaderEnrichment"),
    CFSTR("fuseCarrierMccMncList"),
    CFSTR("isExplicitMusicDisallowed"),
    CFSTR("musicFriends"),
    CFSTR("enhanced-audio"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_knownOptionalBagKeys_sKnownOptionalBagKeys;
  _knownOptionalBagKeys_sKnownOptionalBagKeys = v0;

}

- (id)_initWithDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 14400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICURLBag _initWithDictionary:amsBag:requestDate:expirationDate:serverCorrelationKey:serverEnvironment:profileName:profileVersion:sourceAccountDSID:](self, "_initWithDictionary:amsBag:requestDate:expirationDate:serverCorrelationKey:serverEnvironment:profileName:profileVersion:sourceAccountDSID:", v5, 0, v6, v7, 0, 0, 0, 0, 0);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[ICURLBag bagValues](self, "bagValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bagValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    v7 = 1;
  else
    v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (id)valuesForBagKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[ICURLBag _valueForBagKey:](self, "_valueForBagKey:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (BOOL)hasValueForBagKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[ICURLBag _valueForBagKey:](self, "_valueForBagKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)int64ValueForBagKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[ICURLBag numberForBagKey:](self, "numberForBagKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (id)mescalConfigurationForRequestURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICURLBag mescalConfigurationForRequest:](self, "mescalConfigurationForRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mescalConfigurationForResponseURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C92C88];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v5, 0, 0, 0);

    -[ICURLBag mescalConfigurationForResponse:](self, "mescalConfigurationForResponse:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (ICURLBagLibraryDAAPConfiguration)libraryDAAPConfiguration
{
  void *v2;
  ICURLBagLibraryDAAPConfiguration *v3;

  -[ICURLBag dictionaryForBagKey:](self, "dictionaryForBagKey:", CFSTR("library-daap"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = -[ICURLBagLibraryDAAPConfiguration initWithBagLibraryDAAPDictionary:]([ICURLBagLibraryDAAPConfiguration alloc], "initWithBagLibraryDAAPDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

- (ICURLBagEnhancedAudioConfiguration)enhancedAudioConfiguration
{
  void *v2;
  ICURLBagEnhancedAudioConfiguration *v3;

  -[ICURLBag dictionaryForBagKey:](self, "dictionaryForBagKey:", CFSTR("enhanced-audio"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = -[ICURLBagEnhancedAudioConfiguration initWithBagEnhancedAudioDictionary:]([ICURLBagEnhancedAudioConfiguration alloc], "initWithBagEnhancedAudioDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

- (BOOL)canPostKeybagSyncData
{
  void *v2;
  void *v3;
  char v4;

  -[ICURLBag numberForBagKey:](self, "numberForBagKey:", CFSTR("auth-can-post"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)createAMSSnapshotBagWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  AMSSnapshotBag *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v5 = self->_amsBag;
  if (v5)
  {
    v6 = (uint64_t)v5;
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CFDC40]);
    -[ICURLBag bagValues](self, "bagValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setData:", v9);

    -[ICURLBag expirationDate](self, "expirationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExpirationDate:", v10);

    -[ICURLBag profileName](self, "profileName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProfile:", v11);

    -[ICURLBag profileVersion](self, "profileVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProfileVersion:", v12);

    v13 = 0;
    objc_msgSend(v8, "buildWithError:", &v13);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (uint64_t)v13;
    if (!(v6 | v7))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), 0, CFSTR("Failed to create a snapshot bag"));
      v7 = objc_claimAutoreleasedReturnValue();
    }

  }
  v4[2](v4, v6, v7);

}

- (NSDictionary)_propertyListRepresentation
{
  id v3;
  void *v4;
  NSDictionary *bagValues;
  AMSSnapshotBag *amsBag;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *serverCorrelationKey;
  NSString *serverEnvironment;
  NSString *profileName;
  NSString *profileVersion;
  NSNumber *sourceAccountDSID;
  id v21;
  uint8_t buf[4];
  ICURLBag *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  bagValues = self->_bagValues;
  if (bagValues)
    objc_msgSend(v3, "setObject:forKey:", bagValues, CFSTR("bag_dictionary"));
  amsBag = self->_amsBag;
  if (amsBag)
  {
    -[AMSSnapshotBag compile](amsBag, "compile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v7, "resultWithError:", &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;

    if (v8)
    {
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("ams_bag_data"));
    }
    else
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v23 = self;
        v24 = 2114;
        v25 = v9;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to serialize ams bag. err=%{public}@", buf, 0x16u);
      }

    }
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_requestDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("request_time"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_expirationDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("expiration_time"));

  serverCorrelationKey = self->_serverCorrelationKey;
  if (serverCorrelationKey)
    objc_msgSend(v4, "setObject:forKey:", serverCorrelationKey, CFSTR("server_correlation_key"));
  serverEnvironment = self->_serverEnvironment;
  if (serverEnvironment)
    objc_msgSend(v4, "setObject:forKey:", serverEnvironment, CFSTR("server_environment"));
  profileName = self->_profileName;
  if (profileName)
    objc_msgSend(v4, "setObject:forKey:", profileName, CFSTR("profile_name"));
  profileVersion = self->_profileVersion;
  if (profileVersion)
    objc_msgSend(v4, "setObject:forKey:", profileVersion, CFSTR("profile_version"));
  sourceAccountDSID = self->_sourceAccountDSID;
  if (sourceAccountDSID)
    objc_msgSend(v4, "setObject:forKey:", sourceAccountDSID, CFSTR("aource_account_dsid"));
  return (NSDictionary *)v4;
}

- (id)_knownIncorrectValues
{
  if (_knownIncorrectValues_sKnownIncorrectValuesOnceToken != -1)
    dispatch_once(&_knownIncorrectValues_sKnownIncorrectValuesOnceToken, &__block_literal_global_393);
  return (id)_knownIncorrectValues_sKnownIncorrectValues;
}

- (void)setBagValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)convertedActionsCache
{
  return self->_convertedActionsCache;
}

- (void)setConvertedActionsCache:(id)a3
{
  objc_storeStrong((id *)&self->_convertedActionsCache, a3);
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)_setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)serverCorrelationKey
{
  return self->_serverCorrelationKey;
}

- (NSString)serverEnvironment
{
  return self->_serverEnvironment;
}

- (NSString)profileName
{
  return self->_profileName;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (NSNumber)sourceAccountDSID
{
  return self->_sourceAccountDSID;
}

void __33__ICURLBag__knownIncorrectValues__block_invoke()
{
  void *v0;

  v0 = (void *)_knownIncorrectValues_sKnownIncorrectValues;
  _knownIncorrectValues_sKnownIncorrectValues = MEMORY[0x1E0C9AA70];

}

+ (NSArray)_allBagKeys
{
  if (_allBagKeys_sAllKnownKeysOnceToken != -1)
    dispatch_once(&_allBagKeys_sAllKnownKeysOnceToken, &__block_literal_global_30761);
  return (NSArray *)(id)_allBagKeys_sAllKnownBagKeys;
}

void __23__ICURLBag__allBagKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[134];

  v2[133] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("guid-urls");
  v2[1] = CFSTR("getMatchStatusSrv");
  v2[2] = CFSTR("isMatchServiceEnabled");
  v2[3] = CFSTR("cloud-welcome");
  v2[4] = CFSTR("amd-domains");
  v2[5] = CFSTR("sign-sap-request");
  v2[6] = CFSTR("sign-sap-response");
  v2[7] = CFSTR("signed-actions");
  v2[8] = CFSTR("musicCommon");
  v2[9] = CFSTR("sign-sap-setup-cert");
  v2[10] = CFSTR("sign-sap-setup");
  v2[11] = CFSTR("fps-cert");
  v2[12] = CFSTR("fps-request");
  v2[13] = CFSTR("subDownload");
  v2[14] = CFSTR("md-finish-provisioning");
  v2[15] = CFSTR("amd-finish-provisioning");
  v2[16] = CFSTR("md-sync-machine");
  v2[17] = CFSTR("amd-sync-machine");
  v2[18] = CFSTR("redownloadProduct");
  v2[19] = CFSTR("paidRedownloadProduct");
  v2[20] = CFSTR("auth-can-post");
  v2[21] = CFSTR("songDownloadDone");
  v2[22] = CFSTR("radio");
  v2[23] = CFSTR("storefront-header-suffix");
  v2[24] = CFSTR("musicForYou");
  v2[25] = CFSTR("browse");
  v2[26] = CFSTR("grouping");
  v2[27] = CFSTR("radioTab");
  v2[28] = CFSTR("getSubscriptionStatusSrv");
  v2[29] = CFSTR("lease-start");
  v2[30] = CFSTR("lease-renew");
  v2[31] = CFSTR("lease-stop");
  v2[32] = CFSTR("storeplatform-lookup-url");
  v2[33] = CFSTR("storeplatform-lookup-url-unpersonalized");
  v2[34] = CFSTR("delegatePlayback");
  v2[35] = CFSTR("enableSubscription");
  v2[36] = CFSTR("disableSubscrption");
  v2[37] = CFSTR("getSubscriptionStatus");
  v2[38] = CFSTR("getWholeHouseAudioPlayInfo");
  v2[39] = CFSTR("play-activity-feed-request-post-url");
  v2[40] = CFSTR("authorizeMachine");
  v2[41] = CFSTR("mobile-network-constraints");
  v2[42] = CFSTR("library-auth-service-token-url");
  v2[43] = CFSTR("musicSubscription");
  v2[44] = CFSTR("buyProduct");
  v2[45] = CFSTR("push-notification-types");
  v2[46] = CFSTR("push-notifications");
  v2[47] = CFSTR("revokeMusicToken");
  v2[48] = CFSTR("subscription-status-refresh-interval-in-seconds");
  v2[49] = CFSTR("push-notification-allowexplicit");
  v2[50] = CFSTR("library-daap");
  v2[51] = CFSTR("preference-service-sync-url");
  v2[52] = CFSTR("preference-service-scheduled-sync-period-in-minutes");
  v2[53] = CFSTR("musicFriends");
  v2[54] = CFSTR("isExplicitContentAgeVerificationRequired");
  v2[55] = CFSTR("ExplicitContentBadgeTreatment");
  v2[56] = CFSTR("korAgeVerificationUrl");
  v2[57] = CFSTR("fuseHeaderEnrichment");
  v2[58] = CFSTR("fuseHeaderEnrichmentResponse");
  v2[59] = CFSTR("createMusicToken");
  v2[60] = CFSTR("inAppMessages");
  v2[61] = CFSTR("musicConnect");
  v2[62] = CFSTR("addToSiriTagHistoryBaseUrl");
  v2[63] = CFSTR("addToTRHistoryBaseUrl");
  v2[64] = CFSTR("pmlt-url");
  v2[65] = CFSTR("addToWishlistBaseUrl");
  v2[66] = CFSTR("getShareIdentifiers");
  v2[67] = CFSTR("purchase-daap");
  v2[68] = CFSTR("p2-content-restore");
  v2[69] = CFSTR("cloud-add-computer");
  v2[70] = CFSTR("storeFrontId");
  v2[71] = CFSTR("artist-new-content");
  v2[72] = CFSTR("countryCode");
  v2[73] = CFSTR("fetchSinfs");
  v2[74] = CFSTR("fuseCarrierMccMncList");
  v2[75] = CFSTR("ampMusicAPIDomains");
  v2[76] = CFSTR("enhanced-audio");
  v2[77] = CFSTR("get-play-info");
  v2[78] = CFSTR("url-regex-map");
  v2[79] = CFSTR("ios-app-url");
  v2[80] = CFSTR("js-app-url");
  v2[81] = CFSTR("trustedDomains");
  v2[82] = CFSTR("musicTabs");
  v2[83] = CFSTR("pm-feedback-base-url");
  v2[84] = CFSTR("max-mini-sinf-batch-size");
  v2[85] = CFSTR("getSubscriptionOffersSrv");
  v2[86] = CFSTR("auto-enrollment-percentage");
  v2[87] = CFSTR("use-apple-pay-classic");
  v2[88] = CFSTR("language");
  v2[89] = CFSTR("language-tag");
  v2[90] = CFSTR("manageSubscriptionsV2Url");
  v2[91] = CFSTR("AddFundsUrl");
  v2[92] = CFSTR("modifyAccount");
  v2[93] = CFSTR("marketingItemDynamicUIUrl");
  v2[94] = CFSTR("amsui-sources");
  v2[95] = CFSTR("musicui-js-url");
  v2[96] = CFSTR("commerce-ui-urls");
  v2[97] = CFSTR("musicSubscriptionOffersForStorefront");
  v2[98] = CFSTR("commerceApp");
  v2[99] = CFSTR("commerceAppBaseUrl");
  v2[100] = CFSTR("commerceAppFallbackUrl");
  v2[101] = CFSTR("financeApp");
  v2[102] = CFSTR("marketing-item-media-api-path");
  v2[103] = CFSTR("marketing-item-media-api-realm-mappings");
  v2[104] = CFSTR("subscription-storefront-header-suffix");
  v2[105] = CFSTR("redeemCodeLanding");
  v2[106] = CFSTR("cloud-library-opt-out-url");
  v2[107] = CFSTR("absinthe-requests");
  v2[108] = CFSTR("aps-sampling-percentage");
  v2[109] = CFSTR("clientIDDomains");
  v2[110] = CFSTR("ios-app-download-retry-count");
  v2[111] = CFSTR("lyricsOnByDefaultDisabled");
  v2[112] = CFSTR("md-domains");
  v2[113] = CFSTR("min-artist-update-polling-frequency-secs");
  v2[114] = CFSTR("ratingWarningThreshold");
  v2[115] = CFSTR("ratingWarningTitle");
  v2[116] = CFSTR("ratingWarningText");
  v2[117] = CFSTR("TLSSamplingPercentage");
  v2[118] = CFSTR("TLSSamplingSessionDuration");
  v2[119] = CFSTR("TFOSamplingPercentage");
  v2[120] = CFSTR("TFOSamplingSessionDuration");
  v2[121] = CFSTR("cloud-library-update-request");
  v2[122] = CFSTR("cloud-library-update-check");
  v2[123] = CFSTR("heif-format-rollout");
  v2[124] = CFSTR("sRdnld");
  v2[125] = CFSTR("isExplicitMusicDisallowed");
  v2[126] = CFSTR("processRedirectUrl");
  v2[127] = CFSTR("getMusicSDKAuthorizationsSrv");
  v2[128] = CFSTR("metrics");
  v2[129] = CFSTR("AddFundsUrl");
  v2[130] = CFSTR("manageSubscriptionsUrl");
  v2[131] = CFSTR("appleMusicDeviceOfferDeepLink");
  v2[132] = CFSTR("revokeMusicSDKAuthorizationSrv");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 133);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_allBagKeys_sAllKnownBagKeys;
  _allBagKeys_sAllKnownBagKeys = v0;

}

@end
