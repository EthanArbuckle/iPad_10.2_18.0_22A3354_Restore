@implementation WBSRemotelyUpdatableDataController

uint64_t __70__WBSRemotelyUpdatableDataController_accessSnapshotLoadingItIfNeeded___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadDownloadedSnapshotIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_loadBuiltInSnapshotIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_updateDownloadedDataIfNecessary");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateDownloadedDataIfNecessary
{
  void *v3;
  _BOOL4 v4;
  WBSConfigurationDownloader *v5;
  void *v6;
  id v7;
  WBSConfigurationDownloader *v8;
  WBSConfigurationDownloader *configurationDownloader;
  WBSConfigurationDownloader *v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (self->_shouldAttemptToDownloadConfiguration)
  {
    -[WBSRemotelyUpdatableDataController _lastConfigurationUpdateAttemptDate](self, "_lastConfigurationUpdateAttemptDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[WBSRemotelyUpdatableDataController _shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:](self, "_shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:", v3);

    if (v4)
    {
      -[WBSConfigurationDownloader cancel](self->_configurationDownloader, "cancel");
      v5 = [WBSConfigurationDownloader alloc];
      -[WBSRemotelyUpdatableDataController _downloadedListResourceName](self, "_downloadedListResourceName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(self->_snapshotTransformerClass);
      v8 = -[WBSConfigurationDownloader initWithFileName:dataTransformer:](v5, "initWithFileName:dataTransformer:", v6, v7);
      configurationDownloader = self->_configurationDownloader;
      self->_configurationDownloader = v8;

      -[WBSRemotelyUpdatableDataController _setCurrentDateAsLastConfigurationUpdateAttemptDate](self, "_setCurrentDateAsLastConfigurationUpdateAttemptDate");
      objc_initWeak(&location, self);
      v10 = self->_configurationDownloader;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __70__WBSRemotelyUpdatableDataController__updateDownloadedDataIfNecessary__block_invoke;
      v11[3] = &unk_1E649EAA8;
      objc_copyWeak(&v12, &location);
      -[WBSConfigurationDownloader downloadConfigurationWithCompletionHandler:](v10, "downloadConfigurationWithCompletionHandler:", v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:(id)a3
{
  double v4;

  if (!a3)
    return 1;
  objc_msgSend(a3, "timeIntervalSinceNow");
  return self->_updateInterval < -v4;
}

- (void)_loadDownloadedSnapshotIfNeeded
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_0_1(&dword_1B2621000, v5, v7, "The downloaded data file (%@) could not be loaded: %{public}@", (uint8_t *)&v8);

}

- (id)_urlOfDownloadedList
{
  NSURL *downloadsDirectoryURL;
  NSString *resourceName;
  void *v4;
  void *v5;
  void *v6;

  downloadsDirectoryURL = self->_downloadsDirectoryURL;
  resourceName = self->_resourceName;
  -[WBSRemotelyUpdatableDataController _fileExtensionForData](self, "_fileExtensionForData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathExtension:](resourceName, "stringByAppendingPathExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:isDirectory:](downloadsDirectoryURL, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_loadBuiltInSnapshotIfNeeded
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
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "The built-in data could not be loaded into current snapshot: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

- (id)_lastConfigurationUpdateAttemptDate
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dateForKey:", self->_updateDateDefaultsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_urlOfInternalOverrideList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WBSRemotelyUpdatableDataController _fileExtensionForData](self, "_fileExtensionForData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Override%@.%@"), v4, self->_resourceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_settingsDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_fileExtensionForData
{
  if (self->_dataFormat)
    return CFSTR("json");
  else
    return CFSTR("plist");
}

void __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = *(_BYTE *)(a1 + 40);
  v1 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    if (!v1[16])
    {
      objc_initWeak(&location, v1);
      v3 = (void *)MEMORY[0x1E0C99E88];
      v4 = *(double *)(*(_QWORD *)(a1 + 32) + 88);
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_2;
      v12 = &unk_1E649C808;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v3, "timerWithTimeInterval:repeats:block:", 1, &v9, v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 128);
      *(_QWORD *)(v6 + 128) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setTolerance:", *(double *)(*(_QWORD *)(a1 + 32) + 88) * 0.1, v9, v10, v11, v12);
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTimer:forMode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), *MEMORY[0x1E0C99748]);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetUpdateTimer");
  }
}

- (void)setShouldAttemptToUpdateConfiguration:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke;
  v4[3] = &unk_1E649EA58;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(internalQueue, v4);
}

- (void)accessSnapshotLoadingItIfNeeded:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__WBSRemotelyUpdatableDataController_accessSnapshotLoadingItIfNeeded___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

- (WBSRemotelyUpdatableDataController)initWithDataFormat:(int64_t)a3 builtInListURL:(id)a4 downloadsDirectoryURL:(id)a5 resourceName:(id)a6 resourceVersion:(id)a7 updateDateDefaultsKey:(id)a8 updateInterval:(double)a9 snapshotClass:(Class)a10 snapshotTransformerClass:(Class)a11
{
  id v18;
  id v19;
  WBSRemotelyUpdatableDataController *v20;
  _QWORD v22[4];
  id v23;

  v18 = a4;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __199__WBSRemotelyUpdatableDataController_initWithDataFormat_builtInListURL_downloadsDirectoryURL_resourceName_resourceVersion_updateDateDefaultsKey_updateInterval_snapshotClass_snapshotTransformerClass___block_invoke;
  v22[3] = &unk_1E649EA30;
  v23 = v18;
  v19 = v18;
  v20 = -[WBSRemotelyUpdatableDataController initWithDataFormat:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:builtInDataProvider:](self, "initWithDataFormat:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:builtInDataProvider:", a3, a5, a6, a7, a8, a10, a9, a11, v22);

  return v20;
}

- (WBSRemotelyUpdatableDataController)initWithDataFormat:(int64_t)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8 snapshotClass:(Class)a9 snapshotTransformerClass:(Class)a10 builtInDataProvider:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  WBSRemotelyUpdatableDataController *v24;
  WBSRemotelyUpdatableDataController *v25;
  uint64_t v26;
  id builtInListDataProvider;
  uint64_t v28;
  NSString *resourceName;
  uint64_t v30;
  NSString *resourceVersion;
  uint64_t v32;
  NSString *updateDateDefaultsKey;
  NSObject *v34;
  dispatch_queue_t v35;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v37;
  OS_dispatch_queue *diskWriteQueue;
  WBSRemotelyUpdatableDataController *v39;
  objc_super v41;

  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a11;
  v41.receiver = self;
  v41.super_class = (Class)WBSRemotelyUpdatableDataController;
  v24 = -[WBSRemotelyUpdatableDataController init](&v41, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_dataFormat = a3;
    v26 = objc_msgSend(v23, "copy");
    builtInListDataProvider = v25->_builtInListDataProvider;
    v25->_builtInListDataProvider = (id)v26;

    objc_storeStrong((id *)&v25->_downloadsDirectoryURL, a4);
    v28 = objc_msgSend(v20, "copy");
    resourceName = v25->_resourceName;
    v25->_resourceName = (NSString *)v28;

    v30 = objc_msgSend(v21, "copy");
    resourceVersion = v25->_resourceVersion;
    v25->_resourceVersion = (NSString *)v30;

    v32 = objc_msgSend(v22, "copy");
    updateDateDefaultsKey = v25->_updateDateDefaultsKey;
    v25->_updateDateDefaultsKey = (NSString *)v32;

    v25->_snapshotClass = a9;
    v25->_snapshotTransformerClass = a10;
    v25->_updateInterval = a8;
    v25->_shouldAttemptToDownloadConfiguration = 1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = dispatch_queue_create("com.apple.SafariCore.RemotelyUpdatableDataController.internalQueue", v34);
    internalQueue = v25->_internalQueue;
    v25->_internalQueue = (OS_dispatch_queue *)v35;

    v37 = dispatch_queue_create("com.apple.SafariCore.RemotelyUpdatableDataController.diskWriteQueue", v34);
    diskWriteQueue = v25->_diskWriteQueue;
    v25->_diskWriteQueue = (OS_dispatch_queue *)v37;

    v39 = v25;
  }

  return v25;
}

- (WBSRemotelyUpdatableDataController)init
{

  return 0;
}

+ (WBSRemotelyUpdatableDataController)new
{
  return 0;
}

id __199__WBSRemotelyUpdatableDataController_initWithDataFormat_builtInListURL_downloadsDirectoryURL_resourceName_resourceVersion_updateDateDefaultsKey_updateInterval_snapshotClass_snapshotTransformerClass___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v1, 0, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (!v2)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __199__WBSRemotelyUpdatableDataController_initWithDataFormat_builtInListURL_downloadsDirectoryURL_resourceName_resourceVersion_updateDateDefaultsKey_updateInterval_snapshotClass_snapshotTransformerClass___block_invoke_cold_1(v4, v3);
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSRemotelyUpdatableDataController _stopDownloadedFileMonitoring](self, "_stopDownloadedFileMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)WBSRemotelyUpdatableDataController;
  -[WBSRemotelyUpdatableDataController dealloc](&v3, sel_dealloc);
}

