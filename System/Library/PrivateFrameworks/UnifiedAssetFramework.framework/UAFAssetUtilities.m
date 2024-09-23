@implementation UAFAssetUtilities

- (UAFAssetUtilities)init
{
  char *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  dispatch_group_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UAFAssetUtilities;
  v2 = -[UAFAssetUtilities init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.UAF.AssetUtilities.DownloadQueue", v3);
    v5 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.UAF.AssetUtilities.StatusQueue", v6);
    v8 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.UAF.AssetUtilities.DelegateQueue", v9);
    v11 = (void *)*((_QWORD *)v2 + 16);
    *((_QWORD *)v2 + 16) = v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.UAF.AssetUtilities.AssistantQueue", v12);
    v14 = (void *)*((_QWORD *)v2 + 17);
    *((_QWORD *)v2 + 17) = v13;

    v15 = dispatch_group_create();
    v16 = (void *)*((_QWORD *)v2 + 18);
    *((_QWORD *)v2 + 18) = v15;

    v17 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = 0;

    *((_DWORD *)v2 + 8) = 3;
    *(_OWORD *)(v2 + 72) = xmmword_2292DE9A0;
    *(_OWORD *)(v2 + 56) = xmmword_2292DE9B0;
    v2[29] = 1;
  }
  return (UAFAssetUtilities *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[UAFAssetUtilities _stopObservers](self, "_stopObservers");
  v3.receiver = self;
  v3.super_class = (Class)UAFAssetUtilities;
  -[UAFAssetUtilities dealloc](&v3, sel_dealloc);
}

- (void)startObservers
{
  -[UAFAssetUtilities startObserversWithOptions:](self, "startObserversWithOptions:", 31);
}

- (void)startObserversWithOptions:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];

  -[UAFAssetUtilities assistantGroup](self, "assistantGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__UAFAssetUtilities_startObserversWithOptions___block_invoke;
  v7[3] = &unk_24F1F7000;
  v7[4] = self;
  v7[5] = a3;
  dispatch_group_async(v5, v6, v7);

}

void __47__UAFAssetUtilities_startObserversWithOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t default_evaluator;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v20;
  __CFString *v21;
  NSObject *v22;
  __CFNotificationCenter *v23;
  const void *v24;
  __CFString *v25;
  NSObject *v26;
  __CFNotificationCenter *v27;
  const void *v28;
  __CFString *v29;
  uint64_t v30;
  dispatch_time_t v31;
  NSObject *v32;
  NSObject *v33;
  __CFNotificationCenter *v34;
  _QWORD v35[4];
  id v36[5];
  id v37;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke";
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s #settings Start observers", buf, 0xCu);
  }

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v3 & 4) != 0)
  {
    v4 = 0;
    if ((v3 & 1) != 0)
    {
LABEL_5:
      v5 = 0;
      if ((v3 & 2) != 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = (*(unsigned __int8 *)(a1 + 40) >> 2) & 1;
    if ((v3 & 1) != 0)
      goto LABEL_5;
  }
  v5 = *(_BYTE *)(a1 + 40) & 1;
  if ((v3 & 2) != 0)
  {
LABEL_6:
    v6 = 0;
    if ((v3 & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_12:
  v6 = (*(unsigned __int8 *)(a1 + 40) >> 1) & 1;
  if ((v3 & 0x10) != 0)
  {
LABEL_7:
    v7 = 0;
    if ((v3 & 8) != 0)
      goto LABEL_8;
LABEL_14:
    v8 = (*(unsigned __int8 *)(a1 + 40) >> 3) & 1;
    if (!v4)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_13:
  v7 = (*(unsigned __int8 *)(a1 + 40) >> 4) & 1;
  if ((v3 & 8) == 0)
    goto LABEL_14;
LABEL_8:
  v8 = 0;
  if (v4)
LABEL_15:
    objc_msgSend(*(id *)(a1 + 32), "setAssistantEnabled:", +[UAFCommonUtilities isAssistantEnabled](UAFCommonUtilities, "isAssistantEnabled"));
LABEL_16:
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "getAssistantLanguageIfAvailableSync");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSiriLanguage:", v9);

  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "statusQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__UAFAssetUtilities_startObserversWithOptions___block_invoke_185;
    block[3] = &unk_24F1F6F88;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(v10, block);

  }
  if (v8)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke_2";
      _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s #settings Start network observer", buf, 0xCu);
    }

    default_evaluator = nw_path_create_default_evaluator();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 8);
    *(_QWORD *)(v13 + 8) = default_evaluator;

    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      v15 = (void *)nw_path_evaluator_copy_path();
      v16 = a1 + 32;
      *(_BYTE *)(*(_QWORD *)v16 + 27) = objc_msgSend(*(id *)(a1 + 32), "_networkIsSatisfiedForPath:", v15);
      *(_BYTE *)(*(_QWORD *)v16 + 28) = objc_msgSend(*(id *)(a1 + 32), "_networkIsExpensiveForPath:", v15);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "statusQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = (id)MEMORY[0x24BDAC760];
      v36[2] = (id)3221225472;
      v36[3] = __47__UAFAssetUtilities_startObserversWithOptions___block_invoke_188;
      v36[4] = &unk_24F1F6FB0;
      objc_copyWeak(&v37, (id *)buf);
      nw_path_evaluator_set_update_handler();

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)buf);

    }
  }
  if (v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke_2";
      _os_log_impl(&dword_229282000, v18, OS_LOG_TYPE_DEFAULT, "%s #settings Start language observer", buf, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v20 = *(const void **)(a1 + 32);
    getAFLanguageCodeDidChangeDarwinNotification();
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v20, (CFNotificationCallback)_AFLanguageDidChangeCallback, v21, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  if (v4)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke";
      _os_log_impl(&dword_229282000, v22, OS_LOG_TYPE_DEFAULT, "%s #settings Start preferences observer", buf, 0xCu);
    }

    v23 = CFNotificationCenterGetDarwinNotifyCenter();
    v24 = *(const void **)(a1 + 32);
    getkAFPreferencesDidChangeDarwinNotification();
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v23, v24, (CFNotificationCallback)_AFPreferencesDidChangeCallback, v25, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  if (v5)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke";
      _os_log_impl(&dword_229282000, v26, OS_LOG_TYPE_DEFAULT, "%s #settings Start UOD observer", buf, 0xCu);
    }

    v27 = CFNotificationCenterGetDarwinNotifyCenter();
    v28 = *(const void **)(a1 + 32);
    getAFSiriXAssetDidChangeDarwinNotification();
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v27, v28, (CFNotificationCallback)_SiriXAssetDidChangeCallback, v29, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v30 = objc_msgSend(*(id *)(a1 + 32), "_assetsAreAvailableForLanguageSync:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    objc_msgSend(*(id *)(a1 + 32), "setUnderstandingOnDeviceAssetsAvailable:", v30);
    if ((v30 & 1) == 0)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v31 = dispatch_time(0, 2000000000);
      objc_msgSend(*(id *)(a1 + 32), "statusQueue");
      v32 = objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __47__UAFAssetUtilities_startObserversWithOptions___block_invoke_190;
      v35[3] = &unk_24F1F6FD8;
      objc_copyWeak(v36, (id *)buf);
      dispatch_after(v31, v32, v35);

      objc_destroyWeak(v36);
      objc_destroyWeak((id *)buf);
    }
  }
  if (v7)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke_2";
      _os_log_impl(&dword_229282000, v33, OS_LOG_TYPE_DEFAULT, "%s #settings Start UAFAssetStatus observer", buf, 0xCu);
    }

    v34 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v34, *(const void **)(a1 + 32), (CFNotificationCallback)_UAFAssetStatusDidChangeCallback, CFSTR("kUAFAssetStatusDidChangeDarwinNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= *(_QWORD *)(a1 + 40);
}

