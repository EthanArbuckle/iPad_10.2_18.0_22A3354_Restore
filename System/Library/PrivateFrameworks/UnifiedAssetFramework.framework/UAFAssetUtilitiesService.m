@implementation UAFAssetUtilitiesService

- (UAFAssetUtilitiesService)init
{
  UAFAssetUtilitiesService *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *downloadQueue;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *statusQueue;
  dispatch_group_t v11;
  OS_dispatch_group *statusGroup;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UAFAssetUtilitiesService;
  v2 = -[UAFAssetUtilitiesService init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.UAF.Asset.download", v4);
    downloadQueue = v2->_downloadQueue;
    v2->_downloadQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.UAF.Asset.status", v8);
    statusQueue = v2->_statusQueue;
    v2->_statusQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_group_create();
    statusGroup = v2->_statusGroup;
    v2->_statusGroup = (OS_dispatch_group *)v11;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[UAFAssetUtilitiesService _stopObserver](self, "_stopObserver");
  v3.receiver = self;
  v3.super_class = (Class)UAFAssetUtilitiesService;
  -[UAFAssetUtilitiesService dealloc](&v3, sel_dealloc);
}

- (void)startObserver
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;

  if (!self->_observerEnabled)
  {
    self->_observerEnabled = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getAFSiriXAssetDidChangeDarwinNotification_0();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AFSiriXAssetDidChangeCallback, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
}

- (void)_stopObserver
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;

  if (self->_observerEnabled)
  {
    self->_observerEnabled = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getAFSiriXAssetDidChangeDarwinNotification_0();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  }
}

- (void)downloadSiriAssets
{
  -[UAFAssetUtilitiesService _downloadSiriAssetsWithCellular:](self, "_downloadSiriAssetsWithCellular:", 0);
}

- (void)downloadSiriAssetsOverCellular
{
  -[UAFAssetUtilitiesService _downloadSiriAssetsWithCellular:](self, "_downloadSiriAssetsWithCellular:", 1);
}

- (void)_downloadSiriAssetsWithCellular:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  BOOL v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[UAFAssetUtilitiesService getLanguage](self, "getLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UAFAssetUtilitiesService downloadQueue](self, "downloadQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v6);

    -[UAFAssetUtilitiesService downloadQueue](self, "downloadQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__UAFAssetUtilitiesService__downloadSiriAssetsWithCellular___block_invoke;
    block[3] = &unk_24F1F7078;
    block[4] = self;
    v10 = v5;
    v11 = a3;
    dispatch_async(v7, block);

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[UAFAssetUtilitiesService _downloadSiriAssetsWithCellular:]";
      _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s #settings nil language, skipping download...", buf, 0xCu);
    }

    -[UAFAssetUtilitiesService updateAssetState:value:forLanguage:](self, "updateAssetState:value:forLanguage:", 2, 0, 0);
  }

}

uint64_t __60__UAFAssetUtilitiesService__downloadSiriAssetsWithCellular___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_downloadUnderstandingAssetsForLanguage:useCellular:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_downloadUnderstandingAssetsForLanguage:(id)a3 useCellular:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD block[6];
  uint8_t v41[4];
  const char *v42;
  __int16 v43;
  id v44;
  _BYTE buf[24];
  uint64_t v46;
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[UAFAssetUtilitiesService downloadQueue](self, "downloadQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = -[UAFAssetUtilitiesService _checkFreeSpaceNeededForLanguage:isDictation:](self, "_checkFreeSpaceNeededForLanguage:isDictation:", v6, 0);
  if (v8)
  {
    v9 = v8;
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2048;
      v46 = v9;
      _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s #settings Download requested for Siri assets (%{public}@) but hit out of space... %llu bytes needed", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAFAssetUtilitiesService updateAssetState:value:forLanguage:](self, "updateAssetState:value:forLanguage:", 6, v11, v6);

    goto LABEL_27;
  }
  if (v4
    || +[UAFCommonUtilities isInexpensiveNetworkAvailable](UAFCommonUtilities, "isInexpensiveNetworkAvailable"))
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v12, "addObject:", CFSTR("UpdateNamespaces"));
    if (v4)
      objc_msgSend(v12, "addObject:", CFSTR("UseCellular"));
    v13 = -[UAFAssetUtilitiesService _isLegacySiriDevice](self, "_isLegacySiriDevice");
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s #settings Download requested for legacy Siri for language %{public}@...", buf, 0x16u);
      }

      -[UAFAssetUtilitiesService updateAssetState:value:forLanguage:](self, "updateAssetState:value:forLanguage:", 1, 0, v6);
      +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateAssetsForSubscriber:subscriptionName:policies:queue:progress:completion:", CFSTR("com.apple.siri.assistant"), 0, v12, 0, 0, 0);

      goto LABEL_26;
    }
    if (v15)
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s #settings Download requested for Siri assets (%{public}@)...", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v46 = 2;
    -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke;
    block[3] = &unk_24F1F70A0;
    block[4] = self;
    block[5] = buf;
    dispatch_sync(v17, block);

    v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    if (v19 != 5)
    {
      if (v19 == 3)
      {
        UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v41 = 136315394;
          v42 = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
          v43 = 2114;
          v44 = v6;
          _os_log_impl(&dword_229282000, v20, OS_LOG_TYPE_DEFAULT, "%s #settings Download requested for Siri assets skipped due to existing download in progress (%{public}@)...", v41, 0x16u);
        }

        goto LABEL_25;
      }
      -[UAFAssetUtilitiesService updateAssetState:value:forLanguage:](self, "updateAssetState:value:forLanguage:", 3, &unk_24F202C08, v6);
    }
    -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v38[0] = v18;
    v38[1] = 3221225472;
    v38[2] = __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_191;
    v38[3] = &unk_24F1F70C8;
    v38[4] = self;
    v23 = v6;
    v39 = v23;
    dispatch_async(v22, v38);

    objc_initWeak((id *)v41, self);
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_2;
    v35[3] = &unk_24F1F7928;
    objc_copyWeak(&v37, (id *)v41);
    v24 = v23;
    v36 = v24;
    v25 = (void *)MEMORY[0x22E2C6D60](v35);
    v29 = v18;
    v30 = 3221225472;
    v31 = __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_3;
    v32 = &unk_24F1F7950;
    objc_copyWeak(&v34, (id *)v41);
    v33 = v24;
    v26 = (void *)MEMORY[0x22E2C6D60](&v29);
    +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager", v29, v30, v31, v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateAssetsForSubscriber:subscriptionName:policies:queue:progress:completion:", CFSTR("com.apple.siri.assistant"), 0, v12, v28, v25, v26);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)v41);

