@implementation PHAWallpaperSuggestionRefreshSession

- (PHAWallpaperSuggestionRefreshSession)initWithGraphManager:(id)a3
{
  id v5;
  PHAWallpaperSuggestionRefreshSession *v6;
  PHAWallpaperSuggestionRefreshSession *v7;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  PRSService *v10;
  PRSService *posterService;
  uint64_t v12;
  VCPMediaAnalysisService *mediaAnalysisService;
  void *v14;
  uint64_t v15;
  OS_os_log *loggingConnection;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *workQueue;
  uint64_t v21;
  CPAnalytics *analytics;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHAWallpaperSuggestionRefreshSession;
  v6 = -[PHAWallpaperSuggestionRefreshSession init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    objc_msgSend(v5, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    v10 = (PRSService *)objc_alloc_init(MEMORY[0x1E0D7F710]);
    posterService = v7->_posterService;
    v7->_posterService = v10;

    objc_msgSend(MEMORY[0x1E0D475C0], "analysisService");
    v12 = objc_claimAutoreleasedReturnValue();
    mediaAnalysisService = v7->_mediaAnalysisService;
    v7->_mediaAnalysisService = (VCPMediaAnalysisService *)v12;

    objc_msgSend(v5, "workingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = dispatch_queue_create("com.apple.PHAWallpaperSuggestionRefreshSession", v18);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(v5, "analytics");
    v21 = objc_claimAutoreleasedReturnValue();
    analytics = v7->_analytics;
    v7->_analytics = (CPAnalytics *)v21;

  }
  return v7;
}

- (void)dealloc
{
  NSString *refreshSessionIdentifier;
  NSObject *loggingConnection;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  refreshSessionIdentifier = self->_refreshSessionIdentifier;
  if (refreshSessionIdentifier)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = refreshSessionIdentifier;
      _os_log_fault_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionRefreshSession] Refresh session %@ deallocated while still in-flight, did you forget to call cleanup?", buf, 0xCu);
    }
    -[PHAWallpaperSuggestionRefreshSession cleanup](self, "cleanup");
  }
  v5.receiver = self;
  v5.super_class = (Class)PHAWallpaperSuggestionRefreshSession;
  -[PHAWallpaperSuggestionRefreshSession dealloc](&v5, sel_dealloc);
}

- (BOOL)prepareWithError:(id *)a3
{
  NSObject *workQueue;
  char v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6580;
  v12 = __Block_byref_object_dispose__6581;
  v13 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PHAWallpaperSuggestionRefreshSession_prepareWithError___block_invoke;
  block[3] = &unk_1E8520C40;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(workQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (BOOL)_prepareWithError:(id *)a3
{
  NSString *refreshSessionIdentifier;
  NSObject *loggingConnection;
  int v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  NSURL *v16;
  NSURL *refreshSessionURL;
  void *v18;
  NSURL *v19;
  id v20;
  NSObject *v21;
  NSURL *v22;
  NSString *v23;
  NSURL *v25;
  id v26;
  uint8_t buf[4];
  NSURL *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  refreshSessionIdentifier = self->_refreshSessionIdentifier;
  if (refreshSessionIdentifier)
  {
    if (a3)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (NSURL *)refreshSessionIdentifier;
        _os_log_error_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to begin refresh session, session already inflight with identifier '%@'", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 2);
      LOBYTE(v7) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_refreshSessionIdentifier;
    self->_refreshSessionIdentifier = v9;

    v11 = self->_loggingConnection;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_refreshSessionIdentifier;
      *(_DWORD *)buf = 138412290;
      v28 = (NSURL *)v12;
      _os_log_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Starting refresh session with identifier '%@'", buf, 0xCu);
    }
    NSTemporaryDirectory();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v13, 1);
    objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("RefreshSessions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "URLByAppendingPathComponent:", self->_refreshSessionIdentifier);
    v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    refreshSessionURL = self->_refreshSessionURL;
    self->_refreshSessionURL = v16;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_refreshSessionURL;
    v26 = 0;
    v7 = objc_msgSend(v18, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v26);
    v20 = v26;

    v21 = self->_loggingConnection;
    if (v7)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = self->_refreshSessionURL;
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully created refresh session directory at url '%@'", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v25 = self->_refreshSessionURL;
        *(_DWORD *)buf = 138412546;
        v28 = v25;
        v29 = 2112;
        v30 = v20;
        _os_log_error_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to create refresh session directory at url '%@': %@", buf, 0x16u);
      }
      v23 = self->_refreshSessionIdentifier;
      self->_refreshSessionIdentifier = 0;

      if (a3)
        *a3 = objc_retainAutorelease(v20);
    }

  }
  return v7;
}

- (void)cleanup
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PHAWallpaperSuggestionRefreshSession_cleanup__block_invoke;
  block[3] = &unk_1E8521740;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)_cleanup
{
  void *v3;
  NSURL *refreshSessionURL;
  int v5;
  id v6;
  NSObject *loggingConnection;
  NSString *refreshSessionIdentifier;
  NSObject *v9;
  NSString *v10;
  NSString *v11;
  id v12;
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_refreshSessionIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    refreshSessionURL = self->_refreshSessionURL;
    v12 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", refreshSessionURL, &v12);
    v6 = v12;

    loggingConnection = self->_loggingConnection;
    if (v5)
    {
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
      {
        refreshSessionIdentifier = self->_refreshSessionIdentifier;
        *(_DWORD *)buf = 138412290;
        v14 = refreshSessionIdentifier;
        _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully removed refresh session '%@' directory", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      v11 = self->_refreshSessionIdentifier;
      *(_DWORD *)buf = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to remove refresh session '%@' directory: %@", buf, 0x16u);
    }
    v10 = self->_refreshSessionIdentifier;
    self->_refreshSessionIdentifier = 0;

  }
  else
  {
    v9 = self->_loggingConnection;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionRefreshSession] Failed to close refresh session, session was not started or already closed", buf, 2u);
    }
  }
}

- (void)refreshPosterDescriptorsWithProgressReporter:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  id v8;
  int v9;
  NSObject *loggingConnection;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  PRSService *posterService;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(id, _QWORD, void *);
  uint8_t *v20;
  uint8_t v21[8];
  uint8_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (self->_refreshSessionIdentifier)
  {
    v8 = v6;
    *(_QWORD *)v21 = 0;
    v22 = v21;
    v23 = 0x2020000000;
    v24 = 0;
    v9 = objc_msgSend(v8, "isCancelledWithProgress:", 0.0);
    v22[24] = v9;
    loggingConnection = self->_loggingConnection;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v11);

    }
    else
    {
      v13 = loggingConnection;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)objc_opt_class(), "lastGalleryRefreshDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v14;
        _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] LastGalleryRefreshDate: %@", buf, 0xCu);

      }
      posterService = self->_posterService;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke;
      v16[3] = &unk_1E8520CB8;
      v16[4] = self;
      v19 = v7;
      v20 = v21;
      v17 = v8;
      v18 = v17;
      -[PRSService fetchPosterDescriptorsForExtension:completion:](posterService, "fetchPosterDescriptorsForExtension:completion:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), v16);

    }
    _Block_object_dispose(v21, 8);
  }
  else
  {
    v12 = self->_loggingConnection;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] refreshPosterDescriptors called while refresh session has not been started", v21, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);
  }

}

- (void)refreshPosterConfigurationsForNightlyRefresh:(BOOL)a3 progressReporter:(id)a4 passingFilter:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  id v13;
  int v14;
  NSObject *loggingConnection;
  PRSService *v16;
  NSObject *v17;
  PRSService *v18;
  PHPhotoLibrary *v19;
  OS_os_log *v20;
  PHPhotoLibrary *v21;
  OS_os_log *v22;
  _QWORD v23[5];
  id v24;
  PHPhotoLibrary *v25;
  OS_os_log *v26;
  PRSService *v27;
  void (**v28)(id, _QWORD, id);
  id v29;
  uint8_t *v30;
  BOOL v31;
  uint8_t buf[16];
  uint8_t v33[8];
  uint8_t *v34;
  uint64_t v35;
  char v36;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  if (self->_refreshSessionIdentifier)
  {
    v13 = v10;
    *(_QWORD *)v33 = 0;
    v34 = v33;
    v35 = 0x2020000000;
    v36 = 0;
    v14 = objc_msgSend(v13, "isCancelledWithProgress:", 0.0);
    v34[24] = v14;
    if (v14)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v16 = (PRSService *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v16);
    }
    else
    {
      v18 = self->_posterService;
      v19 = self->_photoLibrary;
      v20 = self->_loggingConnection;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke;
      v23[3] = &unk_1E8520D88;
      v23[4] = self;
      v28 = v12;
      v30 = v33;
      v24 = v13;
      v29 = v11;
      v21 = v19;
      v25 = v21;
      v22 = v20;
      v26 = v22;
      v31 = a3;
      v16 = v18;
      v27 = v16;
      -[PRSService fetchPosterConfigurationsForExtension:completion:](v16, "fetchPosterConfigurationsForExtension:completion:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), v23);

    }
    _Block_object_dispose(v33, 8);
  }
  else
  {
    v17 = self->_loggingConnection;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v33 = 0;
      _os_log_error_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] refreshPosterConfigurations called while refresh session has not been started", v33, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v13);
  }

}