void __47__UAFAssetUtilities_startObserversWithOptions___block_invoke_185(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_refreshUAFAssetStatusSync");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAssetStatus:", v2);

}

void __47__UAFAssetUtilities_startObserversWithOptions___block_invoke_188(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleNetworkPathUpdate:", v5);

}

void __47__UAFAssetUtilities_startObserversWithOptions___block_invoke_190(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[26])
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "refreshUnderstandingOnDeviceAssetsAvailableAsync");
    WeakRetained = v2;
  }

}

- (void)_stopObservers
{
  NSObject *v3;
  OS_nw_path_evaluator *pathEvaluator;
  unint64_t observerOptions;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v8;
  __CFNotificationCenter *v9;
  __CFString *v10;
  __CFNotificationCenter *v11;
  __CFString *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[UAFAssetUtilities _stopObservers]";
    _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s #settings Stop observers", (uint8_t *)&v13, 0xCu);
  }

  if (self->_pathEvaluator)
  {
    nw_path_evaluator_cancel();
    pathEvaluator = self->_pathEvaluator;
    self->_pathEvaluator = 0;

  }
  observerOptions = self->_observerOptions;
  if ((observerOptions & 2) != 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getAFLanguageCodeDidChangeDarwinNotification();
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v8, 0);

    observerOptions = self->_observerOptions;
    if ((observerOptions & 4) == 0)
    {
LABEL_7:
      if ((observerOptions & 1) == 0)
        goto LABEL_8;
LABEL_13:
      v11 = CFNotificationCenterGetDarwinNotifyCenter();
      getAFSiriXAssetDidChangeDarwinNotification();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNotificationCenterRemoveObserver(v11, self, v12, 0);

      if ((self->_observerOptions & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((observerOptions & 4) == 0)
  {
    goto LABEL_7;
  }
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  getkAFPreferencesDidChangeDarwinNotification();
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v9, self, v10, 0);

  observerOptions = self->_observerOptions;
  if ((observerOptions & 1) != 0)
    goto LABEL_13;
LABEL_8:
  if ((observerOptions & 0x10) != 0)
  {
LABEL_9:
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v6, self, CFSTR("kUAFAssetStatusDidChangeDarwinNotification"), 0);
  }
LABEL_10:
  self->_observerOptions = 0;
}

- (id)_createConnection
{
  return objc_alloc_init(UAFXPCConnection);
}

- (void)refreshUnderstandingOnDeviceAssetsAvailableAsync
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];

  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[UAFAssetUtilities assistantGroup](self, "assistantGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__UAFAssetUtilities_refreshUnderstandingOnDeviceAssetsAvailableAsync__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_group_async(v4, v5, block);

}

void __69__UAFAssetUtilities_refreshUnderstandingOnDeviceAssetsAvailableAsync__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "getAssistantLanguageIfAvailableSync");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_assetsAreAvailableForLanguageSync:", v2);

}

- (BOOL)_assetsAreAvailableForLanguageSync:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  dispatch_semaphore_t v11;
  id v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  double v20;
  dispatch_time_t v21;
  NSObject *v22;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  uint64_t *v32;
  id v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  BOOL understandingOnDeviceAssetsAvailable;
  id location;
  id *p_location;
  uint64_t v41;
  uint64_t v42;
  _BYTE buf[32];
  id *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[UAFAssetUtilities _assetsAreAvailableForLanguageSync:]";
      _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assets availability due to nil language. Return NO", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v5 = +[UAFCommonUtilities deviceSupportFullUOD](UAFCommonUtilities, "deviceSupportFullUOD");
  v6 = +[UAFCommonUtilities deviceSupportAndUseHybridASR](UAFCommonUtilities, "deviceSupportAndUseHybridASR");
  if (!v5 && !v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[UAFAssetUtilities _assetsAreAvailableForLanguageSync:]";
      _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s #settings Assets not available due to no UOD support. Return NO.", buf, 0xCu);
    }

    -[UAFAssetUtilities _updateDelegateForUODAvailable:uodStatus:](self, "_updateDelegateForUODAvailable:uodStatus:", 0, 0);
LABEL_10:
    v9 = 0;
    goto LABEL_20;
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  understandingOnDeviceAssetsAvailable = self->_understandingOnDeviceAssetsAvailable;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_semaphore_create(0);
  location = 0;
  p_location = &location;
  v41 = 0x2050000000;
  v12 = (id)getAFSettingsConnectionClass_softClass;
  v42 = getAFSettingsConnectionClass_softClass;
  v13 = MEMORY[0x24BDAC760];
  if (!getAFSettingsConnectionClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAFSettingsConnectionClass_block_invoke;
    *(_QWORD *)&buf[24] = &unk_24F1F7190;
    v44 = &location;
    __getAFSettingsConnectionClass_block_invoke((uint64_t)buf);
    v12 = p_location[3];
  }
  v14 = (objc_class *)objc_retainAutorelease(v12);
  _Block_object_dispose(&location, 8);
  v15 = objc_alloc_init(v14);
  objc_initWeak(&location, self);
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[UAFAssetUtilities _assetsAreAvailableForLanguageSync:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_229282000, v16, OS_LOG_TYPE_DEFAULT, "%s #settings UOD check for language %{public}@", buf, 0x16u);
  }

  v25 = v13;
  v26 = 3221225472;
  v27 = __56__UAFAssetUtilities__assetsAreAvailableForLanguageSync___block_invoke;
  v28 = &unk_24F1F7028;
  v17 = v15;
  v29 = v17;
  objc_copyWeak(&v33, &location);
  v34 = v5;
  v18 = v10;
  v30 = v18;
  v32 = &v35;
  v19 = v11;
  v31 = v19;
  objc_msgSend(v17, "getAssetStatusForLanguage:completionHandler:", v18, &v25);
  -[UAFAssetUtilities assetAvailableCheckTimeout](self, "assetAvailableCheckTimeout", v25, v26, v27, v28);
  v21 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
  if (dispatch_semaphore_wait(v19, v21))
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = *((unsigned __int8 *)v36 + 24);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[UAFAssetUtilities _assetsAreAvailableForLanguageSync:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v24;
      *(_WORD *)&buf[18] = 2114;
      *(_QWORD *)&buf[20] = v4;
      _os_log_error_impl(&dword_229282000, v22, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assets availability due to timeout. Returning cached value:%d, language = %{public}@", buf, 0x1Cu);
    }

  }
  v9 = *((_BYTE *)v36 + 24) != 0;

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v35, 8);
LABEL_20:

  return v9;
}

