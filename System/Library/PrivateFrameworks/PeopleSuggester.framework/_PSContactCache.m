@implementation _PSContactCache

- (_PSContactCache)init
{
  _PSContactCache *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  CNContactStore *contactStore;
  uint64_t v8;
  OS_dispatch_queue *notificationQueue;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *cachedContactForHandle;
  id v14;
  void *v15;
  uint64_t v16;
  _PASLock *cachedFaceTimeableHandleForContactIdentifier;
  id v18;
  id v19;
  uint64_t v20;
  IDSIDQueryController *idsQueryController;
  id *v22;
  void *v23;
  uint64_t v24;
  NSData *changeHistoryToken;
  dispatch_block_t v26;
  void *v27;
  id *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  NSObject *notificationCenterToken;
  _PSContactCache *result;
  _QWORD v35[4];
  id v36;
  _QWORD block[4];
  id v38;
  objc_super v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id *v44;
  id location;
  id *p_location;
  uint64_t v47;
  uint64_t v48;

  v39.receiver = self;
  v39.super_class = (Class)_PSContactCache;
  v2 = -[_PSContactCache init](&v39, sel_init);
  if (!v2)
    return v2;
  location = 0;
  p_location = &location;
  v47 = 0x2050000000;
  v3 = (id)getCNContactStoreClass_softClass_7;
  v48 = getCNContactStoreClass_softClass_7;
  v4 = MEMORY[0x1E0C809B0];
  if (!getCNContactStoreClass_softClass_7)
  {
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = (uint64_t)__getCNContactStoreClass_block_invoke_7;
    v43 = &unk_1E43FEA00;
    v44 = &location;
    __getCNContactStoreClass_block_invoke_7((uint64_t)&v40);
    v3 = p_location[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&location, 8);
  v6 = objc_opt_new();
  contactStore = v2->_contactStore;
  v2->_contactStore = (CNContactStore *)v6;

  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "ps_contact_cache_notification");
  v8 = objc_claimAutoreleasedReturnValue();
  notificationQueue = v2->_notificationQueue;
  v2->_notificationQueue = (OS_dispatch_queue *)v8;

  v10 = objc_alloc(MEMORY[0x1E0D815F0]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 64);
  v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
  cachedContactForHandle = v2->_cachedContactForHandle;
  v2->_cachedContactForHandle = (_PASLock *)v12;

  v14 = objc_alloc(MEMORY[0x1E0D815F0]);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 64);
  v16 = objc_msgSend(v14, "initWithGuardedData:", v15);
  cachedFaceTimeableHandleForContactIdentifier = v2->_cachedFaceTimeableHandleForContactIdentifier;
  v2->_cachedFaceTimeableHandleForContactIdentifier = (_PASLock *)v16;

  location = 0;
  p_location = &location;
  v47 = 0x2050000000;
  v18 = (id)getIDSIDQueryControllerClass_softClass;
  v48 = getIDSIDQueryControllerClass_softClass;
  if (!getIDSIDQueryControllerClass_softClass)
  {
    v40 = v4;
    v41 = 3221225472;
    v42 = (uint64_t)__getIDSIDQueryControllerClass_block_invoke;
    v43 = &unk_1E43FEA00;
    v44 = &location;
    __getIDSIDQueryControllerClass_block_invoke((uint64_t)&v40);
    v18 = p_location[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&location, 8);
  objc_msgSend(v19, "sharedInstance");
  v20 = objc_claimAutoreleasedReturnValue();
  idsQueryController = v2->_idsQueryController;
  v2->_idsQueryController = (IDSIDQueryController *)v20;

  v40 = 0;
  v41 = (uint64_t)&v40;
  v42 = 0x2020000000;
  v22 = (id *)getIDSServiceNameFaceTimeSymbolLoc_ptr;
  v43 = (void *)getIDSServiceNameFaceTimeSymbolLoc_ptr;
  if (!getIDSServiceNameFaceTimeSymbolLoc_ptr)
  {
    v23 = (void *)IDSLibrary();
    v22 = (id *)dlsym(v23, "IDSServiceNameFaceTime");
    *(_QWORD *)(v41 + 24) = v22;
    getIDSServiceNameFaceTimeSymbolLoc_ptr = (uint64_t)v22;
  }
  _Block_object_dispose(&v40, 8);
  if (v22)
  {
    objc_storeStrong((id *)&v2->_faceTimeServiceName, *v22);
    -[IDSIDQueryController _warmupQueryCacheForService:](v2->_idsQueryController, "_warmupQueryCacheForService:", v2->_faceTimeServiceName);
    -[CNContactStore currentHistoryToken](v2->_contactStore, "currentHistoryToken");
    v24 = objc_claimAutoreleasedReturnValue();
    changeHistoryToken = v2->_changeHistoryToken;
    v2->_changeHistoryToken = (NSData *)v24;

    objc_initWeak(&location, v2);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __23___PSContactCache_init__block_invoke;
    block[3] = &unk_1E4400328;
    objc_copyWeak(&v38, &location);
    v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = (uint64_t)&v40;
    v42 = 0x2020000000;
    v28 = (id *)getCNContactStoreDidChangeNotificationSymbolLoc_ptr_0;
    v43 = (void *)getCNContactStoreDidChangeNotificationSymbolLoc_ptr_0;
    if (!getCNContactStoreDidChangeNotificationSymbolLoc_ptr_0)
    {
      v29 = (void *)ContactsLibrary_7();
      v28 = (id *)dlsym(v29, "CNContactStoreDidChangeNotification");
      *(_QWORD *)(v41 + 24) = v28;
      getCNContactStoreDidChangeNotificationSymbolLoc_ptr_0 = (uint64_t)v28;
    }
    _Block_object_dispose(&v40, 8);
    if (v28)
    {
      v30 = *v28;
      v35[0] = v4;
      v35[1] = 3221225472;
      v35[2] = __23___PSContactCache_init__block_invoke_2;
      v35[3] = &unk_1E4400350;
      v31 = v26;
      v36 = v31;
      objc_msgSend(v27, "addObserverForName:object:queue:usingBlock:", v30, 0, 0, v35);
      v32 = objc_claimAutoreleasedReturnValue();
      notificationCenterToken = v2->_notificationCenterToken;
      v2->_notificationCenterToken = v32;

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
      return v2;
    }
  }
  else
  {
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
  }
  dlerror();
  result = (_PSContactCache *)abort_report_np();
  __break(1u);
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_notificationCenterToken);

  v4.receiver = self;
  v4.super_class = (Class)_PSContactCache;
  -[_PSContactCache dealloc](&v4, sel_dealloc);
}

