@implementation TIUserDictionaryServer

uint64_t __38__TIUserDictionaryServer_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "incrementRecentClientCount");
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (!*(_BYTE *)(v4 + 32))
  {
    objc_msgSend((id)v4, "updateCache");
  }
  return objc_msgSend(*(id *)(a1 + 32), "decrementRecentClientCountAfterDelay");
}

- (void)incrementRecentClientCount
{
  TIDispatchAsync();
}

- (void)loadPhraseShortcutPairs:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  TIUserDictionaryServer *v15;
  void (**v16)(id, _QWORD);
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = (void (**)(id, _QWORD))a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v5 = (void *)getMCProfileConnectionClass_softClass_13056;
  v21 = getMCProfileConnectionClass_softClass_13056;
  if (!getMCProfileConnectionClass_softClass_13056)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getMCProfileConnectionClass_block_invoke_13057;
    v17[3] = &unk_1EA107058;
    v17[4] = &v18;
    __getMCProfileConnectionClass_block_invoke_13057((uint64_t)v17);
    v5 = (void *)v19[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v6, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isKeyboardShortcutsAllowed");

  if ((v8 & 1) != 0)
  {
    -[TIUserDictionaryServer textReplacementServer](self, "textReplacementServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v4[2](v4, MEMORY[0x1E0C9AA60]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TIUserDictionaryServer textReplacementServer](self, "textReplacementServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__TIUserDictionaryServer_loadPhraseShortcutPairs___block_invoke;
    v13[3] = &unk_1EA103250;
    v14 = v10;
    v15 = self;
    v16 = v4;
    v12 = v10;
    objc_msgSend(v11, "queryTextReplacementsWithCallback:", v13);

  }
  else
  {
    v4[2](v4, MEMORY[0x1E0C9AA60]);
  }

}

- (_KSTextReplacementServer)textReplacementServer
{
  return self->_textReplacementServer;
}

uint64_t __52__TIUserDictionaryServer_incrementRecentClientCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (void)keyboardActivityDidTransition:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  TIDispatchAsync();

}

_QWORD *__56__TIUserDictionaryServer_keyboardActivityDidTransition___block_invoke(uint64_t a1)
{
  _QWORD *result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(*(id *)(a1 + 40), "toState");
  result = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "toState");
  if (result == (_QWORD *)3)
  {
    result = *(_QWORD **)(a1 + 32);
    if (!result[6])
      return (_QWORD *)objc_msgSend(result, "handleIdleTimeout");
  }
  return result;
}

- (void)decrementRecentClientCountAfterDelay
{
  double v3;
  dispatch_time_t v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  +[TIUserDictionaryServer decrementClientDelay](TIUserDictionaryServer, "decrementClientDelay");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__TIUserDictionaryServer_decrementRecentClientCountAfterDelay__block_invoke;
  block[3] = &unk_1EA106A98;
  block[4] = self;
  dispatch_after(v4, dispatchQueue, block);
}

+ (double)decrementClientDelay
{
  if (decrementClientDelay_onceToken != -1)
    dispatch_once(&decrementClientDelay_onceToken, &__block_literal_global_15_13084);
  return *(double *)&decrementClientDelay_result;
}

void __50__TIUserDictionaryServer_loadPhraseShortcutPairs___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "phrase");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "shortcut");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            objc_msgSend(v10, "phrase");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setShortcut:", v13);

          }
          v14 = *(void **)(a1 + 32);
          objc_msgSend(v10, "phrase");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v15);

          v16 = *(void **)(a1 + 32);
          objc_msgSend(v10, "shortcut");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v17);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  if (a3)
  {
    v19 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 32);
    TIDispatchAsync();

  }
}

+ (id)sharedInstance
{
  if (__testingServer)
    return (id)__testingServer;
  +[TIUserDictionaryServer singletonInstance](TIUserDictionaryServer, "singletonInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_13092 != -1)
    dispatch_once(&singletonInstance_onceToken_13092, &__block_literal_global_13093);
  return (id)singletonInstance_singletonInstance_13094;
}

- (id)addObserver:(id)a3
{
  id v3;
  void *v4;
  void *v6;

  v6 = (void *)objc_msgSend(a3, "copy");
  v3 = v6;
  TIDispatchAsync();
  v4 = _Block_copy(v3);

  return v4;
}

uint64_t __50__TIUserDictionaryServer_loadPhraseShortcutPairs___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __37__TIUserDictionaryServer_updateCache__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUserDictionaryUUID:", v5);

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "decrementRecentClientCountAfterDelay", (_QWORD)v12);
  v11 = *(_DWORD **)(a1 + 32);
  if (v11[9])
    objc_msgSend(v11, "updateCache");

}

- (NSUUID)userDictionaryUUID
{
  return self->_userDictionaryUUID;
}

- (void)updateCache
{
  NSArray *cache;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_updating)
  {
    ++self->_pendingUpdates;
  }
  else
  {
    self->_pendingUpdates = 0;
    -[TIUserDictionaryServer incrementRecentClientCount](self, "incrementRecentClientCount");
    self->_updating = 1;
    cache = self->_cache;
    self->_cache = 0;

    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __37__TIUserDictionaryServer_updateCache__block_invoke;
    v4[3] = &unk_1EA103228;
    v4[4] = self;
    -[TIUserDictionaryServer loadPhraseShortcutPairs:](self, "loadPhraseShortcutPairs:", v4);
  }
}