- (id)featuredPhotoDescriptorsForDonationWithSuggestionUUIDsToAvoid:(id)a3 count:(unint64_t)a4
{
  void *v6;
  void *v7;
  NSObject *loggingConnection;
  NSObject *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PHAWallpaperSuggestionRefreshSession suggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:](self, "suggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[PHAWallpaperSuggestionRefreshSession uuidsOfSuggestions:](self, "uuidsOfSuggestions:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      v9 = loggingConnection;
      v19 = 67109378;
      v20 = objc_msgSend(v6, "count");
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Refreshing gallery with %d suggestions %@", (uint8_t *)&v19, 0x12u);

    }
    v10 = objc_msgSend(v6, "count");
    if (v10 >= a4)
      v11 = a4;
    else
      v11 = v10;
    objc_msgSend(v6, "subarrayWithRange:", 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAWallpaperSuggestionRefreshSession updatedPosterDescriptorsFromSuggestions:](self, "updatedPosterDescriptorsFromSuggestions:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_loggingConnection;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = objc_msgSend(v13, "count");
      v19 = 67109378;
      v20 = v16;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Created %d FeaturedPhoto poster descriptors: %@", (uint8_t *)&v19, 0x12u);

    }
  }
  else
  {
    v17 = self->_loggingConnection;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No featured photo suggestions found to refresh gallery", (uint8_t *)&v19, 2u);
    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (id)suggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:(id)a3
{
  id v4;
  OS_os_log *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *loggingConnection;
  void *v12;
  uint64_t v13;
  uint32_t denom;
  uint32_t numer;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint32_t v22;
  uint32_t v23;
  NSObject *v24;
  NSObject *v25;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_loggingConnection;
  v6 = os_signpost_id_generate((os_log_t)v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WallpaperFeaturedPhotoDonation", ", buf, 2u);
  }

  v10 = mach_absolute_time();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Start Wallpaper Gallery donation", buf, 2u);
  }
  if ((PLIsFeaturedContentAllowed() & 1) != 0)
  {
    -[PHAWallpaperSuggestionRefreshSession fetchSuggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:](self, "fetchSuggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v16 = v8;
    v17 = v16;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v17, OS_SIGNPOST_INTERVAL_END, v6, "WallpaperFeaturedPhotoDonation", ", buf, 2u);
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "WallpaperFeaturedPhotoDonation";
      v30 = 2048;
      v31 = (float)((float)((float)((float)(v13 - v10) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    v18 = self->_loggingConnection;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Featured Content not allowed. Clearing featuredState for existing top wallpaper suggestions.", buf, 2u);
    }
    -[PHAWallpaperSuggestionRefreshSession currentlyFeaturedSuggestionUUIDsForTop:](self, "currentlyFeaturedSuggestionUUIDsForTop:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAWallpaperSuggestionRefreshSession updateSuggestionFeaturedStateWithNewSuggestionUUIDs:oldSuggestionUUIDs:](self, "updateSuggestionFeaturedStateWithNewSuggestionUUIDs:oldSuggestionUUIDs:", v20, v19);

    v21 = mach_absolute_time();
    v23 = info.numer;
    v22 = info.denom;
    v24 = v8;
    v25 = v24;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v25, OS_SIGNPOST_INTERVAL_END, v6, "WallpaperFeaturedPhotoDonation", ", buf, 2u);
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "WallpaperFeaturedPhotoDonation";
      v30 = 2048;
      v31 = (float)((float)((float)((float)(v21 - v10) * (float)v23) / (float)v22) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)fetchSuggestionsForGalleryDonationWithSuggestionUUIDsToAvoid:(id)a3
{
  id v4;
  OS_os_log *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *loggingConnection;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint32_t denom;
  uint32_t numer;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t spid;
  uint64_t v37;
  PHAWallpaperSuggestionRefreshSession *v38;
  NSObject *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  double v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  _QWORD v61[6];

  v61[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_loggingConnection;
  v6 = os_signpost_id_generate((os_log_t)v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  v40 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchGalleryDonation", ", buf, 2u);
  }
  spid = v6;
  v39 = v8;

  v37 = mach_absolute_time();
  -[PHAWallpaperSuggestionRefreshSession randomizedWallpaperSuggesstionWithSubtype:suggestionUUIDsToAvoid:](self, "randomizedWallpaperSuggesstionWithSubtype:suggestionUUIDsToAvoid:", 602, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v10;
  -[PHAWallpaperSuggestionRefreshSession randomizedWallpaperSuggesstionWithSubtype:suggestionUUIDsToAvoid:](self, "randomizedWallpaperSuggesstionWithSubtype:suggestionUUIDsToAvoid:", 603, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v12;
  -[PHAWallpaperSuggestionRefreshSession randomizedWallpaperSuggesstionWithSubtype:suggestionUUIDsToAvoid:](self, "randomizedWallpaperSuggesstionWithSubtype:suggestionUUIDsToAvoid:", 604, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v14;
  v38 = self;
  v41 = v4;
  -[PHAWallpaperSuggestionRefreshSession randomizedWallpaperSuggesstionWithSubtype:suggestionUUIDsToAvoid:](self, "randomizedWallpaperSuggesstionWithSubtype:suggestionUUIDsToAvoid:", 605, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0;
  v43 = 0;
  v44 = 0;
  v19 = 0.0;
  do
  {
    if ((unint64_t)objc_msgSend(v17, "count") > 0xA)
      break;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v20 = v42;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "nextObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v17, "addObject:", v26);
            switch(objc_msgSend(v26, "subtype"))
            {
              case 0x25Au:
                ++*(_QWORD *)&v19;
                break;
              case 0x25Bu:
                ++v18;
                break;
              case 0x25Cu:
                ++v43;
                break;
              case 0x25Du:
                ++v44;
                break;
              default:
                break;
            }
            if ((unint64_t)objc_msgSend(v17, "count") >= 0xB)
            {

              goto LABEL_24;
            }
          }
          else
          {
            ++v23;
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
        if (v22)
          continue;
        break;
      }
    }
    else
    {
      v23 = 0;
    }
LABEL_24:

  }
  while (v23 < objc_msgSend(v20, "count"));
  loggingConnection = v38->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v28 = loggingConnection;
    v29 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134219008;
    v51 = (const char *)v29;
    v52 = 2048;
    v53 = v19;
    v54 = 2048;
    v55 = v18;
    v56 = 2048;
    v57 = v43;
    v58 = 2048;
    v59 = v44;
    _os_log_impl(&dword_1CAC16000, v28, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] found %lu suggestions to donate to Featured Photos. TopPeople(%lu), TopPet(%lu), TopLandscape(%lu), TopCityscape(%lu)", buf, 0x34u);

  }
  v30 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v33 = v39;
  v34 = v33;
  if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v34, OS_SIGNPOST_INTERVAL_END, spid, "FetchGalleryDonation", ", buf, 2u);
  }

  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "FetchGalleryDonation";
    v52 = 2048;
    v53 = (float)((float)((float)((float)(v30 - v37) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v34, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v17;
}

- (id)randomizedWallpaperSuggesstionWithSubtype:(unsigned __int16)a3 suggestionUUIDsToAvoid:(id)a4
{
  unsigned int v4;
  PHPhotoLibrary *photoLibrary;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *loggingConnection;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  _QWORD v26[4];

  v4 = a3;
  v26[3] = *MEMORY[0x1E0C80C00];
  photoLibrary = self->_photoLibrary;
  v7 = a4;
  -[PHPhotoLibrary librarySpecificFetchOptions](photoLibrary, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("uuid"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v14);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchAllFeaturedStateEnabledSuggestionsWithOptions:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v17 = loggingConnection;
    v18 = objc_msgSend(v15, "count");
    PHSuggestionStringWithSubtype();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] found %lu %@ suggestions", buf, 0x16u);

  }
  -[PHAWallpaperSuggestionRefreshSession randomizeSuggestions:](self, "randomizeSuggestions:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)randomizeSuggestions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D77EF8];
  v4 = a3;
  objc_msgSend(v3, "randomNumberGeneratorForWallpaperDonation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "fetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
  PFMutableArrayShuffleWithRandomNumberGenerator();

  return v8;
}

- (id)keyAssetBySuggestionUUIDFromSuggestions:(id)a3
{
  PHPhotoLibrary *photoLibrary;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  photoLibrary = self->_photoLibrary;
  v5 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](photoLibrary, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D762B8], "assetFetchPropertySetsIncludingGating:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1620]), "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v5, self->_photoLibrary, 0, 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)updatedPosterDescriptorsFromSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHAWallpaperSuggestionRefreshSession keyAssetBySuggestionUUIDFromSuggestions:](self, "keyAssetBySuggestionUUIDFromSuggestions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = v4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v4);
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PHAWallpaperSuggestionRefreshSession posterDescriptorOfType:withSuggestion:assetBySuggestionUUID:](self, "posterDescriptorOfType:withSuggestion:assetBySuggestionUUID:", 2, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D751F8], "descriptorTypeStringWithType:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v10);

    objc_msgSend(v6, "addObject:", v9);
    objc_msgSend(v7, "removeLastObject");

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[PHAWallpaperSuggestionRefreshSession posterDescriptorOfType:withSuggestion:assetBySuggestionUUID:](self, "posterDescriptorOfType:withSuggestion:assetBySuggestionUUID:", 1, v16, v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setIdentifier:", v18);

        objc_msgSend(v6, "addObject:", v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  return v6;
}

- (id)settlingEffectDescriptorsForDonationWithSuggestionUUIDsToAvoid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *loggingConnection;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  __int16 v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  int v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  void *v55;
  NSObject *v56;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  PHAWallpaperSuggestionRefreshSession *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  uint8_t v74[128];
  uint8_t buf[4];
  _BYTE v76[18];
  _BYTE v77[128];
  _QWORD v78[8];

  v78[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v7;
  objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v8;
  v60 = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("uuid"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("subtype"), 602);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %d"), CFSTR("subtype"), 605);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v13);

  v59 = v5;
  objc_msgSend(MEMORY[0x1E0D77EF8], "fetchSettlingEffectSuggestionsWithOptions:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAWallpaperSuggestionRefreshSession randomizeSuggestions:](self, "randomizeSuggestions:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = self;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v17 = loggingConnection;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v76 = objc_msgSend(v15, "count");
    _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Found %d settling effect suggestions", buf, 8u);

  }
  -[PHAWallpaperSuggestionRefreshSession keyAssetBySuggestionUUIDFromSuggestions:](self, "keyAssetBySuggestionUUIDFromSuggestions:", v15);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D762A8]), "initWithType:loggingConnection:", 5, self->_loggingConnection);
  v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (!v20)
    goto LABEL_21;
  v21 = v20;
  v22 = *(_QWORD *)v70;
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v70 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
      v25 = objc_msgSend(v24, "subtype");
      PHSuggestionStringWithSubtype();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v25 & 0xFFFE) == 0x25A)
      {
        objc_msgSend(v24, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "assetIsUsingHeadroom:", v28))
        {
          v29 = v64->_loggingConnection;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v29;
            objc_msgSend(v24, "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v76 = v31;
            _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Skip suggestion %@ for settling effect descriptor donation because it's using headroom", buf, 0xCu);

          }
          goto LABEL_17;
        }

      }
      v32 = v64->_loggingConnection;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        objc_msgSend(v24, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v76 = v26;
        *(_WORD *)&v76[8] = 2112;
        *(_QWORD *)&v76[10] = v34;
        _os_log_impl(&dword_1CAC16000, v33, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Select (%@) suggestion %@ for settling effect descriptor donation", buf, 0x16u);

      }
      objc_msgSend(v62, "addObject:", v24);
      if ((unint64_t)objc_msgSend(v62, "count") >= 3)
      {

        goto LABEL_21;
      }
LABEL_17:

    }
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (v21)
      continue;
    break;
  }
LABEL_21:

  v35 = v62;
  if (objc_msgSend(v62, "count"))
  {
    v58 = v19;
    v61 = v18;
    -[PHAWallpaperSuggestionRefreshSession uuidsOfSuggestions:](v64, "uuidsOfSuggestions:", v62);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v64->_loggingConnection;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v37;
      v39 = objc_msgSend(v62, "count");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v76 = v39;
      *(_WORD *)&v76[4] = 2112;
      *(_QWORD *)&v76[6] = v36;
      _os_log_impl(&dword_1CAC16000, v38, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Refreshing gallery with %d settling effect suggestions %@", buf, 0x12u);

    }
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v41 = v62;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v66 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
          -[PHAWallpaperSuggestionRefreshSession posterDescriptorOfType:withSuggestion:assetBySuggestionUUID:](v64, "posterDescriptorOfType:withSuggestion:assetBySuggestionUUID:", 3, v46, v63);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0D751F8];
          objc_msgSend(v46, "uuid");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v49;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "descriptorIdentifierForDescriptorType:uuids:", 3, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setIdentifier:", v51);

          objc_msgSend(v40, "addObject:", v47);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      }
      while (v43);
    }

    v52 = v64->_loggingConnection;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = objc_msgSend(v40, "count");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v76 = v54;
      *(_WORD *)&v76[4] = 2112;
      *(_QWORD *)&v76[6] = v40;
      _os_log_impl(&dword_1CAC16000, v53, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Created %d SettlingEffect poster descriptors: %@", buf, 0x12u);

    }
    v55 = v60;
    v18 = v61;
    v19 = v58;
    v35 = v62;
  }
  else
  {
    v56 = v64->_loggingConnection;
    v55 = v60;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v56, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No settling effect suggestions found to refresh gallery", buf, 2u);
    }
    v40 = (id)MEMORY[0x1E0C9AA60];
  }

  return v40;
}