+ (_PSContactCache)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_33);
  return (_PSContactCache *)(id)sharedInstance__pasExprOnceResult;
}

- (void)_setContact:(id)a3 forHandle:(id)a4
{
  id v6;
  id v7;
  _PASLock *cachedContactForHandle;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  cachedContactForHandle = self->_cachedContactForHandle;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41___PSContactCache__setContact_forHandle___block_invoke;
  v11[3] = &unk_1E4401670;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](cachedContactForHandle, "runWithLockAcquired:", v11);

}

- (void)_removeAllHandlesForContactIdentifier:(id)a3
{
  id v4;
  _PASLock *cachedContactForHandle;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  cachedContactForHandle = self->_cachedContactForHandle;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57___PSContactCache__removeAllHandlesForContactIdentifier___block_invoke;
  v7[3] = &unk_1E44016C0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](cachedContactForHandle, "runWithLockAcquired:", v7);

}

- (void)_purge
{
  NSObject *v3;
  uint8_t v4[16];

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Purging cache.", v4, 2u);
  }

  -[_PASLock runWithLockAcquired:](self->_cachedContactForHandle, "runWithLockAcquired:", &__block_literal_global_45);
  -[_PASLock runWithLockAcquired:](self->_cachedFaceTimeableHandleForContactIdentifier, "runWithLockAcquired:", &__block_literal_global_46);
}

- (id)_getCachedContactForHandle:(id)a3
{
  id v4;
  id v5;
  _PASLock *cachedContactForHandle;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__16;
    v15 = __Block_byref_object_dispose__16;
    v16 = 0;
    cachedContactForHandle = self->_cachedContactForHandle;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46___PSContactCache__getCachedContactForHandle___block_invoke;
    v8[3] = &unk_1E4401728;
    v10 = &v11;
    v9 = v4;
    -[_PASLock runWithLockAcquired:](cachedContactForHandle, "runWithLockAcquired:", v8);
    v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (void)_setLikelyFaceTimeHandle:(id)a3 forContactIdentifier:(id)a4
{
  id v6;
  id v7;
  _PASLock *cachedFaceTimeableHandleForContactIdentifier;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  cachedFaceTimeableHandleForContactIdentifier = self->_cachedFaceTimeableHandleForContactIdentifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65___PSContactCache__setLikelyFaceTimeHandle_forContactIdentifier___block_invoke;
  v11[3] = &unk_1E4401670;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](cachedFaceTimeableHandleForContactIdentifier, "runWithLockAcquired:", v11);

}

