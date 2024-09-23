@implementation ICInAppMessageStore

void __74__ICInAppMessageStore_getStorePropertyForKey_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ICInAppMessageStore_getStorePropertyForKey_bundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4390E58;
  v8 = *(id *)(a1 + 56);
  v6 = v2;
  v7 = *(id *)(a1 + 48);
  v4 = v2;
  dispatch_async(v3, block);

}

- (id)_defaultStoreFilePath
{
  void *v2;
  void *v3;
  void *v4;

  ICDefaultCacheDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v2, CFSTR("InAppMessages"), CFSTR("MessageStore.plist"), 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)getStorePropertyForKey:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__ICInAppMessageStore_getStorePropertyForKey_bundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E4390EA8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(accessQueue, v15);

}

- (void)getAllMessageEntriesForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICInAppMessageStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ICInAppMessageStore_getAllMessageEntriesForBundleIdentifiers_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

void __74__ICInAppMessageStore_getStorePropertyForKey_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

uint64_t __56__ICInAppMessageStore_allStorePropertiesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (ICInAppMessageStore)init
{
  void *v3;
  ICInAppMessageStore *v4;

  -[ICInAppMessageStore _defaultStoreFilePath](self, "_defaultStoreFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICInAppMessageStore initWithFilePath:](self, "initWithFilePath:", v3);

  return v4;
}

- (ICInAppMessageStore)initWithFilePath:(id)a3
{
  id v5;
  ICInAppMessageStore *v6;
  ICInAppMessageStore *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *messageEntryCache;
  NSMutableDictionary *v10;
  NSMutableDictionary *globalPropertyCache;
  NSMutableDictionary *v12;
  NSMutableDictionary *applicationPropertyCache;
  NSMutableDictionary *v14;
  NSMutableDictionary *messageMetadataCache;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *accessQueue;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *callbackQueue;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICInAppMessageStore;
  v6 = -[ICInAppMessageStore init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filePath, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    messageEntryCache = v7->_messageEntryCache;
    v7->_messageEntryCache = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    globalPropertyCache = v7->_globalPropertyCache;
    v7->_globalPropertyCache = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    applicationPropertyCache = v7->_applicationPropertyCache;
    v7->_applicationPropertyCache = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    messageMetadataCache = v7->_messageMetadataCache;
    v7->_messageMetadataCache = v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageStore.accessQueue", v17);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.iTunesCloud.ICInAppMessageStore.callbackQueue", v21);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v22;

    -[ICInAppMessageStore _load](v7, "_load");
  }

  return v7;
}

- (void)_load
{
  NSMutableDictionary *v3;
  NSMutableDictionary *messageEntryCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *globalPropertyCache;
  NSMutableArray *v9;
  NSMutableArray *pendingEvents;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *applicationPropertyCache;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _QWORD v47[5];
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  ICInAppMessageStore *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  messageEntryCache = self->_messageEntryCache;
  self->_messageEntryCache = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = self->_messageEntryCache;
  self->_messageEntryCache = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  globalPropertyCache = self->_globalPropertyCache;
  self->_globalPropertyCache = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", self->_filePath);
  if (objc_msgSend(v11, "length"))
  {
    v48 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, &v48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v48;
    if (v13)
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v51 = self;
        v52 = 2114;
        v53 = v13;
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to read message store data. err=%{public}@", buf, 0x16u);
      }

    }
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v12, "ic_dictionaryValueForKey:", CFSTR("properties"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v16 = (NSMutableDictionary *)objc_msgSend(v15, "mutableCopy");
        v17 = self->_globalPropertyCache;
        self->_globalPropertyCache = v16;

      }
      v38 = v15;
      v39 = v13;
      v40 = v11;
      objc_msgSend(v12, "ic_dictionaryValueForKey:", CFSTR("applicationProperties"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        v19 = (NSMutableDictionary *)objc_msgSend(v18, "mutableCopy");
        applicationPropertyCache = self->_applicationPropertyCache;
        self->_applicationPropertyCache = v19;

      }
      v37 = v18;
      objc_msgSend(v12, "ic_dictionaryValueForKey:", CFSTR("messages"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = _NSIsNSDictionary();
      v23 = MEMORY[0x1E0C809B0];
      if (v22)
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __28__ICInAppMessageStore__load__block_invoke;
        v47[3] = &unk_1E438DDC8;
        v47[4] = self;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v47);
      }
      v36 = v21;
      objc_msgSend(v12, "ic_dictionaryValueForKey:", CFSTR("metadata"));
      v46[0] = v23;
      v46[1] = 3221225472;
      v46[2] = __28__ICInAppMessageStore__load__block_invoke_35;
      v46[3] = &unk_1E438DDC8;
      v46[4] = self;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v46);
      objc_msgSend(v12, "ic_arrayValueForKey:", CFSTR("events"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v43 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            v30 = (void *)MEMORY[0x1E0CB3710];
            v31 = objc_opt_class();
            v41 = 0;
            objc_msgSend(v30, "unarchivedObjectOfClass:fromData:error:", v31, v29, &v41);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v41;
            if (v32)
            {
              -[NSMutableArray addObject:](self->_pendingEvents, "addObject:", v32);
            }
            else
            {
              v34 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v51 = self;
                v52 = 2114;
                v53 = v33;
                _os_log_impl(&dword_1A03E3000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize event entry. err=%{public}@", buf, 0x16u);
              }

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v26);
      }

      v11 = v40;
      v13 = v39;
    }

  }
}

