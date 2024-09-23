@implementation PLDefaults

+ (BOOL)debugEnabled
{
  void *v2;
  char v3;

  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "debugEnabled");

  return v3;
}

+ (id)sharedDefaults
{
  if (sharedDefaults_onceSharedDefaults != -1)
    dispatch_once(&sharedDefaults_onceSharedDefaults, &__block_literal_global_22_1);
  return (id)sharedDefaults_sharedDefaults;
}

- (BOOL)debugEnabled
{
  return self->_debugEnabled;
}

+ (BOOL)fullMode
{
  return +[PLDefaults mode](PLDefaults, "mode") == 1;
}

+ (int64_t)mode
{
  int64_t v2;
  _QWORD block[4];
  __CFString *v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__PLDefaults_mode__block_invoke;
  block[3] = &unk_1E6A52050;
  v5 = CFSTR("Mode");
  if (mode_defaultOnce != -1)
    dispatch_once(&mode_defaultOnce, block);
  v2 = mode_objectForKey;

  return v2;
}

+ (BOOL)isClassDebugEnabled:(Class)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "debugEnabled");

  if (v7)
  {
    NSStringFromClass(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[PLDefaults isClassNameDebugEnabled:forKey:](PLDefaults, "isClassNameDebugEnabled:forKey:", v8, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)taskMode
{
  return +[PLDefaults mode](PLDefaults, "mode") == 2;
}

+ (void)setObject:(id)a3 forKey:(id)a4 saveToDisk:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "applicationID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:forApplicationID:saveToDisk:](PLDefaults, "setObject:forKey:forApplicationID:saveToDisk:", v8, v7, v9, v5);

}

+ (void)setObject:(id)a3 forKey:(id)a4 forApplicationID:(id)a5 saveToDisk:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:forApplicationID:saveToDisk:", v11, v10, v9, v6);

}

- (void)setObject:(id)a3 forKey:(id)a4 forApplicationID:(id)a5 saveToDisk:(BOOL)a6
{
  _BOOL4 v6;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id value;

  v6 = a6;
  value = a3;
  v10 = (__CFString *)a4;
  v11 = (__CFString *)a5;
  objc_msgSend((id)objc_opt_class(), "applicationID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", v12);

  if (v13)
  {
    objc_sync_enter(CFSTR("__instancePrefsCacheSync__"));
    -[PLDefaults instancePrefsCache](self, "instancePrefsCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (value)
      objc_msgSend(v14, "setObject:forKey:", value, v10);
    else
      objc_msgSend(v14, "removeObjectForKey:", v10);

    objc_sync_exit(CFSTR("__instancePrefsCacheSync__"));
  }
  if (v6)
  {
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("com.apple.powerlogd")))
    {
      if (CFPreferencesAppValueIsForced(v10, v11))
        PLCFPreferencesSetAppValue();
      else
        PLCFPreferencesSetValue();
      PLCFPreferencesAppSynchronize();
    }
    else
    {
      v15 = (const __CFString *)*MEMORY[0x1E0C9B250];
      CFPreferencesSetValue(v10, value, v11, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
      CFPreferencesSynchronize(v11, CFSTR("mobile"), v15);
    }
    objc_sync_enter(CFSTR("__userPrefsCacheSync__"));
    if (value)
    {
      -[PLDefaults userPrefsCache](self, "userPrefsCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", value, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDefaults userPrefsCache](self, "userPrefsCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, v10);

    }
    objc_sync_exit(CFSTR("__userPrefsCacheSync__"));
  }

}

+ (BOOL)liteMode
{
  return !+[PLDefaults mode](PLDefaults, "mode")
      || +[PLDefaults mode](PLDefaults, "mode") > 2;
}

+ (BOOL)isDevBoard
{
  char v2;
  _QWORD block[4];
  __CFString *v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__PLDefaults_isDevBoard__block_invoke;
  block[3] = &unk_1E6A52050;
  v5 = CFSTR("DevBoard");
  if (isDevBoard_defaultOnce != -1)
    dispatch_once(&isDevBoard_defaultOnce, block);
  v2 = isDevBoard_objectForKey;

  return v2;
}

+ (BOOL)BOOLForKey:(id)a3 ifNotSet:(BOOL)a4
{
  void *v5;
  void *v6;

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

+ (int64_t)longForKey:(id)a3 ifNotSet:(int64_t)a4
{
  void *v5;
  void *v6;

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "longLongValue");

  return a4;
}

+ (id)objectForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "applicationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults objectForKey:forApplicationID:synchronize:](PLDefaults, "objectForKey:forApplicationID:synchronize:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)applicationID
{
  if (applicationID_onceToken != -1)
    dispatch_once(&applicationID_onceToken, &__block_literal_global_19);
  return (id)applicationID_applicationID;
}

