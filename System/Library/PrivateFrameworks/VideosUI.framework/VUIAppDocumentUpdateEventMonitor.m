@implementation VUIAppDocumentUpdateEventMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor___once != -1)
    dispatch_once(&sharedMonitor___once, &__block_literal_global_82);
  return (id)sharedMonitor___sharedInstance;
}

void __49__VUIAppDocumentUpdateEventMonitor_sharedMonitor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventMonitor _init]([VUIAppDocumentUpdateEventMonitor alloc], "_init");
  v1 = (void *)sharedMonitor___sharedInstance;
  sharedMonitor___sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t v16[16];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VUIAppDocumentUpdateEventMonitor;
  -[VUIAppDocumentUpdateEventMonitor self](&v17, sel_self);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v3[5];
    v3[5] = v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v3[3];
    v3[3] = v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceMediaLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
      v12 = 0;
    else
      v12 = v11;
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleMediaLibraryContentsDidChangeNotification_, CFSTR("VUIMediaLibraryContentsDidChangeNotification"), v12);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleAccountDidChangeNotification_, *MEMORY[0x1E0DAF710], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handlePreferredVideoFormatDidChangeNotification_, CFSTR("VUIPreferredVideoFormatDidChangeNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__handleFamilyUpdate_, *MEMORY[0x1E0D20E78], 0);
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: Listening to ASDSubscriptionEntitlementsTVDidChangeNotification", v16, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CF9DD0], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleTVSubscriptionEntitlementsChanged_, *MEMORY[0x1E0CF9C80], v14);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleVPPADidChangeNotification_, CFSTR("VUIVPPADidChangeNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleFederatedAppDidInstallNotification_, CFSTR("VUIFederatedAppDidInstallNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:suspensionBehavior:", v3, sel__handlePlaybackReportNotification_, *MEMORY[0x1E0DC8900], 0, 2);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleFavoritesRequestDidFinishNotification_, CFSTR("VUIFavoritesRequestDidFinishNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleUpNextRequestDidFinishNotification_, CFSTR("VUIUpNextRequestDidFinishNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleRemoveFromPlayHistoryRequestDidFinishNotification_, CFSTR("VUIRemoveFromPlayHistoryRequestDidFinishNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleClearFromPlayHistoryRequestDidFinishNotification_, CFSTR("VUIClearFromPlayHistoryRequestDidFinishNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handlePlayHistoryUpdatedNotification_, CFSTR("VUIPlayHistoryUpdatedNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleSettingsDidChangeNotification_, *MEMORY[0x1E0DC89D8], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleAppLibraryDidChangeNotification_, *MEMORY[0x1E0DC88B8], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handlePurchaseFlowDidFinishNotification_, CFSTR("VUIPurchaseRequestDidFinishNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleSubscriptionDidChangeNotification_, CFSTR("VUISubscribeRequestDidFinishNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleUTSKDidChangeNotification_, *MEMORY[0x1E0DC88F0], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleLocationAuthorizationDidChangeNotification_, *MEMORY[0x1E0DC8948], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleLocationDidChangeNotification_, *MEMORY[0x1E0DC8950], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleAppWillEnterForegroundNotification_, *MEMORY[0x1E0DC6AC0], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleAppDidEnterBackgroundNotification_, *MEMORY[0x1E0DC6AB8], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleSyndicationInfoUpdatedNotification_, CFSTR("SyndicationInfoUpdated"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleRestrictionsDidChangeNotification_, CFSTR("VUIRestrictionsDidChangeNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleUpNextLockupArtSettingDidChange_, CFSTR("VUIUpNextLockupArtSettingDidChangeNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleClearPlayHistoryNotification_, CFSTR("VUIClearPlayHistoryNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__isPlaybackUIBeingShownDidChange_, VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleDeviceDiscoveryDataAvailableNotification_, CFSTR("VUIDeviceDiscoveryDataNowAvailableNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__handleFavoritesSyncCompleted_, CFSTR("VUISportsFavoritesLocalStorageDidChangeNotification"), 0);

  }
  return v3;
}

- (void)addObserver:(id)a3 forEventDescriptors:(id)a4 viewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void **v12;
  _QWORD v13[2];
  void (*v14)(void **);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  objc_initWeak(&v20, v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v14 = __83__VUIAppDocumentUpdateEventMonitor_addObserver_forEventDescriptors_viewController___block_invoke;
  v15 = &unk_1E9F9F160;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &v20);
  v11 = v9;
  v16 = v11;
  v12 = v13;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v14(v12);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (NSMapTable)observerMapTable
{
  return self->_observerMapTable;
}

- (VUIAppDocumentUpdateEventMonitor)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int playbackReportToken;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  playbackReportToken = self->_playbackReportToken;
  if (playbackReportToken)
  {
    notify_cancel(playbackReportToken);
    self->_playbackReportToken = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VUIAppDocumentUpdateEventMonitor;
  -[VUIAppDocumentUpdateEventMonitor dealloc](&v6, sel_dealloc);
}

- (void)addObserver:(id)a3 forEventDescriptors:(id)a4
{
  -[VUIAppDocumentUpdateEventMonitor addObserver:forEventDescriptors:viewController:](self, "addObserver:forEventDescriptors:viewController:", a3, a4, 0);
}

- (void)updateDescriptorsForObserver:(id)a3 eventDescriptors:(id)a4
{
  id v6;
  id v7;
  id v8;
  void **v9;
  _QWORD v10[2];
  void (*v11)(void **);
  void *v12;
  id v13;
  id v14;
  id v15;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __82__VUIAppDocumentUpdateEventMonitor_updateDescriptorsForObserver_eventDescriptors___block_invoke;
  v12 = &unk_1E9F9C168;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  v8 = v7;
  v13 = v8;
  v9 = v10;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v11(v9);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __82__VUIAppDocumentUpdateEventMonitor_updateDescriptorsForObserver_eventDescriptors___block_invoke(void **a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(WeakRetained, "observerMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = v3;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: updating descriptors for observer [%p].", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v5, "updateDescriptorsWithDescriptors:", a1[4]);
    }
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      VUIAppDocumentUpdateEventStringRepresentationForDescriptors(a1[4]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218242;
      v13 = v3;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Updated observer [%p] with event descriptors [%@]", (uint8_t *)&v12, 0x16u);

    }
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "refreshTimerByEventDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Active timers for event descriptors after update [%@]", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v3;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: No operation for observer during update [%p] since there were no event descriptors", (uint8_t *)&v12, 0xCu);
    }
  }

}

void __83__VUIAppDocumentUpdateEventMonitor_addObserver_forEventDescriptors_viewController___block_invoke(void **a1)
{
  id WeakRetained;
  id v3;
  id v4;
  void *v5;
  _VUIAppDocumentUpdateEventObserverContext *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id from;
  _BYTE location[12];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  v4 = objc_loadWeakRetained(a1 + 7);
  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(WeakRetained, "observerMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (_VUIAppDocumentUpdateEventObserverContext *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = objc_alloc_init(_VUIAppDocumentUpdateEventObserverContext);
      objc_msgSend(v5, "setObject:forKey:", v6, v4);
      objc_initWeak((id *)location, WeakRetained);
      objc_initWeak(&from, v4);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __83__VUIAppDocumentUpdateEventMonitor_addObserver_forEventDescriptors_viewController___block_invoke_130;
      v13[3] = &unk_1E9F9F138;
      objc_copyWeak(&v14, (id *)location);
      objc_copyWeak(&v15, &from);
      -[_VUIAppDocumentUpdateEventObserverContext setRefreshTimerFiredBlock:](v6, "setRefreshTimerFiredBlock:", v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    -[_VUIAppDocumentUpdateEventObserverContext setEventDescriptors:](v6, "setEventDescriptors:", a1[4]);
    -[_VUIAppDocumentUpdateEventObserverContext setViewController:](v6, "setViewController:", v3);
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      VUIAppDocumentUpdateEventStringRepresentationForDescriptors(a1[4]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 134218242;
      *(_QWORD *)&location[4] = v4;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Added observer [%p] for event descriptors [%@]", location, 0x16u);

    }
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[_VUIAppDocumentUpdateEventObserverContext refreshTimerByEventDescriptor](v6, "refreshTimerByEventDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v11;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Active timers for event descriptors [%@]", location, 0xCu);

    }
  }
  else
  {
    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 134217984;
      *(_QWORD *)&location[4] = v4;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Removed observer [%p] since there were no event descriptors", location, 0xCu);
    }

    objc_msgSend(WeakRetained, "removeObserver:", v4);
  }

}

void __83__VUIAppDocumentUpdateEventMonitor_addObserver_forEventDescriptors_viewController___block_invoke_130(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
    objc_msgSend(WeakRetained, "_notifyObserver:ofRefreshEvent:", v4, v6);

}

- (void)removeObserver:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __51__VUIAppDocumentUpdateEventMonitor_removeObserver___block_invoke;
  v9 = &unk_1E9F9A8E8;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  v5 = &v6;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v6, v7))
    v8((uint64_t)v5);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __51__VUIAppDocumentUpdateEventMonitor_removeObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Removing observer [%p]", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(WeakRetained, "observerMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");
  objc_msgSend(v5, "removeObjectForKey:", v3);

}

- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Media Library contents did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent purchases](VUIAppDocumentUpdateEvent, "purchases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  void *v4;
  int v5;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaybackUIBeingShown");

  if (v5)
    -[VUIAppDocumentUpdateEventMonitor _handleNowPlayingWillStartNotification:](self, "_handleNowPlayingWillStartNotification:", 0);
  else
    -[VUIAppDocumentUpdateEventMonitor _handleNowPlayingDidEndNotification:](self, "_handleNowPlayingDidEndNotification:", 0);
}

- (void)_handlePlaybackReportNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 playbackIsActive;
  NSObject *v12;
  _BOOL4 v13;
  WLKPlaybackSummary *v14;
  NSObject *pendingPlayActivity;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIRequireMainThread();
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] WLK activity notification received", buf, 2u);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vui_stringForKey:", *MEMORY[0x1E0DC8908]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
  if (v8)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    if (v9)
    {
      playbackIsActive = self->_playbackIsActive;
      VUIDefaultLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (playbackIsActive)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Playback activity is pended during playback.", buf, 2u);
        }

        v14 = v9;
        pendingPlayActivity = self->_pendingPlayActivity;
        self->_pendingPlayActivity = v14;
      }
      else
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Notifying observers", buf, 2u);
        }

        +[VUIAppDocumentUpdateEvent playActivity](VUIAppDocumentUpdateEvent, "playActivity");
        pendingPlayActivity = objc_claimAutoreleasedReturnValue();
        -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", pendingPlayActivity);
      }
    }
    else
    {
      VUIDefaultLogObject();
      pendingPlayActivity = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(pendingPlayActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_impl(&dword_1D96EE000, pendingPlayActivity, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Failed to decode summary %@", buf, 0xCu);
      }
    }

  }
  else
  {
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] WLK notification lacks data payload", buf, 2u);
    }
  }

}

- (void)_handleNowPlayingWillStartNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  VUIRequireMainThread();
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Player begin notification received", v5, 2u);
  }

  self->_playbackIsActive = 1;
}

- (void)_handleNowPlayingDidEndNotification:(id)a3
{
  NSObject *v4;
  WLKPlaybackSummary *pendingPlayActivity;
  NSObject *v6;
  void *v7;
  WLKPlaybackSummary *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  VUIRequireMainThread();
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Player end notification received", buf, 2u);
  }

  self->_playbackIsActive = 0;
  pendingPlayActivity = self->_pendingPlayActivity;
  if (pendingPlayActivity)
  {
    if (-[WLKPlaybackSummary playbackState](pendingPlayActivity, "playbackState") != 1)
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: [Playback] Notifying observers with pending play activity", v9, 2u);
      }

      +[VUIAppDocumentUpdateEvent playActivity](VUIAppDocumentUpdateEvent, "playActivity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v7);

    }
    v8 = self->_pendingPlayActivity;
    self->_pendingPlayActivity = 0;

  }
}

- (void)_handleAccountDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Active account did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent accountChanged](VUIAppDocumentUpdateEvent, "accountChanged");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleRestrictionsDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Restrictions did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent restrictions](VUIAppDocumentUpdateEvent, "restrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleUpNextLockupArtSettingDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Up next lockup art setting did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent upNextLockupArtSettingChanged](VUIAppDocumentUpdateEvent, "upNextLockupArtSettingChanged");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handlePreferredVideoFormatDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Preferred video format did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent preferredVideoFormat](VUIAppDocumentUpdateEvent, "preferredVideoFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleClearPlayHistoryNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Clear play history notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent clearPlayHistory](VUIAppDocumentUpdateEvent, "clearPlayHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_postSubscriptionNotification:(id)a3 interruptedOfferDetails:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v9)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("Error"));
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("TransactionID"));
    objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __96__VUIAppDocumentUpdateEventMonitor__postSubscriptionNotification_interruptedOfferDetails_error___block_invoke;
    v13[3] = &unk_1E9F9F188;
    v14 = v8;
    v15 = v11;
    objc_msgSend(v12, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 3, 0, v13);

  }
}