LABEL_25:
    _Block_object_dispose(buf, 8);
LABEL_26:

    goto LABEL_27;
  }
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_error_impl(&dword_229282000, v21, OS_LOG_TYPE_ERROR, "%s #settings Cannot download Siri assets for language %{public}@ due to network connectivity...", buf, 0x16u);
  }

  -[UAFAssetUtilitiesService updateAssetState:value:forLanguage:](self, "updateAssetState:value:forLanguage:", 2, 0, v6);
LABEL_27:

}

void __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "assetStatus");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "state");

}

void __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_191(uint64_t a1)
{
  int v2;
  id v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "uodAvailable");
  if (v2)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  objc_msgSend(*(id *)(a1 + 40), "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[UAFInstrumentationProvider logDownloadTriggerEventWithLanguage:hasExistingAssets:retryCount:](UAFInstrumentationProvider, "logDownloadTriggerEventWithLanguage:hasExistingAssets:retryCount:");
  if ((v2 & 1) == 0)
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);

}

void __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_2(uint64_t a1, uint64_t a2, double a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleUpdateProgress:status:language:", (unint64_t)a3, a2, *(_QWORD *)(a1 + 32));

}

void __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_siriDownloadCompleteForLanguage:", *(_QWORD *)(a1 + 32));

}

- (void)_handleUpdateProgress:(unint64_t)a3 status:(unint64_t)a4 language:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    UAFSubscriptionDownloadStatusDescription(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[UAFAssetUtilitiesService _handleUpdateProgress:status:language:]";
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_229282000, v10, OS_LOG_TYPE_DEBUG, "%s #settings progress status %@", (uint8_t *)&v13, 0x16u);

  }
  if (a4 - 1 >= 3)
  {
    if (a4 != 4)
    {
      if (a4 == 5)
      {
        -[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:](self, "_getDiskSpaceNeededInBytesForLanguage:isDictation:error:", v8, 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:](self, "_updateAssetState:value:forLanguage:", 6, v11, v8);

      }
      else
      {
        -[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:](self, "_updateAssetState:value:forLanguage:", 4, 0, v8);
      }
    }
  }
  else
  {
    -[UAFAssetUtilitiesService _updateProgress:forLanguage:](self, "_updateProgress:forLanguage:", a3, v8);
  }

}