+ (id)objectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:forApplicationID:synchronize:", v8, v7, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)objectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  -[PLDefaults userDefaultsObjectForKey:forApplicationID:synchronize:](self, "userDefaultsObjectForKey:forApplicationID:synchronize:", v8, a4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[PLDefaults instancePrefsObjectForKey:](self, "instancePrefsObjectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)instancePrefsObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_sync_enter(CFSTR("__instancePrefsCacheSync__"));
  -[PLDefaults instancePrefsCache](self, "instancePrefsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(CFSTR("__instancePrefsCacheSync__"));
  return v6;
}

- (NSMutableDictionary)instancePrefsCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)userDefaultsObjectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = a5;
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_sync_enter(CFSTR("__userPrefsCacheSync__"));
  -[PLDefaults userPrefsCache](self, "userPrefsCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)objc_opt_new();
    -[PLDefaults userPrefsCache](self, "userPrefsCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v9);

    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v5)
  {
LABEL_5:
    -[PLDefaults userPrefsCache](self, "userPrefsCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v8);

    PLCFPreferencesAppSynchronize();
  }
LABEL_6:
  -[PLDefaults userPrefsCache](self, "userPrefsCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("com.apple.powerlogd")))
    {
      if (CFPreferencesAppValueIsForced(v8, v9))
        v20 = PLCFPreferencesCopyAppValue();
      else
        v20 = PLCFPreferencesCopyValue();
    }
    else
    {
      v20 = (uint64_t)CFPreferencesCopyValue(v8, v9, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
    }
    v21 = (void *)v20;
    if (v20)
    {
      -[PLDefaults userPrefsCache](self, "userPrefsCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDefaults userPrefsCache](self, "userPrefsCache");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v22, v8);

    }
  }
  -[PLDefaults userPrefsCache](self, "userPrefsCache");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27 == v28)
  {
    v31 = 0;
  }
  else
  {
    -[PLDefaults userPrefsCache](self, "userPrefsCache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(CFSTR("__userPrefsCacheSync__"));
  objc_autoreleasePoolPop(v10);

  return v31;
}

- (NSMutableDictionary)userPrefsCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

+ (BOOL)isClassDebugEnabled:(Class)a3
{
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "debugEnabled");

  if (!v5)
    return 0;
  NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PLDefaults isClassNameDebugEnabled:](PLDefaults, "isClassNameDebugEnabled:", v6);

  return v7;
}

void __27__PLDefaults_applicationID__block_invoke()
{
  _BOOL4 v0;
  const __CFString *v1;
  void *v2;

  v0 = +[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd");
  v1 = CFSTR("com.apple.powerlogd");
  v2 = (void *)applicationID_applicationID;
  if (v0)
    v1 = CFSTR("com.apple.powerlogHelperd");
  applicationID_applicationID = (uint64_t)v1;

}

void __28__PLDefaults_sharedDefaults__block_invoke()
{
  PLDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(PLDefaults);
  v1 = (void *)sharedDefaults_sharedDefaults;
  sharedDefaults_sharedDefaults = (uint64_t)v0;

}

+ (id)allDefaultsEnabled
{
  void *v3;
  const __CFString *v4;
  CFArrayRef v5;
  const __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const __CFString *)objc_msgSend((id)objc_opt_class(), "applicationID");
  v5 = CFPreferencesCopyKeyList(v4, (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKey:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v3;
}

+ (BOOL)objectExistsForKey:(id)a3
{
  void *v3;
  BOOL v4;

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)objectForKey:(id)a3 ifNotSet:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a1, "objectForKey:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

+ (id)objectForKey:(id)a3 synchronize:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "applicationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults objectForKey:forApplicationID:synchronize:](PLDefaults, "objectForKey:forApplicationID:synchronize:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", a3, a4, 0);
}

+ (void)resetUserDefaultCacheForKey:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "applicationID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[PLDefaults resetUserDefaultCacheForKey:forApplicationID:](PLDefaults, "resetUserDefaultCacheForKey:forApplicationID:", v3, v4);

}

+ (void)resetUserDefaultCacheForKey:(id)a3 forApplicationID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetUserDefaultCacheForKey:forApplicationID:", v6, v5);

}

+ (BOOL)fullModeForClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_FullMode"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v9 = objc_msgSend(a1, "fullMode");
  }

  return v9;
}