void __96__VUIAppDocumentUpdateEventMonitor__postSubscriptionNotification_interruptedOfferDetails_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint8_t v5[16];
  _QWORD block[4];
  NSObject *v7;
  id v8;

  if (a3)
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: Failed to fetch init/config. Not presenting successful subscription toast", v5, 2u);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__VUIAppDocumentUpdateEventMonitor__postSubscriptionNotification_interruptedOfferDetails_error___block_invoke_2;
    block[3] = &unk_1E9F98FD8;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v3 = v7;
  }

}

void __96__VUIAppDocumentUpdateEventMonitor__postSubscriptionNotification_interruptedOfferDetails_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("notificationTitle"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (__CFString *)v2;
  else
    v4 = &stru_1E9FF3598;
  v10 = v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("notificationBody"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1E9FF3598;
  v8 = v7;

  +[VUIActionCommerceTransaction displayConfirmationUIWithTitle:andBody:](VUIActionCommerceTransaction, "displayConfirmationUIWithTitle:andBody:", v10, v8);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("VUISubscribeRequestDidFinishNotification"), 0, *(_QWORD *)(a1 + 40));

}

- (void)_handleFamilyUpdate:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: _handleFamilyUpdate: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 3, 0, &__block_literal_global_142);

}

void __56__VUIAppDocumentUpdateEventMonitor__handleFamilyUpdate___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VUIDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D96EE000, v0, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: _handleFamilyUpdate completion", v1, 2u);
  }

}

- (void)_handleTVSubscriptionEntitlementsChanged:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: _handleTVSubscriptionEntitlementsChanged", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 3, 0, &__block_literal_global_143);

}

void __77__VUIAppDocumentUpdateEventMonitor__handleTVSubscriptionEntitlementsChanged___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      v7 = "UPDATE_EVENTS: _handleTVSubscriptionEntitlementsChanged - Successfully refreshed config";
      v8 = v5;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    v10 = 138412290;
    v11 = v4;
    v7 = "UPDATE_EVENTS: _handleTVSubscriptionEntitlementsChanged - Error refreshing config, %@";
    v8 = v5;
    v9 = 12;
    goto LABEL_6;
  }

}

- (void)_handleVPPADidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: VPPA state did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent entitlements](VUIAppDocumentUpdateEvent, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleAppWillEnterForegroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: App will enter foreground notification received", v6, 2u);
  }

  -[VUIAppDocumentUpdateEventMonitor _handleAppDidBecomeActive:](self, "_handleAppDidBecomeActive:", v4);
}

- (void)_handleAppDidBecomeActive:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", 0);

  -[VUIAppDocumentUpdateEventMonitor lastAppDidBecomeActive](self, "lastAppDidBecomeActive");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppDocumentUpdateEventMonitor lastAppDidBecomeActive](self, "lastAppDidBecomeActive");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    if (v10 > 5.0)
    {
      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Send AppDidBecomeActive notification", v14, 2u);
      }

      +[VUIAppDocumentUpdateEvent appDidBecomeActive](VUIAppDocumentUpdateEvent, "appDidBecomeActive");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v12);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor setLastAppDidBecomeActive:](self, "setLastAppDidBecomeActive:", v13);

}

- (void)_handleAppDidEnterBackgroundNotification:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: App did enter background", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", 1);

}

- (void)_handleSyndicationInfoUpdatedNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Highlights changed notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent highlightsChanged](VUIAppDocumentUpdateEvent, "highlightsChanged");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleDeviceDiscoveryDataAvailableNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Device discovery data available notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent deviceDiscoveryDataAvailable](VUIAppDocumentUpdateEvent, "deviceDiscoveryDataAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleFavoritesRequestDidFinishNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  VUIAppDocumentModifiedFavoritesEvent *v14;
  int v15;
  void *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(v6, "vui_numberForKey:", CFSTR("Action"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(v6, "vui_errorForKey:", CFSTR("Error"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", CFSTR("FireBackgroundEvent"), 0);
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Sports favorites request did finish notification received [%@], teamId: %@", (uint8_t *)&v15, 0x16u);
    }

    if (v8 || !v11)
    {
      v14 = -[VUIAppDocumentModifiedFavoritesEvent initWithAction:entityID:isBackground:]([VUIAppDocumentModifiedFavoritesEvent alloc], "initWithAction:entityID:isBackground:", v10, v8, v12);
      -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v14);

    }
  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Ignoring Sports favorites request did finish notification: missing userInfo", (uint8_t *)&v15, 2u);
    }
  }

}

- (void)_handleFavoritesSyncCompleted:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: WLKSportsFavoritesSyncCompletion notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent favoritesSyncCompleted](VUIAppDocumentUpdateEvent, "favoritesSyncCompleted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleSettingsDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Settings did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent settings](VUIAppDocumentUpdateEvent, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleAppLibraryDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  void *v12;
  uint8_t v13[16];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(v5, "vui_dictionaryForKey:", *MEMORY[0x1E0DC88C8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vui_dictionaryForKey:", *MEMORY[0x1E0DC88C0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vui_dictionaryForKey:", *MEMORY[0x1E0DC88D0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      VUIDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: App library did change notification received", v13, 2u);
      }

      if (v7)
        v10 = 0;
      else
        v10 = v8 == 0;
      if (!v10 || v6 != 0)
      {
        +[VUIAppDocumentUpdateEvent entitlements](VUIAppDocumentUpdateEvent, "entitlements");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v12);

      }
    }
  }

}

- (void)_handlePurchaseFlowDidFinishNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  VUIAppDocumentPurchaseEventDescriptor *v17;
  VUIAppDocumentPurchaseEvent *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CanonicalIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Error"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  VUIDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v7;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Purchase did finish notification received for canonicals %@, error [%@]", buf, 0x16u);
  }

  if (!v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count"))
    {
      v20 = 0;
      v21 = v7;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            v17 = -[VUIAppDocumentPurchaseEventDescriptor initWithCanonicalID:]([VUIAppDocumentPurchaseEventDescriptor alloc], "initWithCanonicalID:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
            v18 = -[VUIAppDocumentPurchaseEvent initWithPurchaseEventDescriptor:]([VUIAppDocumentPurchaseEvent alloc], "initWithPurchaseEventDescriptor:", v17);
            -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v18);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v14);
      }

      v10 = 0;
    }
    +[VUIAppDocumentUpdateEvent purchases](VUIAppDocumentUpdateEvent, "purchases", v20, v21, (_QWORD)v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v19);

  }
}

- (void)_handleSubscriptionDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Subscription did finish notification received with error [%@]", (uint8_t *)&v10, 0xCu);
  }

  if (!v7)
  {
    +[VUIAppDocumentUpdateEvent entitlements](VUIAppDocumentUpdateEvent, "entitlements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v9);

  }
}

- (void)_handleEntitlementsDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Entitlements did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent entitlements](VUIAppDocumentUpdateEvent, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleUTSKDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: UTSK did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent utsk](VUIAppDocumentUpdateEvent, "utsk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleLocationAuthorizationDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Location authorization did change notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent locationAuthorizationChanged](VUIAppDocumentUpdateEvent, "locationAuthorizationChanged");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleLocationDidChangeNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Location did change notification received", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC87C8], "defaultLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastKnownLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[VUIAppDocumentUpdateEvent locationRetrieved](VUIAppDocumentUpdateEvent, "locationRetrieved");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v7);

  }
}

- (void)_handleXPUpNextRequestDidFinishNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Upnext *Cross Process* did finish notification received %@", (uint8_t *)&v7, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0CB35B0], "vui_wasSentByDifferentProcess:", v5))
    -[VUIAppDocumentUpdateEventMonitor _handleUpNextRequestDidFinishNotification:](self, "_handleUpNextRequestDidFinishNotification:", v4);

}

- (void)_handleUpNextRequestDidFinishNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  VUIAppDocumentModifiedUpNextEvent *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Upnext request did finish notification received [%@]", (uint8_t *)&v12, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    v8 = v5;
    objc_msgSend(v6, "vui_errorForKey:", CFSTR("Error"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v6, "vui_numberForKey:", CFSTR("Action"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[VUIAppDocumentModifiedUpNextEvent initWithAction:canonicalID:]([VUIAppDocumentModifiedUpNextEvent alloc], "initWithAction:canonicalID:", objc_msgSend(v10, "unsignedIntegerValue"), v8);
      -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v11);

    }
  }

}

- (void)_handlePlayHistoryUpdatedNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Play history update notification received", v6, 2u);
  }

  +[VUIAppDocumentUpdateEvent playHistoryUpdated](VUIAppDocumentUpdateEvent, "playHistoryUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v5);

}

- (void)_handleRemoveFromPlayHistoryRequestDidFinishNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  VUIAppDocumentRemovePlayHistoryEvent *v9;
  void *v10;
  VUIAppDocumentRemovePlayHistoryEvent *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Remove from play history request did finish notification received [%@]", buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    objc_msgSend(v6, "vui_stringForKey:", CFSTR("CanonicalID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [VUIAppDocumentRemovePlayHistoryEvent alloc];
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v8, 0);
    v11 = -[VUIAppDocumentRemovePlayHistoryEvent initWithRemovedCanonicalIDs:](v9, "initWithRemovedCanonicalIDs:", v10);

    -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v11);
  }

}

- (void)_handleClearFromPlayHistoryRequestDidFinishNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  VUIAppDocumentModifiedUpNextEvent *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Clear from play history request did finish notification received [%@]", (uint8_t *)&v11, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    v8 = v5;
    objc_msgSend(v6, "vui_errorForKey:", CFSTR("Error"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = -[VUIAppDocumentModifiedUpNextEvent initWithAction:canonicalID:]([VUIAppDocumentModifiedUpNextEvent alloc], "initWithAction:canonicalID:", 1, v8);
      -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v10);

    }
  }

}

- (void)_handleFederatedAppDidInstallNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Federated app installation successful for %@ changed [%@]", (uint8_t *)&v9, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIAppDocumentUpdateEvent federatedAppDidInstall](VUIAppDocumentUpdateEvent, "federatedAppDidInstall");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppDocumentUpdateEventMonitor _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", v8);

  }
}

- (void)_notifyObserver:(id)a3 ofRefreshEvent:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Notifying observer [%p] of refresh event: [%@]", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v5, "appDocumentDidReceiveEvent:", v6);
}

- (void)_notifyObserversOfEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  VUIAppDocumentUpdateEventMonitor *v10;
  id v11;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = __60__VUIAppDocumentUpdateEventMonitor__notifyObserversOfEvent___block_invoke;
  v9 = &unk_1E9F98FD8;
  v10 = self;
  v11 = v4;
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472))
    v8((uint64_t)&v7);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v7);

}

void __60__VUIAppDocumentUpdateEventMonitor__notifyObserversOfEvent___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  __int128 v31;
  id obj;
  void *v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t (**v37)(void *, void *, void *);
  void *v38;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD aBlock[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observerMapTable");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "keyEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend((id)objc_opt_class(), "_isAppRefreshEventType:", *(_QWORD *)(a1 + 40));
  +[VUIAppDocumentUpdateEvent appRefresh](VUIAppDocumentUpdateEvent, "appRefresh");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAppDocumentUpdateEventDescriptor appDidBecomeActive](VUIAppDocumentUpdateEventDescriptor, "appDidBecomeActive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v3, "isEqual:", v4);

  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__VUIAppDocumentUpdateEventMonitor__notifyObserversOfEvent___block_invoke_2;
  aBlock[3] = &unk_1E9F9F210;
  aBlock[4] = &v46;
  v37 = (uint64_t (**)(void *, void *, void *))_Block_copy(aBlock);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v5)
  {
    v34 = *(_QWORD *)v42;
    *(_QWORD *)&v6 = 134218242;
    v31 = v6;
    do
    {
      v39 = v5;
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v38, "objectForKey:", v8, v31);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v37[2](v37, v8, v9);
        v11 = v10;
        if (v36)
        {
          if (!*((_BYTE *)v47 + 24))
          {
            VUIDefaultLogObject();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v16 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = v31;
              v51 = v8;
              v52 = 2112;
              v53 = v16;
              v14 = v12;
              v15 = "UPDATE_EVENTS: MONITOR: observer document became active by coming to foreground. Observer: [%p] for event: [%@]";
LABEL_13:
              _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
            }
LABEL_14:

            objc_msgSend(v8, "appDocumentHasBecomeActive");
            goto LABEL_15;
          }
          if (v10)
          {
            VUIDefaultLogObject();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v13 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = v31;
              v51 = v8;
              v52 = 2112;
              v53 = v13;
              v14 = v12;
              v15 = "UPDATE_EVENTS: MONITOR: view controller backed observer document became active by coming to foregrou"
                    "nd. Observer: [%p] for event: [%@]";
              goto LABEL_13;
            }
            goto LABEL_14;
          }
        }