void __56__UAFAssetUtilities__assetsAreAvailableForLanguageSync___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  _BOOL8 v6;
  id v7;

  v7 = a2;
  v3 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 72))
      v6 = +[UAFCommonUtilities isFullUODSupportedForStatus:language:](UAFCommonUtilities, "isFullUODSupportedForStatus:language:", v7, v5);
    else
      v6 = +[UAFCommonUtilities isHybridUODSupportedForStatus:language:](UAFCommonUtilities, "isHybridUODSupportedForStatus:language:", v7, v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
    objc_msgSend(WeakRetained, "_updateDelegateForUODAvailable:uodStatus:", v6, v7);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

- (void)_updateDelegateForUODAvailable:(BOOL)a3 uodStatus:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v6 = a4;
  -[UAFAssetUtilities assistantGroup](self, "assistantGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilities statusQueue](self, "statusQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke;
  block[3] = &unk_24F1F7078;
  block[4] = self;
  v11 = v6;
  v12 = a3;
  v9 = v6;
  dispatch_group_async(v7, v8, block);

}

void __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  _QWORD v9[5];
  char v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setAssistantUODStatus:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke_2;
  block[3] = &unk_24F1F6F88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 26);
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v13 = "-[UAFAssetUtilities _updateDelegateForUODAvailable:uodStatus:]_block_invoke";
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings UOD check available:%d prev:%d", buf, 0x18u);
  }

  v7 = *(unsigned __int8 *)(a1 + 48);
  if (v4 != v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setUnderstandingOnDeviceAssetsAvailable:", v7 != 0);
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke_199;
    v9[3] = &unk_24F1F7050;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(_BYTE *)(a1 + 48);
    dispatch_async(v8, v9);

  }
}

void __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriUODStatusDidChange");

  }
}

void __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke_199(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriUODAvailabilityDidChange:", *(unsigned __int8 *)(a1 + 40));

  }
}

- (NSDictionary)assistantUODStatus
{
  NSObject *v3;
  double v4;
  dispatch_time_t v5;
  intptr_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[6];
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[UAFAssetUtilities assistantGroup](self, "assistantGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilities assetAvailableCheckTimeout](self, "assetAvailableCheckTimeout");
  v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  v6 = dispatch_group_wait(v3, v5);

  if (v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[UAFAssetUtilities assistantUODStatus]";
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assistant UOD status due to timeout", (uint8_t *)&buf, 0xCu);
    }

  }
  -[UAFAssetUtilities statusQueue](self, "statusQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[UAFAssetUtilities statusQueue](self, "statusQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__UAFAssetUtilities_assistantUODStatus__block_invoke;
  v12[3] = &unk_24F1F70A0;
  v12[4] = self;
  v12[5] = &buf;
  dispatch_sync(v9, v12);

  v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return (NSDictionary *)v10;
}

void __39__UAFAssetUtilities_assistantUODStatus__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (BOOL)understandingOnDeviceAssetsAvailable
{
  NSObject *v3;
  double v4;
  dispatch_time_t v5;
  intptr_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  _QWORD v12[6];
  __int128 buf;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_understandingOnDeviceAssetsAvailable)
  {
    -[UAFAssetUtilities assistantGroup](self, "assistantGroup");
    v3 = objc_claimAutoreleasedReturnValue();
    -[UAFAssetUtilities assetAvailableCheckTimeout](self, "assetAvailableCheckTimeout");
    v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    v6 = dispatch_group_wait(v3, v5);

    if (v6)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[UAFAssetUtilities understandingOnDeviceAssetsAvailable]";
        _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assistant UOD availability due to timeout", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  -[UAFAssetUtilities statusQueue](self, "statusQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 0;
  -[UAFAssetUtilities statusQueue](self, "statusQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__UAFAssetUtilities_understandingOnDeviceAssetsAvailable__block_invoke;
  v12[3] = &unk_24F1F70A0;
  v12[4] = self;
  v12[5] = &buf;
  dispatch_sync(v9, v12);

  v10 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v10;
}

uint64_t __57__UAFAssetUtilities_understandingOnDeviceAssetsAvailable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 26);
  return result;
}

- (void)refreshUAFAssetStatusAsync
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UAFAssetUtilities_refreshUAFAssetStatusAsync__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(v4, block);

}

id __47__UAFAssetUtilities_refreshUAFAssetStatusAsync__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_refreshUAFAssetStatusSync");
}

- (id)_refreshUAFAssetStatusSync
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  double v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint64_t *v15;
  id v16;
  id location;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = dispatch_semaphore_create(0);
  -[UAFAssetUtilities _createConnection](self, "_createConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__UAFAssetUtilities__refreshUAFAssetStatusSync__block_invoke;
  v12[3] = &unk_24F1F70F0;
  objc_copyWeak(&v16, &location);
  v15 = &v18;
  v5 = v3;
  v13 = v5;
  v6 = v4;
  v14 = v6;
  objc_msgSend(v6, "checkAssetStatus:", v12);
  -[UAFAssetUtilities assetAvailableCheckTimeout](self, "assetAvailableCheckTimeout");
  v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  if (dispatch_semaphore_wait(v5, v8))
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[UAFAssetUtilities _refreshUAFAssetStatusSync]";
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s #settings Failed to refresh UAFAssetStatus due to timeout", buf, 0xCu);
    }

    v10 = 0;
  }
  else
  {
    v10 = (id)v19[5];
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __47__UAFAssetUtilities__refreshUAFAssetStatusSync__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[UAFAssetUtilities _refreshUAFAssetStatusSync]_block_invoke";
        v17 = 2112;
        v18 = v6;
        _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s #settings checkAssetStatus error: %@", buf, 0x16u);
      }
    }
    else
    {
      if (v5)
      {
        objc_msgSend(WeakRetained, "statusQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __47__UAFAssetUtilities__refreshUAFAssetStatusSync__block_invoke_2;
        v13[3] = &unk_24F1F70C8;
        v13[4] = v8;
        v14 = v5;
        dispatch_async(v10, v13);

      }
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = v5;
      v9 = *(NSObject **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v12;
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }

}

void __47__UAFAssetUtilities__refreshUAFAssetStatusSync__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)nw_path_evaluator_copy_path();
  if (!objc_msgSend(*(id *)(a1 + 40), "state")
    && (objc_msgSend(*(id *)(a1 + 32), "_networkIsExpensiveForPath:", v2) & 1) == 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[UAFAssetUtilities _refreshUAFAssetStatusSync]_block_invoke_2";
      _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s #settings Forcing unknown server state to not started until WiFi gets enabled", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setState:", 2);
  }
  objc_msgSend(*(id *)(a1 + 32), "setAssetStatus:", *(_QWORD *)(a1 + 40));
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", objc_msgSend(*(id *)(a1 + 40), "state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    v8 = 136315650;
    v9 = "-[UAFAssetUtilities _refreshUAFAssetStatusSync]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 1024;
    v13 = v7;
    _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Refresh server side asset state %@ with value %d", (uint8_t *)&v8, 0x1Cu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_triggerDelegateAssetStatusUpdated");

}

