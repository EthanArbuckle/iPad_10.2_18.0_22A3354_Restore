@implementation PXSettings

- (BOOL)suppressesIntrospectionOnCustomerInstalls
{
  return 1;
}

void __37__PXSettings_addDeferredKeyObserver___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addKeyObserver:", v2);

}

- (void)addKeyObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSettings;
  -[PTSettings addKeyObserver:](&v14, sel_addKeyObserver_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXSettings reparentedRootSettings](self, "reparentedRootSettings", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addKeyObserver:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (NSArray)reparentedRootSettings
{
  return self->_reparentedRootSettings;
}

- (void)addDeferredKeyObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PXSettings_addDeferredKeyObserver___block_invoke;
  v6[3] = &unk_1E5144DF8;
  objc_copyWeak(&v7, &location);
  objc_copyWeak(&v8, &from);
  objc_msgSend(v5, "scheduleMainQueueTask:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

+ (id)createSharedInstance
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!PFOSVariantHasInternalUI()
    || !PFOSVariantHasInternalDiagnostics()
    || (PLIsCamera() & 1) != 0)
  {
    v3 = 0;
LABEL_5:
    v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDefaultValues");
    goto LABEL_6;
  }
  objc_msgSend(a1, "_userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultsKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PXSettingsArchiveKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_userDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("PXSettingsOverride"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = ___ExpandOverrideDictionary_block_invoke;
  v25[3] = &unk_1E5144E20;
  v3 = v14;
  v26 = v3;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v25);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v15, "launchedToTest");

  if (!(_DWORD)v13)
  {
    v24 = 0;
    objc_msgSend(a1, "_signatureDictionaryWithDefaultSettings:", &v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v24;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PXSettingsSignatureKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PXSettingsSignatureVersionKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PXSettingsSignatureVersionKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = v20 == objc_msgSend(v21, "integerValue");

    if ((v20 & 1) != 0)
    {
      if (v11)
      {
        objc_msgSend(a1, "settingsFromArchiveDictionary:", v11);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PXSettingsSignatureDefaultValuesKey"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PXSettingsSignatureDefaultValuesKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_resetValuesThatChangedBetweenCurrentDefaultValues:andArchivedDefaultValues:defaultSettings:", v22, v23, v17);

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {

      v11 = 0;
    }
    v4 = 0;
    goto LABEL_17;
  }
  if (!v11)
  {

    goto LABEL_5;
  }
  objc_msgSend(a1, "settingsFromArchiveDictionary:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  if (!v4)
    goto LABEL_5;
LABEL_6:
  if (v3)
  {
    objc_msgSend(a1, "_defaultsKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_setOverrideValuesFromDictionary:", v6);
  }

  return v4;
}

- (PXSettings)parentSettings
{
  return 0;
}

- (BOOL)isTransientKey:(id)a3
{
  id v4;
  NSSet *cachedTransientProperties;
  NSSet *v6;
  NSSet *v7;
  char v8;

  v4 = a3;
  cachedTransientProperties = self->_cachedTransientProperties;
  if (!cachedTransientProperties)
  {
    objc_msgSend((id)objc_opt_class(), "transientProperties");
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedTransientProperties;
    self->_cachedTransientProperties = v6;

    cachedTransientProperties = self->_cachedTransientProperties;
  }
  if (-[NSSet containsObject:](cachedTransientProperties, "containsObject:", v4))
    v8 = 1;
  else
    v8 = objc_msgSend(v4, "hasPrefix:", CFSTR("_internal_"));

  return v8;
}

- (BOOL)isTransientKeyPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("."), 2);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = -[PXSettings isTransientKey:](self, "isTransientKey:", v4);
  }
  else
  {
    v8 = v5;
    v9 = v6;
    objc_msgSend(v4, "substringToIndex:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSettings valueForKey:](self, "valueForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v4, "substringFromIndex:", v8 + v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "isTransientKeyPath:", v13);

  }
  return v7;
}

