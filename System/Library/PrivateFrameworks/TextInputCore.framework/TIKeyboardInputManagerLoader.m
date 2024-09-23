@implementation TIKeyboardInputManagerLoader

- (void)setInteractingConnection:(id)a3
{
  self->_interactingConnection = (NSXPCConnection *)a3;
}

- (void)prepareForKeyboardActivity
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_availableInputManagers, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_15_14541);
}

void __55__TIKeyboardInputManagerLoader_currentLoadedInputModes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "resourceInputModes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

+ (id)sharedLoader
{
  if (sharedLoader_onceToken != -1)
    dispatch_once(&sharedLoader_onceToken, &__block_literal_global_14568);
  return (id)sharedLoader_loader;
}

- (BOOL)isActiveInputManager:(id)a3
{
  NSMutableDictionary *activeInputManagers;
  id v4;
  void *v5;
  char v6;

  activeInputManagers = self->_activeInputManagers;
  v4 = a3;
  -[NSMutableDictionary allValues](activeInputManagers, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)inputManagerForInputMode:(id)a3 withKeyboardState:(id)a4 class:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  TIKeyboardInputManagerLoaderSyncHelper *helper;
  void *v15;
  NSObject *v16;
  void *v17;
  TIKeyboardInputManagerLoaderSyncHelper *v18;
  void *v19;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKey:](self->_availableInputManagers, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_availableInputManagers, "removeObjectForKey:", v8);
  if (v10
    && objc_msgSend(v10, "isMemberOfClass:", a5)
    && (objc_msgSend(v10, "inputMode"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v8),
        v11,
        (v12 & 1) != 0))
  {
    TIInputManagerOSLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315394;
      v22 = "-[TIKeyboardInputManagerLoader inputManagerForInputMode:withKeyboardState:class:]";
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEFAULT, "%s  Reusing existing input manager for input mode %{public}@", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {

    helper = self->_helper;
    objc_msgSend(v8, "languageWithRegion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLoaderSyncHelper willLoadLanguage:](helper, "willLoadLanguage:", v15);

    TIInputManagerOSLogFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromClass(a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315650;
      v22 = "-[TIKeyboardInputManagerLoader inputManagerForInputMode:withKeyboardState:class:]";
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_DEFAULT, "%s  Initializing new input manager with class %{public}@ for input mode %{public}@", (uint8_t *)&v21, 0x20u);

    }
    v10 = (void *)objc_msgSend([a5 alloc], "initWithInputMode:keyboardState:", v8, v9);
    v18 = self->_helper;
    objc_msgSend(v10, "inputMode");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject languageWithRegion](v13, "languageWithRegion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLoaderSyncHelper noteObject:forLanguage:](v18, "noteObject:forLanguage:", v10, v19);

  }
  -[NSMutableDictionary setObject:forKey:](self->_activeInputManagers, "setObject:forKey:", v10, v8);
  objc_msgSend(v10, "resume");

  return v10;
}