void __75__ICInAppMessageStore_getAllMessageEntriesForBundleIdentifiers_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allValues");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "count"))
          objc_msgSend(v2, "addObjectsFromArray:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)allStorePropertiesWithCompletion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ICInAppMessageStore_allStorePropertiesWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __56__ICInAppMessageStore_allStorePropertiesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__ICInAppMessageStore_allStorePropertiesWithCompletion___block_invoke_2;
  v6[3] = &unk_1E4390EF8;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

- (void)updateStoreProperty:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__ICInAppMessageStore_updateStoreProperty_forKey_completion___block_invoke;
  v15[3] = &unk_1E4390EA8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(accessQueue, v15);

}

- (void)getStorePropertyForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICInAppMessageStore_getStorePropertyForKey_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void)updateStoreProperty:(id)a3 forKey:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *accessQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ICInAppMessageStore_updateStoreProperty_forKey_bundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E438DD78;
  block[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_async(accessQueue, block);

}

- (void)allApplicationStorePropertiesWithCompletion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ICInAppMessageStore_allApplicationStorePropertiesWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)addMessageEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICInAppMessageStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ICInAppMessageStore_addMessageEntry_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void)updateMessageEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICInAppMessageStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICInAppMessageStore_updateMessageEntry_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void)removeMessageEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInAppMessageStore removeMessageEntryWithIdentifier:forBundleIdentifier:completion:](self, "removeMessageEntryWithIdentifier:forBundleIdentifier:completion:", v9, v10, v6);

}

- (void)removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__ICInAppMessageStore_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E4390EA8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(accessQueue, v15);

}

- (void)removeAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ICInAppMessageStore_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void)getMessageEntryWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__ICInAppMessageStore_getMessageEntryWithIdentifier_bundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E4390EA8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(accessQueue, v15);

}

- (void)getAllMessageEntriesWithCompletion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ICInAppMessageStore_getAllMessageEntriesWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)getAllMessageEntriesForBundleIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICInAppMessageStore getAllMessageEntriesForBundleIdentifiers:completion:](self, "getAllMessageEntriesForBundleIdentifiers:completion:", v8, v7);

}

- (void)resetStoreWithCompletion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ICInAppMessageStore_resetStoreWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)addPendingMessageEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICInAppMessageStore_addPendingMessageEvent_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void)pendingMessageEventsWithCompletion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ICInAppMessageStore_pendingMessageEventsWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)removePendingMessageEventWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ICInAppMessageStore_removePendingMessageEventWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void)getMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__ICInAppMessageStore_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E4390EA8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(accessQueue, v15);

}

- (void)getAllMetadataForBundleIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICInAppMessageStore getAllMetadataForBundleIdentifiers:completion:](self, "getAllMetadataForBundleIdentifiers:completion:", v8, v7);

}

- (void)getAllMetadataForBundleIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICInAppMessageStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ICInAppMessageStore_getAllMetadataForBundleIdentifiers_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void)updateMetadata:(id)a3 messageIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *accessQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ICInAppMessageStore_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E438DD78;
  block[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_async(accessQueue, block);

}

- (void)removeMetadataForMessageIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__ICInAppMessageStore_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E4390EA8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(accessQueue, v15);

}

