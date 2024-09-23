@implementation ICCloudAvailabilityController

uint64_t __50__ICCloudAvailabilityController_canShowCloudVideo__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 29);
  return result;
}

uint64_t __50__ICCloudAvailabilityController_canShowCloudMusic__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 28);
  return result;
}

uint64_t __75__ICCloudAvailabilityController_hasProperNetworkConditionsToShowCloudMedia__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __60__ICCloudAvailabilityController_canShowCloudDownloadButtons__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 30);
  return result;
}

- (BOOL)canShowCloudVideo
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__ICCloudAvailabilityController_canShowCloudVideo__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canShowCloudMusic
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__ICCloudAvailabilityController_canShowCloudMusic__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__ICCloudAvailabilityController_hasProperNetworkConditionsToShowCloudMedia__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __85__ICCloudAvailabilityController_shouldProhibitMusicActionForCurrentNetworkConditions__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 27))
    v2 = (unint64_t)(*(_QWORD *)(v1 + 40) - 1) <= 0x1F2 && *(_BYTE *)(v1 + 20) != 0;
  else
    v2 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

+ (id)sharedController
{
  if (sharedController___once != -1)
    dispatch_once(&sharedController___once, &__block_literal_global_26332);
  return (id)sharedController___sharedController;
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__ICCloudAvailabilityController_shouldProhibitMusicActionForCurrentNetworkConditions__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canShowCloudDownloadButtons
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__ICCloudAvailabilityController_canShowCloudDownloadButtons__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __49__ICCloudAvailabilityController_sharedController__block_invoke()
{
  ICCloudAvailabilityController *v0;
  void *v1;

  v0 = objc_alloc_init(ICCloudAvailabilityController);
  v1 = (void *)sharedController___sharedController;
  sharedController___sharedController = (uint64_t)v0;

}

- (void)_applicationWillEnterForeground:(id)a3
{
  BOOL isCellularDataRestrictedForMusic;
  _BOOL4 isCellularDataActive;
  NSObject *v6;
  CoreTelephonyClient *telephonyClient;
  CoreTelephonyClient *v8;
  void *v9;
  CoreTelephonyClient *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *accessQueue;
  _QWORD block[5];
  BOOL v16;
  BOOL v17;
  id v18;
  uint8_t buf[4];
  ICCloudAvailabilityController *v20;
  __int16 v21;
  CoreTelephonyClient *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  isCellularDataRestrictedForMusic = self->_isCellularDataRestrictedForMusic;
  isCellularDataActive = self->_isCellularDataActive;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    telephonyClient = self->_telephonyClient;
    *(_DWORD *)buf = 134218240;
    v20 = self;
    v21 = 2048;
    v22 = telephonyClient;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> getting CTDataConnectionStatus from _telephonyClient <CoreTelephonyClient %p>", buf, 0x16u);
  }

  v8 = self->_telephonyClient;
  v18 = 0;
  -[CoreTelephonyClient getInternetConnectionStateSync:](v8, "getInternetConnectionStateSync:", &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CoreTelephonyClient *)v18;
  if (v10)
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v20 = self;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "<ICCloudAvailabilityController %p> _applicationWillEnterForeground [CoreTelephonyClient getInternetConnectionStateSync] encountered error=%{public}@", buf, 0x16u);
    }

    v12 = isCellularDataActive;
  }
  else
  {
    v12 = objc_msgSend(v9, "state") == 2;
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218243;
      v20 = self;
      v21 = 2113;
      v22 = (CoreTelephonyClient *)v9;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> received _telephonyClient CTDataConnectionStatus.state=%{private}@", buf, 0x16u);
    }

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ICCloudAvailabilityController__applicationWillEnterForeground___block_invoke;
  block[3] = &unk_1E438E628;
  block[4] = self;
  v16 = isCellularDataRestrictedForMusic;
  v17 = v12;
  dispatch_async(accessQueue, block);

}

