@implementation WBSPasswordManagerWebsiteMetadataStore

- (WBSPasswordManagerWebsiteMetadataStore)initWithMetadataEntryClass:(Class)a3
{
  return (WBSPasswordManagerWebsiteMetadataStore *)-[WBSPasswordManagerWebsiteMetadataStore _initWithMetadataEntryClass:keychainAccessGroup:](self, "_initWithMetadataEntryClass:keychainAccessGroup:", a3, CFSTR("com.apple.password-manager.website-metadata"));
}

- (WBSPasswordManagerWebsiteMetadataStore)init
{

  return 0;
}

- (id)test_initWithMetadataEntryClass:(Class)a3 keychainAccessGroup:(id)a4
{
  return -[WBSPasswordManagerWebsiteMetadataStore _initWithMetadataEntryClass:keychainAccessGroup:](self, "_initWithMetadataEntryClass:keychainAccessGroup:", a3, a4);
}

- (id)_initWithMetadataEntryClass:(Class)a3 keychainAccessGroup:(id)a4
{
  id v6;
  WBSPasswordManagerWebsiteMetadataStore *v7;
  WBSPasswordManagerWebsiteMetadataStore *v8;
  uint64_t v9;
  NSString *accessGroup;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  WBSPasswordManagerWebsiteMetadataStore *v17;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WBSPasswordManagerWebsiteMetadataStore;
  v7 = -[WBSPasswordManagerWebsiteMetadataStore init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_metadataEntryClass = a3;
    v9 = objc_msgSend(v6, "copy");
    accessGroup = v8->_accessGroup;
    v8->_accessGroup = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.SafariCore.%@.%p"), v13, v8);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v15;

    v17 = v8;
  }

  return v8;
}

- (void)allMetadataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const __CFDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  const __CFDictionary *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CFTypeRef result;
  _BYTE v56[128];
  _QWORD v57[9];
  _QWORD v58[11];

  v58[9] = *MEMORY[0x1E0C80C00];
  v57[0] = *MEMORY[0x1E0CD68F8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keychainAccountName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CD6898];
  v47 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v58[0] = v2;
  v58[1] = v4;
  v5 = *MEMORY[0x1E0CD6C98];
  v57[1] = v3;
  v57[2] = v5;
  v6 = *MEMORY[0x1E0CD6AD0];
  v7 = *MEMORY[0x1E0CD6B00];
  v58[2] = *MEMORY[0x1E0CD6CB8];
  v58[3] = v7;
  v8 = *MEMORY[0x1E0CD6B80];
  v57[3] = v6;
  v57[4] = v8;
  v9 = *MEMORY[0x1E0CD70A8];
  v58[4] = MEMORY[0x1E0C9AAB0];
  v58[5] = MEMORY[0x1E0C9AAB0];
  v10 = *MEMORY[0x1E0CD7018];
  v57[5] = v9;
  v57[6] = v10;
  v11 = *MEMORY[0x1E0CD7010];
  v58[6] = MEMORY[0x1E0C9AAB0];
  v58[7] = MEMORY[0x1E0C9AAB0];
  v12 = *MEMORY[0x1E0CD6F30];
  v57[7] = v11;
  v57[8] = v12;
  v58[8] = *MEMORY[0x1E0CD6F38];
  v13 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 9);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  result = 0;
  v15 = SecItemCopyMatching(v14, &result);
  if (!(_DWORD)v15)
  {
    v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v24 = (id)result;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v25)
    {
      v26 = v25;
      v44 = v14;
      v46 = 0;
      v49 = 0;
      v50 = 0;
      v27 = *(_QWORD *)v52;
      v28 = *MEMORY[0x1E0CD6B50];
      v29 = *MEMORY[0x1E0CD70D8];
      do
      {
        v30 = 0;
        v48 = v26;
        do
        {
          if (*(_QWORD *)v52 != v27)
            objc_enumerationMutation(v24);
          v31 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v30);
          objc_msgSend(v31, "objectForKeyedSubscript:", v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v29);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v32, "length"))
          {
            objc_msgSend(*(id *)(v13 + 3456), "safari_dictionaryWithPropertyListData:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v35 = v29;
              v36 = v28;
              v37 = v27;
              v38 = v13;
              v39 = v24;
              v40 = (void *)objc_msgSend(objc_alloc(*(Class *)(*(_QWORD *)(v47 + 32) + 8)), "initWithKeychainDictionary:forDomain:", v34, v32);
              if (v40)
                objc_msgSend(v45, "setObject:forKeyedSubscript:", v40, v32);
              else
                ++v46;

              v24 = v39;
              v13 = v38;
              v27 = v37;
              v28 = v36;
              v29 = v35;
              v26 = v48;
            }
            else
            {
              ++v49;
            }

          }
          else
          {
            ++v50;
          }

          ++v30;
        }
        while (v26 != v30);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v26);

      if (v50)
      {
        v41 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_4();
      }
      v14 = v44;
      if (v49 && (v42 = WBS_LOG_CHANNEL_PREFIXKeychain(), os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)))
      {
        __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_3();
        if (v46)
        {
LABEL_28:
          v43 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_2();
        }
      }
      else if (v46)
      {
        goto LABEL_28;
      }
    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(v47 + 40) + 16))();

    goto LABEL_32;
  }
  v16 = v15;
  if ((_DWORD)v15 != -25300)
  {
    v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
  }
  (*(void (**)(void))(*(_QWORD *)(v47 + 40) + 16))();