- (void)_resetValuesThatChangedBetweenCurrentDefaultValues:(id)a3 andArchivedDefaultValues:(id)a4 defaultSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __106__PXSettings__resetValuesThatChangedBetweenCurrentDefaultValues_andArchivedDefaultValues_defaultSettings___block_invoke;
  v24[3] = &unk_1E5144DA8;
  v24[4] = self;
  v12 = v9;
  v25 = v12;
  v13 = v10;
  v26 = v13;
  v14 = v11;
  v27 = v14;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v24);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[PXSettings defaultValueDidChangeForKey:](self, "defaultValueDidChangeForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (BOOL)hasUserDefaultsOverrides
{
  _BOOL4 hasUserDefaultsOverrides;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  hasUserDefaultsOverrides = self->_hasUserDefaultsOverrides;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXSettings reparentedRootSettings](self, "reparentedRootSettings", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  v5 = hasUserDefaultsOverrides;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        if ((v5 & 1) != 0)
          v5 = 1;
        else
          v5 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasUserDefaultsOverrides");
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v5;
}

- (BOOL)_setOverrideValuesFromDictionary:(id)a3
{
  id v4;
  uint64_t *v5;
  BOOL v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PXSettings__setOverrideValuesFromDictionary___block_invoke;
  v9[3] = &unk_1E5144DD0;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  v5 = v11;
  v6 = self->_hasUserDefaultsOverrides || *((_BYTE *)v11 + 24) != 0;
  self->_hasUserDefaultsOverrides = v6;
  v7 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)restoreDefaultValues
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PXSettings;
  -[PTSettings restoreDefaultValues](&v12, sel_restoreDefaultValues);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[PXSettings reparentedRootSettings](self, "reparentedRootSettings", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "restoreDefaultValues");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)hasDefaultValues
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init((Class)objc_opt_class());
  -[PXSettings archiveDictionary](self, "archiveDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "archiveDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXSettings reparentedRootSettings](self, "reparentedRootSettings", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        if ((v6 & 1) != 0)
          v6 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "hasDefaultValues");
        else
          v6 = 0;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)clearManualOverrides
{
  void *v2;
  void *v3;
  id v4;

  -[PXSettings parentSettings](self, "parentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v2)
  {
    objc_msgSend(v2, "clearManualOverrides");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("PXSettingsOverride"));

  }
}

- (void)save
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSMutableSet *v6;
  NSMutableSet *archivedSettings;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableSet *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  PXSettings *v31;
  __int16 v32;
  const __CFString *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (PFOSVariantHasInternalUI() && (PFOSVariantHasInternalDiagnostics() & 1) != 0)
  {
    -[PXSettings parentSettings](self, "parentSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      -[NSObject save](v3, "save");
    }
    else
    {
      if (self->_hasUserDefaultsOverrides)
      {
        PLUIGetLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v31 = self;
          v32 = 2112;
          v33 = CFSTR("PXSettingsOverride");
          _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "%@: Will skip attempt to save a settings tree with some settings overridden. It would conflict with manual override key \"%@\", buf, 0x16u);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        archivedSettings = self->_archivedSettings;
        self->_archivedSettings = v6;

        objc_msgSend((id)objc_opt_class(), "_userDefaults");
        v5 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_defaultsKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSettings _archiveDictionaryWithSignature](self, "_archiveDictionaryWithSignature");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSettings _validateArchivableValue:forKey:](self, "_validateArchivableValue:forKey:", v9, v8);
        -[NSObject setObject:forKey:](v5, "setObject:forKey:", v9, v8);
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = self->_archivedSettings;
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14++), "performPostSaveActions");
            }
            while (v12 != v14);
            v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          }
          while (v12);
        }

        v15 = self->_archivedSettings;
        self->_archivedSettings = 0;

        -[NSObject synchronize](v5, "synchronize");
      }

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[PXSettings reparentedRootSettings](self, "reparentedRootSettings", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v22;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v22 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "save");
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v18);
      }

      v4 = 0;
    }
  }
  else
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_FAULT, "internal settings can't be saved", buf, 2u);
    }
  }

}

- (id)_archiveDictionaryWithSignature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  _PXSettingsRootIsSaving = 1;
  -[PXSettings archiveDictionary](self, "archiveDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PXSettingsArchiveKey"));

  _PXSettingsRootIsSaving = 0;
  objc_msgSend((id)objc_opt_class(), "_signatureDictionaryWithDefaultSettings:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PXSettingsSignatureKey"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (void)_willArchiveSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (_PXSettingsRootIsSaving == 1)
  {
    v7 = v4;
    -[PXSettings parentSettings](self, "parentSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "_willArchiveSettings:", v7);
    else
      -[NSMutableSet addObject:](self->_archivedSettings, "addObject:", v7);

    v4 = v7;
  }

}

- (id)archiveDictionary
{
  objc_super v4;

  -[PXSettings _willArchiveSettings:](self, "_willArchiveSettings:", self);
  v4.receiver = self;
  v4.super_class = (Class)PXSettings;
  -[PTSettings archiveDictionary](&v4, sel_archiveDictionary);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_validateArchivableValue:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!CFPropertyListIsValid(v7, kCFPropertyListBinaryFormat_v1_0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
        v8,
        v8,
        v7);

      abort();
    }
    v9 = v7;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v9, "keyEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXSettings _validateArchivableValue:forKey:](self, "_validateArchivableValue:forKey:", v16, v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
}

- (id)archiveValueForKey:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (-[PXSettings isTransientKey:](self, "isTransientKey:", v4))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXSettings;
    -[PTSettings archiveValueForKey:](&v7, sel_archiveValueForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[PXSettings isTransientKey:](self, "isTransientKey:", v7))
  {
    v8.receiver = self;
    v8.super_class = (Class)PXSettings;
    -[PTSettings applyArchiveValue:forKey:](&v8, sel_applyArchiveValue_forKey_, v6, v7);
  }

}