- (id)posterDescriptorOfType:(int64_t)a3 withSuggestion:(id)a4 assetBySuggestionUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D75220]);
  v13 = objc_msgSend(v8, "subtype");

  v14 = (void *)objc_msgSend(v12, "initWithAssetUUID:suggestionUUID:suggestionSubtype:", v11, v9, v13);
  v15 = objc_alloc(MEMORY[0x1E0D751F8]);
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithDescriptorType:media:", a3, v16);

  return v17;
}

- (id)updateIfNeededPosterDescriptors:(id)a3 fromCurrentPosterDescriptors:(id)a4 partialErrors:(id *)a5 progressReporter:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSObject *loggingConnection;
  void *v23;
  id v24;
  uint8_t v26[8];
  _QWORD v27[4];
  id v28;
  PHAWallpaperSuggestionRefreshSession *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  _QWORD *v35;
  uint8_t *v36;
  _QWORD v37[4];
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  void *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v13 = objc_msgSend(v12, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v43 + 24) = v13;
  if (!v13)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)buf = 0;
    v39 = buf;
    v40 = 0x2020000000;
    v41 = 0;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __132__PHAWallpaperSuggestionRefreshSession_updateIfNeededPosterDescriptors_fromCurrentPosterDescriptors_partialErrors_progressReporter___block_invoke;
    v27[3] = &unk_1E8520DD8;
    v34 = &v42;
    v35 = v37;
    v28 = v12;
    v29 = self;
    v20 = v18;
    v30 = v20;
    v31 = v11;
    v21 = v19;
    v32 = v21;
    v36 = buf;
    v15 = v17;
    v33 = v15;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v27);
    if (*((_BYTE *)v43 + 24))
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", v26, 2u);
      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v16 = 0;
    }
    else
    {
      if (a5)
        *a5 = objc_retainAutorelease(v20);
      if (v39[24])
      {
        v24 = v15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v24;
    }

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_20;
  }
  v14 = self->_loggingConnection;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v47[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

    goto LABEL_21;
  }
  v16 = 0;
LABEL_21:
  _Block_object_dispose(&v42, 8);

  return v16;
}

- (BOOL)savePreviewSegmentationResourcesForAsset:(id)a3 atURL:(id)a4 withClassification:(unint64_t)a5 styleCategory:(id)a6 enableSettlingEffect:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  void *v14;
  id v15;
  id v16;
  id v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  BOOL v24;

  v9 = a7;
  v14 = (void *)MEMORY[0x1E0D75340];
  v15 = a6;
  v16 = a4;
  v17 = a3;
  v18 = objc_msgSend(v14, "deviceSupportsLandscapeConfiguration");
  v19 = 8;
  if (v18)
    v19 = 136;
  if (v9)
    v20 = v19 | 0x40;
  else
    v20 = v19;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("Classification"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("LayerStackOptions"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("EnableSettlingEffect"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("StyleCategory"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("OutOfProcess"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E85409B8, CFSTR("SettlingEffectGatingLevel"));
  v24 = -[PHAWallpaperSuggestionRefreshSession saveSegmentationResourcesForAsset:atURL:withOptions:classification:error:](self, "saveSegmentationResourcesForAsset:atURL:withOptions:classification:error:", v17, v16, v21, a5, a8);

  return v24;
}

- (BOOL)saveShuffleSegmentationResourcesForAsset:(id)a3 atURL:(id)a4 withClassification:(unint64_t)a5 style:(id)a6 error:(id *)a7
{
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;

  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0C99E08];
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v12);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D751A0], "dictionaryWithStyle:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  if (PFPosterWantsLowLuminanceContent())
    v17 = 5;
  else
    v17 = 1;
  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
    v17 |= 0x22uLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("Classification"));

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("Style"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("LayerStackOptions"));

  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E85409D0, CFSTR("Priority"));
  v20 = -[PHAWallpaperSuggestionRefreshSession saveSegmentationResourcesForAsset:atURL:withOptions:classification:error:](self, "saveSegmentationResourcesForAsset:atURL:withOptions:classification:error:", v14, v13, v15, a5, a7);

  return v20;
}

- (BOOL)saveSegmentationResourcesForAsset:(id)a3 atURL:(id)a4 withOptions:(id)a5 classification:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  OS_os_log *v16;
  NSObject *v17;
  unint64_t v18;
  id *v19;
  uint64_t v20;
  id v21;
  VCPMediaAnalysisService *mediaAnalysisService;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  OS_os_log *v27;
  NSObject *v28;
  BOOL v29;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  id v33;
  _QWORD v34[4];
  id v35;
  PHAWallpaperSuggestionRefreshSession *v36;
  id v37;
  NSObject *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint8_t buf[8];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v33 = a5;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 1;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__6580;
  v46 = __Block_byref_object_dispose__6581;
  v47 = 0;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v15 = os_signpost_id_generate((os_log_t)self->_loggingConnection);
  v16 = self->_loggingConnection;
  v17 = v16;
  v18 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "saveSegmentation", ", buf, 2u);
  }
  spid = v15;

  v19 = a7;
  v20 = objc_msgSend(MEMORY[0x1E0D77EF8], "mediaAnalysisTypeForPosterClassification:", a6);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D47630]);
  if (v33)
    objc_msgSend(v21, "addEntriesFromDictionary:", v33, spid);
  mediaAnalysisService = self->_mediaAnalysisService;
  v52[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1, spid);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __113__PHAWallpaperSuggestionRefreshSession_saveSegmentationResourcesForAsset_atURL_withOptions_classification_error___block_invoke_2;
  v34[3] = &unk_1E8520E40;
  v24 = v12;
  v39 = &v48;
  v35 = v24;
  v36 = self;
  v25 = v13;
  v37 = v25;
  v40 = &v42;
  v26 = v14;
  v38 = v26;
  -[VCPMediaAnalysisService requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:](mediaAnalysisService, "requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:", v20 | 0x8000000000, v23, v21, &__block_literal_global_6588, v34);

  dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  v27 = self->_loggingConnection;
  v28 = v27;
  if (v18 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled((os_log_t)v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v28, OS_SIGNPOST_INTERVAL_END, spida, "saveSegmentation", ", buf, 2u);
  }

  if (v19)
    *v19 = objc_retainAutorelease((id)v43[5]);
  v29 = *((_BYTE *)v49 + 24) != 0;

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v29;
}

- (void)_removeIfNeededFeaturedContent:(id)a3 withCompletion:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *loggingConnection;
  _BOOL4 v9;
  id v10;
  void *v11;
  PRSService *posterService;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v6 = a4;
  v7 = objc_msgSend(a3, "count");
  loggingConnection = self->_loggingConnection;
  v9 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Featured content is not allowed and there are existing poster descriptors, attempting to remove them", buf, 2u);
    }
    v10 = objc_alloc_init(MEMORY[0x1E0D7F6F0]);
    -[NSURL path](self->_refreshSessionURL, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", v11);

    posterService = self->_posterService;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__PHAWallpaperSuggestionRefreshSession__removeIfNeededFeaturedContent_withCompletion___block_invoke;
    v13[3] = &unk_1E8520E68;
    v13[4] = self;
    v14 = v6;
    -[PRSService refreshPosterDescriptorsForExtension:sessionInfo:completion:](posterService, "refreshPosterDescriptorsForExtension:sessionInfo:completion:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), v10, v13);

  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Not allowed to feature content, and no existing poster descriptors", buf, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA70], 0);
  }

}

- (BOOL)reloadWallpaperSuggestionsForUUIDs:(id)a3 progress:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *loggingConnection;
  BOOL v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  dispatch_time_t v28;
  intptr_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, void *);
  void *v39;
  id v40;
  PHAWallpaperSuggestionRefreshSession *v41;
  NSObject *v42;
  uint8_t *v43;
  _QWORD v44[4];
  id v45;
  PHAWallpaperSuggestionRefreshSession *v46;
  NSObject *v47;
  uint8_t *v48;
  uint8_t v49[8];
  _QWORD v50[4];
  id v51;
  PHAWallpaperSuggestionRefreshSession *v52;
  NSObject *v53;
  uint8_t *v54;
  _QWORD v55[4];
  id v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Wallpaper suggestions refresh was canceled", buf, 2u);
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_34;
  }
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  *(_QWORD *)buf = 0;
  v58 = buf;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__6580;
  v61 = __Block_byref_object_dispose__6581;
  v62 = 0;
  objc_msgSend(v9, "progressReportersForParallelOperationsWithCount:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && !objc_msgSend(v8, "count"))
  {
    v35 = self->_loggingConnection;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_1CAC16000, v35, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Empty suggestionUUIDs, bypassing refreshPosterConfigurations", v49, 2u);
    }
  }
  else
  {
    dispatch_group_enter(v12);
    objc_msgSend(v14, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v9;
    v18 = v17;

    v19 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke;
    v55[3] = &unk_1E8520E90;
    v56 = v8;
    v50[0] = v19;
    v50[1] = 3221225472;
    v50[2] = __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_2;
    v50[3] = &unk_1E8520EB8;
    v54 = buf;
    v51 = v13;
    v52 = self;
    v53 = v12;
    -[PHAWallpaperSuggestionRefreshSession refreshPosterConfigurationsForNightlyRefresh:progressReporter:passingFilter:withCompletion:](self, "refreshPosterConfigurationsForNightlyRefresh:progressReporter:passingFilter:withCompletion:", 0, v18, v55, v50);

  }
  dispatch_group_enter(v12);
  if ((unint64_t)objc_msgSend(v14, "count") < 2)
  {
    v20 = v9;
  }
  else
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_281;
  v44[3] = &unk_1E8520EB8;
  v22 = v13;
  v48 = buf;
  v45 = v22;
  v46 = self;
  v23 = v12;
  v47 = v23;
  -[PHAWallpaperSuggestionRefreshSession refreshPosterDescriptorsWithProgressReporter:completion:](self, "refreshPosterDescriptorsWithProgressReporter:completion:", v21, v44);
  dispatch_group_enter(v23);
  if ((unint64_t)objc_msgSend(v14, "count") < 3)
  {
    v24 = v9;
  }
  else
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_282;
  v39 = &unk_1E8520EB8;
  v26 = v22;
  v43 = buf;
  v40 = v26;
  v41 = self;
  v27 = v23;
  v42 = v27;
  -[PHAWallpaperSuggestionRefreshSession refreshAmbientDescriptorsWithProgressReporter:completion:](self, "refreshAmbientDescriptorsWithProgressReporter:completion:", v25, &v36);
  dispatch_group_leave(v27);
  v28 = dispatch_time(0, 300000000000);
  v29 = dispatch_group_wait(v27, v28);
  if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0, v36, v37, v38, v39))
  {
    objc_msgSend(v26, "lock");
    if (!*((_QWORD *)v58 + 5))
    {
      v30 = self->_loggingConnection;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v49 = 0;
        _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Wallpaper suggestions refresh was canceled", v49, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v31 = objc_claimAutoreleasedReturnValue();
LABEL_28:
      v33 = (void *)*((_QWORD *)v58 + 5);
      *((_QWORD *)v58 + 5) = v31;

      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if (v29)
  {
    objc_msgSend(v26, "lock");
    if (!*((_QWORD *)v58 + 5))
    {
      v32 = self->_loggingConnection;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v49 = 0;
        _os_log_error_impl(&dword_1CAC16000, v32, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Timed out reloading wallpaper suggestions", v49, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 9);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
LABEL_29:
    objc_msgSend(v26, "unlock");
  }
  if (a5)
    *a5 = objc_retainAutorelease(*((id *)v58 + 5));
  v11 = *((_QWORD *)v58 + 5) == 0;

  _Block_object_dispose(buf, 8);
LABEL_34:

  return v11;
}

- (void)enumerateRefreshableShufflePosterConfigurationsIn:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *loggingConnection;
  __int128 v20;
  void (**v21)(id, void *, void *, uint8_t *);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = (void (**)(id, void *, void *, uint8_t *))a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v24;
    *(_QWORD *)&v9 = 138412546;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0D751F0];
        objc_msgSend(v13, "assetDirectory", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v14, "loadFromURL:error:", v15, &v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v22;

        if (v16)
        {
          if (objc_msgSend(v16, "configurationType") == 1)
          {
            objc_msgSend(v16, "shuffleConfiguration");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "shuffleType") != 1)
            {
              if (v18)
              {
                buf[0] = 0;
                v21[2](v21, v13, v16, buf);
                if (buf[0])
                {

                  goto LABEL_19;
                }
              }
              goto LABEL_16;
            }
LABEL_15:

            v18 = 0;
          }
          else
          {
            v18 = 0;
            if (objc_msgSend(0, "shuffleType") == 1)
              goto LABEL_15;
          }
LABEL_16:

          goto LABEL_17;
        }
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          v28 = v13;
          v29 = 2112;
          v30 = v17;
          _os_log_error_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_ERROR, "Error unarchiving poster configuration %@: %@", buf, 0x16u);
        }