- (void)_setUpDownloadedFileMonitoring
{
  NSObject *v3;
  int *v4;
  char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = __error();
  v5 = strerror(*v4);
  v7 = 136315394;
  v8 = a1;
  v9 = 2080;
  v10 = v5;
  OUTLINED_FUNCTION_0_1(&dword_1B2621000, v3, v6, "Unable to open file (%s) for monitoring: %s", (uint8_t *)&v7);

  OUTLINED_FUNCTION_4();
}

void __68__WBSRemotelyUpdatableDataController__setUpDownloadedFileMonitoring__block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v2;
  NSObject *v3;
  dispatch_source_t v4;
  dispatch_queue_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD handler[5];

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[18];
    if (v3)
      dispatch_source_cancel(v3);
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v2[2]);
    v5 = v2[18];
    v2[18] = v4;

    v6 = v2[18];
    v7 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v8 = v2[18];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __68__WBSRemotelyUpdatableDataController__setUpDownloadedFileMonitoring__block_invoke_2;
    handler[3] = &unk_1E649B768;
    handler[4] = v2;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(v2[18]);
  }

}

void __68__WBSRemotelyUpdatableDataController__setUpDownloadedFileMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_loadDownloadedSnapshotIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didDownloadDataForRemotelyUpdatableDataController:", *(_QWORD *)(a1 + 32));

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 144);
  *(_QWORD *)(v7 + 144) = 0;

}

