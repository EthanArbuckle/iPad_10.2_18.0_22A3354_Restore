@implementation SKUISoftwareLibraryInterface

- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  dispatch_semaphore_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  dispatch_semaphore_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUISoftwareLibraryInterface enumerateStatesForLibraryItems:usingBlock:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v37;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v20), "storeItemIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v18);
  }

  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = objc_alloc_init(MEMORY[0x1E0DAF640]);
  v24 = dispatch_semaphore_create(0);
  v25 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __74__SKUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke;
  v33[3] = &unk_1E73A1A50;
  v26 = v22;
  v34 = v26;
  v35 = v24;
  v27 = v24;
  objc_msgSend(v23, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v15, v33);
  dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __74__SKUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke_2;
  v30[3] = &unk_1E73A8C08;
  v31 = v26;
  v32 = v6;
  v28 = v6;
  v29 = v26;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v30);

}

void __74__SKUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  SKUILibraryItemState *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v16 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = *MEMORY[0x1E0DAFD08];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1BCCE6C7C]();
        objc_msgSend(v12, "valueForProperty:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && (objc_msgSend(v12, "isPlaceholder") & 1) == 0)
        {
          v15 = -[SKUILibraryItemState initWithApplication:]([SKUILibraryItemState alloc], "initWithApplication:", v12);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v15, v14);

        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __74__SKUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  SKUILibraryItemState *v6;
  id v7;

  v7 = a2;
  v3 = (void *)MEMORY[0x1BCCE6C7C]();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v7, "storeItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (SKUILibraryItemState *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = objc_alloc_init(SKUILibraryItemState);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v3);
}

- (id)exposedPlatformItemKinds
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUISoftwareLibraryInterface exposedPlatformItemKinds].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("iosSoftware"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)performActionForLibraryItem:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISoftwareLibraryInterface performActionForLibraryItem:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUISoftwareLibraryInterface stateForLibraryItem:](self, "stateForLibraryItem:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
    SKUIMetricsLaunchApplicationWithIdentifier((uint64_t)v16, 0);
    CFRelease(v16);
  }

  return v15 != 0;
}

- (id)stateForLibraryItem:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  dispatch_semaphore_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUISoftwareLibraryInterface stateForLibraryItem:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__91;
  v26 = __Block_byref_object_dispose__91;
  v27 = 0;
  v12 = objc_alloc_init(MEMORY[0x1E0DAF640]);
  v13 = dispatch_semaphore_create(0);
  objc_msgSend(v3, "storeItemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__SKUISoftwareLibraryInterface_stateForLibraryItem___block_invoke;
  v19[3] = &unk_1E73A3018;
  v21 = &v22;
  v16 = v13;
  v20 = v16;
  objc_msgSend(v12, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", v15, v19);

  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

void __52__SKUISoftwareLibraryInterface_stateForLibraryItem___block_invoke(uint64_t a1, void *a2)
{
  SKUILibraryItemState *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_msgSend(v6, "isPlaceholder") & 1) == 0)
  {
    v3 = -[SKUILibraryItemState initWithApplication:]([SKUILibraryItemState alloc], "initWithApplication:", v6);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)enumerateStatesForLibraryItems:(uint64_t)a3 usingBlock:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)exposedPlatformItemKinds
{
  OUTLINED_FUNCTION_1();
}

- (void)performActionForLibraryItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)stateForLibraryItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