- (void)_updateProgress:(unint64_t)a3 forLanguage:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _WORD v16[17];

  *(_QWORD *)&v16[13] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[UAFAssetUtilitiesService _updateProgress:forLanguage:]";
    v15 = 1024;
    *(_DWORD *)v16 = a3;
    v16[2] = 2114;
    *(_QWORD *)&v16[3] = v6;
    _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Download progress %d%% for language %{public}@", (uint8_t *)&v13, 0x1Cu);
  }

  if (v6)
  {
    -[UAFAssetUtilitiesService assetStatus](self, "assetStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "state");

    if (v10 == 5)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315394;
        v14 = "-[UAFAssetUtilitiesService _updateProgress:forLanguage:]";
        v15 = 2114;
        *(_QWORD *)v16 = v6;
        _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s #settings UOD available already for %{public}@. Skip updating download progress...", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      if (a3 >= 0x63)
      {
        UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315650;
          v14 = "-[UAFAssetUtilitiesService _updateProgress:forLanguage:]";
          v15 = 1024;
          *(_DWORD *)v16 = 98;
          v16[2] = 2114;
          *(_QWORD *)&v16[3] = v6;
          _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s #settings Download progress clamped to %d%% for language %{public}@", (uint8_t *)&v13, 0x1Cu);
        }

        a3 = 98;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v11 = objc_claimAutoreleasedReturnValue();
      -[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:](self, "_updateAssetState:value:forLanguage:", 3, v11, v6);
    }
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[UAFAssetUtilitiesService _updateProgress:forLanguage:]";
      _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, "%s #settings nil language", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)_siriDownloadCompleteForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[UAFAssetUtilitiesService _siriDownloadCompleteForLanguage:]";
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Download complete for language %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    -[UAFAssetUtilitiesService assetStatus](self, "assetStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 != 5)
    {
      -[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:](self, "_updateAssetState:value:forLanguage:", 3, &unk_24F202C20, v4);
      -[UAFAssetUtilitiesService _triggerCompletionTimerForLanguage:](self, "_triggerCompletionTimerForLanguage:", v4);
      goto LABEL_11;
    }
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[UAFAssetUtilitiesService _siriDownloadCompleteForLanguage:]";
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s #settings UOD available already for %{public}@. Skip updating download progress...", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[UAFAssetUtilitiesService _siriDownloadCompleteForLanguage:]";
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s #settings nil language", (uint8_t *)&v10, 0xCu);
    }
  }

LABEL_11:
}

- (void)_triggerCompletionTimerForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  v6 = dispatch_time(0, 20000000000);
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__UAFAssetUtilitiesService__triggerCompletionTimerForLanguage___block_invoke;
  block[3] = &unk_24F1F7950;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v8 = v4;
  dispatch_after(v6, v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __63__UAFAssetUtilitiesService__triggerCompletionTimerForLanguage___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "uodAvailable") & 1) == 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v13 = "-[UAFAssetUtilitiesService _triggerCompletionTimerForLanguage:]_block_invoke";
      v14 = 2114;
      v15 = v8;
      _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s #settings UOD status watchdog hit. Fetching status again. Language = %{public}@", buf, 0x16u);
    }

    objc_msgSend(v4, "updateSiriAssetAvailabilityForLanguageSync:", *(_QWORD *)(a1 + 32));
    v6 = dispatch_time(0, 20000000000);
    objc_msgSend(v4, "statusQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__UAFAssetUtilitiesService__triggerCompletionTimerForLanguage___block_invoke_201;
    v9[3] = &unk_24F1F7950;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 32);
    dispatch_after(v6, v7, v9);

    objc_destroyWeak(&v11);
  }

}

void __63__UAFAssetUtilitiesService__triggerCompletionTimerForLanguage___block_invoke_201(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "uodAvailable") & 1) == 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315394;
      v7 = "-[UAFAssetUtilitiesService _triggerCompletionTimerForLanguage:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, "%s #settings UOD status watchdog hit. Download failed. Language = %{public}@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(v3, "_updateAssetState:value:forLanguage:", 4, 0, *(_QWORD *)(a1 + 32));
  }

}

- (BOOL)_isLegacySiriDevice
{
  BOOL v2;

  v2 = +[UAFCommonUtilities deviceSupportAndUseHybridASR](UAFCommonUtilities, "deviceSupportAndUseHybridASR");
  return !+[UAFCommonUtilities deviceSupportFullUOD](UAFCommonUtilities, "deviceSupportFullUOD") && !v2;
}

- (id)getLanguage
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__UAFAssetUtilitiesService_getLanguage__block_invoke;
  v7[3] = &unk_24F1F70A0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__UAFAssetUtilitiesService_getLanguage__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)switchLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__UAFAssetUtilitiesService_switchLanguage___block_invoke;
  block[3] = &unk_24F1F79F0;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v11 + 24))
    -[UAFAssetUtilitiesService updateSiriAssetAvailabilityForLanguage:](self, "updateSiriAssetAvailabilityForLanguage:", v6);

  _Block_object_dispose(&v10, 8);
}

void __43__UAFAssetUtilitiesService_switchLanguage___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  if ((objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_updateAssetState:value:forLanguage:", 2, 0, *(_QWORD *)(a1 + 40));
  }

}

- (void)postAssetNotificationIfNeeded
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[UAFAssetUtilitiesService postAssetNotificationIfNeeded]";
    _os_log_error_impl(&dword_229282000, v2, OS_LOG_TYPE_ERROR, "%s #settings posting Siri notification not supported.", (uint8_t *)&v3, 0xCu);
  }

}

- (void)updateSiriAssetAvailabilityForObserver
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[UAFAssetUtilitiesService statusGroup](self, "statusGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForObserver__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_group_async(v3, v4, block);

}