void __65__ICCloudAvailabilityController__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_registerPerAppNetworkDataAccessPolicyChangedNotification");
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateIsCellularDataRestrictedForMusic");
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(v3 + 19);
    v5 = *(unsigned __int8 *)(a1 + 40);
    v6 = *(unsigned __int8 *)(a1 + 41);
    v7 = *(unsigned __int8 *)(v3 + 20);
    v10 = 134219008;
    v11 = v3;
    v12 = 1024;
    v13 = v4;
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = v6;
    v18 = 1024;
    v19 = v7;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> _isCellularDataActive=%{BOOL}u, cellularDataRestrictedForMusic=%{BOOL}u, newIsCellularDataActive=%{BOOL}u, newCellularDataRestrictedForMusic=%{BOOL}u", (uint8_t *)&v10, 0x24u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(unsigned __int8 *)(a1 + 41);
  if (*(unsigned __int8 *)(v8 + 19) != v9 || *(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(v8 + 20))
  {
    *(_BYTE *)(v8 + 19) = v9;
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICCloudAvailabilityController *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __80__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  result = objc_msgSend(*(id *)(a1 + 32), "isRemoteServerLikelyReachable");
  v3 = *(_QWORD *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 27) != (_DWORD)result)
  {
    *(_BYTE *)(v3 + 27) = result;
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke_2;
    block[3] = &unk_1E43913D8;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v4, block);

    objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    return objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

- (void)_onQueue_updateIsCellularDataRestrictedForMusic
{
  NSObject *v3;
  _BOOL4 isCellularDataRestrictedForMusic;
  _BYTE theDict[12];
  __int16 v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection)
  {
    *(_QWORD *)theDict = 0;
    _CTServerConnectionCopyCellularUsagePolicy();
  }
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    isCellularDataRestrictedForMusic = self->_isCellularDataRestrictedForMusic;
    *(_DWORD *)theDict = 134218240;
    *(_QWORD *)&theDict[4] = self;
    v6 = 1024;
    v7 = isCellularDataRestrictedForMusic;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> Music restrict cellular data: %d", theDict, 0x12u);
  }

}

- (BOOL)_uncachedIsAutoDownloadOnCellularAllowed
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AllowAutoDownloadOnCellular"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