LABEL_32:

}

- (void)metadataForDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke;
  block[3] = &unk_1E649B990;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  OSStatus v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  CFTypeRef v19;
  _QWORD v20[8];
  _QWORD v21[9];

  v21[8] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(*(Class *)(a1[4] + 8));
  v20[0] = *MEMORY[0x1E0CD68F8];
  objc_msgSend(*(id *)(a1[4] + 8), "keychainAccountName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CD6898];
  v5 = *(_QWORD *)(a1[4] + 16);
  v21[0] = v3;
  v21[1] = v5;
  v6 = *MEMORY[0x1E0CD6C98];
  v20[1] = v4;
  v20[2] = v6;
  v7 = *MEMORY[0x1E0CD6AD0];
  v8 = *MEMORY[0x1E0CD6B00];
  v21[2] = *MEMORY[0x1E0CD6CB8];
  v21[3] = v8;
  v9 = *MEMORY[0x1E0CD6B50];
  v20[3] = v7;
  v20[4] = v9;
  v10 = *MEMORY[0x1E0CD6B80];
  v21[4] = a1[5];
  v21[5] = MEMORY[0x1E0C9AAB0];
  v11 = *MEMORY[0x1E0CD70A8];
  v20[5] = v10;
  v20[6] = v11;
  v20[7] = *MEMORY[0x1E0CD7018];
  v21[6] = MEMORY[0x1E0C9AAB0];
  v21[7] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 8);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v13 = SecItemCopyMatching(v12, &v19);
  if (v13)
  {
    if (v13 != -25300)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke_cold_1(v14);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v15 = (void *)v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithPropertyListData:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_msgSend(objc_alloc(*(Class *)(a1[4] + 8)), "initWithKeychainDictionary:forDomain:", v16, a1[5]);

      (*(void (**)(void))(a1[6] + 16))();
      v2 = (id)v17;
    }
    else
    {
      v18 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke_cold_2(a1 + 5, v18);
      (*(void (**)(void))(a1[6] + 16))();
    }

  }
}