- (id)_getCachedFaceTimeableHandleForContactIdentifier:(id)a3
{
  id v4;
  id v5;
  _PASLock *cachedFaceTimeableHandleForContactIdentifier;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__16;
    v15 = __Block_byref_object_dispose__16;
    v16 = 0;
    cachedFaceTimeableHandleForContactIdentifier = self->_cachedFaceTimeableHandleForContactIdentifier;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68___PSContactCache__getCachedFaceTimeableHandleForContactIdentifier___block_invoke;
    v8[3] = &unk_1E4401728;
    v10 = &v11;
    v9 = v4;
    -[_PASLock runWithLockAcquired:](cachedFaceTimeableHandleForContactIdentifier, "runWithLockAcquired:", v8);
    v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (void)_setContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSContactCache _setContact:forHandle:](self, "_setContact:forHandle:", v5, v6);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "phoneNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)MEMORY[0x1E0D15890];
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v11), "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "normalizedStringFromContactString:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[_PSContactCache _setContact:forHandle:](self, "_setContact:forHandle:", v5, v15);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "emailAddresses", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)MEMORY[0x1E0D15890];
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20), "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "normalizedStringFromContactString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[_PSContactCache _setContact:forHandle:](self, "_setContact:forHandle:", v5, v23);
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }

  }
}

- (void)visitAddContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_PSContactCache visitAddContactEvent:].cold.1();

  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSContactCache _setContact:](self, "_setContact:", v6);
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_PSContactCache visitUpdateContactEvent:].cold.1();

  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactCache _removeAllHandlesForContactIdentifier:](self, "_removeAllHandlesForContactIdentifier:", v7);

  objc_msgSend(v4, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSContactCache _setContact:](self, "_setContact:", v8);
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_PSContactCache visitDeleteContactEvent:].cold.1();

  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSContactCache _removeAllHandlesForContactIdentifier:](self, "_removeAllHandlesForContactIdentifier:", v6);
}

- (void)syncChangeHistory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSContactCache: Received a Drop Everything change history event. Purging contact cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (id)fetchMeContact
{
  CNContactStore *contactStore;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  contactStore = self->_contactStore;
  getCNContactIdentifierKey_4();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](contactStore, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v7)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSContactCache fetchMeContact].cold.1();

  }
  else if (v6)
  {
    goto LABEL_9;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Me Card query returns nil in _PSContactCache. Error: %@", buf, 0xCu);
  }

  v6 = 0;
LABEL_9:
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Caching me contact results for future use", buf, 2u);
  }

  -[_PSContactCache _setContact:forHandle:](self, "_setContact:forHandle:", v6, CFSTR("kMeSentinelString"));
  return v6;
}