+ (int)liveModeQuery
{
  void *v2;
  void *v3;
  int v4;

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", CFSTR("Mode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "intValue");
  }
  else
  {
    if (!+[PLPlatform isWatch](PLPlatform, "isWatch"))
      +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", &unk_1E6ABAD48, CFSTR("Mode"), 1);
    v4 = 0;
  }

  return v4;
}

+ (BOOL)oldFullMode
{
  char v2;
  _QWORD block[4];
  __CFString *v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__PLDefaults_oldFullMode__block_invoke;
  block[3] = &unk_1E6A52050;
  v5 = CFSTR("FullMode");
  if (oldFullMode_defaultOnce != -1)
    dispatch_once(&oldFullMode_defaultOnce, block);
  v2 = oldFullMode_objectForKey;

  return v2;
}

BOOL __25__PLDefaults_oldFullMode__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults BOOLForKey:](PLDefaults, "BOOLForKey:", *(_QWORD *)(a1 + 32));
  oldFullMode_objectForKey = result;
  return result;
}

int64_t __18__PLDefaults_mode__block_invoke(uint64_t a1)
{
  int64_t result;

  result = +[PLDefaults longForKey:](PLDefaults, "longForKey:", *(_QWORD *)(a1 + 32));
  mode_objectForKey = result;
  return result;
}

BOOL __24__PLDefaults_isDevBoard__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults BOOLForKey:](PLDefaults, "BOOLForKey:", *(_QWORD *)(a1 + 32));
  isDevBoard_objectForKey = result;
  return result;
}

+ (BOOL)isModelingDebugEnabled
{
  int v2;
  _QWORD block[4];
  __CFString *v5;

  if (+[PLDefaults isDevBoard](PLDefaults, "isDevBoard"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PLDefaults_isModelingDebugEnabled__block_invoke;
    block[3] = &unk_1E6A52050;
    v5 = CFSTR("ModelingDebugEnabled");
    if (isModelingDebugEnabled_defaultOnce != -1)
      dispatch_once(&isModelingDebugEnabled_defaultOnce, block);
    v2 = isModelingDebugEnabled_objectForKey;

    isModelingDebugEnabled__modelingDebugEnabled = v2;
  }
  else
  {
    v2 = isModelingDebugEnabled__modelingDebugEnabled;
  }
  return v2 != 0;
}

BOOL __36__PLDefaults_isModelingDebugEnabled__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults BOOLForKey:](PLDefaults, "BOOLForKey:", *(_QWORD *)(a1 + 32));
  isModelingDebugEnabled_objectForKey = result;
  return result;
}

+ (BOOL)isModelTrigger
{
  char v2;
  _QWORD block[4];
  __CFString *v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PLDefaults_isModelTrigger__block_invoke;
  block[3] = &unk_1E6A52050;
  v5 = CFSTR("ModelTrigger");
  if (isModelTrigger_defaultOnce != -1)
    dispatch_once(&isModelTrigger_defaultOnce, block);
  v2 = isModelTrigger_objectForKey;

  return v2;
}

BOOL __28__PLDefaults_isModelTrigger__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults BOOLForKey:](PLDefaults, "BOOLForKey:", *(_QWORD *)(a1 + 32));
  isModelTrigger_objectForKey = result;
  return result;
}

+ (BOOL)BOOLForKey:(id)a3
{
  return +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", a3, 0);
}

+ (double)doubleForKey:(id)a3
{
  double result;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", a3, 0.0);
  return result;
}

+ (double)doubleForKey:(id)a3 ifNotSet:(double)a4
{
  void *v5;
  void *v6;
  double v7;

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    a4 = v7;
  }

  return a4;
}

+ (int64_t)longForKey:(id)a3
{
  return +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", a3, 0);
}

+ (BOOL)fullPLLog
{
  int v2;

  v2 = objc_msgSend(a1, "debugEnabled");
  if (v2)
    LOBYTE(v2) = +[PLDefaults BOOLForKey:](PLDefaults, "BOOLForKey:", PLD_NSLogDebugKey);
  return v2;
}

+ (BOOL)isClassNameDebugEnabled:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "debugEnabled");

  if (v5)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("_Debug"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PLDefaults objectExistsForKey:](PLDefaults, "objectExistsForKey:", v6))
    {
      +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v7, "BOOLValue");

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

