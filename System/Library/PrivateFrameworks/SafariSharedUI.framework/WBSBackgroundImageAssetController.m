@implementation WBSBackgroundImageAssetController

+ (NSString)mobileAssetType
{
  return (NSString *)CFSTR("com.apple.MobileAsset.SafariBackgroundImage");
}

+ (id)mobileAssetBackgroundImageNamesOnDisk
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "safari_startPageBackgroundImageMobileAssetFolderURL", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_msgSend(v2, "copy");
  return v10;
}

- (WBSBackgroundImageAssetController)init
{
  WBSMobileAssetController *v3;
  void *v4;
  WBSMobileAssetController *v5;
  WBSBackgroundImageAssetController *v6;

  v3 = [WBSMobileAssetController alloc];
  objc_msgSend((id)objc_opt_class(), "mobileAssetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WBSMobileAssetController initWithMobileAssetType:updateInterval:minimumDelay:](v3, "initWithMobileAssetType:updateInterval:minimumDelay:", v4, 604800.0, 180.0);

  if (v5)
  {
    self = -[WBSBackgroundImageAssetController initWithMobileAssetController:](self, "initWithMobileAssetController:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WBSBackgroundImageAssetController)initWithMobileAssetController:(id)a3
{
  id v5;
  WBSBackgroundImageAssetController *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableDictionary *assetURLToAttributes;
  uint64_t v14;
  NSMutableDictionary *imageNamesToDownloadStates;
  uint64_t v16;
  NSMutableArray *fileNames;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableDictionary *v33;
  void *v34;
  WBSBackgroundImageAssetController *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)WBSBackgroundImageAssetController;
  v6 = -[WBSBackgroundImageAssetController init](&v45, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.SafariSharedUI.WBSBackgroundImageAssetController.%@.%p._queue"), objc_opt_class(), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_assetController, a3);
    -[WBSMobileAssetControllerProtocol setDelegate:](v6->_assetController, "setDelegate:", v6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    assetURLToAttributes = v6->_assetURLToAttributes;
    v6->_assetURLToAttributes = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    imageNamesToDownloadStates = v6->_imageNamesToDownloadStates;
    v6->_imageNamesToDownloadStates = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    fileNames = v6->_fileNames;
    v6->_fileNames = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v18, "safari_startPageBackgroundImageThumbnailMobileAssetFolderURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentsOfDirectoryAtPath:error:", v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v42;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(v21);
          v25 = v6->_fileNames;
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v24), "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v25, "addObject:", v26);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v22);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v18, "safari_startPageBackgroundImageMobileAssetFolderURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentsOfDirectoryAtPath:error:", v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v38;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(v29);
          v33 = v6->_imageNamesToDownloadStates;
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v32), "lastPathComponent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", &unk_1E5479BE8, v34);

          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v30);
    }

    v35 = v6;
  }

  return v6;
}

- (void)savePendingChangesBeforeTermination
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global);
}

- (void)downloadMobileAssetBackgroundImage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WBSMobileAssetControllerProtocol *assetController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  WBSBackgroundImageAssetController *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageNamesToDownloadStates, "setObject:forKeyedSubscript:", &unk_1E5479C00, v6);
    assetController = self->_assetController;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90__WBSBackgroundImageAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke;
    v13[3] = &unk_1E5441370;
    v14 = v6;
    v15 = self;
    v16 = v7;
    -[WBSMobileAssetControllerProtocol downloadMobileAssetBackgroundImage:completionHandler:](assetController, "downloadMobileAssetBackgroundImage:completionHandler:", v14, v13);

    v9 = v14;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D68];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariSharedUI.BackgroundImageAsset.ErrorDomain"), -1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

void __90__WBSBackgroundImageAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_startPageBackgroundImageMobileAssetFolderURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "getLocalFileUrl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(*(id *)(a1 + 40), "_saveAssetAtURL:toURL:", v11, v9);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  if ((v12 & 1) != 0)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E5479BE8, v13);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v19 = CFSTR("FileName");
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("WBSBackgroundImageMobileAssetDidInstallBackgroundImage"), v17, v18);

  }
  else
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E5479C18, v13);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (int64_t)downloadStateForFileName:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_imageNamesToDownloadStates, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (NSArray)fileNames
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_fileNames, "copy");
}

- (WBSBackgroundImageAssetControllerDelegate)delegate
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__WBSBackgroundImageAssetController_delegate__block_invoke;
  v5[3] = &unk_1E5441398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WBSBackgroundImageAssetControllerDelegate *)v3;
}

void __45__WBSBackgroundImageAssetController_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
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
  v7[2] = __49__WBSBackgroundImageAssetController_setDelegate___block_invoke;
  v7[3] = &unk_1E54413C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __49__WBSBackgroundImageAssetController_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(a1 + 32), "_sendBackgroundImageThumbnailAssetsToDelegateIfPossible:");
  }
}

- (void)_sendBackgroundImageThumbnailAssetsToDelegateIfPossible:(id)a3
{
  NSMutableDictionary *assetURLToAttributes;
  _QWORD v5[5];

  if (-[NSMutableDictionary count](self->_assetURLToAttributes, "count", a3))
  {
    assetURLToAttributes = self->_assetURLToAttributes;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __93__WBSBackgroundImageAssetController__sendBackgroundImageThumbnailAssetsToDelegateIfPossible___block_invoke;
    v5[3] = &unk_1E54413E8;
    v5[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](assetURLToAttributes, "enumerateKeysAndObjectsUsingBlock:", v5);
  }
}