LABEL_17:

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v10);
  }
LABEL_19:

}

- (id)consolidatedShuffleConfigurationFromPosterConfigurations:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "shuffleConfiguration", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "personLocalIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v13);

        objc_msgSend(v12, "albumCloudIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v14);

        v9 |= objc_msgSend(v12, "shuffleSmartAlbums");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75230]), "initWithShuffleType:", 0);
  objc_msgSend(v15, "setPersonLocalIdentifiers:", v4);
  objc_msgSend(v15, "setAlbumCloudIdentifiers:", v5);
  objc_msgSend(v15, "setShuffleSmartAlbums:", v9);

  return v15;
}

- (id)createAndExportMediaForSuggestionLocalIdentifiers:(id)a3 style:(id)a4 toURL:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  int v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  id *v35;
  id v36;
  id obj;
  PHAWallpaperSuggestionRefreshSession *v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v40 = a4;
  v38 = self;
  v39 = a5;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("localIdentifier"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0D77EF0], "mediaFromSuggestions:assetBySuggestionUUID:", v13, &v46);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v46;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v16)
  {
    v17 = v16;
    v33 = v13;
    v34 = v11;
    v35 = a6;
    v36 = v10;
    v18 = 0;
    v19 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1D1798448]();
        objc_msgSend(v21, "suggestionUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v21, "subpath");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "URLByAppendingPathComponent:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_msgSend(MEMORY[0x1E0D77EF8], "posterClassificationForSuggestionMedia:", v21);
          v41 = v18;
          LODWORD(v25) = -[PHAWallpaperSuggestionRefreshSession saveShuffleSegmentationResourcesForAsset:atURL:withClassification:style:error:](v38, "saveShuffleSegmentationResourcesForAsset:atURL:withClassification:style:error:", v24, v26, v27, v40, &v41);
          v28 = v41;

          if (!(_DWORD)v25)
          {

            objc_autoreleasePoolPop(v22);
            v29 = 0;
            goto LABEL_13;
          }
          v18 = v28;
        }

        objc_autoreleasePoolPop(v22);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v17)
        continue;
      break;
    }
    v29 = 1;
    v28 = v18;
LABEL_13:
    a6 = v35;
    v10 = v36;
    v13 = v33;
    v11 = v34;
  }
  else
  {
    v28 = 0;
    v29 = 1;
  }

  if (a6)
    *a6 = objc_retainAutorelease(v28);
  if (v29)
    v30 = obj;
  else
    v30 = 0;
  v31 = v30;

  return v31;
}

- (void)updateSuggestionFeaturedStateWithNewSuggestionUUIDs:(id)a3 oldSuggestionUUIDs:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PHPhotoLibrary *photoLibrary;
  id v16;
  _BOOL4 v17;
  id v18;
  NSObject *loggingConnection;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99E20];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithSet:", v8);
  objc_msgSend(v9, "minusSet:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v7);

  objc_msgSend(v10, "minusSet:", v8);
  objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v13);

    objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      photoLibrary = self->_photoLibrary;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __111__PHAWallpaperSuggestionRefreshSession_updateSuggestionFeaturedStateWithNewSuggestionUUIDs_oldSuggestionUUIDs___block_invoke;
      v21[3] = &unk_1E85211E0;
      v22 = v14;
      v16 = v9;
      v23 = v16;
      v20 = 0;
      v17 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v21, &v20);
      v18 = v20;
      loggingConnection = self->_loggingConnection;
      if (v17)
      {
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully updated all suggestions featured state.\n\tFeature: %@", buf, 0xCu);
          loggingConnection = self->_loggingConnection;
        }
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v10;
          _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Unfeature: %@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v18;
        _os_log_error_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to update featured state of suggestions: %@", buf, 0xCu);
      }

    }
  }

}

- (id)currentlyFeaturedSuggestionUUIDsForTop:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1D1798448](self, a2);
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllTopWallpaperSuggestions");
  else
    objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllShuffleWallpaperSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchWallpaperSuggestionsWithFeaturedState:withOptions:", 1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAWallpaperSuggestionRefreshSession uuidsOfSuggestions:](self, "uuidsOfSuggestions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (id)uuidsOfSuggestions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
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
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "uuid", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)suggestionUUIDsForPosterDescriptors:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "media", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "suggestionUUID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)refreshAmbientDescriptorsWithProgressReporter:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  id v8;
  int v9;
  NSObject *loggingConnection;
  _BOOL4 v11;
  void *v12;
  PRSService *posterService;
  _QWORD v14[4];
  id v15;
  PHAWallpaperSuggestionRefreshSession *v16;
  void (**v17)(id, _QWORD, void *);
  uint64_t *v18;
  uint8_t buf[16];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if ((PNAmbientPhotoFrameEnabled() & 1) != 0)
  {
    v8 = v6;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v9 = objc_msgSend(v8, "isCancelledWithProgress:", 0.0);
    *((_BYTE *)v21 + 24) = v9;
    loggingConnection = self->_loggingConnection;
    v11 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Ambient Descriptors refresh was canceled", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v12);
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Start refreshing ambient poster descriptors", buf, 2u);
      }
      posterService = self->_posterService;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __97__PHAWallpaperSuggestionRefreshSession_refreshAmbientDescriptorsWithProgressReporter_completion___block_invoke;
      v14[3] = &unk_1E8520EE0;
      v18 = &v20;
      v15 = v8;
      v16 = self;
      v17 = v7;
      -[PRSService refreshPosterDescriptorsForExtension:completion:](posterService, "refreshPosterDescriptorsForExtension:completion:", CFSTR("com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"), v14);

      v12 = v15;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v7[2](v7, MEMORY[0x1E0C9AA70], 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisService, 0);
  objc_storeStrong((id *)&self->_posterService, 0);
  objc_storeStrong((id *)&self->_refreshSessionURL, 0);
  objc_storeStrong((id *)&self->_refreshSessionIdentifier, 0);
}

void __97__PHAWallpaperSuggestionRefreshSession_refreshAmbientDescriptorsWithProgressReporter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  _QWORD v29[2];
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_BYTE *)(v7 + 24) = v8;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Ambient Descriptors refresh was canceled", buf, 2u);
    }
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    if (v6)
    {
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29[0] = v6;
        _os_log_error_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to refresh poster descriptors: %@", buf, 0xCu);
      }
      v13 = v6;
      v11 = 0;
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v15 = v5;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "identifier", (_QWORD)v24);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v20);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v17);
      }

      v30 = CFSTR("posterDescriptorIdentifiers");
      v31 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        v23 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 67109378;
        LODWORD(v29[0]) = v23;
        WORD2(v29[0]) = 2112;
        *(_QWORD *)((char *)v29 + 6) = v14;
        _os_log_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed %d ambient poster descriptors: %@", buf, 0x12u);

      }
      v13 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __111__PHAWallpaperSuggestionRefreshSession_updateSuggestionFeaturedStateWithNewSuggestionUUIDs_oldSuggestionUUIDs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", v7, (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v7, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "containsObject:", v10);

        objc_msgSend(v8, "setFeaturedState:", v11);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "media");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v4, "media", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "suggestionUUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v13) = objc_msgSend(v13, "containsObject:", v14);

            if ((v13 & 1) != 0)
            {
              v15 = 1;
              goto LABEL_15;
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v10)
            continue;
          break;
        }
      }
      v15 = 0;
LABEL_15:

    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

void __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (a2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] refreshPosterConfigurations succeeded", (uint8_t *)&v8, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] refreshPosterConfigurations failed: %@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_281(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (a2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed poster descriptors", (uint8_t *)&v8, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to refresh poster descriptors: %@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __90__PHAWallpaperSuggestionRefreshSession_reloadWallpaperSuggestionsForUUIDs_progress_error___block_invoke_282(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (a2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed ambient poster descriptors", (uint8_t *)&v8, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to refresh ambient poster descriptors: %@", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __86__PHAWallpaperSuggestionRefreshSession__removeIfNeededFeaturedContent_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully removed all existing poster descriptors", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to remove existing poster descriptors: %@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __113__PHAWallpaperSuggestionRefreshSession_saveSegmentationResourcesForAsset_atURL_withOptions_classification_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  char v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v5 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D475B8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(NSObject **)(v12 + 56);
    if (v11)
    {
      v40 = v6;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v7;
        v45 = 2112;
        v46 = v11;
        _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully exported wallpaper for asset %@ to temporary directory at %@", buf, 0x16u);
      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v11);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 48);
        v42 = 0;
        v20 = objc_msgSend(v18, "removeItemAtURL:error:", v19, &v42);
        v21 = v42;

        if ((v20 & 1) == 0)
        {
          v22 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v39 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138413058;
            v44 = v7;
            v45 = 2112;
            v46 = v14;
            v47 = 2112;
            v48 = v39;
            v49 = 2112;
            v50 = v21;
            _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to remove existing file so it can be overwritten when exporting wallpaper for asset %@ from %@ to %@: %@", buf, 0x2Au);
          }
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 48);
      v41 = 0;
      v25 = objc_msgSend(v23, "copyItemAtURL:toURL:error:", v14, v24, &v41);
      v26 = v41;
      v27 = v41;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v25;

      v28 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        v6 = v40;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138412802;
          v44 = v7;
          v45 = 2112;
          v46 = v14;
          v47 = 2112;
          v48 = v29;
          _os_log_impl(&dword_1CAC16000, v28, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully copied exported wallpaper for asset %@ from %@ to %@", buf, 0x20u);
        }
      }
      else
      {
        v6 = v40;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v38 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          v44 = v7;
          v45 = 2112;
          v46 = v14;
          v47 = 2112;
          v48 = v38;
          v49 = 2112;
          v50 = v27;
          _os_log_error_impl(&dword_1CAC16000, v28, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to copy exported wallpaper for asset %@ from %@ to %@: %@", buf, 0x2Au);
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v26);
      }

    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(v12 + 56), OS_LOG_TYPE_ERROR))
      {
        v37 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v44 = v7;
        v45 = 2112;
        v46 = v37;
        _os_log_error_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to export wallpaper for asset %@ to directory at %@: MAD reported success but no exported file path", buf, 0x16u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 9);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v14 = *(void **)(v35 + 40);
      *(_QWORD *)(v35 + 40) = v34;
    }