- (void)_onQueue_updateCanShowCloudDownloadButtonsWithNotification:(BOOL)a3
{
  _BOOL4 isNetworkReachable;
  NSObject *v5;
  _QWORD block[5];

  isNetworkReachable = self->_isNetworkReachable;
  if (self->_canShowCloudDownloadButtons != isNetworkReachable)
  {
    self->_canShowCloudDownloadButtons = isNetworkReachable;
    if (a3)
    {
      dispatch_get_global_queue(0, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__ICCloudAvailabilityController__onQueue_updateCanShowCloudDownloadButtonsWithNotification___block_invoke;
      block[3] = &unk_1E43913D8;
      block[4] = self;
      dispatch_async(v5, block);

    }
  }
}

- (void)_onQueue_updateCanShowCloudTracksWithNotification:(BOOL)a3
{
  _BOOL4 isNetworkReachable;
  _BOOL4 isShowingAllMusic;
  _BOOL4 isShowingAllVideo;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD v9[5];
  _QWORD block[5];

  isNetworkReachable = self->_isNetworkReachable;
  if (self->_isNetworkReachable)
  {
    isShowingAllMusic = self->_isShowingAllMusic;
    isShowingAllVideo = self->_isShowingAllVideo;
  }
  else
  {
    isShowingAllMusic = 0;
    isShowingAllVideo = 0;
  }
  if (self->_canShowCloudMusic == isShowingAllMusic && self->_canShowCloudVideo == isShowingAllVideo)
  {
    if (self->_hasProperNetworkConditionsToShowCloudMedia != isNetworkReachable)
    {
      self->_hasProperNetworkConditionsToShowCloudMedia = isNetworkReachable;
      if (a3)
      {
        dispatch_get_global_queue(0, 0);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __83__ICCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke_2;
        v9[3] = &unk_1E43913D8;
        v9[4] = self;
        dispatch_async(v7, v9);

      }
    }
  }
  else
  {
    self->_canShowCloudMusic = isShowingAllMusic;
    self->_canShowCloudVideo = isShowingAllVideo;
    if (a3)
    {
      dispatch_get_global_queue(0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__ICCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke;
      block[3] = &unk_1E43913D8;
      block[4] = self;
      dispatch_async(v7, block);

      v8 = self->_isNetworkReachable;
      if (self->_hasProperNetworkConditionsToShowCloudMedia == v8)
        return;
      self->_hasProperNetworkConditionsToShowCloudMedia = v8;
      goto LABEL_12;
    }
    if (self->_hasProperNetworkConditionsToShowCloudMedia != isNetworkReachable)
      self->_hasProperNetworkConditionsToShowCloudMedia = isNetworkReachable;
  }
}

- (ICCloudAvailabilityController)init
{
  ICCloudAvailabilityController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  void *v5;
  int v6;
  uint64_t v7;
  CoreTelephonyClient *telephonyClient;
  CoreTelephonyClient *v9;
  void *v10;
  id v11;
  NSObject *v12;
  ICCloudAvailabilityController *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[4];
  ICCloudAvailabilityController *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, const __CFString *);
  void *v25;
  _BYTE *v26;
  _QWORD handler[5];
  id v28;
  objc_super v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  ICCloudAvailabilityController *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)ICCloudAvailabilityController;
  v2 = -[ICCloudAvailabilityController init](&v29, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICCloudAvailabilityController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v2->_isShowingAllMusic = -[ICCloudAvailabilityController _uncachedIsShowingAllMusic](v2, "_uncachedIsShowingAllMusic");
    v2->_isShowingAllVideo = -[ICCloudAvailabilityController _uncachedIsShowingAllVideo](v2, "_uncachedIsShowingAllVideo");
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasCellularDataCapability");

    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v2->_accessQueue);
      telephonyClient = v2->_telephonyClient;
      v2->_telephonyClient = (CoreTelephonyClient *)v7;

      v9 = v2->_telephonyClient;
      v28 = 0;
      -[CoreTelephonyClient getInternetConnectionStateSync:](v9, "getInternetConnectionStateSync:", &v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v28;
      if (v11)
      {
        v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v2;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v11;
          _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "<ICCloudAvailabilityController %p> init [CoreTelephonyClient getInternetConnectionStateSync] encountered error=%{public}@", buf, 0x16u);
        }

        v2->_isCellularDataActive = 0;
      }
      else
      {
        v2->_isCellularDataActive = objc_msgSend(v10, "state") == 2;
      }
      -[CoreTelephonyClient setDelegate:](v2->_telephonyClient, "setDelegate:", v2);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v31 = __Block_byref_object_copy__26319;
    v32 = __Block_byref_object_dispose__26320;
    v13 = v2;
    v33 = v13;
    v14 = MEMORY[0x1E0C809B0];
    v15 = v2->_accessQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __37__ICCloudAvailabilityController_init__block_invoke;
    handler[3] = &unk_1E438E5B0;
    handler[4] = buf;
    v13->_preferencesChangedNotifyTokenIsValid = notify_register_dispatch("com.apple.mobileipod-prefsChanged", &v13->_preferencesChangedNotifyToken, v15, handler) == 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel__applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v13, sel__applicationDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

    v22 = v14;
    v23 = 3221225472;
    v24 = __37__ICCloudAvailabilityController_init__block_invoke_2;
    v25 = &unk_1E438E5D8;
    v26 = buf;
    v13->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    -[ICCloudAvailabilityController _registerPerAppNetworkDataAccessPolicyChangedNotification](v13, "_registerPerAppNetworkDataAccessPolicyChangedNotification");
    v13->_isCellularDataRestrictedForMusic = 1;
    v18 = v2->_accessQueue;
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __37__ICCloudAvailabilityController_init__block_invoke_29;
    v20[3] = &unk_1E43913D8;
    v21 = v13;
    dispatch_async(v18, v20);

    _Block_object_dispose(buf, 8);
  }
  return v2;
}

- (void)_registerPerAppNetworkDataAccessPolicyChangedNotification
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  ICCloudAvailabilityController *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection)
  {
    v3 = _CTServerConnectionRegisterForNotification();
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v5 = v4;
    if ((_DWORD)v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v10 = 134218496;
        v11 = self;
        v12 = 1024;
        v13 = v3;
        v14 = 1024;
        v15 = HIDWORD(v3);
        v6 = "<ICCloudAvailabilityController %p> Error (domain %d, code %d) registering for PerAppNetworkDataAccessPolicy"
             "ChangedNotification";
        v7 = v5;
        v8 = OS_LOG_TYPE_ERROR;
        v9 = 24;
LABEL_7:
        _os_log_impl(&dword_1A03E3000, v7, v8, v6, (uint8_t *)&v10, v9);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = self;
      v6 = "<ICCloudAvailabilityController %p> _registerPerAppNetworkDataAccessPolicyChangedNotificationfor CTPerAppNetwo"
           "rkDataAccessPolicyChangedNotification";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 12;
      goto LABEL_7;
    }

  }
}

