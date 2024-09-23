@implementation UAUserActivityProxy

- (UAUserActivityProxy)initWithUUID:(id)a3 activityType:(id)a4 dynamicActivityType:(id)a5 bundleID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  UAUserActivityProxy *v15;
  UAUserActivityProxy *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UAUserActivityProxy;
  v15 = -[UAUserActivityProxy init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_activityType, a4);
    objc_storeStrong((id *)&v16->_dynamicActivityType, a5);
    objc_storeStrong((id *)&v16->_bundleIdentifier, a6);
  }
  _uaGetLogForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544131;
    v21 = v11;
    v22 = 2113;
    v23 = v12;
    v24 = 2113;
    v25 = v13;
    v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_1AF7EB000, v17, OS_LOG_TYPE_DEBUG, "UAUserActivityProxy:initWithUUID %{public}@ type:%{private}@/%{private}@ bundleIdentifier:%{public}@", buf, 0x2Au);
  }

  return v16;
}

- (UAUserActivityProxy)initWithUUID:(id)a3 activityType:(id)a4 bundleID:(id)a5
{
  return -[UAUserActivityProxy initWithUUID:activityType:dynamicActivityType:bundleID:](self, "initWithUUID:activityType:dynamicActivityType:bundleID:", a3, a4, 0, a5);
}

- (UAUserActivityProxy)initWithActivity:(id)a3 bundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UAUserActivityProxy *v12;
  uint64_t v13;
  NSString *activityType;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_internalUserActivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dynamicIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UAUserActivityProxy initWithUUID:activityType:dynamicActivityType:bundleID:](self, "initWithUUID:activityType:dynamicActivityType:bundleID:", v8, v9, v11, v7);

  if (v12)
  {
    -[UAUserActivityProxy setInternalActivity:](v12, "setInternalActivity:", v6);
    objc_msgSend(v6, "activityType");
    v13 = objc_claimAutoreleasedReturnValue();
    activityType = v12->_activityType;
    v12->_activityType = (NSString *)v13;

    objc_storeStrong((id *)&v12->_bundleIdentifier, a4);
    v12->_isRemoteActivity = 0;
    -[UAUserActivityProxy internalActivity](v12, "internalActivity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_internalUserActivity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:", 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend(v17, "_createUserActivityStrings:secondaryString:optionalData:", v18, v19, v20);

  }
  return v12;
}

- (UAUserActivityProxy)initWithSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UAUserActivityProxy *v9;
  uint64_t v10;
  NSString *activityType;
  uint64_t v12;
  NSString *bundleIdentifier;

  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dynamicIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UAUserActivityProxy initWithUUID:activityType:dynamicActivityType:bundleID:](self, "initWithUUID:activityType:dynamicActivityType:bundleID:", v5, v6, v7, v8);

  if (v9)
  {
    -[UAUserActivityProxy setSuggestedActivity:](v9, "setSuggestedActivity:", v4);
    objc_msgSend(v4, "activityType");
    v10 = objc_claimAutoreleasedReturnValue();
    activityType = v9->_activityType;
    v9->_activityType = (NSString *)v10;

    objc_msgSend(v4, "bundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v12;

    v9->_isRemoteActivity = 1;
  }

  return v9;
}

- (void)accessActivity:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, void *, _QWORD);
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[UAUserActivityProxy isRemoteActivity](self, "isRemoteActivity");
    v7 = CFSTR("Activity");
    if (v6)
      v7 = CFSTR("Suggesion");
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_INFO, "[PROXY] Accessing activity proxy: %@", buf, 0xCu);
  }

  -[UAUserActivityProxy internalActivity](self, "internalActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UAUserActivityProxy internalActivity](self, "internalActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9, 0);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[UAUserActivityProxy suggestedActivity](self, "suggestedActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38__UAUserActivityProxy_accessActivity___block_invoke;
    v12[3] = &unk_1E60071F8;
    objc_copyWeak(&v14, (id *)buf);
    v13 = v4;
    +[UAUserActivity fetchUserActivityWithUUID:completionHandler:](UAUserActivity, "fetchUserActivityWithUUID:completionHandler:", v11, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

void __38__UAUserActivityProxy_accessActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  _uaGetLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1AF7EB000, v7, OS_LOG_TYPE_INFO, "[PROXY] Finished fetching activity", v12, 2u);
  }

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithInternalUserActivity:", v5);
    objc_msgSend(WeakRetained, "setInternalActivity:", v9);

    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "internalActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)launchActivityWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, UABestAppSuggestionManager *);
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  UABestAppSuggestionManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  __CFString *v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, UABestAppSuggestionManager *))a4;
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (-[UAUserActivityProxy isRemoteActivity](self, "isRemoteActivity"))
      v9 = CFSTR("Suggesion");
    else
      v9 = CFSTR("Activity");
    -[UAUserActivityProxy activityType](self, "activityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityProxy bundleIdentifier](self, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412803;
    v34 = v9;
    v35 = 2113;
    v36 = v10;
    v37 = 2113;
    v38 = v11;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_INFO, "[PROXY] Launching activity proxy: %@, at: %{private}@, id: %{private}@", buf, 0x20u);

  }
  v12 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[UAUserActivityProxy bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v14 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:allowPlaceholder:error:", v13, 0, &v30);
  v15 = (__CFString *)v30;

  if (v15 || !v14)
  {
    if (v15)
    {
      v31 = *MEMORY[0x1E0CB3388];
      v32 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v22 = (UABestAppSuggestionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -134, v21);
    _uaGetLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v15;
      _os_log_impl(&dword_1AF7EB000, v23, OS_LOG_TYPE_ERROR, "[PROXY] Application lookup failed: %@", buf, 0xCu);
    }

    v7[2](v7, 0, v22);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.coreservices.useractivity.interactiontype"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("com.apple.coreservices.useractivity.interactiontype"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "unsignedIntegerValue");

      objc_msgSend(v17, "removeObjectForKey:", CFSTR("com.apple.coreservices.useractivity.interactiontype"));
      v20 = objc_msgSend(v17, "copy");

      v6 = (id)v20;
    }
    else
    {
      v19 = 805306368;
    }
    v21 = objc_alloc_init(MEMORY[0x1E0CA5938]);
    objc_msgSend(v21, "setFrontBoardOptions:", v6);
    -[UAUserActivityProxy internalActivity](self, "internalActivity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v22 = (UABestAppSuggestionManager *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[UAUserActivityProxy internalActivity](self, "internalActivity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UABestAppSuggestionManager openUserActivity:usingApplicationRecord:configuration:completionHandler:](v22, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v25, v14, v21, v7);
    }
    else
    {
      -[UAUserActivityProxy suggestedActivity](self, "suggestedActivity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uniqueIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivityProxy activityType](self, "activityType");
      v29 = v19;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UABestAppSuggestionManager openUserActivityWithUUID:activityType:usingApplicationRecord:configuration:completionHandler:](v22, "openUserActivityWithUUID:activityType:usingApplicationRecord:configuration:completionHandler:", v27, v28, v14, v21, v7);

      v22 = objc_alloc_init(UABestAppSuggestionManager);
      -[UAUserActivityProxy suggestedActivity](self, "suggestedActivity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UABestAppSuggestionManager bestAppSuggestionWasLaunched:withInteractionType:](v22, "bestAppSuggestionWasLaunched:withInteractionType:", v25, v29);
    }

  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[UAUserActivityProxy uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)activityIfAvailible
{
  void *v3;
  void *v4;

  -[UAUserActivityProxy internalActivity](self, "internalActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UAUserActivityProxy internalActivity](self, "internalActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)activityTitle
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[UAUserActivityProxy internalActivity](self, "internalActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UAUserActivityProxy internalActivity](self, "internalActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E60084E8;
  }
  return v5;
}

- (id)activitySubTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  -[UAUserActivityProxy internalActivity](self, "internalActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UAUserActivityProxy internalActivity](self, "internalActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_internalUserActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentAttributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentDescription");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E60084E8;
  }
  return v7;
}