LABEL_27:
    goto LABEL_28;
  }
  v30 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v36 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v44 = v7;
    v45 = 2112;
    v46 = v36;
    v47 = 2112;
    v48 = v6;
    _os_log_error_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to export wallpaper for asset %@ to directory at %@: %@", buf, 0x20u);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v31 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v31, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Missing error while onDemandAnalysis is nil.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", -100, CFSTR("Missing error while onDemandAnalysis is nil."));
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;
    goto LABEL_27;
  }
LABEL_28:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __132__PHAWallpaperSuggestionRefreshSession_updateIfNeededPosterDescriptors_fromCurrentPosterDescriptors_partialErrors_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  char v23;
  int v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  uint64_t k;
  void *v57;
  void *v58;
  uint64_t v59;
  char v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  int v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  _BYTE *v71;
  void *v72;
  void *v73;
  void *v74;
  id obj;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  _BOOL4 v79;
  uint64_t v80;
  id v81;
  void *v82;
  void *context;
  void *v84;
  void *v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  id v100;
  id v101;
  id v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint8_t v105[128];
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  id v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (*(_BYTE *)(v9 + 24))
  {
    v10 = 1;
  }
  else
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.5);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  }
  *(_BYTE *)(v9 + 24) = v10;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    if (objc_msgSend(v8, "descriptorType") == 1)
    {
      PFParallaxStyleFrequencyTable();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) % (unint64_t)objc_msgSend(v11, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setStyleCategory:", v12);

      v13 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        objc_msgSend(v8, "styleCategory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v107 = v15;
        v108 = 2112;
        v109 = v16;
        _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Applied Style: '%@' to descriptor %@", buf, 0x16u);

      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "URLByAppendingPathComponent:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0;
    v19 = objc_msgSend(v18, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v102);
    v20 = v102;

    v21 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (!v19)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v107 = v17;
        v108 = 2112;
        v109 = v20;
        _os_log_error_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to create poster descriptor directory at %@: %@", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v20);
      goto LABEL_33;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v107 = v17;
      _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully created poster descriptor directory at %@", buf, 0xCu);
    }
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (*(_BYTE *)(v22 + 24))
    {
      v23 = 1;
    }
    else
    {
      v23 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.5);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    }
    *(_BYTE *)(v22 + 24) = v23;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      *a4 = 1;
LABEL_33:

      goto LABEL_34;
    }
    v101 = v20;
    v24 = objc_msgSend(v8, "saveToURL:error:", v17, &v101);
    v25 = v101;

    v26 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (!v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v107 = v17;
        v108 = 2112;
        v109 = v25;
        _os_log_error_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to save poster descriptor to directory at %@: %@", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);
      goto LABEL_32;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v107 = v17;
      _os_log_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully saved poster descriptor to directory at %@", buf, 0xCu);
    }
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (*(_BYTE *)(v27 + 24))
    {
      v28 = 1;
    }
    else
    {
      v28 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.5);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    }
    *(_BYTE *)(v27 + 24) = v28;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      *a4 = 1;
LABEL_32:
      v20 = v25;
      goto LABEL_33;
    }
    v85 = v25;
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = (void *)MEMORY[0x1E0D751F8];
      objc_msgSend(v29, "assetDirectory");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v85;
      objc_msgSend(v31, "loadFromURL:error:", v32, &v100);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v100;

      v85 = v34;
    }
    else
    {
      v33 = 0;
    }
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (*(_BYTE *)(v35 + 24))
    {
      v36 = 1;
    }
    else
    {
      v36 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.5);
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    }
    *(_BYTE *)(v35 + 24) = v36;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      if (!v33)
        goto LABEL_47;
      if ((objc_msgSend(v8, "isEqual:", v33) & 1) != 0)
      {
LABEL_44:
        objc_msgSend(*(id *)(a1 + 72), "addObject:", v7, v71);
LABEL_50:

        v20 = v85;
        goto LABEL_33;
      }
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      if (*(_BYTE *)(v37 + 24))
      {
        v38 = 1;
      }
      else
      {
LABEL_47:
        v38 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.5);
        v37 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      }
      *(_BYTE *)(v37 + 24) = v38;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
        v72 = v33;
        v73 = v30;
        v71 = a4;
        v74 = v17;
        v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        objc_msgSend(v8, "media");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v97;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v97 != v42)
                objc_enumerationMutation(v39);
              v44 = (void *)MEMORY[0x1E0CD1390];
              objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "assetUUID", v71);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "localIdentifierWithUUID:", v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (v46)
                objc_msgSend(v86, "addObject:", v46);

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
          }
          while (v41);
        }

        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v86, *(_QWORD *)(a1 + 64));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v49 = v47;
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v93;
          do
          {
            for (j = 0; j != v51; ++j)
            {
              if (*(_QWORD *)v93 != v52)
                objc_enumerationMutation(v49);
              v54 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
              objc_msgSend(v54, "uuid", v71);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setObject:forKeyedSubscript:", v54, v55);

            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
          }
          while (v51);
        }

        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        objc_msgSend(v8, "media");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
        if (v77)
        {
          v76 = *(_QWORD *)v89;
          v17 = v74;
          while (2)
          {
            for (k = 0; k != v77; ++k)
            {
              if (*(_QWORD *)v89 != v76)
                objc_enumerationMutation(obj);
              v57 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * k);
              v58 = (void *)MEMORY[0x1D1798448]();
              v59 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
              if (*(_BYTE *)(v59 + 24))
              {
                v60 = 1;
              }
              else
              {
                v60 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.5);
                v59 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
              }
              *(_BYTE *)(v59 + 24) = v60;
              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
              {
                objc_autoreleasePoolPop(v58);
                goto LABEL_86;
              }
              context = v58;
              objc_msgSend(v57, "assetUUID");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "objectForKeyedSubscript:", v61);
              v62 = objc_claimAutoreleasedReturnValue();

              v84 = (void *)v62;
              if (v62)
              {
                objc_msgSend(v57, "subpath");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "URLByAppendingPathComponent:", v63);
                v82 = (void *)objc_claimAutoreleasedReturnValue();

                v80 = objc_msgSend(MEMORY[0x1E0D77EF8], "posterClassificationForMedia:descriptorType:", v57, objc_msgSend(v8, "descriptorType"));
                v79 = objc_msgSend(v8, "descriptorType") == 3;
                v78 = *(void **)(a1 + 40);
                objc_msgSend(v8, "styleCategory");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = v85;
                v65 = objc_msgSend(v78, "savePreviewSegmentationResourcesForAsset:atURL:withClassification:styleCategory:enableSettlingEffect:error:", v62, v82, v80, v64, v79, &v87);
                v81 = v87;

                v66 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
                if (!v65)
                {
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                  {
                    v69 = v66;
                    objc_msgSend(v84, "uuid");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v107 = v70;
                    v108 = 2112;
                    v109 = v81;
                    _os_log_error_impl(&dword_1CAC16000, v69, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to save preview segmentation resources for asset %@: %@", buf, 0x16u);

                  }
                  if (v81)
                    objc_msgSend(*(id *)(a1 + 48), "addObject:", v81);

                  objc_autoreleasePoolPop(context);
                  v85 = v81;
                  goto LABEL_94;
                }
                if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
                {
                  v67 = v66;
                  objc_msgSend(v84, "uuid");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v107 = v68;
                  _os_log_impl(&dword_1CAC16000, v67, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully saved preview segmentation resources for asset %@", buf, 0xCu);

                }
                v85 = v81;
              }

              objc_autoreleasePoolPop(context);
            }
            v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
            if (v77)
              continue;
            break;
          }
        }
        else
        {
          v17 = v74;
        }
LABEL_86:

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
        {
          *v71 = 1;
LABEL_94:

          v33 = v72;
          v30 = v73;
          goto LABEL_50;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;

        v33 = v72;
        v30 = v73;
        goto LABEL_44;
      }
    }
    *a4 = 1;
    goto LABEL_50;
  }
  *a4 = 1;