- (id)getFaceTimeableHandleForContact:(id)a3 interactionStore:(id)a4 seedRecipientHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  int64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  int v64;
  NSObject *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  int64_t v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  __objc2_class **v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int64_t v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  int v95;
  NSObject *v96;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int64_t v110;
  id v111;
  NSObject *v112;
  _BOOL4 v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[4];
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[4];
  id v147;
  _QWORD v148[4];
  id v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _QWORD v152[2];
  uint8_t buf[4];
  id v154;
  __int16 v155;
  void *v156;
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v20 = 0;
    goto LABEL_123;
  }
  objc_msgSend(v8, "phoneNumbers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_53);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "emailAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_54);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "count");
  v16 = objc_msgSend(v14, "count") + v15;
  if (!v16)
  {
    v20 = 0;
    goto LABEL_122;
  }
  if (v16 == 1)
  {
    objc_msgSend(v12, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(v14, "firstObject");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    goto LABEL_122;
  }
  objc_msgSend(v8, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactCache _getCachedFaceTimeableHandleForContactIdentifier:](self, "_getCachedFaceTimeableHandleForContactIdentifier:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v132 = v22;
  if (v22)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v22, "handle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v154 = v25;
      v155 = 2112;
      v156 = v26;
      _os_log_impl(&dword_1A07F4000, v23, OS_LOG_TYPE_DEFAULT, "Returning cached FaceTimeable handle %@ for contact UUID %@", buf, 0x16u);

    }
    objc_msgSend(v132, "handle");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_121;
  }
  v130 = v14;
  v131 = v12;
  objc_msgSend(v8, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v28;
  +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v152[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 2);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v129 = v9;
  +[_PSInteractionStoreUtils mostRecentInteractionInvolvingMatchingIdentifier:store:bundleIds:](_PSInteractionStoreUtils, "mostRecentInteractionInvolvingMatchingIdentifier:store:bundleIds:", v27, v9, v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v128 = v30;
  if (!v30)
  {
    v133 = 0;
    v42 = 0;
    goto LABEL_32;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v154 = v32;
    _os_log_impl(&dword_1A07F4000, v31, OS_LOG_TYPE_DEFAULT, "Found previous FaceTime interaction to cache handle for contact UUID %@, checking with IDS filter", buf, 0xCu);

  }
  objc_msgSend(v30, "recipients");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = MEMORY[0x1E0C809B0];
  v148[1] = 3221225472;
  v148[2] = __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_57;
  v148[3] = &unk_1E4401770;
  v34 = v8;
  v149 = v34;
  objc_msgSend(v33, "_pas_filteredArrayWithTest:", v148);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "identifier");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v131, "containsObject:", v20) & 1) == 0
    && !objc_msgSend(v130, "containsObject:", v20))
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v34, "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v154 = v45;
      _os_log_impl(&dword_1A07F4000, v44, OS_LOG_TYPE_DEFAULT, "Found previous FaceTime interaction for best FaceTime handle, but handle no longer associated to contact %@", buf, 0xCu);

    }
    goto LABEL_28;
  }
  v37 = -[_PSContactCache getFaceTimeIDSStatusForHandle:contactType:](self, "getFaceTimeIDSStatusForHandle:contactType:", v20, objc_msgSend(v36, "type"));
  if (!v37)
  {
    v42 = v20;
    v133 = objc_msgSend(v36, "type");
    goto LABEL_30;
  }
  if (v37 != 1)
  {
LABEL_28:
    v133 = 0;
    v42 = 0;
LABEL_30:
    v43 = 1;
    goto LABEL_31;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v34, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v154 = v20;
    v155 = 2112;
    v156 = v39;
    _os_log_impl(&dword_1A07F4000, v38, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);

  }
  objc_msgSend(v34, "identifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactCache _setLikelyFaceTimeHandle:forContactIdentifier:](self, "_setLikelyFaceTimeHandle:forContactIdentifier:", v20, v40);

  v41 = v20;
  v133 = 0;
  v42 = 0;
  v43 = 0;
LABEL_31:

  if (!v43)
    goto LABEL_120;
LABEL_32:
  v46 = v131;
  if (objc_msgSend(v131, "count"))
  {
    objc_msgSend(v8, "identifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dateByAddingTimeInterval:", -86400.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils someIMessageInteractionInvolvingContactIdentifier:store:contactType:afterStartDate:](_PSInteractionStoreUtils, "someIMessageInteractionInvolvingContactIdentifier:store:contactType:afterStartDate:", v47, v129, 1, v49);
    v50 = objc_claimAutoreleasedReturnValue();

    v51 = (void *)v50;
    if (v50)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "identifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v154 = v53;
        _os_log_impl(&dword_1A07F4000, v52, OS_LOG_TYPE_DEFAULT, "Found previous phone iMessage interaction to cache handle for contact UUID %@, checking with IDS filter", buf, 0xCu);

      }
      v134 = v51;
      objc_msgSend(v51, "recipients");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v146[0] = MEMORY[0x1E0C809B0];
      v146[1] = 3221225472;
      v146[2] = __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_59;
      v146[3] = &unk_1E4401770;
      v55 = v8;
      v147 = v55;
      objc_msgSend(v54, "_pas_filteredArrayWithTest:", v146);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "firstObject");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = v57;
      objc_msgSend(v57, "identifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v131, "containsObject:", v59) & 1) != 0
        || objc_msgSend(v130, "containsObject:", v59))
      {
        v60 = -[_PSContactCache getFaceTimeIDSStatusForHandle:contactType:](self, "getFaceTimeIDSStatusForHandle:contactType:", v59, objc_msgSend(v58, "type"));
        if (v60 == 1)
        {
          v126 = v58;
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v55, "identifier");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v154 = v59;
            v155 = 2112;
            v156 = v62;
            _os_log_impl(&dword_1A07F4000, v61, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);

          }
          objc_msgSend(v55, "identifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSContactCache _setLikelyFaceTimeHandle:forContactIdentifier:](self, "_setLikelyFaceTimeHandle:forContactIdentifier:", v59, v63);

          v20 = v59;
          v64 = 0;
          v58 = v126;
        }
        else
        {
          v64 = 1;
          if (!v42 && !v60)
          {
            v42 = v59;
            v133 = objc_msgSend(v58, "type");
          }
        }
      }
      else
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v55, "identifier");
          v66 = v58;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v154 = v67;
          _os_log_impl(&dword_1A07F4000, v65, OS_LOG_TYPE_DEFAULT, "Found previous phone iMessage interaction for best FaceTime handle, but handle no longer associated to contact %@", buf, 0xCu);

          v58 = v66;
        }

        v64 = 1;
      }

      if (!v64)
      {
        v100 = v134;
        goto LABEL_119;
      }
      v46 = v131;
      v51 = v134;
    }

  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v154 = v69;
    _os_log_impl(&dword_1A07F4000, v68, OS_LOG_TYPE_DEFAULT, "Checking IDS eligibility for phone numbers belong to contact UUID %@", buf, 0xCu);

  }
  v135 = v10;

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v70 = v46;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v142, v151, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v143;
    do
    {
      for (i = 0; i != v72; ++i)
      {
        if (*(_QWORD *)v143 != v73)
          objc_enumerationMutation(v70);
        v75 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
        v76 = -[_PSContactCache getFaceTimeIDSStatusForHandle:contactType:](self, "getFaceTimeIDSStatusForHandle:contactType:", v75, 1);
        if (v76)
        {
          if (v76 == 1)
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v96 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v8, "identifier");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v154 = v75;
              v155 = 2112;
              v156 = v98;
LABEL_79:
              _os_log_impl(&dword_1A07F4000, v96, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);

            }
            goto LABEL_80;
          }
        }
        else if (!v42 || objc_msgSend(v135, "isEqualToString:", v75))
        {
          v77 = v75;

          v133 = 1;
          v42 = v77;
        }
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v142, v151, 16);
    }
    while (v72);
  }

  v10 = v135;
  if (objc_msgSend(v130, "count"))
  {
    objc_msgSend(v8, "identifier");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dateByAddingTimeInterval:", -86400.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils someIMessageInteractionInvolvingContactIdentifier:store:contactType:afterStartDate:](_PSInteractionStoreUtils, "someIMessageInteractionInvolvingContactIdentifier:store:contactType:afterStartDate:", v78, v129, 2, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = off_1E43FD000;
    if (!v81)
    {
LABEL_91:

      goto LABEL_92;
    }
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v154 = v84;
      _os_log_impl(&dword_1A07F4000, v83, OS_LOG_TYPE_DEFAULT, "Found previous email iMessage interaction to cache handle for contact UUID %@", buf, 0xCu);

    }
    objc_msgSend(v81, "recipients");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v140[0] = MEMORY[0x1E0C809B0];
    v140[1] = 3221225472;
    v140[2] = __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_60;
    v140[3] = &unk_1E4401770;
    v125 = v8;
    v141 = v125;
    objc_msgSend(v85, "_pas_filteredArrayWithTest:", v140);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "firstObject");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v87, "identifier");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v81;
    if ((objc_msgSend(v70, "containsObject:", v88) & 1) == 0
      && !objc_msgSend(v130, "containsObject:", v88))
    {
      v124 = v88;
      v82 = off_1E43FD000;
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v125, "identifier");
        v102 = v87;
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v154 = v103;
        _os_log_impl(&dword_1A07F4000, v101, OS_LOG_TYPE_DEFAULT, "Found previous email iMessage interaction for best FaceTime handle, but handle no longer associated to contact %@", buf, 0xCu);

        v87 = v102;
      }

      v95 = 1;
      v88 = v124;
      goto LABEL_89;
    }
    v89 = -[_PSContactCache getFaceTimeIDSStatusForHandle:contactType:](self, "getFaceTimeIDSStatusForHandle:contactType:", v88, objc_msgSend(v87, "type"));
    if (v89 == 1)
    {
      v90 = v88;
      v91 = v87;
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v125, "identifier");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v154 = v90;
        v155 = 2112;
        v156 = v93;
        _os_log_impl(&dword_1A07F4000, v92, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);

      }
      objc_msgSend(v125, "identifier");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v90;
      -[_PSContactCache _setLikelyFaceTimeHandle:forContactIdentifier:](self, "_setLikelyFaceTimeHandle:forContactIdentifier:", v90, v94);

      v20 = v90;
      v95 = 0;
      v87 = v91;
    }
    else
    {
      v95 = 1;
      if (!v89)
      {
        v82 = off_1E43FD000;
        if (!v42)
        {
          v42 = v88;
          v133 = 2;
        }
        goto LABEL_89;
      }
    }
    v82 = off_1E43FD000;