- (void)removeAllMetadataForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageStore_removeAllMetadataForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void)_commit
{
  void *v3;
  void *v4;
  NSMutableDictionary *globalPropertyCache;
  NSMutableDictionary *applicationPropertyCache;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *messageEntryCache;
  id v10;
  void *v11;
  NSMutableDictionary *messageMetadataCache;
  id v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  ICInAppMessageStore *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  ICInAppMessageStore *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v4 = v3;
  globalPropertyCache = self->_globalPropertyCache;
  if (globalPropertyCache)
    objc_msgSend(v3, "setObject:forKey:", globalPropertyCache, CFSTR("properties"));
  applicationPropertyCache = self->_applicationPropertyCache;
  if (applicationPropertyCache)
    objc_msgSend(v4, "setObject:forKey:", applicationPropertyCache, CFSTR("applicationProperties"));
  v7 = MEMORY[0x1E0C809B0];
  if (self->_messageEntryCache)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_messageEntryCache, "count"));
    messageEntryCache = self->_messageEntryCache;
    v38[0] = v7;
    v38[1] = 3221225472;
    v38[2] = __30__ICInAppMessageStore__commit__block_invoke;
    v38[3] = &unk_1E438DDF0;
    v38[4] = self;
    v39 = v8;
    v10 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](messageEntryCache, "enumerateKeysAndObjectsUsingBlock:", v38);
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("messages"));

  }
  if (self->_messageMetadataCache)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_messageMetadataCache, "count"));
    messageMetadataCache = self->_messageMetadataCache;
    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __30__ICInAppMessageStore__commit__block_invoke_43;
    v36[3] = &unk_1E438DDF0;
    v36[4] = self;
    v37 = v11;
    v13 = v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](messageMetadataCache, "enumerateKeysAndObjectsUsingBlock:", v36);
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("metadata"));

  }
  if (self->_pendingEvents)
  {
    v28 = v4;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_pendingEvents, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = self;
    v15 = self->_pendingEvents;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v31 = 0;
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, &v31);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v31;
          if (v21)
          {
            objc_msgSend(v14, "addObject:", v21);
          }
          else
          {
            v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v20, "eventIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v41 = v29;
              v42 = 2114;
              v43 = v24;
              v44 = 2114;
              v45 = v22;
              _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize event entry with identifier %{public}@. err=%{public}@", buf, 0x20u);

            }
          }

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v17);
    }

    v4 = v28;
    objc_msgSend(v28, "setObject:forKey:", v14, CFSTR("events"));

    self = v29;
  }
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v30;
  if (v26)
  {
    v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v41 = self;
      v42 = 2114;
      v43 = v26;
      _os_log_impl(&dword_1A03E3000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to commit message store data. err=%{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v25, "writeToFile:atomically:", self->_filePath, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_messageMetadataCache, 0);
  objc_storeStrong((id *)&self->_applicationPropertyCache, 0);
  objc_storeStrong((id *)&self->_globalPropertyCache, 0);
  objc_storeStrong((id *)&self->_messageEntryCache, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __30__ICInAppMessageStore__commit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__ICInAppMessageStore__commit__block_invoke_2;
  v11[3] = &unk_1E438FA60;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v10 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v7);
}

void __30__ICInAppMessageStore__commit__block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__ICInAppMessageStore__commit__block_invoke_2_44;
  v11[3] = &unk_1E438FA60;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v10 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v7);
}

void __30__ICInAppMessageStore__commit__block_invoke_2_44(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);
  }
  else
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v12 = v9;
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize message metadata entry with identifier %{public}@. err=%{public}@", buf, 0x20u);
    }

  }
}

void __30__ICInAppMessageStore__commit__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);
  }
  else
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v12 = v9;
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize message entry with identifier %{public}@. err=%{public}@", buf, 0x20u);
    }

  }
}

void __28__ICInAppMessageStore__load__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v9 = a2;
  v5 = a3;
  if (_NSIsNSDictionary())
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __28__ICInAppMessageStore__load__block_invoke_2;
    v10[3] = &unk_1E438DDA0;
    v7 = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = v7;
    v8 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v8, v9);

  }
}

void __28__ICInAppMessageStore__load__block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v9 = a2;
  v5 = a3;
  if (_NSIsNSDictionary())
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __28__ICInAppMessageStore__load__block_invoke_2_36;
    v10[3] = &unk_1E438DDA0;
    v7 = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = v7;
    v8 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v8, v9);

  }
}

void __28__ICInAppMessageStore__load__block_invoke_2_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (_NSIsNSData())
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);
    }
    else
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v13 = v10;
        v14 = 2114;
        v15 = v5;
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize message metadata entry with identifier %{public}@. err=%{public}@", buf, 0x20u);
      }

    }
  }

}

void __28__ICInAppMessageStore__load__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (_NSIsNSData())
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);
    }
    else
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v13 = v10;
        v14 = 2114;
        v15 = v5;
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize message entry with identifier %{public}@. err=%{public}@", buf, 0x20u);
      }

    }
  }

}

void __71__ICInAppMessageStore_removeAllMetadataForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_commit");
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ICInAppMessageStore_removeAllMetadataForBundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

uint64_t __71__ICInAppMessageStore_removeAllMetadataForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__ICInAppMessageStore_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_commit");
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__ICInAppMessageStore_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v6 = *(id *)(a1 + 56);
  dispatch_async(v4, block);

}

uint64_t __86__ICInAppMessageStore_removeMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__ICInAppMessageStore_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  }
  v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "_commit");
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ICInAppMessageStore_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v6 = *(id *)(a1 + 64);
  dispatch_async(v4, block);

}