void __93__WBSBackgroundImageAssetController__sendBackgroundImageThumbnailAssetsToDelegateIfPossible___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;

  v13 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("FileName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_startPageBackgroundImageThumbnailMobileAssetFolderURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "URLByAppendingPathComponent:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "_saveAssetAtURL:toURL:", v9, v8) & 1) != 0)
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(v8, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
      objc_msgSend(WeakRetained, "backgroundImageAssetController:didInstallBackgroundImageThumbnailAtURL:", *(_QWORD *)(a1 + 32), v8);

    }
  }

}

- (void)_sendBackgroundImageThumbnailAssetsToDelegateIfPossible
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    -[WBSBackgroundImageAssetController _sendBackgroundImageThumbnailAssetsToDelegateIfPossible:](self, "_sendBackgroundImageThumbnailAssetsToDelegateIfPossible:", WeakRetained);

}

- (BOOL)_saveAssetAtURL:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  id v33[7];

  v33[6] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  MEMORY[0x1A85D4170](v33, CFSTR("com.apple.Safari.SafariSharedUI.WBSBackgroundImageAssetController"));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isReadableFileAtPath:", v8);

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v6, "URLByDeletingLastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v7, "safari_ensureDirectoryExists:", v10);

      v32 = 0;
      v12 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v5, v6, &v32);
      v13 = v32;
      if ((v12 & 1) == 0)
      {
        v14 = (id)WBS_LOG_CHANNEL_PREFIXMobileAsset();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSBackgroundImageAssetController _saveAssetAtURL:toURL:].cold.2();
        }

      }
    }
    else
    {
      v23 = WBS_LOG_CHANNEL_PREFIXMobileAsset();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[WBSBackgroundImageAssetController _saveAssetAtURL:toURL:].cold.3(v23, v24, v25, v26, v27, v28, v29, v30);
      v12 = 0;
    }

  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXMobileAsset();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[WBSBackgroundImageAssetController _saveAssetAtURL:toURL:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    v12 = 0;
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v33);

  return v12;
}

- (void)mobileAssetController:(id)a3 didBecomeAvailable:(id)a4 withAttributes:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__WBSBackgroundImageAssetController_mobileAssetController_didBecomeAvailable_withAttributes___block_invoke;
  block[3] = &unk_1E5441410;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

uint64_t __93__WBSBackgroundImageAssetController_mobileAssetController_didBecomeAvailable_withAttributes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_sendBackgroundImageThumbnailAssetsToDelegateIfPossible");
}

- (void)mobileAssetController:(id)a3 willPerformQuery:(id)a4
{
  objc_msgSend(a4, "addKeyValuePair:with:", CFSTR("IsThumbnail"), CFSTR("YES"));
}

- (void)mobileAssetController:(id)a3 didFailCatalogDownload:(id)a4
{
  id v5;
  NSObject *v6;
  id WeakRetained;

  v5 = a4;
  v6 = (id)WBS_LOG_CHANNEL_PREFIXMobileAsset();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    -[WBSBackgroundImageAssetController mobileAssetController:didFailCatalogDownload:].cold.1();
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "backgroundImageAssetController:didFailCatalogDownload:", self, v5);

}

- (void)mobileAssetController:(id)a3 didFailDownload:(id)a4
{
  id v5;
  NSObject *v6;
  id WeakRetained;

  v5 = a4;
  v6 = (id)WBS_LOG_CHANNEL_PREFIXMobileAsset();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    -[WBSBackgroundImageAssetController mobileAssetController:didFailDownload:].cold.1();
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "backgroundImageAssetController:didFailDownload:", self, v5);

}

- (void)mobileAssetController:(id)a3 didFailRetrieve:(id)a4
{
  id v5;
  NSObject *v6;
  id WeakRetained;

  v5 = a4;
  v6 = (id)WBS_LOG_CHANNEL_PREFIXMobileAsset();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    -[WBSBackgroundImageAssetController mobileAssetController:didFailRetrieve:].cold.1();
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "backgroundImageAssetController:didFailLoad:", self, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageNamesToDownloadStates, 0);
  objc_storeStrong((id *)&self->_fileNames, 0);
  objc_storeStrong((id *)&self->_assetURLToAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_saveAssetAtURL:(uint64_t)a3 toURL:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A840B000, a1, a3, "Mobile Asset destination URL was not available.", a5, a6, a7, a8, 0);
}

- (void)_saveAssetAtURL:toURL:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Error while copying a mobile asset. Error description: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)_saveAssetAtURL:(uint64_t)a3 toURL:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A840B000, a1, a3, "Failed to read Safari background images in the Mobile Asset directory.", a5, a6, a7, a8, 0);
}

- (void)mobileAssetController:didFailCatalogDownload:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Failed to download Safari's background image asset catalog: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)mobileAssetController:didFailDownload:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Failed to download mobile asset: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)mobileAssetController:didFailRetrieve:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Failed to load mobile asset: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

@end
