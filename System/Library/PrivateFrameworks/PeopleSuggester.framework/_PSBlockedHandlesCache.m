@implementation _PSBlockedHandlesCache

+ (id)sharedBlockedHandlesCache
{
  if (sharedBlockedHandlesCache__pasOnceToken1 != -1)
    dispatch_once(&sharedBlockedHandlesCache__pasOnceToken1, &__block_literal_global_2);
  return (id)sharedBlockedHandlesCache_cache;
}

- (_PSBlockedHandlesCache)init
{
  _PSBlockedHandlesCache *v2;
  _PSBlockedHandlesCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PSBlockedHandlesCache;
  v2 = -[_PSBlockedHandlesCache init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_PSBlockedHandlesCache rebuildCacheWithBlockedHandles:](v2, "rebuildCacheWithBlockedHandles:", MEMORY[0x1E0C9AA60]);
  return v3;
}

- (BOOL)isHandleBlocked:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  char v7;

  v4 = a3;
  v5 = (*((uint64_t (**)(void))self->_isHandleBlocked + 2))();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_PSBlockedHandlesCache isHandleBlocked:].cold.1((uint64_t)v4, v5, v6);

  v7 = (*((uint64_t (**)(void))self->_isHandleBlocked + 2))();
  return v7;
}

- (void)beginSyncingWithTU
{
  void *v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getTUPrivacyRulesChangedNotificationSymbolLoc_ptr;
  v11 = getTUPrivacyRulesChangedNotificationSymbolLoc_ptr;
  if (!getTUPrivacyRulesChangedNotificationSymbolLoc_ptr)
  {
    v5 = (void *)TelephonyUtilitiesLibrary();
    v4 = dlsym(v5, "TUPrivacyRulesChangedNotification");
    v9[3] = (uint64_t)v4;
    getTUPrivacyRulesChangedNotificationSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    v7 = (_Unwind_Exception *)-[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handlePrivacyManagerChangeNotification_, *v4, 0, v8);

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_DEFAULT, "_PSBlockedHandlesCache will perform initial fetch from TU", (uint8_t *)&v8, 2u);
  }

  -[_PSBlockedHandlesCache rebuildCacheFromPrivacyManager](self, "rebuildCacheFromPrivacyManager");
}

- (void)handlePrivacyManagerChangeNotification:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  +[_PSLogging generalChannel](_PSLogging, "generalChannel", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "_PSBlockedHandlesCache handling change notification", buf, 2u);
  }

  if (handlePrivacyManagerChangeNotification___pasOnceToken6 != -1)
    dispatch_once(&handlePrivacyManagerChangeNotification___pasOnceToken6, &__block_literal_global_5);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___PSBlockedHandlesCache_handlePrivacyManagerChangeNotification___block_invoke_2;
  block[3] = &unk_1E43FEB68;
  block[4] = self;
  v5 = (id)handlePrivacyManagerChangeNotification___pasExprOnceResult;
  dispatch_async(v5, block);

}

- (void)rebuildCacheFromPrivacyManager
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)os_transaction_create();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)getTUPrivacyManagerClass_softClass;
  v13 = getTUPrivacyManagerClass_softClass;
  if (!getTUPrivacyManagerClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getTUPrivacyManagerClass_block_invoke;
    v9[3] = &unk_1E43FEA00;
    v9[4] = &v10;
    __getTUPrivacyManagerClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v5, "sharedPrivacyManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privacyRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_10_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSBlockedHandlesCache rebuildCacheWithBlockedHandles:](self, "rebuildCacheWithBlockedHandles:", v8);
}

- (void)rebuildCacheWithBlockedHandles:(id)a3
{
  id v4;
  void *v5;
  _PSBlockedHandlesCache *v6;
  id v7;
  uint64_t v8;
  id v9;
  const __CFString *v10;
  _PSBlockedHandlesCache *v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _PSBlockedHandlesCache *v26;
  id v27;
  uint64_t v28;
  id isHandleBlocked;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if ((unint64_t)objc_msgSend(v4, "count") > 0x3E7)
    {
      v13 = (void *)MEMORY[0x1E0D81538];
      v14 = objc_msgSend(v4, "count");
      LODWORD(v15) = 897988541;
      objc_msgSend(v13, "bloomFilterInMemoryWithNumberOfValuesN:errorRateP:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v17 = v4;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v35;
        do
        {
          v22 = 0;
          v23 = v20;
          do
          {
            if (*(_QWORD *)v35 != v21)
              objc_enumerationMutation(v17);
            v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v22);
            v25 = (void *)MEMORY[0x1A1AFCA24]();
            objc_msgSend(v16, "computeHashesForString:reuse:", v24, v23);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "setWithHashes:", v20);
            objc_autoreleasePoolPop(v25);
            ++v22;
            v23 = v20;
          }
          while (v19 != v22);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        }
        while (v19);

      }
      v26 = self;
      objc_sync_enter(v26);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke_3;
      v32[3] = &unk_1E43FEBF0;
      v33 = v16;
      v27 = v16;
      v28 = MEMORY[0x1A1AFCBF8](v32);
      isHandleBlocked = v26->_isHandleBlocked;
      v26->_isHandleBlocked = (id)v28;

      objc_sync_exit(v26);
      v10 = CFSTR("bloom filter");
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
      v6 = self;
      objc_sync_enter(v6);
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke_2;
      v38[3] = &unk_1E43FEBF0;
      v39 = v5;
      v7 = v5;
      v8 = MEMORY[0x1A1AFCBF8](v38);
      v9 = v6->_isHandleBlocked;
      v6->_isHandleBlocked = (id)v8;

      objc_sync_exit(v6);
      v10 = CFSTR("set");
    }
  }
  else
  {
    v11 = self;
    objc_sync_enter(v11);
    v12 = v11->_isHandleBlocked;
    v11->_isHandleBlocked = &__block_literal_global_13;

    objc_sync_exit(v11);
    v10 = CFSTR("empty");
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134218242;
    v41 = v31;
    v42 = 2112;
    v43 = v10;
    _os_log_impl(&dword_1A07F4000, v30, OS_LOG_TYPE_DEFAULT, "_PSBlockedHandlesCache rebuilt cache with %tu blocked handles using %@ path", buf, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isHandleBlocked, 0);
}

- (void)isHandleBlocked:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138478083;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_1A07F4000, log, OS_LOG_TYPE_DEBUG, "_PSBlockedHandlesCache _isHandleBlocked:%{private}@ result:%d", (uint8_t *)&v3, 0x12u);
}

- (uint64_t)beginSyncingWithTU
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getTUPrivacyManagerClass_block_invoke_cold_1(v0);
}

@end