- (id)contentAttributeSet
{
  void *v3;
  void *v4;
  void *v5;

  -[UAUserActivityProxy internalActivity](self, "internalActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UAUserActivityProxy internalActivity](self, "internalActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentAttributeSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UAUserActivityProxy uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityProxy activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityProxy dynamicActivityType](self, "dynamicActivityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityProxy bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UAUserActivityProxy(%@ %@/%@ %@)"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[UAUserActivityProxy uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("uuid"));

  -[UAUserActivityProxy activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("ProxiedActivityType"));

  -[UAUserActivityProxy bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("ProxiedBundleID"));

  objc_msgSend(v11, "encodeBool:forKey:", -[UAUserActivityProxy isRemoteActivity](self, "isRemoteActivity"), CFSTR("ProxiedActivityIsRemote"));
  if (-[UAUserActivityProxy isRemoteActivity](self, "isRemoteActivity"))
  {
    -[UAUserActivityProxy suggestedActivity](self, "suggestedActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("ProxiedSuggestion");
  }
  else
  {
    -[UAUserActivityProxy internalActivity](self, "internalActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_internalUserActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callWillSaveDelegateIfDirtyAndPackageUpData:clearDirty:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = CFSTR("ProxiedActivityInfo");
  }
  objc_msgSend(v11, "encodeObject:forKey:", v7, v8);

}

- (UAUserActivityProxy)initWithCoder:(id)a3
{
  id v4;
  UAUserActivityProxy *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSString *activityType;
  uint64_t v10;
  NSString *bundleIdentifier;
  uint64_t v12;
  void *suggestedActivity;
  UAUserActivity *v14;
  void *v15;
  UAUserActivity *v16;
  uint64_t v17;
  NSUserActivity *internalActivity;
  id v19;
  id v20;
  id v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)UAUserActivityProxy;
  v5 = -[UAUserActivityProxy init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxiedActivityType"));
    v8 = objc_claimAutoreleasedReturnValue();
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxiedBundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    v5->_isRemoteActivity = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ProxiedActivityIsRemote"));
    if (-[UAUserActivityProxy isRemoteActivity](v5, "isRemoteActivity"))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxiedSuggestion"));
      v12 = objc_claimAutoreleasedReturnValue();
      suggestedActivity = v5->_suggestedActivity;
      v5->_suggestedActivity = (UABestAppSuggestion *)v12;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxiedActivityInfo"));
      suggestedActivity = (void *)objc_claimAutoreleasedReturnValue();
      v14 = [UAUserActivity alloc];
      +[UAUserActivityManager defaultManager](UAUserActivityManager, "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[UAUserActivity initWithManager:userActivityInfo:](v14, "initWithManager:userActivityInfo:", v15, suggestedActivity);

      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithInternalUserActivity:", v16);
      internalActivity = v5->_internalActivity;
      v5->_internalActivity = (NSUserActivity *)v17;

      v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v20 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v21 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      objc_msgSend(suggestedActivity, "_createUserActivityStrings:secondaryString:optionalData:", v19, v20, v21);

    }
  }

  return v5;
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)dynamicActivityType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)isRemoteActivity
{
  return self->_isRemoteActivity;
}

- (NSUserActivity)internalActivity
{
  return (NSUserActivity *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternalActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UABestAppSuggestion)suggestedActivity
{
  return (UABestAppSuggestion *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSuggestedActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedActivity, 0);
  objc_storeStrong((id *)&self->_internalActivity, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicActivityType, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