- (void)_stopDownloadedFileMonitoring
{
  NSObject *downloadedFileChangedSource;

  downloadedFileChangedSource = self->_downloadedFileChangedSource;
  if (downloadedFileChangedSource)
  {
    dispatch_source_cancel(downloadedFileChangedSource);
    downloadedFileChangedSource = self->_downloadedFileChangedSource;
  }
  self->_downloadedFileChangedSource = 0;

}

- (id)_downloadedListResourceName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->_resourceName, self->_resourceVersion);
}

void __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)WeakRetained + 20);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v3, "shouldRemotelyUpdatableDataControllerUpdateOnSchedule:", v2) & 1) == 0)
    {
      v5 = v2[2];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_3;
      block[3] = &unk_1E649B768;
      block[4] = v2;
      dispatch_sync(v5, block);
    }
    else
    {
      v4 = v2[2];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_4;
      v6[3] = &unk_1E649B768;
      v6[4] = v2;
      dispatch_async(v4, v6);
    }

  }
}

uint64_t __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetUpdateTimer");
}

uint64_t __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDownloadedDataIfNecessary");
}

- (void)setDataIsUsedByMultipleProcesses:(BOOL)a3
{
  if (self->_dataIsUsedByMultipleProcesses != a3)
  {
    self->_dataIsUsedByMultipleProcesses = a3;
    if (a3)
      -[WBSRemotelyUpdatableDataController _setUpDownloadedFileMonitoring](self, "_setUpDownloadedFileMonitoring");
    else
      -[WBSRemotelyUpdatableDataController _stopDownloadedFileMonitoring](self, "_stopDownloadedFileMonitoring");
  }
}

- (void)_resetUpdateTimer
{
  NSTimer *updateTimer;

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

}

void __70__WBSRemotelyUpdatableDataController__updateDownloadedDataIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v7 = WeakRetained[2];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__WBSRemotelyUpdatableDataController__updateDownloadedDataIfNecessary__block_invoke_2;
    v8[3] = &unk_1E649EA80;
    objc_copyWeak(&v10, v4);
    v9 = v3;
    dispatch_async(v7, v8);

    objc_destroyWeak(&v10);
  }

}

void __70__WBSRemotelyUpdatableDataController__updateDownloadedDataIfNecessary__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_didDownloadSnapshot:", *(_QWORD *)(a1 + 32));
    v3 = objc_loadWeakRetained(v4 + 20);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "didDownloadDataForRemotelyUpdatableDataController:", v4);

    WeakRetained = v4;
  }

}