- (void)saveMetadataEntry:(id)a3 forDomain:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  WBSPasswordManagerWebsiteMetadataStore *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke;
  v15[3] = &unk_1E649B9B8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void (*v26)(void);
  NSObject *v27;
  void *v28;
  const __CFDictionary *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(void);
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _BYTE buf[12];
  __int16 v49;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[7];
  _QWORD v54[9];

  v54[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "originalBackingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToDictionary:", v2))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, &v47);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v47;
    v6 = v5;
    if (v4)
    {
      v46 = v5;
      v53[0] = *MEMORY[0x1E0CD68F8];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "keychainAccountName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CD6898];
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
      v54[0] = v7;
      v54[1] = v10;
      v11 = *MEMORY[0x1E0CD6C98];
      v53[1] = v8;
      v53[2] = v11;
      v12 = *MEMORY[0x1E0CD6AD0];
      v13 = *MEMORY[0x1E0CD6B00];
      v54[2] = *MEMORY[0x1E0CD6CB8];
      v54[3] = v13;
      v14 = *MEMORY[0x1E0CD6B50];
      v53[3] = v12;
      v53[4] = v14;
      v15 = *MEMORY[0x1E0CD6B80];
      v16 = MEMORY[0x1E0C9AAB0];
      v54[4] = v9;
      v54[5] = MEMORY[0x1E0C9AAB0];
      v17 = *MEMORY[0x1E0CD70A8];
      v53[5] = v15;
      v53[6] = v17;
      v54[6] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 7);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = *MEMORY[0x1E0CD70D8];
      v52[0] = v4;
      v19 = *MEMORY[0x1E0CD6A90];
      v51[0] = v18;
      v51[1] = v19;
      v43 = v19;
      v44 = v4;
      objc_msgSend(*(id *)(a1 + 32), "keychainItemLabelForDomain:", *(_QWORD *)(a1 + 48));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v20;
      v51[2] = *MEMORY[0x1E0CD69A0];
      objc_msgSend(*(id *)(a1 + 32), "keychainItemDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v52[2] = v21;
      v51[3] = v8;
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
      v51[4] = v15;
      v52[3] = v22;
      v52[4] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v40 = v24;
        objc_msgSend(v23, "objectForKeyedSubscript:", v8);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v43);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        *(_QWORD *)&buf[4] = v41;
        v49 = 2113;
        v50 = v42;
        _os_log_debug_impl(&dword_1B2621000, v40, OS_LOG_TYPE_DEBUG, "Within WebsiteMetadataStore, attributes for credential SecItemUpdate: { accessGroup: %{public}@, label: %{private}@ }", buf, 0x16u);

      }
      *(_QWORD *)buf = 0;
      SecItemUpdateWithError();
      v6 = *(void **)buf;

      v25 = objc_msgSend(v6, "code");
      if (v25 == -25300)
      {
        v28 = (void *)objc_msgSend(v23, "mutableCopy");
        objc_msgSend(v28, "addEntriesFromDictionary:", v45);
        v29 = v28;

        v30 = SecItemAdd(v29, 0);
        v4 = v44;
        if ((_DWORD)v30)
        {
          v31 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_3(v30, v31, v32, v33, v34, v35, v36, v37);
          v38 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
        }
        else
        {
          v38 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
        }
        v38();
        v23 = v29;
      }
      else
      {
        v4 = v44;
        if (v25)
        {
          v39 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_2(v39, v6);
          v26 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
        }
        else
        {
          v26 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
        }
        v26();
      }

    }
    else
    {
      v27 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_1(v27, v6);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

- (void)debug_deleteAllPersistedDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__WBSPasswordManagerWebsiteMetadataStore_debug_deleteAllPersistedDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __92__WBSPasswordManagerWebsiteMetadataStore_debug_deleteAllPersistedDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  OSStatus v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keychainAccountName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CD6898];
  v19[0] = *MEMORY[0x1E0CD68F8];
  v19[1] = v4;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  v20[0] = v3;
  v20[1] = v5;
  v6 = *MEMORY[0x1E0CD6CB8];
  v7 = *MEMORY[0x1E0CD6AD0];
  v19[2] = *MEMORY[0x1E0CD6C98];
  v19[3] = v7;
  v8 = *MEMORY[0x1E0CD6B00];
  v20[2] = v6;
  v20[3] = v8;
  v9 = *MEMORY[0x1E0CD70A8];
  v19[4] = *MEMORY[0x1E0CD6B80];
  v19[5] = v9;
  v20[4] = MEMORY[0x1E0C9AAB0];
  v20[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = SecItemDelete(v10);
  v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __92__WBSPasswordManagerWebsiteMetadataStore_debug_deleteAllPersistedDataWithCompletionHandler___block_invoke_cold_1(v2, (uint64_t)v3, v13);
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(*(_QWORD *)v2 + 16);
    v15 = 138412546;
    v16 = v14;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1B2621000, v13, OS_LOG_TYPE_DEFAULT, "Within WebsiteMetadataStore, deleted all items in %@ with kSecAttrAccount %@", (uint8_t *)&v15, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B2621000, a2, a3, "SecItemCopyMatching failed while fetching all website metadata with status %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v0, v1, "Within WebsiteMetadataStore, found %lu keychain items returned nil items from -initWithKeychainDictionary:forDomain:", v2);
  OUTLINED_FUNCTION_1_1();
}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v0, v1, "Within WebsiteMetadataStore, found %lu keychain items whose data were not dictionaries", v2);
  OUTLINED_FUNCTION_1_1();
}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v0, v1, "Within WebsiteMetadataStore, found %lu keychain items with empty domains", v2);
  OUTLINED_FUNCTION_1_1();
}

void __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Within WebsiteMetadataStore, SecItemCopyMatching failed while fetching website metadata", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1B2621000, a2, OS_LOG_TYPE_DEBUG, "Within WebsiteMetadataStore, fetched keychain entry for %@ wasn't a dictionary", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

void __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v3, v5, "Within WebsiteMetadataStore, could not create data from dictionary to persist; error: %@",
    v6);

  OUTLINED_FUNCTION_4();
}

void __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v3, v5, "Within WebsiteMetadataStore, SecItemUpdateWithError failed with error %@", v6);

  OUTLINED_FUNCTION_4();
}

void __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B2621000, a2, a3, "Within WebsiteMetadataStore, SecItemAdd failed with error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __92__WBSPasswordManagerWebsiteMetadataStore_debug_deleteAllPersistedDataWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Within WebsiteMetadataStore, failed to delete all items in %@ with kSecAttrAccount %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

@end