uint64_t __84__ICInAppMessageStore_updateMetadata_messageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__ICInAppMessageStore_getAllMetadataForBundleIdentifiers_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "copy");

        if (objc_msgSend(v9, "count"))
          objc_msgSend(v2, "addEntriesFromDictionary:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  v10 = *(void **)(a1 + 48);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__ICInAppMessageStore_getAllMetadataForBundleIdentifiers_completion___block_invoke_2;
  v13[3] = &unk_1E4390EF8;
  v14 = v2;
  v15 = v10;
  v12 = v2;
  dispatch_async(v11, v13);

}

uint64_t __69__ICInAppMessageStore_getAllMetadataForBundleIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __83__ICInAppMessageStore_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__ICInAppMessageStore_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2;
  v8[3] = &unk_1E4390EF8;
  v6 = *(id *)(a1 + 56);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, v8);

}

uint64_t __83__ICInAppMessageStore_getMetadataForMessageIdentifier_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __74__ICInAppMessageStore_removePendingMessageEventWithIdentifier_completion___block_invoke(uint64_t a1)
{
  unint64_t i;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  for (i = 0; i < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"); ++i)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndex:", i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if ((v5 & 1) != 0)
      break;
  }
  if (i < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectAtIndex:", i);
    objc_msgSend(*(id *)(a1 + 32), "_commit");
  }
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ICInAppMessageStore_removePendingMessageEventWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v6, block);

}

uint64_t __74__ICInAppMessageStore_removePendingMessageEventWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__ICInAppMessageStore_pendingMessageEventsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__ICInAppMessageStore_pendingMessageEventsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E4390EF8;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __58__ICInAppMessageStore_pendingMessageEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __57__ICInAppMessageStore_addPendingMessageEvent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_commit");
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICInAppMessageStore_addPendingMessageEvent_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v6, block);

}

uint64_t __57__ICInAppMessageStore_addPendingMessageEvent_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__ICInAppMessageStore_resetStoreWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = v11;

  objc_msgSend(*(id *)(a1 + 32), "_commit");
  v14 = *(void **)(a1 + 40);
  v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICInAppMessageStore_resetStoreWithCompletion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v17 = v14;
  dispatch_async(v15, block);

}

uint64_t __48__ICInAppMessageStore_resetStoreWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__ICInAppMessageStore_getAllMessageEntriesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "allValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__ICInAppMessageStore_getMessageEntryWithIdentifier_bundleIdentifier_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7008, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(a1[7] + 16))();

}

void __77__ICInAppMessageStore_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_commit");
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ICInAppMessageStore_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

uint64_t __77__ICInAppMessageStore_removeAllMessageEntriesForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__ICInAppMessageStore_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "_commit");
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__ICInAppMessageStore_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v6 = *(id *)(a1 + 56);
  dispatch_async(v4, block);

}

uint64_t __87__ICInAppMessageStore_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__ICInAppMessageStore_updateMessageEntry_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "applicationMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", v3, v2);
  objc_msgSend(*(id *)(a1 + 40), "_commit");
  v7 = *(void **)(a1 + 48);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICInAppMessageStore_updateMessageEntry_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __53__ICInAppMessageStore_updateMessageEntry_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__ICInAppMessageStore_addMessageEntry_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "applicationMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", v3, v2);
  objc_msgSend(*(id *)(a1 + 40), "_commit");
  v7 = *(void **)(a1 + 48);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ICInAppMessageStore_addMessageEntry_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __50__ICInAppMessageStore_addMessageEntry_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__ICInAppMessageStore_allApplicationStorePropertiesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__ICInAppMessageStore_allApplicationStorePropertiesWithCompletion___block_invoke_2;
  v6[3] = &unk_1E4390EF8;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __67__ICInAppMessageStore_allApplicationStorePropertiesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __78__ICInAppMessageStore_updateStoreProperty_forKey_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_commit");
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ICInAppMessageStore_updateStoreProperty_forKey_bundleIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v6 = *(id *)(a1 + 64);
  dispatch_async(v4, block);

}

uint64_t __78__ICInAppMessageStore_updateStoreProperty_forKey_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__ICInAppMessageStore_getStorePropertyForKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ICInAppMessageStore_getStorePropertyForKey_completion___block_invoke_2;
  v7[3] = &unk_1E4390EF8;
  v5 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __57__ICInAppMessageStore_getStorePropertyForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __61__ICInAppMessageStore_updateStoreProperty_forKey_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_commit");
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ICInAppMessageStore_updateStoreProperty_forKey_completion___block_invoke_2;
  block[3] = &unk_1E4390D18;
  v4 = *(id *)(a1 + 56);
  dispatch_async(v2, block);

}

uint64_t __61__ICInAppMessageStore_updateStoreProperty_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