LABEL_34:

}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  _DWORD v29[7];

  *(_QWORD *)&v29[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)buf = 67109378;
      v29[0] = objc_msgSend(v5, "count");
      LOWORD(v29[1]) = 2112;
      *(_QWORD *)((char *)&v29[1] + 2) = v5;
      _os_log_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully fetched %d current poster configurations: %@", buf, 0x12u);

    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (*(_BYTE *)(v9 + 24))
    {
      v10 = 1;
    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "isCancelledWithProgress:", 0.2);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    }
    *(_BYTE *)(v9 + 24) = v10;
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      v12 = *(NSObject **)(v11 + 56);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", buf, 2u);
      }
      v13 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    }
    else
    {
      v15 = *(NSObject **)(v11 + 64);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_228;
      v18[3] = &unk_1E8520D60;
      v18[4] = v11;
      v16 = *(id *)(a1 + 72);
      v17 = *(_QWORD *)(a1 + 88);
      v24 = v16;
      v26 = v17;
      v19 = *(id *)(a1 + 40);
      v20 = v5;
      v25 = *(id *)(a1 + 80);
      v21 = *(id *)(a1 + 48);
      v22 = *(id *)(a1 + 56);
      v27 = *(_BYTE *)(a1 + 96);
      v23 = *(id *)(a1 + 64);
      dispatch_async(v15, v18);

    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v29 = v6;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to fetch current poster configurations: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_228(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  int v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  int v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  int v76;
  int v77;
  NSObject *v78;
  _BOOL4 v80;
  void *v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  NSObject *v86;
  NSObject *v87;
  const char *v88;
  uint32_t v89;
  void *v90;
  void *v91;
  int v92;
  id v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  NSObject *v100;
  char v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  NSObject *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  int v117;
  int v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t j;
  void *v124;
  id v125;
  void *v126;
  NSObject *v127;
  int v128;
  NSObject *v129;
  _BOOL4 v130;
  NSObject *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  PHAWallpaperSuggestionAnalyticsSender *v137;
  void *v138;
  id v139;
  NSObject *group;
  id v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  id obj;
  void *v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  void *v151;
  id v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  uint64_t v161;
  _QWORD v162[4];
  id v163;
  void *v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  NSObject *v171;
  id v172;
  id v173;
  id v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _QWORD block[4];
  id v184;
  uint64_t v185;
  id v186;
  id v187;
  id v188;
  id v189;
  uint64_t v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _QWORD v195[4];
  id v196;
  id v197;
  uint64_t v198;
  id v199;
  uint8_t v200[128];
  uint8_t buf[4];
  _BYTE v202[20];
  void *v203;
  __int16 v204;
  void *v205;
  _BYTE v206[128];
  _BYTE v207[128];
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 8))
  {
    v5 = *(NSObject **)(v2 + 56);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Refresh session has been cleaned up, bailing", buf, 2u);
    }
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "isCancelledWithProgress:", 0.25);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  }
  *(_BYTE *)(v3 + 24) = v4;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 48);
    v195[0] = MEMORY[0x1E0C809B0];
    v195[1] = 3221225472;
    v195[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_229;
    v195[3] = &unk_1E8520CE0;
    v199 = *(id *)(a1 + 88);
    v13 = a1;
    v8 = v9;
    v196 = v8;
    v14 = v10;
    v15 = *(_QWORD *)(v13 + 32);
    v152 = v14;
    v197 = v14;
    v198 = v15;
    objc_msgSend(v11, "enumerateRefreshableShufflePosterConfigurationsIn:usingBlock:", v12, v195);
    v16 = objc_msgSend(v8, "count");
    v161 = v13;
    v17 = *(_QWORD **)(v13 + 32);
    v18 = v17[7];
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No poster configurations eligible for update", buf, 2u);
        v17 = *(_QWORD **)(v13 + 32);
      }
      objc_msgSend(v17, "currentlyFeaturedSuggestionUUIDsForTop:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(v161 + 32);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateSuggestionFeaturedStateWithNewSuggestionUUIDs:oldSuggestionUUIDs:", v24, v22);

      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v161 + 80) + 16))(*(_QWORD *)(v161 + 80), MEMORY[0x1E0C9AA70], 0);
      goto LABEL_130;
    }
    if (v19)
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v202 = v16;
      *(_WORD *)&v202[4] = 2112;
      *(_QWORD *)&v202[6] = v8;
      _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Found %d poster configurations eligible for update: %@", buf, 0x12u);
    }
    v20 = *(_QWORD *)(*(_QWORD *)(v13 + 96) + 8);
    if (*(_BYTE *)(v20 + 24))
    {
      v21 = 1;
    }
    else
    {
      v21 = objc_msgSend(*(id *)(v13 + 40), "isCancelledWithProgress:", 0.3);
      v20 = *(_QWORD *)(*(_QWORD *)(v13 + 96) + 8);
    }
    *(_BYTE *)(v20 + 24) = v21;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v13 + 96) + 8) + 24))
    {
      v25 = *(NSObject **)(*(_QWORD *)(v13 + 32) + 56);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", buf, 2u);
      }
      v26 = *(_QWORD *)(v13 + 80);
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v22);
      goto LABEL_130;
    }
    v136 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(NSObject **)(*(_QWORD *)(v13 + 32) + 56);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v202 = v27;
      _os_log_impl(&dword_1CAC16000, v28, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Date is %@", buf, 0xCu);
    }
    v147 = (void *)v27;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F8]), "initWithPhotoLibrary:", *(_QWORD *)(v13 + 56));
    v160 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v191 = 0u;
    v192 = 0u;
    v193 = 0u;
    v194 = 0u;
    v134 = v29;
    objc_msgSend(v29, "personUUIDsWithNegativeFeedback");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v191, v207, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v192;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v192 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v191 + 1) + 8 * i));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            objc_msgSend(v160, "addObject:", v35);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v191, v207, 16);
      }
      while (v32);
    }

    v36 = v13;
    v37 = *(_QWORD **)(v13 + 32);
    v38 = v37[7];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = v38;
      v40 = objc_msgSend(v160, "count");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v202 = v40;
      *(_WORD *)&v202[4] = 2112;
      *(_QWORD *)&v202[6] = v160;
      _os_log_impl(&dword_1CAC16000, v39, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Found %d rejected person local identifiers: %@", buf, 0x12u);

      v37 = *(_QWORD **)(v13 + 32);
    }
    objc_msgSend(v152, "allValues");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "consolidatedShuffleConfigurationFromPosterConfigurations:", v41);
    v42 = objc_claimAutoreleasedReturnValue();

    v43 = *(NSObject **)(*(_QWORD *)(v13 + 32) + 56);
    v22 = v147;
    if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(v161 + 32) + 56), OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v202 = v42;
      _os_log_impl(&dword_1CAC16000, v43, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Consolidated shuffle configuration: %@", buf, 0xCu);
    }
    v133 = (void *)v42;
    objc_msgSend(MEMORY[0x1E0D77EF0], "suggestionLocalIdentifiersByFeatureForPosterConfiguration:atDate:inPhotoLibrary:", v42, v147, *(_QWORD *)(v161 + 56));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *(NSObject **)(*(_QWORD *)(v161 + 32) + 56);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = v44;
      v46 = objc_msgSend(v151, "count");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v202 = v46;
      _os_log_impl(&dword_1CAC16000, v45, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Found %d features with suggestions", buf, 8u);

    }
    v47 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v145 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v16);
    v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = dispatch_group_create();
    dispatch_group_enter(v50);
    v51 = *(void **)(v161 + 40);
    v52 = *(NSObject **)(*(_QWORD *)(v161 + 32) + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_236;
    block[3] = &unk_1E8520D08;
    v190 = *(_QWORD *)(v161 + 96);
    v53 = v51;
    v54 = *(_QWORD *)(v161 + 32);
    v184 = v53;
    v185 = v54;
    v189 = *(id *)(v161 + 80);
    v141 = v47;
    v186 = v141;
    v144 = v49;
    v187 = v144;
    v139 = v48;
    group = v50;
    v188 = v139;
    dispatch_group_notify(v50, v52, block);
    v55 = objc_alloc_init(MEMORY[0x1E0D7F6F0]);
    objc_msgSend(*(id *)(*(_QWORD *)(v161 + 32) + 16), "path");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v55;
    objc_msgSend(v55, "setIdentifier:", v56);

    v132 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D762A0]), "initWithPhotoLibrary:", *(_QWORD *)(v161 + 56));
    v137 = -[PHAWallpaperSuggestionAnalyticsSender initWithGraphManager:libraryAnalysisSummary:]([PHAWallpaperSuggestionAnalyticsSender alloc], "initWithGraphManager:libraryAnalysisSummary:", *(_QWORD *)(*(_QWORD *)(v161 + 32) + 40), v132);
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    v182 = 0u;
    obj = v136;
    v150 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v206, 16);
    if (!v150)
    {
LABEL_129:

      dispatch_group_leave(group);
      v8 = v136;
LABEL_130:

      goto LABEL_131;
    }
    v148 = *(_QWORD *)v180;
LABEL_43:
    v57 = 0;
    while (1)
    {
      if (*(_QWORD *)v180 != v148)
        objc_enumerationMutation(obj);
      v58 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * v57);
      v59 = *(_QWORD *)(*(_QWORD *)(v36 + 96) + 8);
      if (*(_BYTE *)(v59 + 24))
      {
        v60 = 1;
      }
      else
      {
        v60 = objc_msgSend(*(id *)(v36 + 40), "isCancelledWithProgress:", 0.5);
        v59 = *(_QWORD *)(*(_QWORD *)(v36 + 96) + 8);
      }
      *(_BYTE *)(v59 + 24) = v60;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v36 + 96) + 8) + 24))
        goto LABEL_129;
      v153 = v57;
      objc_msgSend(v58, "assetDirectory");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "objectForKeyedSubscript:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v62, "shuffleConfiguration");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = *(NSObject **)(*(_QWORD *)(v36 + 32) + 56);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v202 = v58;
        *(_WORD *)&v202[8] = 2112;
        *(_QWORD *)&v202[10] = v62;
        _os_log_impl(&dword_1CAC16000, v64, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Handling poster configuration %@, PFPosterConfiguration %@", buf, 0x16u);
        v64 = *(NSObject **)(*(_QWORD *)(v36 + 32) + 56);
      }
      v149 = v58;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v202 = v63;
        _os_log_impl(&dword_1CAC16000, v64, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Handling PFPosterShuffleConfiguration: %@", buf, 0xCu);
      }
      v65 = (void *)MEMORY[0x1E0D77EF0];
      objc_msgSend(v62, "shuffleConfiguration");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "chosenSuggestionLocalIdentifiersForPosterConfiguration:fromSuggestionLocalIdentifiersByFeature:atDate:usingStrategy:withRejectedPersonLocalIdentifiers:", v66, v151, v22, 1, v160);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = *(NSObject **)(*(_QWORD *)(v36 + 32) + 56);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = v68;
        v70 = objc_msgSend(v67, "count");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v202 = v70;
        _os_log_impl(&dword_1CAC16000, v69, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Found %d suggestions", buf, 8u);

      }
      v71 = (void *)MEMORY[0x1E0CD17D0];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v67);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "uuidsFromLocalIdentifiers:", v72);
      v158 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v62, "identifier");
      v73 = objc_claimAutoreleasedReturnValue();
      v157 = v62;
      objc_msgSend(v62, "media");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v154 = v63;
      v155 = v74;
      v159 = v67;
      v156 = (void *)v73;
      if (!v74)
        break;
      v76 = objc_msgSend(v74, "count");
      v77 = objc_msgSend(v67, "count");
      v78 = *(NSObject **)(v36 + 64);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v202 = v76;
        *(_WORD *)&v202[4] = 2112;
        *(_QWORD *)&v202[6] = v74;
        _os_log_impl(&dword_1CAC16000, v78, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] %d previousMedia: %@", buf, 0x12u);
        v78 = *(NSObject **)(v36 + 64);
      }
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v202 = v77;
        *(_WORD *)&v202[4] = 2112;
        *(_QWORD *)&v202[6] = v159;
        _os_log_impl(&dword_1CAC16000, v78, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] %d updatedSuggestionLocalIdentifiers: %@", buf, 0x12u);
      }
      v80 = v76 > v77 && v77 < 2;
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "BOOLForKey:", CFSTR("PHAWallpaperSuggestionGenerationWeeklyTaskLibraryIsProcessedEnough"));

      v83 = objc_msgSend(v63, "shuffleType");
      v84 = v83;
      if (v80)
        v85 = ((*(_BYTE *)(v36 + 104) != 0) | ~v82) & (v83 != 2);
      else
        v85 = 0;
      v107 = *(NSObject **)(v36 + 64);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        v108 = v107;
        NSStringFromBOOL();
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBOOL();
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBOOL();
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBOOL();
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)v202 = v109;
        *(_WORD *)&v202[8] = 2112;
        *(_QWORD *)&v202[10] = v110;
        *(_WORD *)&v202[18] = 2112;
        v203 = v111;
        v204 = 2112;
        v205 = v112;
        _os_log_impl(&dword_1CAC16000, v108, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] notEnoughContent:%@, isNightlyRefresh:%@, libraryIsProcessedEnough:%@, isUserAlbumShuffle:%@", buf, 0x2Au);

      }
      v113 = v159;
      if (!objc_msgSend(v159, "count") && v84 != 2)
      {
        v114 = *(NSObject **)(v36 + 64);
        v106 = v157;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v202 = v154;
          _os_log_fault_impl(&dword_1CAC16000, v114, OS_LOG_TYPE_FAULT, "[PHAWallpaperSuggestionRefreshSession] Found 0 suggestions for PFPosterShuffleConfiguration: %@. Skip refresh. This is unexpected because user must have enough content to create the first shuffle poster. If the library is processed enough please file a radar.", buf, 0xCu);
        }