- (void)_triggerDelegateAssetStatusUpdated
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[UAFAssetUtilities statusQueue](self, "statusQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[UAFAssetUtilities delegateQueue](self, "delegateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__UAFAssetUtilities__triggerDelegateAssetStatusUpdated__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(v4, block);

}

void __55__UAFAssetUtilities__triggerDelegateAssetStatusUpdated__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[UAFAssetUtilities _triggerDelegateAssetStatusUpdated]_block_invoke";
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s #settings asset status update requested", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[UAFAssetUtilities _triggerDelegateAssetStatusUpdated]_block_invoke";
      _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings asset status delegate", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleAssetStatusUpdated");

  }
}

- (UAFAssetStatus)assetStatus
{
  NSObject *v3;
  double v4;
  dispatch_time_t v5;
  intptr_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[6];
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[UAFAssetUtilities assistantGroup](self, "assistantGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilities assetAvailableCheckTimeout](self, "assetAvailableCheckTimeout");
  v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  v6 = dispatch_group_wait(v3, v5);

  if (v6)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[UAFAssetUtilities assetStatus]";
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s #settings Failed to check UAF asset status due to timeout", (uint8_t *)&buf, 0xCu);
    }

  }
  -[UAFAssetUtilities statusQueue](self, "statusQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[UAFAssetUtilities statusQueue](self, "statusQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __32__UAFAssetUtilities_assetStatus__block_invoke;
  v12[3] = &unk_24F1F7118;
  v12[4] = self;
  v12[5] = &buf;
  dispatch_sync(v9, v12);

  v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return (UAFAssetStatus *)v10;
}

void __32__UAFAssetUtilities_assetStatus__block_invoke(uint64_t a1)
{
  void *v2;
  UAFAssetStatus *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (!v2)
  {
    v3 = objc_alloc_init(UAFAssetStatus);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (id)currentAssetStatus
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  _QWORD block[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[UAFAssetUtilities assetStatus](self, "assetStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", objc_msgSend(v3, "state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v32 = "-[UAFAssetUtilities currentAssetStatus]";
    v33 = 2112;
    v34 = v5;
    v35 = 1024;
    v36 = objc_msgSend(v6, "unsignedIntegerValue");
    _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Current asset state %@ with value %d", buf, 0x1Cu);

  }
  v7 = +[UAFCommonUtilities isAssistantEnabled](UAFCommonUtilities, "isAssistantEnabled");
  v8 = +[UAFCommonUtilities deviceSupportAndUseHybridASR](UAFCommonUtilities, "deviceSupportAndUseHybridASR");
  v9 = +[UAFCommonUtilities deviceSupportFullUOD](UAFCommonUtilities, "deviceSupportFullUOD");
  if (!objc_msgSend(v3, "state") || objc_msgSend(v3, "state") == 2 || objc_msgSend(v3, "state") == 4)
  {
    v10 = 0;
    if (!v7)
      goto LABEL_11;
  }
  else
  {
    v10 = objc_msgSend(v3, "state") != 6;
    if (!v7)
      goto LABEL_11;
  }
  if (-[UAFAssetUtilities autoRetryEnabled](self, "autoRetryEnabled") && (v8 || v9) && !v10)
  {
    objc_initWeak((id *)buf, self);
    -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__UAFAssetUtilities_currentAssetStatus__block_invoke;
    block[3] = &unk_24F1F6FD8;
    objc_copyWeak(&v30, (id *)buf);
    dispatch_async(v11, block);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
LABEL_11:
  v12 = -[UAFAssetUtilities showHybridAsUnsupported](self, "showHybridAsUnsupported");
  v13 = v9 || v8;
  if (v12)
    v13 = v9;
  if ((v7 & v13 & 1) == 0)
  {
    objc_msgSend(v3, "setState:", 1);
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", objc_msgSend(v3, "state"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v32 = "-[UAFAssetUtilities currentAssetStatus]";
      v33 = 2112;
      v34 = v16;
      v35 = 1024;
      v36 = v7;
      v37 = 1024;
      v38 = v8;
      v39 = 1024;
      v40 = v9;
      _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s #settings Forcing display state to %@ (enabled:%d, hybridUOD:%d, fullUOD:%d)", buf, 0x28u);

    }
    goto LABEL_20;
  }
  if (v9 && -[UAFAssetUtilities understandingOnDeviceAssetsAvailable](self, "understandingOnDeviceAssetsAvailable"))
  {
    objc_msgSend(v3, "setState:", 5);
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", objc_msgSend(v3, "state"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v32 = "-[UAFAssetUtilities currentAssetStatus]";
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s #settings Forcing display state to %@ due to UOD available", buf, 0x16u);

    }
LABEL_20:

  }
  +[UAFAssetStatus mockAssetStatus](UAFAssetStatus, "mockAssetStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v3, "setState:", objc_msgSend(v17, "state"));
    objc_msgSend(v18, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:", v19);

    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", objc_msgSend(v3, "state"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");
      *(_DWORD *)buf = 136315650;
      v32 = "-[UAFAssetUtilities currentAssetStatus]";
      v33 = 2112;
      v34 = v21;
      v35 = 1024;
      v36 = v23;
      _os_log_impl(&dword_229282000, v20, OS_LOG_TYPE_DEFAULT, "%s #settings Using mock asset state %@ with value %d", buf, 0x1Cu);

    }
  }
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", objc_msgSend(v3, "state"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntegerValue");
    *(_DWORD *)buf = 136315650;
    v32 = "-[UAFAssetUtilities currentAssetStatus]";
    v33 = 2112;
    v34 = v25;
    v35 = 1024;
    v36 = v27;
    _os_log_impl(&dword_229282000, v24, OS_LOG_TYPE_DEFAULT, "%s #settings Returning state %@ with value %d", buf, 0x1Cu);

  }
  return v3;
}

