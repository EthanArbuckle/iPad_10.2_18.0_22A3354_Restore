@implementation TIKeyboardInputManagerLoaderSyncHelper

- (BOOL)shouldCacheObject:(id)a3
{
  void *v3;
  char v4;

  objc_getAssociatedObject(a3, &kTidyObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "valid") ^ 1;

  return v4;
}

- (TIKeyboardInputManagerLoaderSyncHelper)init
{
  TIKeyboardInputManagerLoaderSyncHelper *v2;
  uint64_t v3;
  NSMutableDictionary *languages;
  uint64_t v5;
  NSMapTable *pendingSaves;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  TIKeyboardInputManagerLoaderSyncHelper *result;
  TIKeyboardInputManagerLoaderSyncHelper *v12;
  SEL v13;
  objc_super v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManagerLoaderSyncHelper;
  v2 = -[TIKeyboardInputManagerLoaderSyncHelper init](&v14, sel_init);
  if (!v2)
    return v2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  languages = v2->_languages;
  v2->_languages = (NSMutableDictionary *)v3;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v5 = objc_claimAutoreleasedReturnValue();
  pendingSaves = v2->_pendingSaves;
  v2->_pendingSaves = (NSMapTable *)v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_languagesChanged_, CFSTR("AppleKeyboardsPreferencesChangedNotification_Private"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v9 = (_QWORD *)get_KSUserWordsWereDownloadedNotificationSymbolLoc_ptr;
  v18 = get_KSUserWordsWereDownloadedNotificationSymbolLoc_ptr;
  if (!get_KSUserWordsWereDownloadedNotificationSymbolLoc_ptr)
  {
    v10 = (void *)KeyboardServicesLibrary();
    v9 = dlsym(v10, "_KSUserWordsWereDownloadedNotification");
    v16[3] = (uint64_t)v9;
    get_KSUserWordsWereDownloadedNotificationSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v15, 8);
  if (v9)
  {
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_languagePulled_, *v9, 0);

    -[TIKeyboardInputManagerLoaderSyncHelper languagesChanged:](v2, "languagesChanged:", 0);
    return v2;
  }
  dlerror();
  v12 = (TIKeyboardInputManagerLoaderSyncHelper *)abort_report_np();
  -[TIKeyboardInputManagerLoaderSyncHelper dealloc](v12, v13);
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLoaderSyncHelper;
  -[TIKeyboardInputManagerLoaderSyncHelper dealloc](&v4, sel_dealloc);
}

- (void)languagesChanged:(id)a3
{
  TIDispatchAsync();
}