LABEL_90:
        v115 = *(NSObject **)(v36 + 64);
        v22 = v147;
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          v116 = v115;
          v117 = objc_msgSend(v155, "count");
          v118 = objc_msgSend(v159, "count");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v202 = v156;
          *(_WORD *)&v202[8] = 1024;
          *(_DWORD *)&v202[10] = v117;
          *(_WORD *)&v202[14] = 1024;
          *(_DWORD *)&v202[16] = v118;
          _os_log_impl(&dword_1CAC16000, v116, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Special case. Poster configuration %@ has %d media and new shuffle has %d. Skip updating.", buf, 0x18u);

        }
        goto LABEL_127;
      }
      v106 = v157;
      if (v85)
        goto LABEL_90;
      v177 = 0u;
      v178 = 0u;
      v175 = 0u;
      v176 = 0u;
      v119 = v155;
      v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v175, v200, 16);
      if (v120)
      {
        v121 = v120;
        v122 = *(_QWORD *)v176;
        do
        {
          for (j = 0; j != v121; ++j)
          {
            if (*(_QWORD *)v176 != v122)
              objc_enumerationMutation(v119);
            v124 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v125 = v124;
              objc_msgSend(v125, "suggestionUUID");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "addObject:", v126);

            }
            else
            {
              v127 = *(NSObject **)(v161 + 64);
              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v202 = v124;
                _os_log_error_impl(&dword_1CAC16000, v127, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Error: previous medium has unexpected class: %@.", buf, 0xCu);
              }
            }
          }
          v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v175, v200, 16);
        }
        while (v121);
      }

      v128 = objc_msgSend(v75, "isEqualToSet:", v158);
      v36 = v161;
      v129 = *(NSObject **)(v161 + 64);
      v130 = os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT);
      if (v128)
      {
        v22 = v147;
        v106 = v157;
        v113 = v159;
        if (v130)
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v202 = v156;
          *(_WORD *)&v202[8] = 2112;
          *(_QWORD *)&v202[10] = v158;
          _os_log_impl(&dword_1CAC16000, v129, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster configuration %@ is unchanged, %@", buf, 0x16u);
        }
        objc_msgSend(v141, "unionSet:", v158);
        goto LABEL_127;
      }
      v22 = v147;
      if (v130)
      {
        *(_DWORD *)buf = 138412546;
        v73 = (uint64_t)v156;
        *(_QWORD *)v202 = v156;
        *(_WORD *)&v202[8] = 2112;
        *(_QWORD *)&v202[10] = v75;
        _os_log_impl(&dword_1CAC16000, v129, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster configuration %@ has changed from %@", buf, 0x16u);
        v129 = *(NSObject **)(v161 + 64);
      }
      else
      {
        v73 = (uint64_t)v156;
      }
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v202 = v158;
        v87 = v129;
        v88 = "[PHAWallpaperSuggestionRefreshSession] To %@";
        v89 = 12;
LABEL_71:
        _os_log_impl(&dword_1CAC16000, v87, OS_LOG_TYPE_DEFAULT, v88, buf, v89);
      }
LABEL_72:
      objc_msgSend(*(id *)(*(_QWORD *)(v36 + 32) + 16), "URLByAppendingPathComponent:", v73);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = 0;
      v92 = objc_msgSend(v91, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v90, 1, 0, &v174);
      v93 = v174;

      v94 = *(NSObject **)(*(_QWORD *)(v36 + 32) + 56);
      if (!v92)
      {
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v202 = v90;
          *(_WORD *)&v202[8] = 2112;
          *(_QWORD *)&v202[10] = v93;
          _os_log_error_impl(&dword_1CAC16000, v94, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to create poster configuration directory at %@: %@\nSkipping configuration", buf, 0x16u);
        }
        objc_msgSend(v145, "lock");
        objc_msgSend(v144, "addObject:", v93);
        objc_msgSend(v145, "unlock");
        v106 = v157;
        goto LABEL_126;
      }
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v202 = v90;
        _os_log_impl(&dword_1CAC16000, v94, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully created poster configuration directory at %@", buf, 0xCu);
      }
      objc_msgSend(v157, "editConfiguration");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = *(void **)(v36 + 32);
      v143 = v95;
      objc_msgSend(v95, "style");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v173 = v93;
      objc_msgSend(v96, "createAndExportMediaForSuggestionLocalIdentifiers:style:toURL:error:", v159, v97, v90, &v173);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v173;

      if (v98)
      {
        objc_msgSend(v157, "setMedia:", v98);
        v100 = *(NSObject **)(v36 + 64);
        if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v202 = v156;
          *(_WORD *)&v202[8] = 2112;
          *(_QWORD *)&v202[10] = v98;
          _os_log_impl(&dword_1CAC16000, v100, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully created/exported media for poster configuration %@: %@", buf, 0x16u);
        }
        v142 = v98;
        v172 = v99;
        v101 = objc_msgSend(v157, "saveToURL:error:", v90, &v172);
        v93 = v172;

        v102 = *(NSObject **)(v36 + 64);
        if ((v101 & 1) != 0)
        {
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v202 = v156;
            _os_log_impl(&dword_1CAC16000, v102, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully saved updated poster configuration %@", buf, 0xCu);
          }
          dispatch_group_enter(group);
          v135 = (void *)objc_opt_class();
          v103 = *(void **)(v36 + 64);
          v104 = *(_QWORD *)(v36 + 72);
          v162[0] = MEMORY[0x1E0C809B0];
          v162[1] = 3221225472;
          v162[2] = __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_242;
          v162[3] = &unk_1E8520D38;
          v105 = v103;
          v163 = v105;
          v164 = v149;
          v165 = v139;
          v166 = v141;
          v167 = v158;
          v168 = v144;
          v169 = v75;
          v170 = v145;
          v171 = group;
          objc_msgSend(v135, "refreshPosterConfigurationWithPosterService:retryCount:configuration:sessionInfo:log:completion:", v104, 3, v149, v138, v105, v162);
          v106 = v157;
          -[PHAWallpaperSuggestionAnalyticsSender sendRefreshSummaryEventWithPosterConfiguration:](v137, "sendRefreshSummaryEventWithPosterConfiguration:", v157);

        }
        else
        {
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v202 = v156;
            *(_WORD *)&v202[8] = 2112;
            *(_QWORD *)&v202[10] = v93;
            _os_log_error_impl(&dword_1CAC16000, v102, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to save updated poster configuration %@: %@\nSkipping configuration", buf, 0x16u);
          }
          objc_msgSend(v145, "lock");
          objc_msgSend(v144, "addObject:", v93);
          objc_msgSend(v145, "unlock");
          v106 = v157;
        }
        v98 = v142;
        goto LABEL_125;
      }
      v131 = *(NSObject **)(v36 + 64);
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v202 = v156;
        *(_WORD *)&v202[8] = 2112;
        *(_QWORD *)&v202[10] = v99;
        _os_log_error_impl(&dword_1CAC16000, v131, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to create/export media for poster configuration %@: %@\nSkipping configuration", buf, 0x16u);
        if (!v99)
        {
LABEL_123:
          v93 = 0;
          goto LABEL_124;
        }
      }
      else if (!v99)
      {
        goto LABEL_123;
      }
      objc_msgSend(v145, "lock");
      objc_msgSend(v144, "addObject:", v99);
      objc_msgSend(v145, "unlock");
      v93 = v99;
LABEL_124:
      v106 = v157;
LABEL_125:

LABEL_126:
      v113 = v159;

LABEL_127:
      v57 = v153 + 1;
      if (v153 + 1 == v150)
      {
        v150 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v206, 16);
        if (v150)
          goto LABEL_43;
        goto LABEL_129;
      }
    }
    v86 = *(NSObject **)(v36 + 64);
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      goto LABEL_72;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v202 = v73;
    *(_WORD *)&v202[8] = 2112;
    *(_QWORD *)&v202[10] = v158;
    v87 = v86;
    v88 = "[PHAWallpaperSuggestionRefreshSession] Poster configuration %@ is new, %@";
    v89 = 22;
    goto LABEL_71;
  }
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", buf, 2u);
  }
LABEL_10:
  v7 = *(_QWORD *)(a1 + 80);
  objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v8);
LABEL_131:

}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_229(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 56);
  if (!v7 || (*(unsigned int (**)(uint64_t, id))(v7 + 16))(v7, v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "assetDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

    v10 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 56);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster configurations eligible for update: %@", (uint8_t *)&v11, 0xCu);
    }
  }

}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_236(uint64_t a1)
{
  uint64_t v2;
  char v3;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.95);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  }
  *(_BYTE *)(v2 + 24) = v3;
  v4 = *(_QWORD **)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v5 = v4[7];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", v16, 2u);
    }
    v6 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    objc_msgSend(v4, "currentlyFeaturedSuggestionUUIDsForTop:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "updateSuggestionFeaturedStateWithNewSuggestionUUIDs:oldSuggestionUUIDs:", *(_QWORD *)(a1 + 48), v7);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (*(_BYTE *)(v8 + 24))
    {
      v9 = 1;
    }
    else
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 1.0);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    }
    *(_BYTE *)(v8 + 24) = v9;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Configurations refresh was canceled", v16, 2u);
      }
      v11 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 56), "count"))
      {
        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), 0);
        goto LABEL_19;
      }
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *(_QWORD *)(a1 + 56);
      v17 = *MEMORY[0x1E0CB2F70];
      v18[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pl_analysisErrorWithCode:userInfo:", 25, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 0, v12);
    }

  }
LABEL_19:

}

void __131__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationsForNightlyRefresh_progressReporter_passingFilter_withCompletion___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed poster configuration %@ to %@", buf, 0x16u);
    }
    v9 = *(void **)(a1 + 48);
    objc_msgSend(v5, "assetDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], v11);

    v12 = (_QWORD *)(a1 + 64);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v21 = v17;
      v22 = 2112;
      v23 = v6;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Error refreshing poster configuration %@: %@", buf, 0x16u);
    }
    v18 = CFSTR("error");
    v19 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "assetDirectory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v16);

    objc_msgSend(*(id *)(a1 + 72), "addObject:", v6);
    v12 = (_QWORD *)(a1 + 80);
  }
  objc_msgSend(*(id *)(a1 + 56), "unionSet:", *v12);
  objc_msgSend(*(id *)(a1 + 88), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));

}

void __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void (*v15)(void);
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  _DWORD v30[7];

  *(_QWORD *)&v30[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      *(_DWORD *)buf = 67109378;
      v30[0] = objc_msgSend(v5, "count");
      LOWORD(v30[1]) = 2112;
      *(_QWORD *)((char *)&v30[1] + 2) = v5;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully fetched %d current poster descriptors: %@", buf, 0x12u);

    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_BYTE *)(v10 + 24))
    {
      v11 = 1;
    }
    else
    {
      v11 = objc_msgSend(*(id *)(a1 + 40), "isCancelledWithProgress:", 0.2);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    }
    *(_BYTE *)(v10 + 24) = v11;
    v16 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v17 = *(NSObject **)(v16 + 56);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
      }
      v18 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

    }
    else
    {
      v20 = *(NSObject **)(v16 + 64);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke_210;
      v23[3] = &unk_1E8520C90;
      v23[4] = v16;
      v27 = *(id *)(a1 + 56);
      v21 = v5;
      v22 = *(_QWORD *)(a1 + 64);
      v24 = v21;
      v28 = v22;
      v25 = *(id *)(a1 + 40);
      v26 = *(id *)(a1 + 48);
      dispatch_async(v20, v23);

    }
  }
  else
  {
    v12 = objc_msgSend(v6, "code");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 56);
    if (v12 == -2218)
    {
      if (os_log_type_enabled(*(os_log_t *)(v13 + 56), OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v30 = v7;
        _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] PosterDescriptor dataStore is not initialized, currentPosterDescriptors is empty, received fetchError: %@. Proceed with refreshSession.", buf, 0xCu);
      }
      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(v13 + 56), OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v30 = v7;
        _os_log_error_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to fetch current poster descriptors: %@", buf, 0xCu);
      }
      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v15();
  }

}

void __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke_210(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  PHAWallpaperGalleryDemoHelper *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  char v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  char v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  NSObject *v63;
  _BOOL4 v64;
  uint64_t v65;
  NSObject *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  char v73;
  void *v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  _QWORD v94[4];
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  uint8_t v115[128];
  uint8_t buf[4];
  _BYTE v117[14];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 8))
  {
    v5 = *(NSObject **)(v2 + 56);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Refresh session has been cleaned up, bailing", buf, 2u);
    }
    goto LABEL_12;
  }
  if ((PLIsFeaturedContentAllowed() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeIfNeededFeaturedContent:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    return;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "isCancelledWithProgress:", 0.25);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  }
  *(_BYTE *)(v3 + 24) = v4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
    }