- (BOOL)_uncachedIsShowingAllVideo
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("VideosShowCloudMediaEnabledSetting"), CFSTR("com.apple.mobileipod"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (BOOL)_uncachedIsShowingAllMusic
{
  return 1;
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  if (!self->_isNetworkReachable)
    return 0;
  if ((unint64_t)(self->_networkType - 1) > 0x1F2)
    return 1;
  return self->_isAutoDownloadOnCellularAllowed;
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  if (!self->_isNetworkReachable)
    return 1;
  if ((unint64_t)(self->_networkType - 1) > 0x1F2)
    return 0;
  return -[ICCloudAvailabilityController isCellularDataRestrictedForVideos](self, "isCellularDataRestrictedForVideos");
}

- (BOOL)isCellularDataRestrictedForVideos
{
  void *v3;
  int v4;
  NSObject *v5;
  int v7;
  ICCloudAvailabilityController *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[ICNetworkConstraints constraintsForSystemApplicationType:](ICNetworkConstraints, "constraintsForSystemApplicationType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAllowDataForCellularNetworkTypes");
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = self;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> Videos allow cellular data: %d", (uint8_t *)&v7, 0x12u);
  }

  return v4 ^ 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[CoreTelephonyClient setDelegate:](self->_telephonyClient, "setDelegate:", 0);
  -[RadiosPreferences setDelegate:](self->_radiosPreferences, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

  if (self->_preferencesChangedNotifyTokenIsValid)
    notify_cancel(self->_preferencesChangedNotifyToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICWiFiManager sharedWiFiManager](ICWiFiManager, "sharedWiFiManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("ICWiFiManagerWiFiDidChangeNotification"), v6);

  if (self->_ctServerConnection)
  {
    -[ICCloudAvailabilityController _unregisterPerAppNetworkDataAccessPolicyChangedNotification](self, "_unregisterPerAppNetworkDataAccessPolicyChangedNotification");
    CFRelease(self->_ctServerConnection);
  }
  v7.receiver = self;
  v7.super_class = (Class)ICCloudAvailabilityController;
  -[ICCloudAvailabilityController dealloc](&v7, sel_dealloc);
}

- (BOOL)isCellularDataRestrictedForMusic
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__ICCloudAvailabilityController_isCellularDataRestrictedForMusic__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  NSObject *v3;
  int v5;
  ICCloudAvailabilityController *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134218240;
    v6 = self;
    v7 = 1024;
    v8 = 1;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> StoreApps allow cellular data: %d", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  if (!self->_isNetworkReachable)
    return 1;
  if ((unint64_t)(self->_networkType - 1) > 0x1F2)
    return 0;
  return -[ICCloudAvailabilityController isCellularDataRestrictedForStoreApps](self, "isCellularDataRestrictedForStoreApps");
}

- (BOOL)isNetworkReachable
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__ICCloudAvailabilityController_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)airplaneModeChanged
{
  char v3;
  NSObject *accessQueue;
  _QWORD v5[5];
  char v6;

  v3 = -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ICCloudAvailabilityController_airplaneModeChanged__block_invoke;
  v5[3] = &unk_1E438E600;
  v5[4] = self;
  v6 = v3;
  dispatch_async(accessQueue, v5);
}

- (void)_wifiStateDidChangeNotification:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  NSObject *accessQueue;
  _QWORD v9[5];
  char v10;
  char v11;

  +[ICWiFiManager sharedWiFiManager](ICWiFiManager, "sharedWiFiManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWiFiEnabled");

  +[ICWiFiManager sharedWiFiManager](ICWiFiManager, "sharedWiFiManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWiFiAssociated");

  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ICCloudAvailabilityController__wifiStateDidChangeNotification___block_invoke;
  v9[3] = &unk_1E438E628;
  v9[4] = self;
  v10 = v5;
  v11 = v7;
  dispatch_async(accessQueue, v9);
}