- (void)_didDownloadSnapshot:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WBSRemotelyUpdatableDataController _urlOfDownloadedList](self, "_urlOfDownloadedList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v7, "isEqual:", self->_currentSnapshot) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_remotelyLoadedSnapshot, a3);
    objc_storeStrong((id *)&self->_currentSnapshot, a3);
    -[WBSRemotelyUpdatableDataSnapshot snapshotData](self->_currentSnapshot, "snapshotData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSRemotelyUpdatableDataController _writeConfigurationData:](self, "_writeConfigurationData:", v6);

  }
}

- (void)_writeConfigurationData:(id)a3
{
  id v4;
  NSObject *diskWriteQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WBSRemotelyUpdatableDataController _stopDownloadedFileMonitoring](self, "_stopDownloadedFileMonitoring");
  diskWriteQueue = self->_diskWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSRemotelyUpdatableDataController__writeConfigurationData___block_invoke;
  block[3] = &unk_1E649EA80;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(diskWriteQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__WBSRemotelyUpdatableDataController__writeConfigurationData___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "_urlOfDownloadedList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "safari_ensureDirectoryExists:", v5);

    objc_msgSend(*(id *)(a1 + 32), "writeToURL:atomically:", v3, 1);
    objc_msgSend(v7, "_setUpDownloadedFileMonitoring");

    WeakRetained = v7;
  }

}

- (void)prepareForTermination
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WBSRemotelyUpdatableDataController_prepareForTermination__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __59__WBSRemotelyUpdatableDataController_prepareForTermination__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_resetUpdateTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "cancel");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;

}

- (void)accessCurrentSnapshot:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSRemotelyUpdatableDataController_accessCurrentSnapshot___block_invoke;
  block[3] = &unk_1E649B910;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __60__WBSRemotelyUpdatableDataController_accessCurrentSnapshot___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)accessBuiltInAndRemotelyLoadedSnapshots:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSRemotelyUpdatableDataController_accessBuiltInAndRemotelyLoadedSnapshots___block_invoke;
  block[3] = &unk_1E649B910;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __78__WBSRemotelyUpdatableDataController_accessBuiltInAndRemotelyLoadedSnapshots___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
}

- (id)fetchDataFromCurrentSnapshot:(id)a3
{
  id v4;
  id v5;
  id v6;
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
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__WBSRemotelyUpdatableDataController_fetchDataFromCurrentSnapshot___block_invoke;
  v8[3] = &unk_1E649EAD0;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[WBSRemotelyUpdatableDataController accessCurrentSnapshot:](self, "accessCurrentSnapshot:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __67__WBSRemotelyUpdatableDataController_fetchDataFromCurrentSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setCurrentDateAsLastConfigurationUpdateAttemptDate
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, self->_updateDateDefaultsKey);

}

- (WBSRemotelyUpdatableDataControllerDelegate)delegate
{
  return (WBSRemotelyUpdatableDataControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAttemptToUpdateConfiguration
{
  return self->_shouldAttemptToUpdateConfiguration;
}

- (BOOL)shouldAttemptToDownloadConfiguration
{
  return self->_shouldAttemptToDownloadConfiguration;
}

- (void)setShouldAttemptToDownloadConfiguration:(BOOL)a3
{
  self->_shouldAttemptToDownloadConfiguration = a3;
}

- (BOOL)dataIsUsedByMultipleProcesses
{
  return self->_dataIsUsedByMultipleProcesses;
}

- (BOOL)shouldKeepBuiltInSnapshotLoaded
{
  return self->_shouldKeepBuiltInSnapshotLoaded;
}

- (void)setShouldKeepBuiltInSnapshotLoaded:(BOOL)a3
{
  self->_shouldKeepBuiltInSnapshotLoaded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_downloadedFileChangedCoalescingSource, 0);
  objc_storeStrong((id *)&self->_downloadedFileChangedSource, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_configurationDownloader, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_remotelyLoadedSnapshot, 0);
  objc_storeStrong((id *)&self->_builtInSnapshot, 0);
  objc_storeStrong((id *)&self->_updateDateDefaultsKey, 0);
  objc_storeStrong((id *)&self->_resourceVersion, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_downloadsDirectoryURL, 0);
  objc_storeStrong(&self->_builtInListDataProvider, 0);
  objc_storeStrong((id *)&self->_diskWriteQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __199__WBSRemotelyUpdatableDataController_initWithDataFormat_builtInListURL_downloadsDirectoryURL_resourceName_resourceVersion_updateDateDefaultsKey_updateInterval_snapshotClass_snapshotTransformerClass___block_invoke_cold_1(void *a1, void *a2)
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
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "The built-in data file could not be loaded: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

@end