LABEL_12:
    v7 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    return;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(MEMORY[0x1E0D77EF8], "wallpaperDemoModeEnabled"))
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Wallpaper Demo Mode ON", buf, 2u);
    }
    v12 = -[PHAWallpaperGalleryDemoHelper initWithPhotoLibrary:loggingConnection:]([PHAWallpaperGalleryDemoHelper alloc], "initWithPhotoLibrary:loggingConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    -[PHAWallpaperGalleryDemoHelper demoDescriptors](v12, "demoDescriptors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v13);
  }
  else
  {
    v12 = -[PHAWallpaperShuffleDescriptorGenerator initWithPhotoLibrary:loggingConnection:]([PHAWallpaperShuffleDescriptorGenerator alloc], "initWithPhotoLibrary:loggingConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    -[PHAWallpaperGalleryDemoHelper shuffleDescriptorsForDonation](v12, "shuffleDescriptorsForDonation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v13);
    objc_msgSend(*(id *)(a1 + 32), "suggestionUUIDsForPosterDescriptors:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v14);

    objc_msgSend(*(id *)(a1 + 32), "settlingEffectDescriptorsForDonationWithSuggestionUUIDsToAvoid:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v15);
    objc_msgSend(*(id *)(a1 + 32), "suggestionUUIDsForPosterDescriptors:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v16);

    objc_msgSend(*(id *)(a1 + 32), "featuredPhotoDescriptorsForDonationWithSuggestionUUIDsToAvoid:count:", v10, 11 - objc_msgSend(v15, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v17);
    objc_msgSend(*(id *)(a1 + 32), "suggestionUUIDsForPosterDescriptors:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v18);

  }
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v108 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, v26);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
    }
    while (v22);
  }

  objc_msgSend(*(id *)(a1 + 32), "currentlyFeaturedSuggestionUUIDsForTop:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateSuggestionFeaturedStateWithNewSuggestionUUIDs:oldSuggestionUUIDs:", v10, v27);
  objc_msgSend(v19, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v19, "count");
  v30 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (!v29)
  {
    if (v31)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No poster descriptors to refresh gallery, bailing", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_84;
  }
  if (v31)
  {
    v32 = v30;
    v33 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v117 = v33;
    *(_WORD *)&v117[4] = 2112;
    *(_QWORD *)&v117[6] = v28;
    _os_log_impl(&dword_1CAC16000, v32, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Refreshing gallery with %d suggestions %@", buf, 0x12u);

  }
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v34 + 24))
  {
    v35 = 1;
  }
  else
  {
    v35 = objc_msgSend(*(id *)(a1 + 48), "isCancelledWithProgress:", 0.3);
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  }
  *(_BYTE *)(v34 + 24) = v35;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v36 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v36, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
    }
    v37 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v37 + 16))(v37, 0, v38);

    goto LABEL_84;
  }
  v91 = v27;
  v92 = v28;
  v93 = v10;
  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v40 = *(id *)(a1 + 40);
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v104 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
        objc_msgSend(v45, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v45, v46);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
    }
    while (v42);
  }

  objc_msgSend(*(id *)(a1 + 56), "childProgressReporterFromStart:toEnd:", 0.3, 0.8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *(void **)(a1 + 32);
  v102 = 0;
  objc_msgSend(v48, "updateIfNeededPosterDescriptors:fromCurrentPosterDescriptors:partialErrors:progressReporter:", v19, v39, &v102, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v102;
  if (!v49)
  {
    v53 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    v10 = v93;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v53, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
    }
    v54 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v54 + 16))(v54, 0, v55);
    goto LABEL_83;
  }
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v50);
  v10 = v93;
  if (objc_msgSend(v49, "count"))
  {
    v51 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (*(_BYTE *)(v51 + 24))
    {
      v52 = 1;
    }
    else
    {
      v52 = objc_msgSend(*(id *)(a1 + 48), "isCancelledWithProgress:", 0.85);
      v51 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    }
    *(_BYTE *)(v51 + 24) = v52;
    v61 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v62 = *(_QWORD *)(a1 + 32);
    v63 = *(NSObject **)(v62 + 56);
    v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    if (!v61)
    {
      v89 = v50;
      if (v64)
      {
        v66 = v63;
        v67 = objc_msgSend(v49, "count");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v117 = v67;
        _os_log_impl(&dword_1CAC16000, v66, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] %d poster descriptors changed, needs actual refresh", buf, 8u);

        v62 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(v62 + 16), "URLByAppendingPathComponent:", CFSTR("UpdatedPosterDescriptorIdentifiers"));
      v68 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "allObjects");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "sortedArrayUsingSelector:", sel_compare_);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v101 = 0;
      v87 = v70;
      v84 = (void *)v68;
      LODWORD(v69) = objc_msgSend(v70, "writeToURL:error:", v68, &v101);
      v85 = v101;
      v71 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
      if ((_DWORD)v69)
      {
        v10 = v93;
        v55 = v90;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v117 = v87;
          _os_log_impl(&dword_1CAC16000, v71, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionRefreshSession] Successfully persisted updated poster descriptor identifiers: %@", buf, 0xCu);
        }
        v72 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        if (*(_BYTE *)(v72 + 24))
        {
          v73 = 1;
        }
        else
        {
          v73 = objc_msgSend(*(id *)(a1 + 48), "isCancelledWithProgress:", 0.9);
          v72 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        }
        *(_BYTE *)(v72 + 24) = v73;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        {
          v76 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CAC16000, v76, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
          }
          v77 = *(_QWORD *)(a1 + 64);
          objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v77 + 16))(v77, 0, v78);

          v50 = v89;
          v55 = v90;
        }
        else
        {
          v79 = objc_alloc_init(MEMORY[0x1E0D7F6F0]);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "path");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setIdentifier:", v80);

          v81 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke_226;
          v94[3] = &unk_1E8520C68;
          v100 = *(_QWORD *)(a1 + 72);
          v82 = *(id *)(a1 + 48);
          v83 = *(_QWORD *)(a1 + 32);
          v95 = v82;
          v96 = v83;
          v99 = *(id *)(a1 + 64);
          v97 = v90;
          v98 = v92;
          objc_msgSend(v81, "refreshPosterDescriptorsForExtension:sessionInfo:completion:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), v79, v94);

          v50 = v89;
        }
        v75 = v85;
      }
      else
      {
        v10 = v93;
        v55 = v90;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v117 = v85;
          _os_log_error_impl(&dword_1CAC16000, v71, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to persist updated poster descriptor identifiers: %@", buf, 0xCu);
        }
        v75 = v85;
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        v50 = v89;
      }

      v60 = v84;
      goto LABEL_82;
    }
    if (v64)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v63, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", buf, 2u);
    }
    v65 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v65 + 16))(v65, 0, v60);
    v10 = v93;
  }
  else
  {
    v56 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v56, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] No poster descriptors changed, no actual refresh needed", buf, 2u);
    }
    v86 = v47;
    v88 = v50;
    if (objc_msgSend(v90, "count"))
    {
      v57 = (void *)MEMORY[0x1E0CB35C8];
      v111 = *MEMORY[0x1E0CB2F70];
      v112 = v90;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "pl_analysisErrorWithCode:userInfo:", 24, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0;
    }
    else
    {
      v113 = CFSTR("posterDescriptorIdentifiers");
      v114 = v92;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "saveLastGalleryRefreshDate:loggingConnection:", v58, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      v59 = 0;
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v47 = v86;
    v50 = v88;
  }
  v55 = v90;
LABEL_82:

LABEL_83:
  v27 = v91;
  v28 = v92;
LABEL_84:

}

void __96__PHAWallpaperSuggestionRefreshSession_refreshPosterDescriptorsWithProgressReporter_completion___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.95);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  }
  *(_BYTE *)(v7 + 24) = v8;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", (uint8_t *)&v26, 2u);
    }
    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v26 = 67109120;
        LODWORD(v27) = objc_msgSend(v5, "count");
        _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Successfully refreshed %d poster descriptors", (uint8_t *)&v26, 8u);

      }
      if (objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = *(_QWORD *)(a1 + 48);
        v28 = *MEMORY[0x1E0CB2F70];
        v29 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pl_analysisErrorWithCode:userInfo:", 24, v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
      }
      else
      {
        v18 = *(_QWORD *)(a1 + 56);
        v30 = CFSTR("posterDescriptorIdentifiers");
        v31[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
      }
      v19 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "saveLastGalleryRefreshDate:loggingConnection:", v20, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));

    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v26 = 138412290;
        v27 = v6;
        _os_log_error_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Failed to refresh poster descriptors: %@", (uint8_t *)&v26, 0xCu);
      }
      v17 = v6;
      v11 = 0;
    }
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (*(_BYTE *)(v21 + 24))
    {
      v22 = 1;
    }
    else
    {
      v22 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 1.0);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    }
    *(_BYTE *)(v21 + 24) = v22;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v23 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1CAC16000, v23, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Poster Descriptors refresh was canceled", (uint8_t *)&v26, 2u);
      }
      v24 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v25);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

uint64_t __47__PHAWallpaperSuggestionRefreshSession_cleanup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

void __57__PHAWallpaperSuggestionRefreshSession_prepareWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  char v3;
  id v4;
  id obj;

  v2 = (void *)a1[4];
  obj = 0;
  v3 = objc_msgSend(v2, "_prepareWithError:", &obj);
  v4 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v4);
}

+ (void)refreshPosterConfigurationWithPosterService:(id)a3 retryCount:(int64_t)a4 configuration:(id)a5 sessionInfo:(id)a6 log:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  id v31;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __136__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationWithPosterService_retryCount_configuration_sessionInfo_log_completion___block_invoke;
  v24[3] = &unk_1E8520DB0;
  v25 = v17;
  v26 = v15;
  v30 = a4;
  v31 = a1;
  v27 = v14;
  v28 = v16;
  v29 = v18;
  v19 = v18;
  v20 = v16;
  v21 = v14;
  v22 = v15;
  v23 = v17;
  objc_msgSend(v21, "refreshPosterConfiguration:sessionInfo:completion:", v22, v20, v24);

}

+ (void)saveLastGalleryRefreshDate:(id)a3 loggingConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("PHAWallpaperSuggestionLastGalleryRefreshDate"));

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperSuggestionRefreshSession] Saved lastGalleryRefreshDate: %@", (uint8_t *)&v8, 0xCu);
  }

}

+ (id)lastGalleryRefreshDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PHAWallpaperSuggestionLastGalleryRefreshDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __136__PHAWallpaperSuggestionRefreshSession_refreshPosterConfigurationWithPosterService_retryCount_configuration_sessionInfo_log_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 || (v7 = *(_QWORD *)(a1 + 72), v7 < 1))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412802;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      v14 = 2048;
      v15 = v7;
      _os_log_error_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_ERROR, "[PHAWallpaperSuggestionRefreshSession] Error refreshing poster configuration %@: %@ retries left: %ld", (uint8_t *)&v10, 0x20u);
      v7 = *(_QWORD *)(a1 + 72);
      v8 = *(NSObject **)(a1 + 32);
    }
    objc_msgSend(*(id *)(a1 + 80), "refreshPosterConfigurationWithPosterService:retryCount:configuration:sessionInfo:log:completion:", *(_QWORD *)(a1 + 48), v7 - 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v8, *(_QWORD *)(a1 + 64));
  }

}

@end