uint64_t __66__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForObserver__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSiriAssetAvailabilityForLanguageSync:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)updateSiriAssetAvailabilityForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[UAFAssetUtilitiesService statusGroup](self, "statusGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguage___block_invoke;
  v8[3] = &unk_24F1F70C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_async(v5, v6, v8);

}

uint64_t __67__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSiriAssetAvailabilityForLanguageSync:", *(_QWORD *)(a1 + 40));
}

- (void)updateSiriAssetAvailabilityForLanguageSync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  id v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id location;
  id *p_location;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  id *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    p_location = &location;
    v25 = 0x2050000000;
    v7 = (id)getAFSettingsConnectionClass_softClass_0;
    v26 = getAFSettingsConnectionClass_softClass_0;
    v8 = MEMORY[0x24BDAC760];
    if (!getAFSettingsConnectionClass_softClass_0)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getAFSettingsConnectionClass_block_invoke_0;
      v28 = &unk_24F1F7190;
      v29 = &location;
      __getAFSettingsConnectionClass_block_invoke_0((uint64_t)buf);
      v7 = p_location[3];
    }
    v9 = (objc_class *)objc_retainAutorelease(v7);
    _Block_object_dispose(&location, 8);
    v10 = objc_alloc_init(v9);
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[UAFAssetUtilitiesService updateSiriAssetAvailabilityForLanguageSync:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s #settings server UOD check for language %{public}@", buf, 0x16u);
    }

    v12 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __71__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguageSync___block_invoke;
    v18[3] = &unk_24F1F79A0;
    v13 = v10;
    v19 = v13;
    objc_copyWeak(&v22, &location);
    v14 = v5;
    v20 = v14;
    v15 = v12;
    v21 = v15;
    objc_msgSend(v13, "getAssetStatusForLanguage:completionHandler:", v6, v18);
    v16 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v15, v16))
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[UAFAssetUtilitiesService updateSiriAssetAvailabilityForLanguageSync:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v14;
        _os_log_error_impl(&dword_229282000, v17, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assets availability due to timeout, language = %{public}@", buf, 0x16u);
      }

    }
    objc_destroyWeak(&v22);

    objc_destroyWeak(&location);
  }

}

void __71__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguageSync___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "statusGroup");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguageSync___block_invoke_2;
    block[3] = &unk_24F1F7978;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    dispatch_group_async(v7, v8, block);

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    objc_destroyWeak(&v12);
  }

}

void __71__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguageSync___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSiriAssetAvailability:forLanguage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_updateSiriAssetAvailability:(id)a3 forLanguage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = "-[UAFAssetUtilitiesService _updateSiriAssetAvailability:forLanguage:]";
      v19 = 2112;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s #settings update asset status %@ for language %{public}@", (uint8_t *)&v17, 0x20u);
    }

    if (+[UAFCommonUtilities deviceSupportFullUOD](UAFCommonUtilities, "deviceSupportFullUOD"))
    {
      if (!+[UAFCommonUtilities isFullUODSupportedForStatus:language:](UAFCommonUtilities, "isFullUODSupportedForStatus:language:", v6, v7))
      {
LABEL_6:
        -[UAFAssetUtilitiesService assetStatus](self, "assetStatus");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "state");

        if (v11 == 5)
        {
          UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v17 = 136315394;
            v18 = "-[UAFAssetUtilitiesService _updateSiriAssetAvailability:forLanguage:]";
            v19 = 2114;
            v20 = v7;
            _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s #settings forcing state to UAFAssetStateNotStarted due to sudden UOD unavailable for %{public}@...", (uint8_t *)&v17, 0x16u);
          }

          -[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:](self, "_updateAssetState:value:forLanguage:", 2, &unk_24F202C38, v7);
        }
        v13 = 0;
LABEL_17:
        -[UAFAssetUtilitiesService setUodAvailable:](self, "setUodAvailable:", v13);
        goto LABEL_18;
      }
    }
    else if (!+[UAFCommonUtilities isHybridUODSupportedForStatus:language:](UAFCommonUtilities, "isHybridUODSupportedForStatus:language:", v6, v7))
    {
      goto LABEL_6;
    }
    -[UAFAssetUtilitiesService uodAvailable](self, "uodAvailable");
    -[UAFAssetUtilitiesService assetStatus](self, "assetStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "state");

    if (v15 != 5)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315394;
        v18 = "-[UAFAssetUtilitiesService _updateSiriAssetAvailability:forLanguage:]";
        v19 = 2114;
        v20 = v7;
        _os_log_impl(&dword_229282000, v16, OS_LOG_TYPE_DEFAULT, "%s #settings forcing state to UAFAssetStateFinished due to sudden UOD available for %{public}@...", (uint8_t *)&v17, 0x16u);
      }

      -[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:](self, "_updateAssetState:value:forLanguage:", 5, 0, v7);
    }
    v13 = 1;
    goto LABEL_17;
  }
LABEL_18:

}

