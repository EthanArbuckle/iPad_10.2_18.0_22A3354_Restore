@implementation PHAWallpaperSuggestionUpgradeSession

- (PHAWallpaperSuggestionUpgradeSession)init
{
  PHAWallpaperSuggestionUpgradeSession *v2;
  PRSService *v3;
  PRSService *posterService;
  uint64_t v5;
  VCPMediaAnalysisService *mediaAnalysisService;
  os_log_t v7;
  OS_os_log *loggingConnection;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSMutableSet *v13;
  NSMutableSet *upgradeSessions;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PHAWallpaperSuggestionUpgradeSession;
  v2 = -[PHAWallpaperSuggestionUpgradeSession init](&v16, sel_init);
  if (v2)
  {
    v3 = (PRSService *)objc_alloc_init(MEMORY[0x1E0D7F710]);
    posterService = v2->_posterService;
    v2->_posterService = v3;

    objc_msgSend(MEMORY[0x1E0D475C0], "analysisService");
    v5 = objc_claimAutoreleasedReturnValue();
    mediaAnalysisService = v2->_mediaAnalysisService;
    v2->_mediaAnalysisService = (VCPMediaAnalysisService *)v5;

    v7 = os_log_create("com.apple.photoanalysisd", "PHAWallpaperSuggestionUpgradeSession");
    loggingConnection = v2->_loggingConnection;
    v2->_loggingConnection = (OS_os_log *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create("com.apple.PHAWallpaperSuggestionUpgradeSession", v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    upgradeSessions = v2->_upgradeSessions;
    v2->_upgradeSessions = v13;

  }
  return v2;
}

- (void)upgradePosterConfigurationWithAssetDirectory:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *loggingConnection;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PHAWallpaperSuggestionUpgradeSession *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v12 = loggingConnection;
    objc_msgSend(v8, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v13;
    _os_log_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_INFO, "Request to upgrade poster configuration at: %{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __104__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfigurationWithAssetDirectory_options_completion___block_invoke;
  v17[3] = &unk_1E851F9F0;
  objc_copyWeak(&v22, (id *)buf);
  v14 = v9;
  v18 = v14;
  v15 = v10;
  v21 = v15;
  v19 = self;
  v16 = v8;
  v20 = v16;
  -[PHAWallpaperSuggestionUpgradeSession fetchPosterConfigurationWithAssetDirectory:completion:](self, "fetchPosterConfigurationWithAssetDirectory:completion:", v16, v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

- (void)fetchPosterConfigurationWithAssetDirectory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *loggingConnection;
  NSObject *v9;
  void *v10;
  PRSService *posterService;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v9 = loggingConnection;
    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v10;
    _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "Fetching poster configuration with asset directory: %{public}@", buf, 0xCu);

  }
  posterService = self->_posterService;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke;
  v14[3] = &unk_1E851FA68;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  -[PRSService fetchPosterConfigurationsForExtension:completion:](posterService, "fetchPosterConfigurationsForExtension:completion:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), v14);

}

- (void)upgradePosterConfiguration:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *loggingConnection;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PHAWallpaperSuggestionUpgradeSession upgradeSessionURLForPosterConfiguration:](self, "upgradeSessionURLForPosterConfiguration:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHAWallpaperSuggestionUpgradeSession beginUpgradeSessionAtURL:](self, "beginUpgradeSessionAtURL:", v11))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_options_completion___block_invoke;
    v16[3] = &unk_1E851FCE8;
    v16[4] = self;
    v17 = v11;
    v18 = v10;
    -[PHAWallpaperSuggestionUpgradeSession upgradePosterConfiguration:withSessionURL:options:completion:](self, "upgradePosterConfiguration:withSessionURL:options:completion:", v8, v17, v9, v16);

  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      v13 = loggingConnection;
      objc_msgSend(v11, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v14;
      _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_DEFAULT, "Poster configuration upgrade session already in progress at %{public}@, aborting...", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 14, CFSTR("Poster configuration upgrade session already in progress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v15);

  }
}

- (void)upgradePosterConfiguration:(id)a3 withSessionURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *loggingConnection;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  PHAWallpaperSuggestionUpgradeSession *v31;
  id v32;
  id v33;
  id v34;
  _BYTE location[12];
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27 = a6;
  v13 = (void *)MEMORY[0x1E0D751F0];
  objc_msgSend(v10, "assetDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v13, "loadFromURL:error:", v14, &v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v34;

  if (v15)
  {
    objc_initWeak((id *)location, self);
    objc_msgSend(v15, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke;
    v28[3] = &unk_1E851FAE0;
    objc_copyWeak(&v33, (id *)location);
    v18 = v10;
    v19 = v10;
    v20 = v12;
    v21 = v19;
    v29 = v19;
    v30 = v11;
    v31 = self;
    v32 = v27;
    v22 = v21;
    v12 = v20;
    -[PHAWallpaperSuggestionUpgradeSession upgradePosterConfiguration:withSessionURL:localIdentifier:options:completion:](self, "upgradePosterConfiguration:withSessionURL:localIdentifier:options:completion:", v22, v30, v17, v20, v28);

    v10 = v18;
    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)location);
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      v24 = loggingConnection;
      objc_msgSend(v10, "assetDirectory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v26;
      v36 = 2114;
      v37 = v16;
      _os_log_error_impl(&dword_1CAC16000, v24, OS_LOG_TYPE_ERROR, "Failed to load poster configuration from asset directory: '%{public}@', error: %{public}@", location, 0x16u);

    }
    (*((void (**)(id, _QWORD, id))v27 + 2))(v27, 0, v16);
  }

}

- (void)upgradePosterConfiguration:(id)a3 withSessionURL:(id)a4 localIdentifier:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  NSObject *loggingConnection;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  VCPMediaAnalysisService *mediaAnalysisService;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a4, "URLByAppendingPathComponent:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v18 = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v36);
  v19 = v36;

  loggingConnection = self->_loggingConnection;
  if (v18)
  {
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      v21 = loggingConnection;
      objc_msgSend(v12, "serverUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v22;
      v39 = 2114;
      v40 = v13;
      v41 = 2114;
      v42 = v23;
      _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_DEFAULT, "Upgrading poster configuration %{public}@ with local identifier: %{public}@ to: %{public}@", buf, 0x20u);

    }
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_1E8540940, CFSTR("WallpaperUpgradeMode"));
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LayoutConfiguration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("LayoutConfiguration"));

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LayerStackOptions"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("LayerStackOptions"));

    mediaAnalysisService = self->_mediaAnalysisService;
    objc_msgSend(v12, "assetDirectory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __117__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_localIdentifier_options_completion___block_invoke;
    v31[3] = &unk_1E851FB08;
    v31[4] = self;
    v32 = v12;
    v33 = v13;
    v34 = v16;
    v35 = v15;
    -[VCPMediaAnalysisService requestWallpaperUpgradeAtURL:toDestinationURL:withOptions:andCompletionHandler:](mediaAnalysisService, "requestWallpaperUpgradeAtURL:toDestinationURL:withOptions:andCompletionHandler:", v28, v34, v24, v31);

  }
  else
  {
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      v29 = loggingConnection;
      objc_msgSend(v16, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v30;
      v39 = 2114;
      v40 = v19;
      _os_log_error_impl(&dword_1CAC16000, v29, OS_LOG_TYPE_ERROR, "Failed to create poster upgrade directory: %{public}@, error: %{public}@", buf, 0x16u);

    }
    (*((void (**)(id, id))v15 + 2))(v15, v19);
  }

}

- (id)upgradeSessionURLForPosterConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "serverUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("UpgradeSessions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)beginUpgradeSessionAtURL:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;
  OS_os_log *v13;
  NSObject *v14;
  void *v15;
  OS_os_log *v16;
  void *v17;
  int v18;
  BOOL v19;
  void *v21;
  id v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PHAWallpaperSuggestionUpgradeSession_beginUpgradeSessionAtURL___block_invoke;
  block[3] = &unk_1E851FB30;
  block[4] = self;
  v6 = v4;
  v24 = v6;
  v25 = &v26;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v27 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v11 = objc_msgSend(v10, "removeItemAtURL:error:", v6, &v22);
      v12 = v22;

      v13 = self->_loggingConnection;
      v14 = v13;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v15;
          _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, "Successfully removed temporary poster configuration data at %{public}@", buf, 0xCu);

        }
      }
      else if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v21;
        _os_log_error_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_ERROR, "Failed to remove temporary poster configuration data at %{public}@", buf, 0xCu);

      }
    }
  }
  v16 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *((unsigned __int8 *)v27 + 24);
    *(_DWORD *)buf = 138543618;
    v31 = v17;
    v32 = 1024;
    v33 = v18;
    _os_log_impl(&dword_1CAC16000, (os_log_t)v16, OS_LOG_TYPE_INFO, "BEGIN upgrade session at %{public}@ (success=%d)", buf, 0x12u);

  }
  v19 = *((_BYTE *)v27 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  return v19;
}