void __39__UAFAssetUtilities_currentAssetStatus__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_downloadSiriAssetsRetry");
    WeakRetained = v2;
  }

}

- (BOOL)_networkIsSatisfiedForPath:(id)a3
{
  return a3 && (nw_path_get_status((nw_path_t)a3) & 0xFFFFFFFD) == 1;
}

- (BOOL)_networkIsExpensiveForPath:(id)a3
{
  return a3 && nw_path_is_expensive((nw_path_t)a3);
}

- (void)_handleNetworkPathUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  int networkSatisfied;
  _BOOL4 networkExpensive;
  NSObject *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  _BOOL4 v12;
  unint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  char v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UAFAssetUtilities statusQueue](self, "statusQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  networkSatisfied = self->_networkSatisfied;
  networkExpensive = self->_networkExpensive;
  self->_networkSatisfied = -[UAFAssetUtilities _networkIsSatisfiedForPath:](self, "_networkIsSatisfiedForPath:", v4);
  self->_networkExpensive = -[UAFAssetUtilities _networkIsExpensiveForPath:](self, "_networkIsExpensiveForPath:", v4);
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_networkSatisfied;
    v10 = self->_networkExpensive;
    *(_DWORD *)buf = 136315650;
    v27 = "-[UAFAssetUtilities _handleNetworkPathUpdate:]";
    v28 = 1024;
    v29 = v9;
    v30 = 1024;
    v31 = v10;
    _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Primary network (satisfied:%d, expensive: %d)", buf, 0x18u);
  }

  v11 = self->_networkSatisfied;
  if (networkSatisfied != v11)
  {
    v12 = v11 == 0;
    v13 = -[UAFAssetStatus state](self->_assetStatus, "state");
    if (v12)
    {
      if (v13 == 3)
      {
        -[UAFAssetStatus setState:](self->_assetStatus, "setState:", 4);
        -[UAFAssetStatus setValue:](self->_assetStatus, "setValue:", &unk_24F202BD8);
        UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[UAFAssetUtilities _handleNetworkPathUpdate:]";
          _os_log_impl(&dword_229282000, v16, OS_LOG_TYPE_DEFAULT, "%s #settings Forcing downloading state to failed", buf, 0xCu);
        }

        -[UAFAssetUtilities _triggerDelegateAssetStatusUpdated](self, "_triggerDelegateAssetStatusUpdated");
      }
    }
    else if (v13 == 4)
    {
      -[UAFAssetStatus value](self->_assetStatus, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToNumber:", &unk_24F202BD8);

      if (v15)
        -[UAFAssetUtilities refreshUAFAssetStatusAsync](self, "refreshUAFAssetStatusAsync");
    }
    if (networkSatisfied != self->_networkSatisfied)
      goto LABEL_26;
  }
  if (networkExpensive == self->_networkExpensive)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[UAFAssetUtilities _handleNetworkPathUpdate:]";
      _os_log_impl(&dword_229282000, v17, OS_LOG_TYPE_DEFAULT, "%s #settings Network path nothing changed", buf, 0xCu);
    }

  }
  else
  {
LABEL_26:
    if (-[UAFAssetUtilities autoRetryEnabled](self, "autoRetryEnabled")
      && self->_networkSatisfied
      && !self->_networkExpensive)
    {
      objc_initWeak((id *)buf, self);
      -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__UAFAssetUtilities__handleNetworkPathUpdate___block_invoke;
      block[3] = &unk_24F1F6FD8;
      objc_copyWeak(&v25, (id *)buf);
      dispatch_async(v18, block);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    -[UAFAssetUtilities delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      objc_initWeak((id *)buf, self);
      -[UAFAssetUtilities delegateQueue](self, "delegateQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __46__UAFAssetUtilities__handleNetworkPathUpdate___block_invoke_210;
      v22[3] = &unk_24F1F6FD8;
      objc_copyWeak(&v23, (id *)buf);
      dispatch_async(v21, v22);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __46__UAFAssetUtilities__handleNetworkPathUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[UAFAssetUtilities _handleNetworkPathUpdate:]_block_invoke";
      _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s #settings Auto retry download on network change", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "retryState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCancelled:", 1);

    objc_msgSend(WeakRetained, "setRetryState:", 0);
    objc_msgSend(WeakRetained, "autoRetryDelayOnSettingsChanged");
    objc_msgSend(WeakRetained, "_downloadSiriAssetsWithDelay:");
  }

}

void __46__UAFAssetUtilities__handleNetworkPathUpdate___block_invoke_210(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v2;
  unsigned __int8 *v3;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "networkPathChangeSatisfied:isExpensive:", v3[27], v3[28]);

    WeakRetained = v3;
  }

}

- (void)downloadSiriAssetsIfNeeded
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[UAFAssetUtilities downloadQueue](self, "downloadQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__UAFAssetUtilities_downloadSiriAssetsIfNeeded__block_invoke;
  v4[3] = &unk_24F1F6FD8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__UAFAssetUtilities_downloadSiriAssetsIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "getAssistantLanguageIfAvailableSync");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "assetsAreAvailableForLanguageSync:", v3))
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[UAFAssetUtilities downloadSiriAssetsIfNeeded]_block_invoke";
        _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Skip download due to assets available already", (uint8_t *)&v5, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v2, "_downloadSiriAssetsOverCellular:", 0);
    }

  }
}