+ (BOOL)isClassNameDebugEnabled:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "debugEnabled");

  if (v8)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("_Debug"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PLDefaults objectExistsForKey:](PLDefaults, "objectExistsForKey:", v9)
      && (+[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v9),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "BOOLValue"),
          v10,
          (v11 & 1) != 0))
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("_%@"), v6);
      v13 = objc_claimAutoreleasedReturnValue();

      if (+[PLDefaults objectExistsForKey:](PLDefaults, "objectExistsForKey:", v13))
      {
        +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v14, "BOOLValue");

      }
      else
      {
        v12 = 0;
      }
      v9 = (void *)v13;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)setClass:(Class)a3 debugEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  NSStringFromClass(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setClassName:debugEnabled:](PLDefaults, "setClassName:debugEnabled:", v5, v4);

}

+ (void)setClass:(Class)a3 debugEnabled:(BOOL)a4 forKey:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  NSStringFromClass(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setClassName:debugEnabled:forKey:](PLDefaults, "setClassName:debugEnabled:forKey:", v8, v5, v7);

}

+ (void)setClassName:(id)a3 debugEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), a3, CFSTR("_Debug"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v5, v6);

}

+ (void)setClassName:(id)a3 debugEnabled:(BOOL)a4 forKey:(id)a5
{
  _BOOL8 v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), a3, CFSTR("_Debug"), a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v6, v7);

}

- (PLDefaults)init
{
  PLDefaults *v2;
  uint64_t v3;
  NSMutableDictionary *managedPrefsCache;
  uint64_t v5;
  NSMutableDictionary *instancePrefsCache;
  uint64_t v7;
  NSMutableDictionary *userPrefsCache;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLDefaults;
  v2 = -[PLDefaults init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    managedPrefsCache = v2->_managedPrefsCache;
    v2->_managedPrefsCache = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    instancePrefsCache = v2->_instancePrefsCache;
    v2->_instancePrefsCache = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    userPrefsCache = v2->_userPrefsCache;
    v2->_userPrefsCache = (NSMutableDictionary *)v7;

    objc_msgSend((id)objc_opt_class(), "applicationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDefaults objectForKey:forApplicationID:synchronize:](v2, "objectForKey:forApplicationID:synchronize:", CFSTR("debugEnabled"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "BOOLValue"))
    {
      v2->_debugEnabled = 1;
      NSLog(CFSTR("*** DEBUG ENABLED ***"));
    }
    else
    {
      v2->_debugEnabled = 0;
    }

  }
  return v2;
}

- (id)managedPrefsObjectForKey:(id)a3 forApplicationID:(id)a4 synchronize:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_sync_enter(CFSTR("__managedPrefsCacheSync__"));
  if (v5)
  {
    v10 = (void *)objc_opt_new();
    -[PLDefaults setManagedPrefsCache:](self, "setManagedPrefsCache:", v10);

  }
  -[PLDefaults managedPrefsCache](self, "managedPrefsCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.plist"), PLD_ManagedPreferencePath, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v13);
    -[PLDefaults managedPrefsCache](self, "managedPrefsCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v15, "setObject:forKey:", v14, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v16, v9);

    }
  }
  -[PLDefaults managedPrefsCache](self, "managedPrefsCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 == v19)
  {
    v22 = 0;
  }
  else
  {
    -[PLDefaults managedPrefsCache](self, "managedPrefsCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(CFSTR("__managedPrefsCacheSync__"));

  return v22;
}

- (void)resetUserDefaultCacheForKey:(id)a3 forApplicationID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_sync_enter(CFSTR("__userPrefsCacheSync__"));
  -[PLDefaults userPrefsCache](self, "userPrefsCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLDefaults userPrefsCache](self, "userPrefsCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

  }
  objc_sync_exit(CFSTR("__userPrefsCacheSync__"));

}

+ (BOOL)eplEnabled
{
  void *v2;
  char v3;

  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eplEnabled");

  return v3;
}

+ (BOOL)isTaskFullEPLMode
{
  return +[PLDefaults taskMode](PLDefaults, "taskMode")
      || +[PLDefaults fullMode](PLDefaults, "fullMode")
      || +[PLDefaults eplEnabled](PLDefaults, "eplEnabled");
}

+ (void)enableRestartAtEPL
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__PLDefaults_enableRestartAtEPL__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (enableRestartAtEPL_defaultOnce != -1)
      dispatch_once(&enableRestartAtEPL_defaultOnce, block);
    if (enableRestartAtEPL_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Restart requested at EPL enable\n"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLDefaults.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLDefaults enableRestartAtEPL]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 478);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnableRestartAtEPL:", 1);

}