- (void)cacheInputManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSMutableDictionary *activeInputManagers;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *availableInputManagers;
  void *v14;
  void *v15;
  NSMutableDictionary *lastUsedDate;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v20 = v4;
    objc_msgSend(v4, "suspend");
    objc_msgSend(v20, "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v20;
    if (v6)
    {
      v7 = -[TIKeyboardInputManagerLoaderSyncHelper shouldCacheObject:](self->_helper, "shouldCacheObject:", v20);
      activeInputManagers = self->_activeInputManagers;
      objc_msgSend(v20, "inputMode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](activeInputManagers, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v20)
      {
        v11 = self->_activeInputManagers;
        objc_msgSend(v20, "inputMode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

      }
      else
      {
        v7 = 0;
      }
      if (self->_helper && !v7)
        goto LABEL_14;
      availableInputManagers = self->_availableInputManagers;
      objc_msgSend(v20, "inputMode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](availableInputManagers, "setObject:forKey:", v20, v14);

      if ((objc_msgSend(v20, "hasHandledInput") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_12;
      }
      else
      {
        lastUsedDate = self->_lastUsedDate;
        objc_msgSend(v20, "inputMode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](lastUsedDate, "objectForKey:", v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
LABEL_12:
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v18 = self->_lastUsedDate;
      objc_msgSend(v20, "inputMode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v15, v19);

      -[TIKeyboardInputManagerLoader reduceInputManagerCacheToSize:](self, "reduceInputManagerCacheToSize:", 4);
LABEL_14:

      v5 = v20;
    }
  }

}

void __60__TIKeyboardInputManagerLoader_prepareForKeyboardInactivity__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 1
    && objc_msgSend(v6, "isHighMemoryManager"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[TIKeyboardInputManagerLoader prepareForKeyboardInactivity]_block_invoke_2";
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Input manager %@ is loading advanced model, and there is only one Input Manager loading advanced models", (uint8_t *)&v10, 0x16u);
    }
    v8 = 1;
  }
  else
  {
    v8 = 2;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = off_1EA104728[v8];
    v10 = 136315650;
    v11 = "-[TIKeyboardInputManagerLoader prepareForKeyboardInactivity]_block_invoke";
    v12 = 2080;
    v13 = v9;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Issuing %s to %@ to prepare for Keyboard Inactivity", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(v7, "prepareForKeyboardInactivity:", v8);

}

void __60__TIKeyboardInputManagerLoader_prepareForKeyboardInactivity__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "isHighMemoryManager");
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v4);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v6;
}

- (void)prepareForKeyboardInactivity
{
  void *v3;
  NSMutableDictionary *availableInputManagers;
  uint64_t v5;
  id v6;
  NSMutableDictionary *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[4];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  availableInputManagers = self->_availableInputManagers;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__TIKeyboardInputManagerLoader_prepareForKeyboardInactivity__block_invoke;
  v9[3] = &unk_1EA103FF8;
  v6 = v3;
  v10 = v6;
  v11 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](availableInputManagers, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = self->_availableInputManagers;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __60__TIKeyboardInputManagerLoader_prepareForKeyboardInactivity__block_invoke_2;
  v8[3] = &unk_1EA104020;
  v8[4] = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (getExcessMemoryInBytes())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[TIKeyboardInputManagerLoader prepareForKeyboardInactivity]";
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  kbd is already over inactive limit, hard-resetting all language models (including advanced ones)", buf, 0xCu);
    }
    -[TIKeyboardInputManagerLoader releaseAllLanguageModelBuffers](self, "releaseAllLanguageModelBuffers");
  }

  _Block_object_dispose(v12, 8);
}