- (void)downloadSiriAssets
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[UAFAssetUtilities assistantGroup](self, "assistantGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilities downloadQueue](self, "downloadQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__UAFAssetUtilities_downloadSiriAssets__block_invoke;
  v5[3] = &unk_24F1F6FD8;
  objc_copyWeak(&v6, &location);
  dispatch_group_notify(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__UAFAssetUtilities_downloadSiriAssets__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_downloadSiriAssetsOverCellular:", 0);

}

- (void)downloadSiriAssetsOverCellular
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[UAFAssetUtilities assistantGroup](self, "assistantGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetUtilities downloadQueue](self, "downloadQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__UAFAssetUtilities_downloadSiriAssetsOverCellular__block_invoke;
  v5[3] = &unk_24F1F6FD8;
  objc_copyWeak(&v6, &location);
  dispatch_group_notify(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__UAFAssetUtilities_downloadSiriAssetsOverCellular__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_downloadSiriAssetsOverCellular:", 1);

}

- (void)_downloadSiriAssetsRetry
{
  NSObject *v3;
  unsigned int v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  unsigned int v22;
  unsigned int v23;
  uint8_t v24[4];
  const char *v25;
  __int16 v26;
  unsigned int v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[UAFAssetUtilities autoRetryEnabled](self, "autoRetryEnabled"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy_;
    v31 = __Block_byref_object_dispose_;
    -[UAFAssetUtilities retryState](self, "retryState");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "retryCount");
    if (v4 >= -[UAFAssetUtilities autoRetryLimit](self, "autoRetryLimit"))
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 136315394;
        v25 = "-[UAFAssetUtilities _downloadSiriAssetsRetry]";
        v26 = 1024;
        v27 = v4;
        v6 = "%s #settings Skip retry after hitting limit %d";
        v7 = v5;
        v8 = 18;
        goto LABEL_11;
      }
    }
    else
    {
      if (!objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "pending"))
      {
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setPending:", 1);
        v10 = -[UAFAssetUtilities autoRetryLimit](self, "autoRetryLimit");
        v11 = v10 - v4;
        if (v10 != v4)
        {
          v12 = 0;
          v13 = MEMORY[0x24BDAC760];
          do
          {
            -[UAFAssetUtilities autoRetryDelayOnFailure](self, "autoRetryDelayOnFailure");
            v15 = v14;
            -[UAFAssetUtilities autoRetryDelayOnFailureIncrement](self, "autoRetryDelayOnFailureIncrement");
            v17 = v16;
            objc_initWeak((id *)v24, self);
            v18 = dispatch_time(0, (uint64_t)((v15 + (double)v12 * v17) * 1000000000.0));
            -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
            v19 = objc_claimAutoreleasedReturnValue();
            block[0] = v13;
            block[1] = 3221225472;
            block[2] = __45__UAFAssetUtilities__downloadSiriAssetsRetry__block_invoke;
            block[3] = &unk_24F1F7140;
            objc_copyWeak(&v21, (id *)v24);
            block[4] = &buf;
            v22 = v12;
            v23 = v11;
            dispatch_after(v18, v19, block);

            objc_destroyWeak(&v21);
            objc_destroyWeak((id *)v24);
            ++v12;
          }
          while (v11 != v12);
        }
        goto LABEL_13;
      }
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 136315138;
        v25 = "-[UAFAssetUtilities _downloadSiriAssetsRetry]";
        v6 = "%s #settings Skip retry attempt on pending execution";
        v7 = v5;
        v8 = 12;
LABEL_11:
        _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, v6, v24, v8);
      }
    }

LABEL_13:
    _Block_object_dispose(&buf, 8);

    return;
  }
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[UAFAssetUtilities _downloadSiriAssetsRetry]";
    _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s #settings Auto retry is disabled", (uint8_t *)&buf, 0xCu);
  }

}

void __45__UAFAssetUtilities__downloadSiriAssetsRetry__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "assetStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "autoRetryEnabled")
      || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "cancelled") & 1) != 0
      || (v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "retryCount"),
          v5 >= objc_msgSend(v3, "autoRetryLimit"))
      || objc_msgSend(v4, "state") == 5
      || objc_msgSend(v4, "state") == 3)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_DWORD *)(a1 + 48);
        v10 = 136315394;
        v11 = "-[UAFAssetUtilities _downloadSiriAssetsRetry]_block_invoke";
        v12 = 1024;
        v13 = v7;
        _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Retry attempt %d skipped", (uint8_t *)&v10, 0x12u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPending:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRetryCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "retryCount") + 1);
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_DWORD *)(a1 + 48);
        v10 = 136315394;
        v11 = "-[UAFAssetUtilities _downloadSiriAssetsRetry]_block_invoke";
        v12 = 1024;
        v13 = v9;
        _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Retry attempt %d", (uint8_t *)&v10, 0x12u);
      }

      objc_msgSend(v3, "downloadSiriAssets");
    }
    if (*(_DWORD *)(a1 + 48) + 1 == *(_DWORD *)(a1 + 52))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPending:", 0);

  }
}

- (void)_downloadSiriAssetsWithDelay:(double)a3
{
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  -[UAFAssetUtilities downloadQueue](self, "downloadQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__UAFAssetUtilities__downloadSiriAssetsWithDelay___block_invoke;
  v7[3] = &unk_24F1F6FD8;
  objc_copyWeak(&v8, &location);
  dispatch_after(v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__UAFAssetUtilities__downloadSiriAssetsWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_downloadSiriAssetsOverCellular:", 0);

}

- (void)_downloadSiriAssetsOverCellular:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD block[6];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  -[UAFAssetUtilities downloadQueue](self, "downloadQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[UAFAssetUtilities getAssistantLanguageIfAvailableSync](self, "getAssistantLanguageIfAvailableSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[UAFAssetUtilities _checkFreeSpaceNeededForLanguage:forClient:](self, "_checkFreeSpaceNeededForLanguage:forClient:", v6, 0);
    if (v7)
    {
      v8 = v7;
      -[UAFAssetUtilities statusQueue](self, "statusQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__UAFAssetUtilities__downloadSiriAssetsOverCellular___block_invoke;
      block[3] = &unk_24F1F7000;
      block[4] = self;
      block[5] = v8;
      dispatch_async(v9, block);

      goto LABEL_21;
    }
    v11 = (void *)nw_path_evaluator_copy_path();
    v12 = -[UAFAssetUtilities _networkIsSatisfiedForPath:](self, "_networkIsSatisfiedForPath:", v11);
    if (v3 || !v12)
    {
      if (v12)
        goto LABEL_10;
    }
    else if (!-[UAFAssetUtilities _networkIsExpensiveForPath:](self, "_networkIsExpensiveForPath:", v11))
    {
LABEL_10:
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[UAFAssetUtilities _downloadSiriAssetsOverCellular:]";
        v22 = 2114;
        v23 = v6;
        v24 = 1024;
        v25 = v3;
        _os_log_impl(&dword_229282000, v13, OS_LOG_TYPE_DEFAULT, "%s #settings Download requested for language (%{public}@) (cellular:%d)", buf, 0x1Cu);
      }

      -[UAFAssetUtilities _createConnection](self, "_createConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v3)
        objc_msgSend(v14, "downloadSiriAssetsOverCellular");
      else
        objc_msgSend(v14, "downloadSiriAssets");

LABEL_20:
      goto LABEL_21;
    }
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[UAFAssetUtilities _downloadSiriAssetsOverCellular:]";
      _os_log_impl(&dword_229282000, v16, OS_LOG_TYPE_DEFAULT, "%s #settings Skip download due to network path", buf, 0xCu);
    }

    -[UAFAssetUtilities statusQueue](self, "statusQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __53__UAFAssetUtilities__downloadSiriAssetsOverCellular___block_invoke_212;
    v18[3] = &unk_24F1F6F88;
    v18[4] = self;
    dispatch_async(v17, v18);

    goto LABEL_20;
  }
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[UAFAssetUtilities _downloadSiriAssetsOverCellular:]";
    _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s #settings Skip download due to nil language", buf, 0xCu);
  }

LABEL_21:
}

uint64_t __53__UAFAssetUtilities__downloadSiriAssetsOverCellular___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setState:", 6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setValue:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "_triggerDelegateAssetStatusUpdated");
}