- (void)_applicationDidEnterBackground:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ICCloudAvailabilityController__applicationDidEnterBackground___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (BOOL)_isAutoDownloadOnCellularAllowed
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__ICCloudAvailabilityController__isAutoDownloadOnCellularAllowed__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_unregisterPerAppNetworkDataAccessPolicyChangedNotification
{
  if (self->_ctServerConnection)
    _CTServerConnectionUnregisterForNotification();
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICCloudAvailabilityController *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)internetConnectionStateChanged:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 isCellularDataActive;
  int v7;
  ICCloudAvailabilityController *v8;
  __int16 v9;
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "state") == 2;
  if (self->_isCellularDataActive != v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      isCellularDataActive = self->_isCellularDataActive;
      v7 = 134218496;
      v8 = self;
      v9 = 1024;
      v10 = isCellularDataActive;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p> CoreTelephonyClientDataDelegate internetConnectionStateChanged: _isCellularDataActive=%{BOOL}u, newIsCellularDataActive=%{BOOL}u", (uint8_t *)&v7, 0x18u);
    }

    self->_isCellularDataActive = v4;
    -[ICCloudAvailabilityController _onQueue_updateCanShowCloudDownloadButtonsWithNotification:](self, "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    -[ICCloudAvailabilityController _onQueue_updateCanShowCloudTracksWithNotification:](self, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __72__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _BOOL4 v6;

  result = objc_msgSend(*(id *)(a1 + 32), "networkType");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v3 + 40);
  if (v4 != result)
  {
    v5 = ((unint64_t)(v4 - 1) < 0x1F3) ^ ((unint64_t)(result - 1) < 0x1F3);
    v6 = v4 > 1999;
    *(_QWORD *)(v3 + 40) = result;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 26) = result == 2000;
    if ((v5 & 1) != 0 || v6 != result > 1999)
    {
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
      return objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
    }
  }
  return result;
}

void __80__ICCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerNetworkReachabilityDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __83__ICCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __83__ICCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerHasProperNetworkConditionsToShowCloudMediaDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __92__ICCloudAvailabilityController__onQueue_updateCanShowCloudDownloadButtonsWithNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerCanShowCloudDownloadButtonsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __65__ICCloudAvailabilityController__isAutoDownloadOnCellularAllowed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 18);
  return result;
}

uint64_t __64__ICCloudAvailabilityController__applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterPerAppNetworkDataAccessPolicyChangedNotification");
}

uint64_t __65__ICCloudAvailabilityController__wifiStateDidChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  v3 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v2 + 24) != v3 || *(unsigned __int8 *)(v2 + 25) != *(unsigned __int8 *)(result + 41))
  {
    *(_BYTE *)(v2 + 24) = v3;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 25) = *(_BYTE *)(result + 41);
    objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    return objc_msgSend(*(id *)(v1 + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

uint64_t __52__ICCloudAvailabilityController_airplaneModeChanged__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 17) != v2)
  {
    v3 = result;
    *(_BYTE *)(v1 + 17) = v2;
    objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    return objc_msgSend(*(id *)(v3 + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

uint64_t __51__ICCloudAvailabilityController_isNetworkReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 27);
  return result;
}

uint64_t __65__ICCloudAvailabilityController_isCellularDataRestrictedForMusic__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 20);
  return result;
}

void __37__ICCloudAvailabilityController_init__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  int v2;
  int v3;
  _BYTE *v4;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v4 = v1;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
    v2 = objc_msgSend(v4, "_uncachedIsShowingAllMusic");
    v3 = objc_msgSend(v4, "_uncachedIsShowingAllVideo");
    v1 = v4;
    if (v4[21] != v2 || v4[22] != v3)
    {
      v4[21] = v2;
      v4[22] = v3;
      objc_msgSend(v4, "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
      objc_msgSend(v4, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
      v1 = v4;
    }
  }

}

void __37__ICCloudAvailabilityController_init__block_invoke_2(uint64_t a1, const __CFString *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (CFStringCompare(a2, (CFStringRef)*MEMORY[0x1E0CA7490], 0) == kCFCompareEqualTo)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "<ICCloudAvailabilityController %p>  Received kCTPerAppNetworkDataAccessPolicyChangedNotification. Updating cellular data restrictions", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "_onQueue_updateIsCellularDataRestrictedForMusic");
  }

}

void __37__ICCloudAvailabilityController_init__block_invoke_29(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = objc_alloc_init(MEMORY[0x1E0CFA9B8]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setDelegate:");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "airplaneMode");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = objc_msgSend(*(id *)(a1 + 32), "_uncachedIsAutoDownloadOnCellularAllowed");
  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerObserver:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = objc_msgSend(v10, "isEthernetWired");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) = objc_msgSend(v10, "isRemoteServerLikelyReachable");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(v10, "networkType");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  +[ICWiFiManager sharedWiFiManager](ICWiFiManager, "sharedWiFiManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v6, sel__wifiStateDidChangeNotification_, CFSTR("ICWiFiManagerWiFiDidChangeNotification"), v7);

  +[ICWiFiManager sharedWiFiManager](ICWiFiManager, "sharedWiFiManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(v8, "isWiFiEnabled");

  +[ICWiFiManager sharedWiFiManager](ICWiFiManager, "sharedWiFiManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = objc_msgSend(v9, "isWiFiAssociated");

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateIsCellularDataRestrictedForMusic");
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 0);

}

@end
