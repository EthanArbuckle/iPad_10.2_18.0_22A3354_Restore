@implementation TILaunchServicesLookup

- (TILaunchServicesLookup)init
{
  TILaunchServicesLookup *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TILaunchServicesLookup;
  v2 = -[TILaunchServicesLookup init](&v5, sel_init);
  if (v2)
  {
    +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addActivityObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeActivityObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TILaunchServicesLookup;
  -[TILaunchServicesLookup dealloc](&v4, sel_dealloc);
}

- (id)tryCache
{
  TILaunchServicesLookup *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  -[TILaunchServicesLookup cache](v2, "cache");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[TILaunchServicesLookup lastCacheUpdate](v2, "lastCacheUpdate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILaunchServicesLookup lastCacheUpdate](v2, "lastCacheUpdate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", 1200.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "earlierDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v6)
    {
      -[TILaunchServicesLookup cache](v2, "cache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  objc_sync_exit(v2);

  return v10;
}

- (void)cacheNames:(id)a3
{
  id v4;
  void *v5;
  TILaunchServicesLookup *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  -[TILaunchServicesLookup setCache:](obj, "setCache:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILaunchServicesLookup setLastCacheUpdate:](obj, "setLastCacheUpdate:", v5);

  objc_sync_exit(obj);
}

- (void)resetCache
{
  TILaunchServicesLookup *obj;

  obj = self;
  objc_sync_enter(obj);
  -[TILaunchServicesLookup setCache:](obj, "setCache:", 0);
  -[TILaunchServicesLookup setLastCacheUpdate:](obj, "setLastCacheUpdate:", 0);
  objc_sync_exit(obj);

}

- (id)appNames
{
  void *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[TILaunchServicesLookup tryCache](self, "tryCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[TILaunchServicesLookup appNames]";
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  Requesting installed app names from LaunchServices.", (uint8_t *)&v6, 0xCu);
    }
    +[TILaunchServicesLookup lookupAppNames](TILaunchServicesLookup, "lookupAppNames");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILaunchServicesLookup cacheNames:](self, "cacheNames:", v3);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(v3, "count");
    v6 = 136315394;
    v7 = "-[TILaunchServicesLookup appNames]";
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s  Got installed app names (count = %lu).", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (void)enumerateAppNames:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  if (v4)
  {
    -[TILaunchServicesLookup appNames](self, "appNames");
    v14 = 0;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
        if (v14)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4
{
  if (a3 == 3)
    -[TILaunchServicesLookup resetCache](self, "resetCache", 3, a4);
}

- (NSArray)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSDate)lastCacheUpdate
{
  return self->_lastCacheUpdate;
}

- (void)setLastCacheUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastCacheUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCacheUpdate, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8232 != -1)
    dispatch_once(&sharedInstance_onceToken_8232, &__block_literal_global_8233);
  return (id)sharedInstance_instance_8234;
}

+ (void)enumerateInstalledApplicationNames:(id)a3
{
  id v3;
  id v4;

  if (!__disableForTesting)
  {
    v3 = a3;
    +[TILaunchServicesLookup sharedInstance](TILaunchServicesLookup, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumerateAppNames:", v3);

  }
}

+ (id)lookupAppNames
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (void *)getLSApplicationWorkspaceClass_softClass;
  v15 = getLSApplicationWorkspaceClass_softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getLSApplicationWorkspaceClass_block_invoke;
    v11[3] = &unk_1EA107058;
    v11[4] = &v12;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v5, "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __40__TILaunchServicesLookup_lookupAppNames__block_invoke;
  v9[3] = &unk_1EA0FFF50;
  v7 = v2;
  v10 = v7;
  objc_msgSend(v6, "enumerateBundlesOfType:block:", 1, v9);

  return v7;
}

+ (id)genreIDsForApplicationIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (__disableForTesting)
  {
    v4 = 0;
  }
  else
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v5 = (void *)getLSApplicationProxyClass_softClass_8199;
    v39 = getLSApplicationProxyClass_softClass_8199;
    if (!getLSApplicationProxyClass_softClass_8199)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __getLSApplicationProxyClass_block_invoke_8200;
      v35[3] = &unk_1EA107058;
      v35[4] = &v36;
      __getLSApplicationProxyClass_block_invoke_8200((uint64_t)v35);
      v5 = (void *)v37[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v36, 8);
    objc_msgSend(v6, "applicationProxyForIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleContainerURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("subgenres"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v11;
      v28 = v10;
      v29 = v7;
      v30 = v3;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v19, "objectForKey:", CFSTR("genreId"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "integerValue") < 7001)
              {
                v21 = v13;
                v22 = v20;
              }
              else
              {
                v21 = v13;
                v22 = &unk_1EA140480;
              }
              objc_msgSend(v21, "addObject:", v22);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v16);
      }

      v7 = v29;
      v3 = v30;
      v11 = v27;
      v10 = v28;
    }
    objc_msgSend(v11, "objectForKey:", CFSTR("genreId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "integerValue") < 7001)
    {
      v25 = v13;
      v24 = v23;
    }
    else
    {
      v24 = &unk_1EA140480;
      v25 = v13;
    }
    objc_msgSend(v25, "addObject:", v24);
    if (objc_msgSend(v13, "count"))
      v4 = v13;
    else
      v4 = 0;

  }
  return v4;
}

void __40__TILaunchServicesLookup_lookupAppNames__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 0x12C)
  {
    v5 = v12;
    objc_msgSend(v5, "applicationType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Internal")) & 1) == 0)
    {
      objc_msgSend(v5, "applicationType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Hidden")) & 1) != 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v5, "appTags");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "containsObject:", CFSTR("hidden")))
      {

        goto LABEL_7;
      }
      objc_msgSend(v5, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.webapp1"));

      if ((v10 & 1) != 0)
        goto LABEL_9;
      objc_msgSend(v5, "objectForInfoDictionaryKey:ofClass:", CFSTR("SBIconVisibilityDefaultVisible"), objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      if (!v11 || objc_msgSend(v11, "BOOLValue"))
      {
        objc_msgSend(v5, "localizedName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
        goto LABEL_7;
      }
    }
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  *a3 = 1;
LABEL_10:

}

void __40__TILaunchServicesLookup_sharedInstance__block_invoke()
{
  TILaunchServicesLookup *v0;
  void *v1;

  v0 = objc_alloc_init(TILaunchServicesLookup);
  v1 = (void *)sharedInstance_instance_8234;
  sharedInstance_instance_8234 = (uint64_t)v0;

}

+ (void)disableForTesting:(BOOL)a3
{
  __disableForTesting = a3;
}

@end