LABEL_89:

    if (v95)
    {
      v81 = v127;
      goto LABEL_91;
    }
    v100 = v127;
LABEL_119:

    goto LABEL_120;
  }
  v82 = off_1E43FD000;
LABEL_92:
  if (objc_msgSend(v70, "count"))
  {
    if (v133 == 1)
    {
      v20 = v42;
    }
    else
    {
      objc_msgSend(v8, "phoneNumbers");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "firstObject");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "value");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "formattedInternationalStringValue");
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[__objc2_class generalChannel](v82[8], "generalChannel");
    v118 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v154 = v20;
      v155 = 2112;
      v156 = v119;
      _os_log_impl(&dword_1A07F4000, v118, OS_LOG_TYPE_DEFAULT, "As best effort guess, using phone number %@ for contact UUID %@", buf, 0x16u);

    }
    goto LABEL_120;
  }
  -[__objc2_class generalChannel](v82[8], "generalChannel");
  v104 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v154 = v105;
    _os_log_impl(&dword_1A07F4000, v104, OS_LOG_TYPE_DEFAULT, "Checking IDS eligibility for emails belong to contact UUID %@", buf, 0xCu);

  }
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v70 = v130;
  v106 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v136, v150, 16);
  if (!v106)
  {
LABEL_110:

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v112 = objc_claimAutoreleasedReturnValue();
    v113 = os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT);
    if (v42)
    {
      v10 = v135;
      if (v113)
      {
        objc_msgSend(v8, "identifier");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v154 = v42;
        v155 = 2112;
        v156 = v114;
        _os_log_impl(&dword_1A07F4000, v112, OS_LOG_TYPE_DEFAULT, "Caching fallback handle %@ for contact UUID %@", buf, 0x16u);

      }
      v42 = v42;
      v20 = v42;
    }
    else
    {
      v10 = v135;
      if (v113)
      {
        objc_msgSend(v8, "identifier");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v154 = 0;
        v155 = 2112;
        v156 = v122;
        _os_log_impl(&dword_1A07F4000, v112, OS_LOG_TYPE_DEFAULT, "Caching handle %@ for contact UUID %@", buf, 0x16u);

      }
      objc_msgSend(v8, "identifier");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSContactCache _setLikelyFaceTimeHandle:forContactIdentifier:](self, "_setLikelyFaceTimeHandle:forContactIdentifier:", 0, v123);

      v42 = 0;
      v20 = 0;
    }
    goto LABEL_120;
  }
  v107 = v106;
  v108 = *(_QWORD *)v137;