- (void)languagePulled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  dispatch_time_t v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  __int128 buf;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKeyboardInputManagerLoaderSyncHelper languageUpdated](self, "languageUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v25 = 0x2020000000;
    v7 = (id *)get_KSUserWordsWereDownloadedLanguageKeySymbolLoc_ptr;
    v26 = get_KSUserWordsWereDownloadedLanguageKeySymbolLoc_ptr;
    if (!get_KSUserWordsWereDownloadedLanguageKeySymbolLoc_ptr)
    {
      v8 = (void *)KeyboardServicesLibrary();
      v7 = (id *)dlsym(v8, "_KSUserWordsWereDownloadedLanguageKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v7;
      get_KSUserWordsWereDownloadedLanguageKeySymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&buf, 8);
    if (v7)
    {
      v9 = *v7;
      objc_msgSend(v6, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v25 = 0x2020000000;
      v12 = (id *)get_KSUserWordsWereDownloadedFilesKeySymbolLoc_ptr;
      v26 = get_KSUserWordsWereDownloadedFilesKeySymbolLoc_ptr;
      if (!get_KSUserWordsWereDownloadedFilesKeySymbolLoc_ptr)
      {
        v13 = (void *)KeyboardServicesLibrary();
        v12 = (id *)dlsym(v13, "_KSUserWordsWereDownloadedFilesKey");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v12;
        get_KSUserWordsWereDownloadedFilesKeySymbolLoc_ptr = (uint64_t)v12;
      }
      _Block_object_dispose(&buf, 8);
      if (v12)
      {
        v14 = *v12;
        objc_msgSend(v11, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v10;
        v16 = v15;
        v17 = v10;
        TIDispatchAsync();

        goto LABEL_13;
      }
    }
    dlerror();
    abort_report_np();
    goto LABEL_15;
  }
  if (TICanLogMessageAtLevel_onceToken != -1)
LABEL_15:
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  TIOSLogFacility();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Got notification before block configured! Delaying..."), "-[TIKeyboardInputManagerLoaderSyncHelper languagePulled:]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v20;
    _os_log_debug_impl(&dword_1DA6F2000, v18, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

  }
  v19 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__TIKeyboardInputManagerLoaderSyncHelper_languagePulled___block_invoke;
  block[3] = &unk_1EA107030;
  block[4] = self;
  v23 = v4;
  dispatch_after(v19, MEMORY[0x1E0C80D38], block);

LABEL_13:
}

- (void)willLoadLanguage:(id)a3
{
  void *v3;
  id v4;

  -[NSMapTable objectForKey:](self->_pendingSaves, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "execute");

  objc_msgSend(get_KSUserWordsSynchroniserClass(), "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardUsed");

}

- (void)noteObject:(id)a3 forLanguage:(id)a4
{
  NSMutableDictionary *languages;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  languages = self->_languages;
  v7 = a3;
  -[NSMutableDictionary objectForKey:](languages, "objectForKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "compact");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_languages, "setObject:forKey:", v9, v10);
  }
  objc_msgSend(v9, "addPointer:", v7);

}

- (id)languageUpdated
{
  return self->_languageUpdated;
}

- (void)setLanguageUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_languageUpdated, 0);
  objc_storeStrong((id *)&self->_pendingSaves, 0);
  objc_storeStrong((id *)&self->_languages, 0);
}

uint64_t __57__TIKeyboardInputManagerLoaderSyncHelper_languagePulled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "languagePulled:", *(_QWORD *)(a1 + 40));
}

void __57__TIKeyboardInputManagerLoaderSyncHelper_languagePulled___block_invoke_2(uint64_t a1)
{
  void *v2;
  _TIKeyboardSyncFileInstaller *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  v3 = -[_TIKeyboardSyncFileInstaller initWithEntry:]([_TIKeyboardSyncFileInstaller alloc], "initWithEntry:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if (v10)
            objc_setAssociatedObject(v10, &kTidyObject, v3, (void *)0x301);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "languageUpdated");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v11[2](v11, *(_QWORD *)(a1 + 40));

}

void __59__TIKeyboardInputManagerLoaderSyncHelper_languagesChanged___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[TIAssetManager sharedAssetManager](TIAssetManager, "sharedAssetManager", 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enabledInputModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        TIInputModeGetLanguageWithRegion();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v0, "containsObject:", v7) & 1) == 0)
          objc_msgSend(v0, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  get_KSUserWordsSynchroniserClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(get_KSUserWordsSynchroniserClass(), "sharedAcrossLanguagesNegativeLearningValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v8);

  }
  get_KSUserWordsSynchroniserClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(get_KSUserWordsSynchroniserClass(), "sharedAcrossLanguagesVulgarWordUsageValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v9);

  }
  objc_msgSend(get_KSUserWordsSynchroniserClass(), "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequiredLanguages:", v0);

}

+ (void)deleteCloudKitBackup
{
  id v2;

  objc_msgSend(get_KSUserWordsSynchroniserClass(), "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteZoneWithCompletionHandler:", &__block_literal_global_22);

}

void __62__TIKeyboardInputManagerLoaderSyncHelper_deleteCloudKitBackup__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = CFSTR("Success");
      if (v2)
        v4 = v2;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s User word zone delete result: %@"), "+[TIKeyboardInputManagerLoaderSyncHelper deleteCloudKitBackup]_block_invoke", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

@end