BOOL __32__PLDefaults_enableRestartAtEPL__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  enableRestartAtEPL_classDebugEnabled = result;
  return result;
}

+ (void)registerEPLNotificationWithQueue:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD handler[5];
  int out_token;
  _QWORD block[6];

  v4 = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.da"));
  v5 = (void *)CFPreferencesCopyValue(CFSTR("HTEPL.EPLEnabled"), CFSTR("com.apple.da"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 0;
  objc_msgSend(v6, "setEplEnabled:", v7);

  v8 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (registerEPLNotificationWithQueue__defaultOnce != -1)
      dispatch_once(&registerEPLNotificationWithQueue__defaultOnce, block);
    if (registerEPLNotificationWithQueue__classDebugEnabled)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Initially, EPLEnabled %d\n"), objc_msgSend(v11, "eplEnabled"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLDefaults.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLDefaults registerEPLNotificationWithQueue:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v14, v15, 489);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v9 = MEMORY[0x1E0C809B0];
    }
  }
  out_token = 0;
  handler[0] = v9;
  handler[1] = 3221225472;
  handler[2] = __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_68;
  handler[3] = &__block_descriptor_40_e8_v12__0i8l;
  handler[4] = a1;
  v17 = notify_register_dispatch("com.apple.plde.epl_changed", &out_token, v4, handler);
  if ((_DWORD)v17)
  {
    v18 = v17;
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_75;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = objc_opt_class();
      if (registerEPLNotificationWithQueue__defaultOnce_73 != -1)
        dispatch_once(&registerEPLNotificationWithQueue__defaultOnce_73, v24);
      if (registerEPLNotificationWithQueue__classDebugEnabled_74)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notify_register_dispatch failed %d %s"), v18, "com.apple.plde.epl_changed");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLDefaults.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLDefaults registerEPLNotificationWithQueue:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v21, v22, 504);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
  }

}

BOOL __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  registerEPLNotificationWithQueue__classDebugEnabled = result;
  return result;
}

void __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_68()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t block;
  uint64_t v16;
  BOOL (*v17)(uint64_t);
  void *v18;
  uint64_t v19;

  CFPreferencesAppSynchronize(CFSTR("com.apple.da"));
  v0 = (void *)CFPreferencesCopyValue(CFSTR("HTEPL.EPLEnabled"), CFSTR("com.apple.da"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
    v2 = objc_msgSend(v0, "BOOLValue");
  else
    v2 = 0;
  objc_msgSend(v1, "setEplEnabled:", v2);

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_2;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v3;
    if (instancePrefsCacheSync_block_invoke_defaultOnce != -1)
      dispatch_once(&instancePrefsCacheSync_block_invoke_defaultOnce, &block);
    if (instancePrefsCacheSync_block_invoke_classDebugEnabled)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "eplEnabled");
      objc_msgSend(v4, "stringWithFormat:", CFSTR("EPLEnabled changed to %d\n"), v6, block, v16, v17, v18, v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLDefaults.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLDefaults registerEPLNotificationWithQueue:]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 498);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "enableRestartAtEPL") & 1) != 0)
  {
    +[PLDefaults sharedDefaults](PLDefaults, "sharedDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "eplEnabled");

    if (v14)
      +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 7);
  }
  else
  {

  }
}

BOOL __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  instancePrefsCacheSync_block_invoke_classDebugEnabled = result;
  return result;
}

BOOL __47__PLDefaults_registerEPLNotificationWithQueue___block_invoke_75(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  registerEPLNotificationWithQueue__classDebugEnabled_74 = result;
  return result;
}

- (void)setDebugEnabled:(BOOL)a3
{
  self->_debugEnabled = a3;
}

- (BOOL)eplEnabled
{
  return self->_eplEnabled;
}

- (void)setEplEnabled:(BOOL)a3
{
  self->_eplEnabled = a3;
}

- (NSMutableDictionary)managedPrefsCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManagedPrefsCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setInstancePrefsCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setUserPrefsCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)enableRestartAtEPL
{
  return self->_enableRestartAtEPL;
}

- (void)setEnableRestartAtEPL:(BOOL)a3
{
  self->_enableRestartAtEPL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrefsCache, 0);
  objc_storeStrong((id *)&self->_instancePrefsCache, 0);
  objc_storeStrong((id *)&self->_managedPrefsCache, 0);
}

@end