LABEL_99:
  v109 = 0;
  while (1)
  {
    if (*(_QWORD *)v137 != v108)
      objc_enumerationMutation(v70);
    v75 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v109);
    v110 = -[_PSContactCache getFaceTimeIDSStatusForHandle:contactType:](self, "getFaceTimeIDSStatusForHandle:contactType:", v75, 1);
    if (!v110)
    {
      if (!v42 || objc_msgSend(v135, "isEqualToString:", v75))
      {
        v111 = v75;

        v42 = v111;
      }
      goto LABEL_108;
    }
    if (v110 == 1)
      break;
LABEL_108:
    if (v107 == ++v109)
    {
      v107 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v136, v150, 16);
      if (v107)
        goto LABEL_99;
      goto LABEL_110;
    }
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v96 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v154 = v75;
    v155 = 2112;
    v156 = v98;
    goto LABEL_79;
  }
LABEL_80:

  objc_msgSend(v8, "identifier");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactCache _setLikelyFaceTimeHandle:forContactIdentifier:](self, "_setLikelyFaceTimeHandle:forContactIdentifier:", v75, v99);

  v20 = v75;
  v10 = v135;
LABEL_120:

  v9 = v129;
  v14 = v130;
  v12 = v131;
  v24 = 0;
LABEL_121:

LABEL_122:
LABEL_123:

  return v20;
}