- (void)downloadDictationAssetsForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[UAFAssetUtilitiesService downloadQueue](self, "downloadQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__UAFAssetUtilitiesService_downloadDictationAssetsForLanguage___block_invoke;
  v7[3] = &unk_24F1F70C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __63__UAFAssetUtilitiesService_downloadDictationAssetsForLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_downloadDictationAssetsForLanguage:useCellular:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_downloadDictationAssetsForLanguage:(id)a3 useCellular:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  UAFAssetSetSubscription *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  _QWORD v43[4];
  NSObject *v44;
  NSObject *v45;
  id v46;
  id location;
  _QWORD v48[5];
  NSObject *v49;
  _BYTE *v50;
  _QWORD block[5];
  id v52;
  unint64_t v53;
  _QWORD v54[5];
  id v55;
  UAFAssetSetSubscription *v56;
  const __CFString *v57;
  NSObject *v58;
  const __CFString *v59;
  void *v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  NSObject *v64;
  _BYTE v65[24];
  uint64_t v66;
  uint64_t v67;

  v4 = a4;
  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[UAFAssetUtilitiesService downloadQueue](self, "downloadQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    if (v4
      || +[UAFCommonUtilities isInexpensiveNetworkAvailable](UAFCommonUtilities, "isInexpensiveNetworkAvailable"))
    {
      v8 = -[UAFAssetUtilitiesService _checkFreeSpaceNeededForLanguage:isDictation:](self, "_checkFreeSpaceNeededForLanguage:isDictation:", v6, 1);
      if (v8)
      {
        v9 = v8;
        UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v65 = 136315650;
          *(_QWORD *)&v65[4] = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
          *(_WORD *)&v65[12] = 2114;
          *(_QWORD *)&v65[14] = v6;
          *(_WORD *)&v65[22] = 2048;
          v66 = v9;
          _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s #settings Download requested for Dictation assets (%{public}@) but hit out of space... %llu bytes needed", v65, 0x20u);
        }

        -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_204;
        block[3] = &unk_24F1F79C8;
        block[4] = self;
        v53 = v9;
        v52 = v6;
        dispatch_async(v11, block);

      }
      else
      {
        *(_QWORD *)v65 = 0;
        *(_QWORD *)&v65[8] = v65;
        *(_QWORD *)&v65[16] = 0x2020000000;
        v66 = 2;
        -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_2;
        v48[3] = &unk_24F1F79F0;
        v50 = v65;
        v48[4] = self;
        v14 = v6;
        v49 = v14;
        dispatch_sync(v13, v48);

        if (*(_QWORD *)(*(_QWORD *)&v65[8] + 24) == 3)
        {
          UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
            v63 = 2114;
            v64 = v14;
            _os_log_impl(&dword_229282000, v15, OS_LOG_TYPE_DEFAULT, "%s #settings Already in progress download for dictation assets language %{public}@... Skipping...", buf, 0x16u);
          }
        }
        else
        {
          -[NSObject stringByReplacingOccurrencesOfString:withString:](v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
          v15 = objc_claimAutoreleasedReturnValue();
          UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
            v63 = 2114;
            v64 = v15;
            _os_log_impl(&dword_229282000, v18, OS_LOG_TYPE_DEFAULT, "%s #settings Downloading dictation assets for language %{public}@...", buf, 0x16u);
          }

          v58 = v15;
          v59 = CFSTR("com.apple.siri.understanding");
          v57 = CFSTR("asr.language");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(CFSTR("dictation."), "stringByAppendingString:", v15);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2592000.0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[UAFAssetSetSubscription initWithName:assetSets:usageAliases:expires:]([UAFAssetSetSubscription alloc], "initWithName:assetSets:usageAliases:expires:", v36, v35, 0, v34);
          v20 = dispatch_semaphore_create(0);
          objc_initWeak(&location, self);
          +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v33;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_213;
          v43[3] = &unk_24F1F7A18;
          objc_copyWeak(&v46, &location);
          v23 = v14;
          v44 = v23;
          v24 = v20;
          v45 = v24;
          objc_msgSend(v21, "subscribe:subscriptions:queue:completion:", CFSTR("com.apple.uaf.assetutil"), v22, 0, v43);

          v25 = dispatch_time(0, 3000000000);
          if (dispatch_semaphore_wait(v24, v25))
          {
            UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v62 = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
              v63 = 2114;
              v64 = v23;
              _os_log_error_impl(&dword_229282000, v26, OS_LOG_TYPE_ERROR, "%s #settings Failed to subscribe to dictation language %{public}@ due to timeout", buf, 0x16u);
            }

          }
          else
          {
            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_215;
            v40[3] = &unk_24F1F7928;
            objc_copyWeak(&v42, &location);
            v27 = v23;
            v41 = v27;
            v32 = (void *)MEMORY[0x22E2C6D60](v40);
            v37[0] = MEMORY[0x24BDAC760];
            v37[1] = 3221225472;
            v37[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_2_216;
            v37[3] = &unk_24F1F7950;
            objc_copyWeak(&v39, &location);
            v38 = v27;
            v28 = (void *)MEMORY[0x22E2C6D60](v37);
            v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v29, "addObject:", CFSTR("UpdateNamespaces"));
            if (v4)
              objc_msgSend(v29, "addObject:", CFSTR("UseCellular"));
            +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "updateAssetsForSubscriber:subscriptionName:policies:queue:progress:completion:", CFSTR("com.apple.uaf.assetutil"), v36, v29, v31, v32, v28);

            objc_destroyWeak(&v39);
            objc_destroyWeak(&v42);
          }

          objc_destroyWeak(&v46);
          objc_destroyWeak(&location);

        }
        _Block_object_dispose(v65, 8);
      }
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v65 = 136315394;
        *(_QWORD *)&v65[4] = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
        *(_WORD *)&v65[12] = 2114;
        *(_QWORD *)&v65[14] = v6;
        _os_log_error_impl(&dword_229282000, v16, OS_LOG_TYPE_ERROR, "%s #settings Cannot download Dictation assets for %{public}@ due to network connectivity...", v65, 0x16u);
      }

      -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke;
      v54[3] = &unk_24F1F70C8;
      v54[4] = self;
      v55 = v6;
      dispatch_async(v17, v54);

    }
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v65 = 136315138;
      *(_QWORD *)&v65[4] = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
      _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, "%s #settings Cannot download Dictation assets due to nil language", v65, 0xCu);
    }

  }
}

