@implementation SYContentItemPreviewManager

+ (void)loadPreviewDataForItems:(id)a3 fullDetail:(BOOL)a4 didFinishLoadingPreviewHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id obj;
  _QWORD v17[5];
  id v18;
  BOOL v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  _BOOL4 v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v8;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = os_log_create("com.apple.synapse", "ContentItemManager");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v14;
          v26 = 1024;
          v27 = v6;
          _os_log_debug_impl(&dword_1BCC38000, v15, OS_LOG_TYPE_DEBUG, "Start loading preview for item: %@, fullDetail: %d", buf, 0x12u);
        }

        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke;
        v17[3] = &unk_1E757B1C0;
        v19 = v6;
        v17[4] = v14;
        v18 = v9;
        objc_msgSend(a1, "_loadPreviewMetadataForItem:fullDetail:completion:", v14, v6, v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v11);
  }

}

void __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke_2;
  v7[3] = &unk_1E757B198;
  v11 = *(_BYTE *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setLinkPreviewMetadata:loadLevel:");
    v2 = os_log_create("com.apple.synapse", "ContentItemManager");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke_2_cold_1((uint64_t *)(a1 + 40), (unsigned __int8 *)(a1 + 56), v2);

  }
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SYContentItemLinkPreviewDidFinishLoading"), *(_QWORD *)(a1 + 40));

}

+ (void)_loadPreviewMetadataForItem:(id)a3 fullDetail:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "itemURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "_lp_isHTTPFamilyURL") & 1) != 0 || objc_msgSend(v10, "isFileURL"))
  {
    objc_initWeak(&location, a1);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__SYContentItemPreviewManager__loadPreviewMetadataForItem_fullDetail_completion___block_invoke;
    v11[3] = &unk_1E757B1E8;
    objc_copyWeak(&v14, &location);
    v12 = v8;
    v13 = v9;
    objc_msgSend(a1, "_loadPreviewUsingLPForItem:fullDetail:completion:", v12, v6, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(a1, "_loadPreviewForAppContentItem:completion:", v8, v9);
  }

}

void __81__SYContentItemPreviewManager__loadPreviewMetadataForItem_fullDetail_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_loadPreviewForAppContentItem:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

+ (void)_loadPreviewUsingLPForItem:(id)a3 fullDetail:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "itemURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYContentItemPreviewManager.m"), 91, CFSTR("itemURL cannot be nil"));

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke;
  v16[3] = &unk_1E757B198;
  v20 = a4;
  v17 = v11;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

void __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v2 = (void *)getLPMetadataProviderClass_softClass;
  v14 = getLPMetadataProviderClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getLPMetadataProviderClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getLPMetadataProviderClass_block_invoke;
    v10[3] = &unk_1E757B260;
    v10[4] = &v11;
    __getLPMetadataProviderClass_block_invoke((uint64_t)v10);
    v2 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v11, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "_setShouldDownloadMediaSubresources:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(v5, "_setShouldDownloadImageSubresources:", *(unsigned __int8 *)(a1 + 56));
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke_2;
  v7[3] = &unk_1E757B210;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v5, "startFetchingMetadataForURL:completionHandler:", v6, v7);

}

void __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "displayTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v8);

    }
    objc_msgSend(v5, "dataRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = os_log_create("com.apple.synapse", "ContentItemManager");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke_2_cold_1(a1, (uint64_t)v6, v10);

    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)_loadPreviewForAppContentItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.synapse.itemSourceID.web")) & 1) == 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v8);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A858]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __72__SYContentItemPreviewManager__loadPreviewForAppContentItem_completion___block_invoke;
      v13[3] = &unk_1E757B238;
      v14 = v5;
      v15 = v8;
      v16 = v6;
      objc_msgSend(v10, "getImageForImageDescriptor:completion:", v11, v13);

    }
    else
    {
      v12 = os_log_create("com.apple.synapse", "ContentItemManager");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[SYContentItemPreviewManager _loadPreviewForAppContentItem:completion:].cold.2(v5);

      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }

  }
  else
  {
    v9 = os_log_create("com.apple.synapse", "ContentItemManager");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[SYContentItemPreviewManager _loadPreviewForAppContentItem:completion:].cold.1(v5);

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __72__SYContentItemPreviewManager__loadPreviewForAppContentItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_class *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a2;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "size"), v5 > 0.0) && (objc_msgSend(v4, "size"), v6 > 0.0))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v7 = (void *)getLPLinkMetadataClass_softClass;
    v28 = getLPLinkMetadataClass_softClass;
    if (!getLPLinkMetadataClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getLPLinkMetadataClass_block_invoke;
      v23 = &unk_1E757B260;
      v24 = &v25;
      __getLPLinkMetadataClass_block_invoke((uint64_t)&v20);
      v7 = (void *)v26[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v25, 8);
    v9 = objc_alloc_init(v8);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v10 = (void *)getUIImageClass_softClass;
    v28 = getUIImageClass_softClass;
    if (!getUIImageClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getUIImageClass_block_invoke;
      v23 = &unk_1E757B260;
      v24 = &v25;
      __getUIImageClass_block_invoke((uint64_t)&v20);
      v10 = (void *)v26[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v11, "imageWithCGImage:", objc_msgSend(v4, "CGImage"));
    v12 = objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v13 = (void *)getLPImageClass_softClass;
    v28 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getLPImageClass_block_invoke;
      v23 = &unk_1E757B260;
      v24 = &v25;
      __getLPImageClass_block_invoke((uint64_t)&v20);
      v13 = (void *)v26[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v25, 8);
    v15 = (void *)objc_msgSend([v14 alloc], "initWithPlatformImage:", v12);
    -[NSObject setIcon:](v9, "setIcon:", v15);

    objc_msgSend(*(id *)(a1 + 32), "displayTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setTitle:](v9, "setTitle:", v16);

    objc_msgSend(*(id *)(a1 + 32), "itemURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setOriginalURL:](v9, "setOriginalURL:", v17);

    objc_msgSend(*(id *)(a1 + 32), "itemURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setURL:](v9, "setURL:", v18);

    -[NSObject dataRepresentation](v9, "dataRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = os_log_create("com.apple.synapse", "ContentItemManager");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __72__SYContentItemPreviewManager__loadPreviewForAppContentItem_completion___block_invoke_cold_1(a1, v12);
    v19 = 0;
    v9 = v12;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke_2_cold_1(uint64_t *a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_debug_impl(&dword_1BCC38000, log, OS_LOG_TYPE_DEBUG, "Finished loading preview for item: %@, fullDetail: %d", (uint8_t *)&v5, 0x12u);
}

void __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413058;
  v11 = v6;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  v16 = 2112;
  v17 = a2;
  _os_log_error_impl(&dword_1BCC38000, a3, OS_LOG_TYPE_ERROR, "Error fetching LP preview for item: %@, identifier: %@ (%@), error: %@", (uint8_t *)&v10, 0x2Au);

}

+ (void)_loadPreviewForAppContentItem:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "itemIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v3, v4, "Error loading app icon for item %@, invalid bundle ID: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

+ (void)_loadPreviewForAppContentItem:(void *)a1 completion:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "itemIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v3, v4, "Error loading app icon for item %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

void __72__SYContentItemPreviewManager__loadPreviewForAppContentItem_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "Error requesting icon image for item %@ (%@)", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_0();
}

@end