- (int64_t)getFaceTimeIDSStatusForHandle:(id)a3 contactType:(unint64_t)a4
{
  id v6;
  int64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BYTE v15[24];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v7 = 1;
    goto LABEL_16;
  }
  if (a4 - 3 < 0xFFFFFFFFFFFFFFFELL)
  {
    v7 = 2;
    goto LABEL_16;
  }
  v8 = v6;
  if (a4 == 1)
  {
    *(_QWORD *)v15 = 0;
    *(_QWORD *)&v15[8] = v15;
    *(_QWORD *)&v15[16] = 0x2020000000;
    v9 = getIDSCopyIDForPhoneNumberSymbolLoc_ptr;
    v16 = getIDSCopyIDForPhoneNumberSymbolLoc_ptr;
    if (!getIDSCopyIDForPhoneNumberSymbolLoc_ptr)
    {
      v10 = (void *)IDSLibrary();
      v9 = dlsym(v10, "IDSCopyIDForPhoneNumber");
      *(_QWORD *)(*(_QWORD *)&v15[8] + 24) = v9;
      getIDSCopyIDForPhoneNumberSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(v15, 8);
    if (!v9)
      goto LABEL_17;
  }
  else
  {
    *(_QWORD *)v15 = 0;
    *(_QWORD *)&v15[8] = v15;
    *(_QWORD *)&v15[16] = 0x2020000000;
    v9 = (void *)getIDSCopyIDForEmailAddressSymbolLoc_ptr;
    v16 = (void *)getIDSCopyIDForEmailAddressSymbolLoc_ptr;
    if (!getIDSCopyIDForEmailAddressSymbolLoc_ptr)
    {
      v11 = (void *)IDSLibrary();
      v9 = dlsym(v11, "IDSCopyIDForEmailAddress");
      *(_QWORD *)(*(_QWORD *)&v15[8] + 24) = v9;
      getIDSCopyIDForEmailAddressSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(v15, 8);
    if (!v9)
    {
LABEL_17:
      -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
      __break(1u);
    }
  }
  v12 = (void *)((uint64_t (*)(id))v9)(v8);

  v7 = -[IDSIDQueryController _currentIDStatusForDestination:service:respectExpiry:listenerID:](self->_idsQueryController, "_currentIDStatusForDestination:service:respectExpiry:listenerID:", v12, self->_faceTimeServiceName, 0, CFSTR("com.apple.PeopleSuggester.IDSListener"), *(_QWORD *)v15);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v15 = 138412546;
    *(_QWORD *)&v15[4] = v8;
    *(_WORD *)&v15[12] = 2048;
    *(_QWORD *)&v15[14] = v7;
    _os_log_impl(&dword_1A07F4000, v13, OS_LOG_TYPE_INFO, "Handle %@ received IDS status %ld", v15, 0x16u);
  }

LABEL_16:
  return v7;
}

- (id)getMeContact
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  -[_PSContactCache _getCachedContactForHandle:](self, "_getCachedContactForHandle:", CFSTR("kMeSentinelString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[_PSContactCache getMeContact].cold.1();

    objc_msgSend(v3, "contact");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_PSContactCache fetchMeContact](self, "fetchMeContact");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)getContactForHandle:(id)a3 handleType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  CNContactStore *contactStore;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id CNContactClass_3;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  CNContactStore *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[24];
  void *v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    return 0;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0D15890], "normalizedStringFromContactString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSContactCache _getCachedContactForHandle:](self, "_getCachedContactForHandle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    switch(a4)
    {
      case 2:
        CNContactClass_3 = getCNContactClass_3();
        v30 = 0;
        v31 = &v30;
        v32 = 0x2050000000;
        v19 = (void *)getCNPhoneNumberClass_softClass_3;
        v33 = getCNPhoneNumberClass_softClass_3;
        if (!getCNPhoneNumberClass_softClass_3)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getCNPhoneNumberClass_block_invoke_3;
          v35 = &unk_1E43FEA00;
          v36 = &v30;
          __getCNPhoneNumberClass_block_invoke_3((uint64_t)buf);
          v19 = (void *)v31[3];
        }
        v20 = objc_retainAutorelease(v19);
        _Block_object_dispose(&v30, 8);
        objc_msgSend(v20, "phoneNumberWithStringValue:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CNContactClass_3, "predicateForContactsMatchingPhoneNumber:", v21);
        v17 = objc_claimAutoreleasedReturnValue();

        break;
      case 1:
        objc_msgSend(getCNContactClass_3(), "predicateForContactsMatchingEmailAddress:", v8);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 0:
        contactStore = self->_contactStore;
        -[_PSContactCache contactKeysToFetch](self, "contactKeysToFetch");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v8, v14, &v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v29;

        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412803;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2117;
          *(_QWORD *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2112;
          v35 = v16;
          _os_log_impl(&dword_1A07F4000, v17, OS_LOG_TYPE_DEFAULT, "_PSContactCache: ZKW FaceTime suggestions attempted to lookup contact for uuid %@, found contact %{sensitive}@, error %@", buf, 0x20u);
        }
LABEL_22:

        if (!v15 || v16)
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v8;
            _os_log_impl(&dword_1A07F4000, v27, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Unable to find contact for handle %@, caching nil", buf, 0xCu);
          }

          -[_PSContactCache _setContact:forHandle:](self, "_setContact:forHandle:", 0, v8);
          v11 = 0;
        }
        else
        {
          -[_PSContactCache _setContact:](self, "_setContact:", v15);
          v11 = v15;
        }

        goto LABEL_29;
      default:
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[_PSContactCache getContactForHandle:handleType:].cold.1();

        v17 = 0;
        break;
    }
    v23 = self->_contactStore;
    -[_PSContactCache contactKeysToFetch](self, "contactKeysToFetch");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](v23, "unifiedContactsMatchingPredicate:keysToFetch:error:", v17, v24, &v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v28;

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412803;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2117;
      *(_QWORD *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2112;
      v35 = v16;
      _os_log_impl(&dword_1A07F4000, v26, OS_LOG_TYPE_DEFAULT, "_PSContactCache: ZKW FaceTime suggestions attempted to lookup contact for handle %@, found contacts %{sensitive}@, error %@", buf, 0x20u);
    }

    objc_msgSend(v25, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_PSContactCache getContactForHandle:handleType:].cold.2();

  objc_msgSend(v9, "contact");
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v11;
}