uint64_t __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDictationState:value:forLanguage:", 2, 0, *(_QWORD *)(a1 + 40));
}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_204(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateDictationState:value:forLanguage:", 6, v3, a1[5]);

}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dictationStatus");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "state");

}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_213(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = 136315650;
        v8 = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]_block_invoke";
        v9 = 2114;
        v10 = v6;
        v11 = 2112;
        v12 = v3;
        _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s #settings Failed to subscribe to dictation language %{public}@ due to error %@", (uint8_t *)&v7, 0x20u);
      }

    }
    else
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
  }

}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_215(uint64_t a1, uint64_t a2, double a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleDictationProgress:status:language:", (unint64_t)a3, a2, *(_QWORD *)(a1 + 32));

}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_2_216(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleDictationCompletionForLanguage:", *(_QWORD *)(a1 + 32));

}

- (void)_handleDictationProgress:(unint64_t)a3 status:(unint64_t)a4 language:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = v8;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v11 = v8;
    -[UAFAssetUtilitiesService _updateDictationProgress:language:](self, "_updateDictationProgress:language:", a3, v8);
LABEL_7:
    v9 = v11;
    goto LABEL_8;
  }
  if (a4 != 4)
  {
    v11 = v8;
    if (a4 == 5)
    {
      -[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:](self, "_getDiskSpaceNeededInBytesForLanguage:isDictation:error:", v8, 1, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAFAssetUtilitiesService _updateDictationState:value:forLanguage:](self, "_updateDictationState:value:forLanguage:", 6, v10, v11);

    }
    else
    {
      -[UAFAssetUtilitiesService _updateDictationState:value:forLanguage:](self, "_updateDictationState:value:forLanguage:", 4, 0, v8);
    }
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_updateDictationProgress:(unint64_t)a3 language:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[UAFAssetUtilitiesService _updateDictationProgress:language:]";
    v13 = 1024;
    v14 = a3;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Dictation download percent %d for language %{public}@", (uint8_t *)&v11, 0x1Cu);
  }

  if (a3 >= 0x63)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "-[UAFAssetUtilitiesService _updateDictationProgress:language:]";
      v13 = 1024;
      v14 = 98;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s #settings Download progress clamped to %d%% for language %{public}@", (uint8_t *)&v11, 0x1Cu);
    }

    a3 = 98;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilitiesService _updateDictationState:value:forLanguage:](self, "_updateDictationState:value:forLanguage:", 3, v10, v6);

}

- (void)_handleDictationCompletionForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[UAFAssetUtilitiesService _handleDictationCompletionForLanguage:]";
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Dictation download complete for %{public}@", buf, 0x16u);
  }

  -[UAFAssetUtilitiesService _updateDictationState:value:forLanguage:](self, "_updateDictationState:value:forLanguage:", 3, &unk_24F202C20, v4);
  objc_initWeak((id *)buf, self);
  v7 = dispatch_time(0, 3000000000);
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__UAFAssetUtilitiesService__handleDictationCompletionForLanguage___block_invoke;
  v10[3] = &unk_24F1F7950;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v4;
  v9 = v4;
  dispatch_after(v7, v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __66__UAFAssetUtilitiesService__handleDictationCompletionForLanguage___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "_updateDictationAvailabilityForLanguage:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v13 = "-[UAFAssetUtilitiesService _handleDictationCompletionForLanguage:]_block_invoke";
      v14 = 2114;
      v15 = v8;
      _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s #settings Dictation still not available after download completed for language %{public}@", buf, 0x16u);
    }

    v6 = dispatch_time(0, 3000000000);
    objc_msgSend(v4, "statusQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__UAFAssetUtilitiesService__handleDictationCompletionForLanguage___block_invoke_217;
    v9[3] = &unk_24F1F7950;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 32);
    dispatch_after(v6, v7, v9);

    objc_destroyWeak(&v11);
  }

}