uint64_t __53__UAFAssetUtilities__downloadSiriAssetsOverCellular___block_invoke_212(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setState:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "_triggerDelegateAssetStatusUpdated");
}

- (id)getDiskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  double v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id *v15;
  uint64_t v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    -[UAFAssetUtilities _createConnection](self, "_createConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __68__UAFAssetUtilities_getDiskSpaceNeededInBytesForLanguage_forClient___block_invoke;
    v18[3] = &unk_24F1F7168;
    v20 = &v28;
    v21 = &v22;
    v9 = v7;
    v19 = v9;
    objc_msgSend(v8, "diskSpaceNeededInBytesForLanguage:forClient:completion:", v6, a4, v18);
    -[UAFAssetUtilities assetAvailableCheckTimeout](self, "assetAvailableCheckTimeout");
    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    if (dispatch_semaphore_wait(v9, v11))
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[UAFAssetUtilities getDiskSpaceNeededInBytesForLanguage:forClient:]";
        _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, "%s #settings Failed to check size due to timeout", buf, 0xCu);
      }

      if (!v23[5])
        goto LABEL_12;
    }
    else if (!v23[5])
    {
      v15 = (id *)(v29 + 5);
      goto LABEL_13;
    }
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = v23[5];
      *(_DWORD *)buf = 136315394;
      v35 = "-[UAFAssetUtilities getDiskSpaceNeededInBytesForLanguage:forClient:]";
      v36 = 2112;
      v37 = v17;
      _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s #settings Failed to check size due to error %@", buf, 0x16u);
    }

LABEL_12:
    v15 = (id *)&kUAFSiriDefaultDiskSpaceNeededSize;
LABEL_13:
    v13 = *v15;

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

    goto LABEL_14;
  }
  v13 = &unk_24F202BF0;
LABEL_14:

  return v13;
}

void __68__UAFAssetUtilities_getDiskSpaceNeededInBytesForLanguage_forClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)_checkFreeSpaceNeededForLanguage:(id)a3 forClient:(unint64_t)a4
{
  void *v4;
  uint64_t v5;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[UAFAssetUtilities getDiskSpaceNeededInBytesForLanguage:forClient:](self, "getDiskSpaceNeededInBytesForLanguage:forClient:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5)
    return +[UAFCommonUtilities getFreeDiskSpaceNeededInBytes:](UAFCommonUtilities, "getFreeDiskSpaceNeededInBytes:", v5);
  UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315138;
    v9 = "-[UAFAssetUtilities _checkFreeSpaceNeededForLanguage:forClient:]";
    _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s #settings Returning enough space for assets even with an unknown size requested", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (BOOL)hasSufficientDiskSpaceForDownload
{
  void *v3;
  BOOL v4;

  -[UAFAssetUtilities getAssistantLanguageIfAvailableSync](self, "getAssistantLanguageIfAvailableSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[UAFAssetUtilities _checkFreeSpaceNeededForLanguage:forClient:](self, "_checkFreeSpaceNeededForLanguage:forClient:", v3, 0) == 0;
  else
    v4 = 1;

  return v4;
}

- (BOOL)hasSufficientDiskSpaceForClient:(unint64_t)a3
{
  void *v5;
  BOOL v6;

  -[UAFAssetUtilities getAssistantLanguageIfAvailableSync](self, "getAssistantLanguageIfAvailableSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[UAFAssetUtilities _checkFreeSpaceNeededForLanguage:forClient:](self, "_checkFreeSpaceNeededForLanguage:forClient:", v5, a3) == 0;
  else
    v6 = 1;

  return v6;
}

- (NSString)siriLanguage
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

  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__UAFAssetUtilities_siriLanguage__block_invoke;
  v7[3] = &unk_24F1F70A0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __33__UAFAssetUtilities_siriLanguage__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (BOOL)assistantEnabled
{
  UAFAssetUtilities *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[UAFAssetUtilities assistantQueue](v2, "assistantQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__UAFAssetUtilities_assistantEnabled__block_invoke;
  v6[3] = &unk_24F1F70A0;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __37__UAFAssetUtilities_assistantEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 25);
  return result;
}

- (UAFRetryState)retryState
{
  NSObject *v3;
  UAFRetryState *retryState;
  UAFRetryState *v5;
  UAFRetryState *v6;

  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  retryState = self->_retryState;
  if (!retryState)
  {
    v5 = objc_alloc_init(UAFRetryState);
    v6 = self->_retryState;
    self->_retryState = v5;

    retryState = self->_retryState;
  }
  return retryState;
}

- (void)setRetryState:(id)a3
{
  UAFRetryState *v4;
  NSObject *v5;
  UAFRetryState *retryState;

  v4 = (UAFRetryState *)a3;
  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  retryState = self->_retryState;
  self->_retryState = v4;

}

- (id)getAssistantLanguageIfAvailableSync
{
  void *v2;

  if (+[UAFCommonUtilities isAssistantEnabled](UAFCommonUtilities, "isAssistantEnabled"))
  {
    +[UAFCommonUtilities currentAssistantLanguage](UAFCommonUtilities, "currentAssistantLanguage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_assistantLanguageUpdate
{
  NSObject *v3;
  _QWORD block[5];

  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__UAFAssetUtilities__assistantLanguageUpdate__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(v3, block);

}

void __45__UAFAssetUtilities__assistantLanguageUpdate__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(*(id *)(a1 + 32), "getAssistantLanguageIfAvailableSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v2) & 1) == 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[UAFAssetUtilities _assistantLanguageUpdate]_block_invoke";
      v14 = 2114;
      v15 = v3;
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Siri language changed to : %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSiriLanguage:", v3);
    v5 = objc_msgSend(*(id *)(a1 + 32), "autoRetryEnabled");
    if (v3 && v5)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[UAFAssetUtilities _assistantLanguageUpdate]_block_invoke";
        v14 = 2114;
        v15 = v3;
        _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Auto retry download on language change, language = %{public}@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "retryState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCancelled:", 1);

      objc_msgSend(*(id *)(a1 + 32), "setRetryState:", 0);
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "autoRetryDelayOnSettingsChanged");
      objc_msgSend(v8, "_downloadSiriAssetsWithDelay:");
    }
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__UAFAssetUtilities__assistantLanguageUpdate__block_invoke_216;
    v10[3] = &unk_24F1F70C8;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v3;
    dispatch_async(v9, v10);

  }
}

void __45__UAFAssetUtilities__assistantLanguageUpdate__block_invoke_216(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 136315394;
      v8 = "-[UAFAssetUtilities _assistantLanguageUpdate]_block_invoke";
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Calling delegate assistantLanguageDidChange : %{public}@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assistantLanguageDidChange:", *(_QWORD *)(a1 + 40));

  }
}

- (void)_assistantPreferencesAndLanguageUpdate
{
  NSObject *v3;
  _QWORD block[5];

  -[UAFAssetUtilities assistantQueue](self, "assistantQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__UAFAssetUtilities__assistantPreferencesAndLanguageUpdate__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(v3, block);

  -[UAFAssetUtilities _assistantLanguageUpdate](self, "_assistantLanguageUpdate");
}

void __59__UAFAssetUtilities__assistantPreferencesAndLanguageUpdate__block_invoke(uint64_t a1)
{
  int v2;
  _BOOL8 v3;
  _BOOL8 v4;
  NSObject *v5;
  const char *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  BOOL v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25);
  v3 = +[UAFCommonUtilities isAssistantEnabled](UAFCommonUtilities, "isAssistantEnabled");
  if (v2 != v3)
  {
    v4 = v3;
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "disabled";
      if (v4)
        v6 = "enabled";
      *(_DWORD *)buf = 136315394;
      v15 = "-[UAFAssetUtilities _assistantPreferencesAndLanguageUpdate]_block_invoke";
      v16 = 2080;
      v17 = v6;
      _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings Assistant preferences changed to : %s", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setAssistantEnabled:", v4);
    v7 = objc_msgSend(*(id *)(a1 + 32), "autoRetryEnabled");
    if (v4 && v7)
    {
      UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[UAFAssetUtilities _assistantPreferencesAndLanguageUpdate]_block_invoke";
        _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Auto retry download on enablement change", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "retryState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCancelled:", 1);

      objc_msgSend(*(id *)(a1 + 32), "setRetryState:", 0);
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v10, "autoRetryDelayOnSettingsChanged");
      objc_msgSend(v10, "_downloadSiriAssetsWithDelay:");
    }
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__UAFAssetUtilities__assistantPreferencesAndLanguageUpdate__block_invoke_221;
    v12[3] = &unk_24F1F7050;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v4;
    dispatch_async(v11, v12);

  }
}