- (BOOL)endUpgradeSessionAtURL:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  int v8;
  OS_os_log *v9;
  OS_os_log *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  OS_os_log *v14;
  void *v15;
  int v16;
  BOOL v17;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PHAWallpaperSuggestionUpgradeSession_endUpgradeSessionAtURL___block_invoke;
  block[3] = &unk_1E851FB30;
  block[4] = self;
  v6 = v4;
  v22 = v6;
  v23 = &v24;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v25 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v8 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &v20);
    v9 = (OS_os_log *)v20;

    v10 = self->_loggingConnection;
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v12;
        _os_log_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_INFO, "Successfully removed temporary poster configuration data at %{public}@", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_error_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_ERROR, "Failed to remove temporary poster configuration data at %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v9 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1CAC16000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "END upgrade called with unknown session at %{public}@", buf, 0xCu);

    }
  }

  v14 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *((unsigned __int8 *)v25 + 24);
    *(_DWORD *)buf = 138543618;
    v29 = v15;
    v30 = 1024;
    v31 = v16;
    _os_log_impl(&dword_1CAC16000, (os_log_t)v14, OS_LOG_TYPE_INFO, "END upgrade session at %{public}@ (success=%d)", buf, 0x12u);

  }
  v17 = *((_BYTE *)v25 + 24) != 0;

  _Block_object_dispose(&v24, 8);
  return v17;
}

- (void)refreshPosterConfiguration:(id)a3 withSessionURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  PRSService *posterService;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a3;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0D7F6F0];
  v11 = a4;
  v12 = objc_alloc_init(v10);
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setIdentifier:", v13);
  posterService = self->_posterService;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__PHAWallpaperSuggestionUpgradeSession_refreshPosterConfiguration_withSessionURL_completion___block_invoke;
  v17[3] = &unk_1E851FA90;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  -[PRSService refreshPosterConfiguration:sessionInfo:completion:](posterService, "refreshPosterConfiguration:sessionInfo:completion:", v16, v12, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradeSessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisService, 0);
  objc_storeStrong((id *)&self->_posterService, 0);
}

void __93__PHAWallpaperSuggestionUpgradeSession_refreshPosterConfiguration_withSessionURL_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1[4] + 24);
  if (!v5)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = (void *)a1[5];
    v9 = v7;
    objc_msgSend(v11, "serverUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_ERROR, "Error refreshing poster configuration %{public}@: %{public}@", (uint8_t *)&v12, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)a1[5];
    v9 = v7;
    objc_msgSend(v8, "serverUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "Successfully refreshed poster configuration %{public}@", (uint8_t *)&v12, 0xCu);
LABEL_4:

  }
LABEL_6:
  (*(void (**)(void))(a1[6] + 16))();

}

void __63__PHAWallpaperSuggestionUpgradeSession_endUpgradeSessionAtURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  if ((_DWORD)v2)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(*(id *)(a1 + 40), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __65__PHAWallpaperSuggestionUpgradeSession_beginUpgradeSessionAtURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "containsObject:", v3);

  if ((v2 & 1) == 0)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(*(id *)(a1 + 40), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __117__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_localIdentifier_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void (*v13)(void);
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v7;
      objc_msgSend(v8, "serverUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v10;
      v21 = 2114;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "Successfully upgraded poster configuration %{public}@ with local identifier: %{public}@ to: %{public}@", (uint8_t *)&v19, 0x20u);

    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = *(void **)(a1 + 40);
      v15 = v7;
      objc_msgSend(v14, "serverUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v16;
      v21 = 2114;
      v22 = v17;
      v23 = 2114;
      v24 = v18;
      v25 = 2114;
      v26 = v6;
      _os_log_error_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_ERROR, "Failed to upgrade poster configuration %{public}@ with local identifier: %{public}@ to: %{public}@, error: %{public}@", (uint8_t *)&v19, 0x2Au);

    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  v13();

}

void __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 32);
      v11 = v4;
      objc_msgSend(v10, "serverUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2114;
      v23 = v3;
      _os_log_error_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_ERROR, "Failed to upgrade poster configuration %{public}@, error: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "assetDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke_2;
    v13[3] = &unk_1E851FAB8;
    objc_copyWeak(&v19, (id *)(a1 + 64));
    v14 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(void **)(a1 + 56);
    v15 = v7;
    v16 = v8;
    v17 = 0;
    v18 = v9;
    objc_msgSend(WeakRetained, "fetchPosterConfigurationWithAssetDirectory:completion:", v6, v13);

    objc_destroyWeak(&v19);
  }

}