LABEL_15:
        objc_msgSend(v9, "eventDescriptors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "descriptor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35
          && (objc_msgSend(v9, "eventDescriptors"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v33, "descriptor"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v21 = objc_msgSend(v19, "containsObject:", v20),
              v20,
              v19,
              v21))
        {
          v22 = v33;
        }
        else
        {
          if (!objc_msgSend(v17, "containsObject:", v18))
          {
            v22 = 0;
            goto LABEL_29;
          }
          objc_msgSend(v17, "member:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setAnimated:", objc_msgSend(v23, "animated"));
          v22 = *(id *)(a1 + 40);

        }
        if (v22)
        {
          objc_msgSend(*(id *)(a1 + 40), "descriptor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIAppDocumentUpdateEventDescriptor utsk](VUIAppDocumentUpdateEventDescriptor, "utsk");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqual:", v25);

          if ((v26 & v11) != 0)
          {
            VUIDefaultLogObject();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = v31;
              v51 = v8;
              v52 = 2112;
              v53 = v28;
              _os_log_impl(&dword_1D96EE000, v27, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Ignoring observer [%p] for event: [%@]", buf, 0x16u);
            }

          }
          else
          {
            VUIDefaultLogObject();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = v31;
              v51 = v8;
              v52 = 2112;
              v53 = v30;
              _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "UPDATE_EVENTS: MONITOR: Notifying observer [%p] of event: [%@]", buf, 0x16u);
            }

            objc_msgSend(v8, "appDocumentDidReceiveEvent:", v22);
          }
        }
LABEL_29:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v46, 8);
}

uint64_t __60__VUIAppDocumentUpdateEventMonitor__notifyObserversOfEvent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    if (!v7)
      goto LABEL_15;
  }
  else
  {
    if (!v6)
    {
      v7 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v6, "viewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7 != 0;
    if (!v7)
    {
LABEL_15:
      v10 = 0;
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v8 == v7;
  else
    v9 = 0;
  v10 = v9;

LABEL_16:
  return v10;
}

+ (BOOL)_isAppRefreshEventType:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAppDocumentUpdateEventDescriptor utsk](VUIAppDocumentUpdateEventDescriptor, "utsk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[VUIAppDocumentUpdateEventDescriptor restrictions](VUIAppDocumentUpdateEventDescriptor, "restrictions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v6) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      +[VUIAppDocumentUpdateEventDescriptor accountChanged](VUIAppDocumentUpdateEventDescriptor, "accountChanged");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqual:", v7) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        +[VUIAppDocumentUpdateEventDescriptor entitlements](VUIAppDocumentUpdateEventDescriptor, "entitlements");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v3, "isEqual:", v8);

      }
    }

  }
  return v5;
}

- (void)setObserverMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_observerMapTable, a3);
}

- (int)playbackReportToken
{
  return self->_playbackReportToken;
}

- (void)setPlaybackReportToken:(int)a3
{
  self->_playbackReportToken = a3;
}

- (NSDate)lastProcesssedPlayActivity
{
  return self->_lastProcesssedPlayActivity;
}

- (void)setLastProcesssedPlayActivity:(id)a3
{
  objc_storeStrong((id *)&self->_lastProcesssedPlayActivity, a3);
}

- (NSDate)lastAppDidBecomeActive
{
  return self->_lastAppDidBecomeActive;
}

- (void)setLastAppDidBecomeActive:(id)a3
{
  objc_storeStrong((id *)&self->_lastAppDidBecomeActive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppDidBecomeActive, 0);
  objc_storeStrong((id *)&self->_lastProcesssedPlayActivity, 0);
  objc_storeStrong((id *)&self->_observerMapTable, 0);
  objc_storeStrong((id *)&self->_pendingPlayActivity, 0);
}

@end