- (id)currentLoadedInputModes
{
  void *v3;
  NSMutableDictionary *availableInputManagers;
  uint64_t v5;
  id v6;
  NSMutableDictionary *activeInputManagers;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  availableInputManagers = self->_availableInputManagers;
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__TIKeyboardInputManagerLoader_currentLoadedInputModes__block_invoke;
  v16[3] = &unk_1EA104068;
  v6 = v3;
  v17 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](availableInputManagers, "enumerateKeysAndObjectsUsingBlock:", v16);
  activeInputManagers = self->_activeInputManagers;
  v11 = v5;
  v12 = 3221225472;
  v13 = __55__TIKeyboardInputManagerLoader_currentLoadedInputModes__block_invoke_2;
  v14 = &unk_1EA104068;
  v15 = v6;
  v8 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeInputManagers, "enumerateKeysAndObjectsUsingBlock:", &v11);
  objc_msgSend(v8, "allObjects", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)startSyncHelper
{
  void *v3;
  void *v4;
  TIKeyboardInputManagerLoaderSyncHelper *v5;
  TIKeyboardInputManagerLoaderSyncHelper *helper;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_helper)
  {
    if (TIGetEnableUserWordSyncingValue_onceToken != -1)
      dispatch_once(&TIGetEnableUserWordSyncingValue_onceToken, &__block_literal_global_61);
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForPreferenceKey:", CFSTR("EnableUserWordSyncing"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v3) = objc_msgSend(v4, "BOOLValue");
    if ((_DWORD)v3)
    {
      objc_initWeak(&location, self);
      v5 = (TIKeyboardInputManagerLoaderSyncHelper *)objc_opt_new();
      helper = self->_helper;
      self->_helper = v5;

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __47__TIKeyboardInputManagerLoader_startSyncHelper__block_invoke;
      v7[3] = &unk_1EA103F68;
      objc_copyWeak(&v8, &location);
      -[TIKeyboardInputManagerLoaderSyncHelper setLanguageUpdated:](self->_helper, "setLanguageUpdated:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)reduceInputManagerCacheToSize:(int)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  int v31;
  uint64_t v32;
  void *obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_availableInputManagers, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __62__TIKeyboardInputManagerLoader_reduceInputManagerCacheToSize___block_invoke;
  v42[3] = &unk_1EA103FD0;
  v42[4] = self;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v42);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_availableInputManagers, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isHighMemoryManager"))
        {
          if (v9)
          {
            TIInputManagerOSLogFacility();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "normalizedIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v12, "isSiriMode");
              *(_DWORD *)buf = 136315650;
              v45 = "-[TIKeyboardInputManagerLoader reduceInputManagerCacheToSize:]";
              v46 = 2114;
              v47 = v15;
              v48 = 1024;
              v49 = v16;
              _os_log_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEFAULT, "%s  Removing inputManager from cache for inputMode %{public}@ isSiriMode: %d", buf, 0x1Cu);

            }
            -[TIKeyboardInputManagerLoader removeInputModeFromAllContainers:](self, "removeInputModeFromAllContainers:", v12);
          }
          else
          {
            v9 = v13;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (-[NSMutableDictionary count](self->_availableInputManagers, "count") > (unint64_t)a3)
  {
    v17 = objc_msgSend(v6, "count");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v6, "reverseObjectEnumerator");
    obj = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = v17 - a3;
      v22 = *(_QWORD *)v35;
      v31 = v21;
      while (2)
      {
        v23 = 0;
        v32 = v19;
        do
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v23);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_availableInputManagers, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "isHighMemoryManager") & 1) == 0)
          {
            v26 = v22;
            TIInputManagerOSLogFacility();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v24, "normalizedIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v45 = "-[TIKeyboardInputManagerLoader reduceInputManagerCacheToSize:]";
              v46 = 2114;
              v47 = v28;
              _os_log_impl(&dword_1DA6F2000, v27, OS_LOG_TYPE_DEFAULT, "%s  Removing inputManager from cache for inputMode %{public}@", buf, 0x16u);

              v21 = v31;
            }

            -[TIKeyboardInputManagerLoader removeInputModeFromAllContainers:](self, "removeInputModeFromAllContainers:", v24);
            ++v20;
            v22 = v26;
            v19 = v32;
            if (v20 >= v21)
            {

              goto LABEL_30;
            }
          }

          ++v23;
        }
        while (v19 != v23);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_30:

    if (!a3)
    {
      TIInputManagerOSLogFacility();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[TIKeyboardInputManagerLoader reduceInputManagerCacheToSize:]";
        _os_log_impl(&dword_1DA6F2000, v29, OS_LOG_TYPE_DEFAULT, "%s  Received cache size is 0, unwiring all language models", buf, 0xCu);
      }

      +[TILanguageModelLoaderManager unwireAllLanguageModelMemory](TILanguageModelLoaderManager, "unwireAllLanguageModelMemory");
    }
  }

}

- (NSXPCConnection)interactingConnection
{
  return self->_interactingConnection;
}

- (TIKeyboardInputManagerLoader)init
{
  TIKeyboardInputManagerLoader *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *availableInputManagers;
  NSMutableDictionary *v5;
  NSMutableDictionary *lastUsedDate;
  NSMutableDictionary *v7;
  NSMutableDictionary *activeInputManagers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerLoader;
  v2 = -[TIKeyboardInputManagerLoader init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    availableInputManagers = v2->_availableInputManagers;
    v2->_availableInputManagers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastUsedDate = v2->_lastUsedDate;
    v2->_lastUsedDate = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeInputManagers = v2->_activeInputManagers;
    v2->_activeInputManagers = v7;

    v2->_interactingConnection = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  self->_interactingConnection = 0;
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManagerLoader;
  -[TIKeyboardInputManagerLoader dealloc](&v2, sel_dealloc);
}

- (void)removeInputModeFromAllContainers:(id)a3
{
  NSMutableDictionary *availableInputManagers;
  id v5;

  availableInputManagers = self->_availableInputManagers;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](availableInputManagers, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_activeInputManagers, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_lastUsedDate, "removeObjectForKey:", v5);

}