- (id)contactKeysToFetch
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  id v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v2 = (void *)getCNContactFormatterClass_softClass_5;
  v23 = getCNContactFormatterClass_softClass_5;
  if (!getCNContactFormatterClass_softClass_5)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = (uint64_t)__getCNContactFormatterClass_block_invoke_5;
    v18 = &unk_1E43FEA00;
    v19 = &v20;
    __getCNContactFormatterClass_block_invoke_5((uint64_t)&v15);
    v2 = (void *)v21[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v3, "descriptorForRequiredKeysForStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getCNContactIdentifierKey_4();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v15 = 0;
  v16 = (uint64_t)&v15;
  v17 = 0x2020000000;
  v6 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_6;
  v18 = (void *)getCNContactPhoneNumbersKeySymbolLoc_ptr_6;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_6)
  {
    v7 = (void *)ContactsLibrary_7();
    v6 = (id *)dlsym(v7, "CNContactPhoneNumbersKey");
    *(_QWORD *)(v16 + 24) = v6;
    getCNContactPhoneNumbersKeySymbolLoc_ptr_6 = (uint64_t)v6;
  }
  _Block_object_dispose(&v15, 8);
  if (!v6)
    goto LABEL_10;
  v8 = *v6;
  v24[1] = v8;
  v15 = 0;
  v16 = (uint64_t)&v15;
  v17 = 0x2020000000;
  v9 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_6;
  v18 = (void *)getCNContactEmailAddressesKeySymbolLoc_ptr_6;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_6)
  {
    v10 = (void *)ContactsLibrary_7();
    v9 = (id *)dlsym(v10, "CNContactEmailAddressesKey");
    *(_QWORD *)(v16 + 24) = v9;
    getCNContactEmailAddressesKeySymbolLoc_ptr_6 = (uint64_t)v9;
  }
  _Block_object_dispose(&v15, 8);
  if (!v9)
  {
LABEL_10:
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v25 = *v9;
  v26 = v4;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = v25;
  objc_msgSend(v11, "arrayWithObjects:count:", v24, 4, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTimeServiceName, 0);
  objc_storeStrong((id *)&self->_idsQueryController, 0);
  objc_storeStrong((id *)&self->_cachedFaceTimeableHandleForContactIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedContactForHandle, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenterToken, 0);
  objc_storeStrong((id *)&self->_changeHistoryToken, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)visitAddContactEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSContactCache: Processing Add Contact change history event from ContactStore.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)visitUpdateContactEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSContactCache: Processing Update Contact change history event from ContactStore.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)visitDeleteContactEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSContactCache: Processing Delete Contact change history event from ContactStore.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)fetchMeContact
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error fetching me contact from store in _PSContactCache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getMeContact
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSContactCache: Returning cached contact for me", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)getContactForHandle:handleType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "_PSContactCache: Unknown handle type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getContactForHandle:handleType:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1A07F4000, v0, OS_LOG_TYPE_DEBUG, "_PSContactCache: Returning cached contact for %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