- (void)setUserDictionaryUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)removeObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  TIDispatchAsync();

}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  getKSTextReplacementDidChangeNotification();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0);

  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeActivityObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)TIUserDictionaryServer;
  -[TIUserDictionaryServer dealloc](&v7, sel_dealloc);
}

- (TIUserDictionaryServer)init
{
  TIUserDictionaryServer *v2;
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *observers;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dispatchQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIUserDictionaryServer;
  v2 = -[TIUserDictionaryServer init](&v10, sel_init);
  if (v2)
  {
    +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addActivityObserver:", v2);

    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v2->_observers;
    v2->_observers = v4;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.TextInput.shortcuts", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)startServer
{
  TIDispatchAsync();
}

- (void)getPhraseShortcutPairs:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  TIDispatchAsync();

}

- (void)resetCache
{
  NSArray *cache;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  cache = self->_cache;
  self->_cache = 0;

  -[TIUserDictionaryServer setUserDictionaryUUID:](self, "setUserDictionaryUUID:", 0);
}

- (void)managedKeyboardSettingsDidChange:(id)a3
{
  TIDispatchAsync();
}

- (void)handleIdleTimeout
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel)
  {
    TIOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Closing user dictionary due to lack of activity"), "-[TIUserDictionaryServer handleIdleTimeout]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  -[TIUserDictionaryServer textReplacementServer](self, "textReplacementServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanup");

  -[TIUserDictionaryServer resetCache](self, "resetCache");
}

- (void)setTextReplacementServer:(id)a3
{
  objc_storeStrong((id *)&self->_textReplacementServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textReplacementServer, 0);
  objc_storeStrong((id *)&self->_userDictionaryUUID, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

_QWORD *__62__TIUserDictionaryServer_decrementRecentClientCountAfterDelay__block_invoke(uint64_t a1)
{
  _QWORD *result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  result = *(_QWORD **)(a1 + 32);
  if (result[5] == 3 && !result[6])
    return (_QWORD *)objc_msgSend(result, "handleIdleTimeout");
  return result;
}

uint64_t __59__TIUserDictionaryServer_managedKeyboardSettingsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCache");
}

uint64_t __49__TIUserDictionaryServer_getPhraseShortcutPairs___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2[3])
    return (*(uint64_t (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v2, "loadPhraseShortcutPairs:", v3);
}

void __41__TIUserDictionaryServer_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v2, "removeObject:", v3);

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
}

void __37__TIUserDictionaryServer_startServer__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v2 = (void *)get_KSTextReplacementServerClass_softClass;
  v24 = get_KSTextReplacementServerClass_softClass;
  if (!get_KSTextReplacementServerClass_softClass)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = (uint64_t)__get_KSTextReplacementServerClass_block_invoke;
    v19 = &unk_1EA107058;
    v20 = &v21;
    __get_KSTextReplacementServerClass_block_invoke((uint64_t)&v16);
    v2 = (void *)v22[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v3, "textReplacementServer");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v16 = 0;
  v17 = (uint64_t)&v16;
  v18 = 0x2020000000;
  v9 = (_QWORD *)getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
  v19 = (void *)getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
  if (!getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr)
  {
    v10 = (void *)ManagedConfigurationLibrary_13060();
    v9 = dlsym(v10, "MCKeyboardSettingsChangedNotification");
    *(_QWORD *)(v17 + 24) = v9;
    getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v16, 8);
  if (v9)
  {
    objc_msgSend(v7, "addObserver:selector:name:object:", v8, sel_managedKeyboardSettingsDidChange_, *v9, 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v12 = *(const void **)(a1 + 32);
    getKSTextReplacementDidChangeNotification();
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v12, (CFNotificationCallback)ShortcutsDidChange, v13, 0, (CFNotificationSuspensionBehavior)0);

    objc_msgSend(*(id *)(a1 + 32), "textReplacementServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "start");

  }
  else
  {
    dlerror();
    v15 = abort_report_np();
    __get_KSTextReplacementServerClass_block_invoke(v15);
  }
}

void __46__TIUserDictionaryServer_decrementClientDelay__block_invoke()
{
  CFIndex AppIntegerValue;
  CFIndex v1;
  NSObject *v2;
  void *v3;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  decrementClientDelay_result = 0x4066800000000000;
  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
  {
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("idleTimeout"), CFSTR("com.apple.keyboard"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      v1 = AppIntegerValue;
      if ((AppIntegerValue & 0x8000000000000000) == 0)
      {
        *(double *)&decrementClientDelay_result = (double)AppIntegerValue;
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v2 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Setting decrement client delay to %ld seconds"), "+[TIUserDictionaryServer decrementClientDelay]_block_invoke", v1);
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v6 = v3;
            _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
      }
    }
  }
}

void __43__TIUserDictionaryServer_singletonInstance__block_invoke()
{
  TIUserDictionaryServer *v0;
  void *v1;

  v0 = objc_alloc_init(TIUserDictionaryServer);
  v1 = (void *)singletonInstance_singletonInstance_13094;
  singletonInstance_singletonInstance_13094 = (uint64_t)v0;

}

+ (void)setSharedInstance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingServer != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingServer, a3);
    v4 = v5;
  }

}

@end