void __66__UAFAssetUtilitiesService__handleDictationCompletionForLanguage___block_invoke_217(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "_updateDictationAvailabilityForLanguage:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315394;
      v7 = "-[UAFAssetUtilitiesService _handleDictationCompletionForLanguage:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_229282000, v4, OS_LOG_TYPE_ERROR, "%s #settings Dictation still not available after retrying availability check for language %{public}@", (uint8_t *)&v6, 0x16u);
    }

    objc_msgSend(v3, "_updateDictationState:value:forLanguage:", 4, 0, *(_QWORD *)(a1 + 32));
  }

}

- (BOOL)_updateDictationAvailabilityForLanguage:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = +[UAFAssetStatus dictationAvailableForLanguage:](UAFAssetStatus, "dictationAvailableForLanguage:", v4);
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[UAFAssetUtilitiesService _updateDictationAvailabilityForLanguage:]";
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s #settings Dictation available for %{public}@", (uint8_t *)&v9, 0x16u);
    }

    -[UAFAssetUtilitiesService _updateDictationState:value:forLanguage:](self, "_updateDictationState:value:forLanguage:", 5, 0, v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[UAFAssetUtilitiesService _updateDictationAvailabilityForLanguage:]";
      v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s #settings Dictation still not available after successful download for language %{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  return v5;
}

- (void)postDictationAssetNotificationForLanguage:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[UAFAssetUtilitiesService postDictationAssetNotificationForLanguage:]";
    _os_log_error_impl(&dword_229282000, v3, OS_LOG_TYPE_ERROR, "%s #settings posting Dictation notification not supported.", (uint8_t *)&v4, 0xCu);
  }

}

- (NSMutableDictionary)dictationStatus
{
  NSMutableDictionary *dictationStatus;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  dictationStatus = self->_dictationStatus;
  if (!dictationStatus)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = self->_dictationStatus;
    self->_dictationStatus = v4;

    dictationStatus = self->_dictationStatus;
  }
  return dictationStatus;
}

- (void)_updateDictationState:(unint64_t)a3 value:(id)a4 forLanguage:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  UAFAssetStatus *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a5;
  v8 = a4;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[UAFAssetUtilitiesService dictationStatus](self, "dictationStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(UAFAssetStatus);
    -[UAFAssetUtilitiesService dictationStatus](self, "dictationStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v18);

  }
  -[UAFAssetUtilitiesService dictationStatus](self, "dictationStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setState:", a3);

  -[UAFAssetUtilitiesService dictationStatus](self, "dictationStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:", v8);

}

- (UAFAssetStatus)assetStatus
{
  UAFAssetStatus *assetStatus;
  UAFAssetStatus *v4;
  UAFAssetStatus *v5;

  assetStatus = self->_assetStatus;
  if (!assetStatus)
  {
    v4 = objc_alloc_init(UAFAssetStatus);
    v5 = self->_assetStatus;
    self->_assetStatus = v4;

    assetStatus = self->_assetStatus;
  }
  return assetStatus;
}

- (void)checkAssetStatus:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  if (v4)
  {
    -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__UAFAssetUtilitiesService_checkAssetStatus___block_invoke;
    v8[3] = &unk_24F1F7A40;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v6, v8);

    v7 = v9;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[UAFAssetUtilitiesService checkAssetStatus:]";
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s #settings nil completion", buf, 0xCu);
    }
  }

}

void __45__UAFAssetUtilitiesService_checkAssetStatus___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "assetStatus");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)updateAssetState:(unint64_t)a3 value:(id)a4 forLanguage:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a4;
  v9 = a5;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__UAFAssetUtilitiesService_updateAssetState_value_forLanguage___block_invoke;
  v14[3] = &unk_24F1F7828;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

uint64_t __63__UAFAssetUtilitiesService_updateAssetState_value_forLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAssetState:value:forLanguage:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_updateAssetState:(unint64_t)a3 value:(id)a4 forLanguage:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[UAFAssetUtilitiesService statusQueue](self, "statusQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (v9
    || (+[UAFCommonUtilities currentAssistantLanguage](UAFCommonUtilities, "currentAssistantLanguage"),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[NSObject stringByReplacingOccurrencesOfString:withString:](v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAFAssetUtilitiesService assetStatus](self, "assetStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setState:", a3);

    -[UAFAssetUtilitiesService assetStatus](self, "assetStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:", v8);

    -[UAFAssetUtilitiesService assetStatus](self, "assetStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSiriLanguage:", v11);

    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315906;
      v18 = "-[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:]";
      v19 = 2114;
      v20 = v11;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_229282000, v15, OS_LOG_TYPE_DEFAULT, "%s #settings Updated Siri asset status for %{public}@ with state %@ and value %@", (uint8_t *)&v17, 0x2Au);

    }
    -[UAFAssetUtilitiesService _postAssetStateChangedNotification](self, "_postAssetStateChangedNotification");

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "-[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:]";
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s #settings nil language", (uint8_t *)&v17, 0xCu);
    }
  }

}