- (void)removeKeyObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSettings;
  -[PTSettings removeKeyObserver:](&v14, sel_removeKeyObserver_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXSettings reparentedRootSettings](self, "reparentedRootSettings", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeKeyObserver:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)addKeyPathObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSettings;
  -[PTSettings addKeyPathObserver:](&v14, sel_addKeyPathObserver_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXSettings reparentedRootSettings](self, "reparentedRootSettings", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addKeyPathObserver:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)removeKeyPathObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSettings;
  -[PTSettings removeKeyPathObserver:](&v14, sel_removeKeyPathObserver_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXSettings reparentedRootSettings](self, "reparentedRootSettings", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeKeyPathObserver:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)addDeferredKeyPathObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PXSettings_addDeferredKeyPathObserver___block_invoke;
  v6[3] = &unk_1E5144DF8;
  objc_copyWeak(&v7, &location);
  objc_copyWeak(&v8, &from);
  objc_msgSend(v5, "scheduleMainQueueTask:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXSettings _archiveDictionaryWithSignature](self, "_archiveDictionaryWithSignature");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttachmentWithDictionary:name:", v7, v6);

}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reparentedRootSettings, 0);
  objc_storeStrong((id *)&self->_cachedTransientProperties, 0);
  objc_storeStrong((id *)&self->_archivedSettings, 0);
}

void __41__PXSettings_addDeferredKeyPathObserver___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addKeyPathObserver:", v2);

}

void __47__PXSettings__setOverrideValuesFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    if ((v9 & 1) != 0)
    {
      v11 = objc_msgSend(v8, "_setOverrideValuesFromDictionary:", v6);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v12 + 24))
        v13 = 1;
      else
        v13 = v11;
      *(_BYTE *)(v12 + 24) = v13;
      goto LABEL_17;
    }
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v20 = 138412546;
      v21 = v18;
      v22 = 2112;
      v23 = v5;
      v17 = "%@: Unable to find child settings object for key \"%@\";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  PLUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v20 = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v5;
      v17 = "%@: Unable to override value for key \"%@\" because it is a child settings tree";
LABEL_12:
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v20, 0x16u);
    }
LABEL_13:

    goto LABEL_17;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = 138412546;
    v21 = v19;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "%@: Overriding value for key \"%@\", (uint8_t *)&v20, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v6, v5);
LABEL_17:

}

void __106__PXSettings__resetValuesThatChangedBetweenCurrentDefaultValues_andArchivedDefaultValues_defaultSettings___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if ((objc_msgSend(a1[4], "isTransientKey:", v13) & 1) == 0)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "valueForKey:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(a1[4], "valueForKey:", v13), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      objc_msgSend(a1[6], "valueForKey:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_resetValuesThatChangedBetweenCurrentDefaultValues:andArchivedDefaultValues:defaultSettings:", v5, v6, v10);

    }
    else if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
    {
      v11 = objc_msgSend(v13, "isEqualToString:", CFSTR("version"));
      v12 = a1[4];
      if (v11)
        objc_msgSend(v12, "restoreDefaultValues");
      else
        objc_msgSend(v12, "setValue:forKey:", v7, v13);
      objc_msgSend(a1[7], "addObject:", v13);
    }

  }
}

+ (NSString)suiteName
{
  return (NSString *)(id)_suiteName;
}

+ (void)setSuiteName:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_suiteName;
  _suiteName = v3;

}

+ (id)sharedInstance
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSettings.m"), 100, CFSTR("Concrete subclass must implement. Use either PXSettingsImplementRootSettings() or PXSettingsImplementChildSettings() macro for this."));

  return 0;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "transientProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (NSSet)transientProperties
{
  if (transientProperties_onceToken_282064 != -1)
    dispatch_once(&transientProperties_onceToken_282064, &__block_literal_global_282065);
  return (NSSet *)(id)transientProperties_transientProperties_282066;
}

+ (id)_userDefaults
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "suiteName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

+ (id)_signatureDictionaryWithDefaultSettings:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDefaultValues");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("PXSettingsSignatureVersionKey"));

  objc_msgSend(v6, "archiveDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("PXSettingsSignatureDefaultValuesKey"));

  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v5;
}

void __33__PXSettings_transientProperties__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  NSStringFromSelector(sel_parentSettings);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v1;
  NSStringFromSelector(sel_hasDefaultValues);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  NSStringFromSelector(sel_hasUserDefaultsOverrides);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  NSStringFromSelector(sel_reparentedRootSettings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v0, "initWithArray:", v5);
  v7 = (void *)transientProperties_transientProperties_282066;
  transientProperties_transientProperties_282066 = v6;

}

@end