void __59__UAFAssetUtilities__assistantPreferencesAndLanguageUpdate__block_invoke_221(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextAssetUtilities);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = "enabled";
      if (!*(_BYTE *)(a1 + 40))
        v5 = "disabled";
      v7 = 136315394;
      v8 = "-[UAFAssetUtilities _assistantPreferencesAndLanguageUpdate]_block_invoke";
      v9 = 2080;
      v10 = v5;
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Calling delegate assistantEnabledDidChange : %s", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assistantEnabledDidChange:", *(unsigned __int8 *)(a1 + 40));

  }
}

- (UAFAssetUtilitiesDelegate)delegate
{
  return (UAFAssetUtilitiesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)autoRetryEnabled
{
  return self->_autoRetryEnabled;
}

- (void)setAutoRetryEnabled:(BOOL)a3
{
  self->_autoRetryEnabled = a3;
}

- (unsigned)autoRetryLimit
{
  return self->_autoRetryLimit;
}

- (void)setAutoRetryLimit:(unsigned int)a3
{
  self->_autoRetryLimit = a3;
}

- (double)autoRetryDelayOnFailure
{
  return self->_autoRetryDelayOnFailure;
}

- (void)setAutoRetryDelayOnFailure:(double)a3
{
  self->_autoRetryDelayOnFailure = a3;
}

- (double)autoRetryDelayOnFailureIncrement
{
  return self->_autoRetryDelayOnFailureIncrement;
}

- (void)setAutoRetryDelayOnFailureIncrement:(double)a3
{
  self->_autoRetryDelayOnFailureIncrement = a3;
}

- (double)autoRetryDelayOnSettingsChanged
{
  return self->_autoRetryDelayOnSettingsChanged;
}

- (void)setAutoRetryDelayOnSettingsChanged:(double)a3
{
  self->_autoRetryDelayOnSettingsChanged = a3;
}

- (double)assetAvailableCheckTimeout
{
  return self->_assetAvailableCheckTimeout;
}

- (void)setAssetAvailableCheckTimeout:(double)a3
{
  self->_assetAvailableCheckTimeout = a3;
}

- (void)setAssistantEnabled:(BOOL)a3
{
  self->_assistantEnabled = a3;
}

- (void)setSiriLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_siriLanguage, a3);
}

- (void)setAssetStatus:(id)a3
{
  objc_storeStrong((id *)&self->_assetStatus, a3);
}

- (void)setUnderstandingOnDeviceAssetsAvailable:(BOOL)a3
{
  self->_understandingOnDeviceAssetsAvailable = a3;
}

- (void)setAssistantUODStatus:(id)a3
{
  objc_storeStrong((id *)&self->_assistantUODStatus, a3);
}

- (BOOL)networkSatisfied
{
  return self->_networkSatisfied;
}

- (void)setNetworkSatisfied:(BOOL)a3
{
  self->_networkSatisfied = a3;
}

- (BOOL)networkExpensive
{
  return self->_networkExpensive;
}

- (void)setNetworkExpensive:(BOOL)a3
{
  self->_networkExpensive = a3;
}

- (BOOL)showHybridAsUnsupported
{
  return self->_showHybridAsUnsupported;
}

- (void)setShowHybridAsUnsupported:(BOOL)a3
{
  self->_showHybridAsUnsupported = a3;
}

- (OS_dispatch_queue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_downloadQueue, a3);
}

- (OS_dispatch_queue)statusQueue
{
  return self->_statusQueue;
}

- (void)setStatusQueue:(id)a3
{
  objc_storeStrong((id *)&self->_statusQueue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (OS_dispatch_queue)assistantQueue
{
  return self->_assistantQueue;
}

- (void)setAssistantQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assistantQueue, a3);
}

- (OS_dispatch_group)assistantGroup
{
  return self->_assistantGroup;
}

- (void)setAssistantGroup:(id)a3
{
  objc_storeStrong((id *)&self->_assistantGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantGroup, 0);
  objc_storeStrong((id *)&self->_assistantQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_assistantUODStatus, 0);
  objc_storeStrong((id *)&self->_assetStatus, 0);
  objc_storeStrong((id *)&self->_siriLanguage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_retryState, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
}

@end