- (void)_postAssetStateChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kUAFAssetStatusDidChangeDarwinNotification"), 0, 0, 1u);
}

- (void)diskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, NSObject *);
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *, NSObject *))a5;
  if (v9)
  {
    v12 = 0;
    -[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:](self, "_getDiskSpaceNeededInBytesForLanguage:isDictation:error:", v8, a4 == 1, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    v9[2](v9, v10, v11);

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[UAFAssetUtilitiesService diskSpaceNeededInBytesForLanguage:forClient:completion:]";
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, "%s #settings diskSpaceNeededInBytesForLanguage with nil completion, language = %{public}@", buf, 0x16u);
    }
  }

}

- (id)_getDiskSpaceNeededInBytesForLanguage:(id)a3 isDictation:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v6 = a4;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    v8 = CFSTR("com.apple.siri.assistant");
    if (v6)
      v8 = CFSTR("com.apple.uaf.assetutil");
    v9 = v8;
    if (v6)
    {
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("dictation."), "stringByAppendingString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    +[UAFAssetSetManager sharedManager](UAFAssetSetManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "diskSpaceNeededForSubscriber:subscriptionName:error:", v9, v11, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "unsignedIntegerValue");
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      v20 = v16;
      if (v19)
      {
        v22 = 136315394;
        v23 = "-[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:]";
        v24 = 2048;
        v25 = objc_msgSend(v16, "unsignedIntegerValue");
        _os_log_impl(&dword_229282000, v18, OS_LOG_TYPE_DEFAULT, "%s #settings return size %lu", (uint8_t *)&v22, 0x16u);
        v20 = v16;
      }
    }
    else
    {
      v20 = &unk_24F202C50;
      if (v19)
      {
        v22 = 136315394;
        v23 = "-[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:]";
        v24 = 2048;
        v25 = objc_msgSend(&unk_24F202C50, "unsignedIntegerValue");
        _os_log_impl(&dword_229282000, v18, OS_LOG_TYPE_DEFAULT, "%s #settings return default size %lu", (uint8_t *)&v22, 0x16u);
      }
    }

    v14 = v20;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315138;
      v23 = "-[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:]";
      _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, "%s #settings nil language", (uint8_t *)&v22, 0xCu);
    }

    if (!a5)
    {
      v14 = &unk_24F202C08;
      goto LABEL_18;
    }
    v13 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FD8];
    v27[0] = CFSTR("nil language");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v14 = &unk_24F202C08;
  }

LABEL_18:
  return v14;
}

- (unint64_t)_checkFreeSpaceNeededForLanguage:(id)a3 isDictation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14 = 0;
  -[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:](self, "_getDiskSpaceNeededInBytesForLanguage:isDictation:error:", v6, v4, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (v8)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[UAFAssetUtilitiesService _checkFreeSpaceNeededForLanguage:isDictation:]";
      v17 = 2112;
      v18 = v8;
      v19 = 2114;
      v20 = v6;
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assets download size due to error %@, language = %{public}@", buf, 0x20u);
    }

  }
  v10 = objc_msgSend(v7, "unsignedIntegerValue");
  if (v10)
  {
    v11 = +[UAFCommonUtilities getFreeDiskSpaceNeededInBytes:](UAFCommonUtilities, "getFreeDiskSpaceNeededInBytes:", v10);
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[UAFAssetUtilitiesService _checkFreeSpaceNeededForLanguage:isDictation:]";
      v17 = 2114;
      v18 = v6;
      _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, "%s #settings Returning enough space for assets even with an unknown size requested, language = %{public}@", buf, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (BOOL)uodAvailable
{
  return self->_uodAvailable;
}

- (void)setUodAvailable:(BOOL)a3
{
  self->_uodAvailable = a3;
}

- (OS_dispatch_group)statusGroup
{
  return self->_statusGroup;
}

- (void)setStatusGroup:(id)a3
{
  objc_storeStrong((id *)&self->_statusGroup, a3);
}

- (OS_dispatch_queue)statusQueue
{
  return self->_statusQueue;
}

- (void)setStatusQueue:(id)a3
{
  objc_storeStrong((id *)&self->_statusQueue, a3);
}

- (OS_dispatch_queue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_downloadQueue, a3);
}

- (void)setAssetStatus:(id)a3
{
  objc_storeStrong((id *)&self->_assetStatus, a3);
}

- (void)setDictationStatus:(id)a3
{
  objc_storeStrong((id *)&self->_dictationStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationStatus, 0);
  objc_storeStrong((id *)&self->_assetStatus, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_statusGroup, 0);
  objc_storeStrong((id *)&self->_siriLanguage, 0);
}

@end