- (void)releaseAllLanguageModelBuffers
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_availableInputManagers, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_9);
}

- (void)releaseAllInputManagers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_availableInputManagers, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        TIInputManagerOSLogFacility();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "normalizedIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v16 = "-[TIKeyboardInputManagerLoader releaseAllInputManagers]";
          v17 = 2114;
          v18 = v10;
          _os_log_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEFAULT, "%s  removing inputManager from cache for inputMode %{public}@", buf, 0x16u);

        }
        -[TIKeyboardInputManagerLoader removeInputModeFromAllContainers:](self, "removeInputModeFromAllContainers:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v5);
  }

}

- (BOOL)hasActiveInputManagers
{
  return -[NSMutableDictionary count](self->_activeInputManagers, "count") != 0;
}

- (id)activeInputModeIdentifiers
{
  void *v3;
  NSMutableDictionary *activeInputManagers;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_activeInputManagers, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activeInputManagers = self->_activeInputManagers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__TIKeyboardInputManagerLoader_activeInputModeIdentifiers__block_invoke;
  v7[3] = &unk_1EA104068;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeInputManagers, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (void)registerMaintenanceActivity
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  TIOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Preparing for %s activity"), "-[TIKeyboardInputManagerLoader registerMaintenanceActivity]", "com.apple.textinput.keyboardmaintenance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __59__TIKeyboardInputManagerLoader_registerMaintenanceActivity__block_invoke;
  handler[3] = &unk_1EA1040B0;
  handler[4] = self;
  xpc_activity_register("com.apple.textinput.keyboardmaintenance", v4, handler);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInputManagers, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_availableInputManagers, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

void __59__TIKeyboardInputManagerLoader_registerMaintenanceActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v2;
  xpc_activity_state_t state;
  NSObject *v4;
  xpc_object_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Running %s activity"), "-[TIKeyboardInputManagerLoader registerMaintenanceActivity]_block_invoke", "com.apple.textinput.keyboardmaintenance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    TIDispatchSync();
  }
  else if (!state)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Checking in activity %s"), "-[TIKeyboardInputManagerLoader registerMaintenanceActivity]_block_invoke", "com.apple.textinput.keyboardmaintenance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80898], 1);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80760], *MEMORY[0x1E0C807B0]);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C0]);
    xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808D8], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808B8], 1);
    xpc_activity_set_criteria(v2, v5);

  }
}

uint64_t __59__TIKeyboardInputManagerLoader_registerMaintenanceActivity__block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_25);
}

uint64_t __59__TIKeyboardInputManagerLoader_registerMaintenanceActivity__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "runMaintenanceTask");
}

void __58__TIKeyboardInputManagerLoader_activeInputModeIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "currentInputModeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    v4 = v5;
  }

}

void __55__TIKeyboardInputManagerLoader_currentLoadedInputModes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "resourceInputModes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

uint64_t __58__TIKeyboardInputManagerLoader_prepareForKeyboardActivity__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "prepareForKeyboardActivity");
}

uint64_t __62__TIKeyboardInputManagerLoader_reduceInputManagerCacheToSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a2;
  objc_msgSend(v5, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

uint64_t __62__TIKeyboardInputManagerLoader_releaseAllLanguageModelBuffers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "prepareForKeyboardInactivity:", 2);
}

void __47__TIKeyboardInputManagerLoader_startSyncHelper__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = WeakRetained[2];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "languageWithRegion", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v3);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(WeakRetained[2], "removeObjectsForKeys:", v5);
    objc_msgSend(WeakRetained[3], "removeObjectsForKeys:", v5);

  }
}

void __44__TIKeyboardInputManagerLoader_sharedLoader__block_invoke()
{
  TIKeyboardInputManagerLoader *v0;
  void *v1;

  v0 = objc_alloc_init(TIKeyboardInputManagerLoader);
  v1 = (void *)sharedLoader_loader;
  sharedLoader_loader = (uint64_t)v0;

}

@end