void __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void (*v17)(void);
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke_3;
    v23[3] = &unk_1E851FA90;
    v23[4] = *(_QWORD *)(a1 + 48);
    v24 = v8;
    v25 = *(id *)(a1 + 64);
    objc_msgSend(WeakRetained, "refreshPosterConfiguration:withSessionURL:completion:", v24, v9, v23);

  }
  else
  {
    objc_msgSend(v5, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.photoanalysis"));

    v12 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(a1 + 32);
        v14 = v12;
        objc_msgSend(v13, "assetDirectory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v16;
        _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_DEFAULT, "Poster configuration at: %{public}@ is out of date, discarding...", buf, 0xCu);

      }
      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = *(void **)(a1 + 32);
        v19 = v12;
        objc_msgSend(v18, "assetDirectory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        v28 = 2114;
        v29 = v22;
        _os_log_error_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_ERROR, "Failed to reload poster configuration at: %{public}@, error: %{public}@", buf, 0x16u);

      }
      v17 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v17();
  }

}

void __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1[4] + 24);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)a1[5];
      v9 = v7;
      objc_msgSend(v8, "serverUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetDirectory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "Successfully refreshed poster configuration %{public}@ to: %{public}@", (uint8_t *)&v16, 0x16u);

    }
    v12 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)a1[5];
      v14 = v7;
      objc_msgSend(v13, "serverUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2114;
      v19 = v6;
      _os_log_error_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_ERROR, "Failed to refresh poster configuration %{public}@, error: %{public}@", (uint8_t *)&v16, 0x16u);

    }
    v12 = *(void (**)(void))(a1[6] + 16);
  }
  v12();

}

void __86__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_options_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a3;
  objc_msgSend(v4, "endUpgradeSessionAtURL:", v5);
  (*(void (**)(void))(a1[6] + 16))();

}

void __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void (**v11)(void *, _QWORD);
  void *v12;
  void (**v13)(void *, _QWORD);
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (*v22)(void);
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD aBlock[5];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 24);
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      *(_DWORD *)buf = 134217984;
      v39 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched %lu poster configurations", buf, 0xCu);

      v7 = *(_QWORD *)(a1 + 32);
    }
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke_13;
    aBlock[3] = &unk_1E851FA18;
    aBlock[4] = v7;
    v11 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v11[2](v11, *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v10;
    v33[1] = 3221225472;
    v33[2] = __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke_15;
    v33[3] = &unk_1E851FA40;
    v13 = v11;
    v36 = v13;
    v14 = v12;
    v34 = v14;
    v35 = *(id *)(a1 + 40);
    v15 = objc_msgSend(v5, "indexOfObjectPassingTest:", v33);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v29 = *(void **)(a1 + 40);
        v30 = v16;
        objc_msgSend(v29, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = (uint64_t)v31;
        _os_log_error_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_ERROR, "Couldn't find poster configuration with asset directory: %{public}@", buf, 0xCu);

      }
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 40), "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Couldn't find poster configuration with asset directory: %@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pl_analysisErrorWithCode:localizedDescription:", 9, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v32 = v6;
        v24 = v23;
        objc_msgSend(v21, "assetDirectory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "serverUUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = (uint64_t)v26;
        v40 = 2114;
        v41 = v28;
        _os_log_impl(&dword_1CAC16000, v24, OS_LOG_TYPE_DEFAULT, "Found poster configuration with asset directory: %{public}@, identifier: %{public}@", buf, 0x16u);

        v6 = v32;
      }
      v22 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v22();

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = (uint64_t)v6;
      _os_log_error_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch poster configurations: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

id __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0;
  v4 = *MEMORY[0x1E0C99948];
  v9 = 0;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &v10, v4, &v9);
  v5 = v10;
  v6 = v9;
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v3;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "Failed to get resource identifier for URL: %{public}@", buf, 0xCu);
    }
  }

  return v5;
}

uint64_t __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke_15(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  objc_msgSend(a2, "assetDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[4];
  if (v6)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v6 = a1[5];
    v4 = v3;
  }
  v8 = objc_msgSend(v4, "isEqual:", v6);

  return v8;
}

void __104__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfigurationWithAssetDirectory_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "upgradePosterConfiguration:options:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  }
  else
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 48);
      v10 = v8;
      objc_msgSend(v9, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_ERROR, "Failed to load poster configuration at: %{public}@, error: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

@end
