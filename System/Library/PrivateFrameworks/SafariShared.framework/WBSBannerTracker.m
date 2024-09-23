@implementation WBSBannerTracker

- (void)load
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__WBSBannerTracker_load__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __24__WBSBannerTracker_load__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[1])
  {
    v3 = (void *)MEMORY[0x1E0C99D50];
    v4 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v2, "_filePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataWithContentsOfURL:options:error:", v6, 8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v16 = 0;
      v17 = 200;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 1, &v17, &v16);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v16;
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 8);
      *(_QWORD *)(v10 + 8) = v8;

    }
    else
    {
      v9 = 0;
    }
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 8);
      *(_QWORD *)(v13 + 8) = v12;

      if (v9)
      {
        v15 = WBS_LOG_CHANNEL_PREFIXBanners();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __24__WBSBannerTracker_load__block_invoke_cold_1(v15, v9);
      }
    }

  }
}

- (id)_filePath
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WBSBannerTracker__filePath__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  if (_filePath_once != -1)
    dispatch_once(&_filePath_once, block);
  return (id)_filePath_path;
}

void __29__WBSBannerTracker__filePath__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_mobileSafariContainerDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("WebKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v5, 0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "categoryName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.plist"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_filePath_path;
  _filePath_path = v9;

}

- (WBSBannerTracker)init
{
  WBSBannerTracker *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  WBSBannerTracker *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSBannerTracker;
  v2 = -[WBSBannerTracker init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.%@"), v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

+ (id)sharedTracker
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__WBSBannerTracker_sharedTracker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTracker_once != -1)
    dispatch_once(&sharedTracker_once, block);
  return (id)sharedTracker_sharedTracker;
}

void __33__WBSBannerTracker_sharedTracker__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedTracker_sharedTracker;
  sharedTracker_sharedTracker = (uint64_t)v0;

}

- (NSString)categoryName
{
  return 0;
}

- (int64_t)basis
{
  return 0;
}

- (void)clear
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__WBSBannerTracker_clear__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __25__WBSBannerTracker_clear__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v2 = WBS_LOG_CHANNEL_PREFIXBanners();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, "Clearing banner tracker plist which will reset all dismissed banners", v7, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_filePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_web_removeFileOnlyAtPath:", v6);

}

- (void)_saveOnInteralQueue
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to serialize banner tracker plist: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)isBannerBlockedForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[WBSBannerTracker load](self, "load");
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke;
    block[3] = &unk_1E4B2A0F0;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(internalQueue, block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  id *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];
  _QWORD block[4];
  id v15;
  BOOL v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "basis");
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (int)objc_msgSend(v6, "intValue");

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke_3;
    v11[3] = &unk_1E4B2A0C8;
    v5 = (id *)v13;
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v13[0] = v8;
    v11[4] = v9;
    v12 = v10;
    v13[1] = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  else
  {
    if (v2)
      return;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke_2;
    block[3] = &unk_1E4B2A0A0;
    v5 = &v15;
    v15 = *(id *)(a1 + 48);
    v16 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __60__WBSBannerTracker_isBannerBlockedForIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "shouldBlockForIdentifier:withDismissCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)));
}

- (void)blockBannerForIdentifier:(id)a3
{
  id v4;
  NSObject *internalQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[WBSBannerTracker load](self, "load");
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__WBSBannerTracker_blockBannerForIdentifier___block_invoke;
    v6[3] = &unk_1E4B2A118;
    v6[4] = self;
    v7 = v4;
    dispatch_async(internalQueue, v6);

  }
}

uint64_t __45__WBSBannerTracker_blockBannerForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "basis");
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (int)(objc_msgSend(v10, "intValue") + 1);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

    v13 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v16 = 138478083;
      *(_QWORD *)&v16[4] = v14;
      *(_WORD *)&v16[12] = 2048;
      *(_QWORD *)&v16[14] = v11;
      v6 = "User has closed Banner for identifier '%{private}@' %lu time(s)";
      v7 = v13;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 22;
      goto LABEL_7;
    }
  }
  else if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

    v4 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v16 = 138543362;
      *(_QWORD *)&v16[4] = v5;
      v6 = "Identifier <%{public}@> is blocked from showing banner.";
      v7 = v4;
      v8 = OS_LOG_TYPE_INFO;
      v9 = 12;
LABEL_7:
      _os_log_impl(&dword_1A3D90000, v7, v8, v6, v16, v9);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_saveOnInteralQueue", *(_OWORD *)v16, *(_QWORD *)&v16[16]);
}

- (void)unblockBannerForIdentifier:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WBSBannerTracker load](self, "load");
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__WBSBannerTracker_unblockBannerForIdentifier___block_invoke;
  v7[3] = &unk_1E4B2A118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __47__WBSBannerTracker_unblockBannerForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_INFO, "Identifier <%{public}@> is unblocked from showing banner.", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_saveOnInteralQueue");
  }
}

- (BOOL)shouldBlockForIdentifier:(id)a3 withDismissCount:(unint64_t)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_blockedBanners, 0);
}

void __24__WBSBannerTracker_load__block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to read banner tracker plist: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

@end
