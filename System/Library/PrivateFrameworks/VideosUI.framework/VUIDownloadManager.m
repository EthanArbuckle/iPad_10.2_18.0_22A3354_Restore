@implementation VUIDownloadManager

- (NSArray)downloads
{
  void *v2;
  void *v3;

  -[VUIDownloadManager mutableDownloads](self, "mutableDownloads");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSMutableArray)mutableDownloads
{
  return self->_mutableDownloads;
}

- (VUIDownloadManager)init
{
  VUIDownloadManager *v2;
  NSMutableArray *v3;
  NSMutableArray *mutableDownloads;
  NSMutableArray *v5;
  NSMutableArray *failedDownloadsNeedingDialog;
  uint64_t v7;
  NSPointerArray *delegates;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)VUIDownloadManager;
  v2 = -[VUIDownloadManager init](&v20, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableDownloads = v2->_mutableDownloads;
    v2->_mutableDownloads = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    failedDownloadsNeedingDialog = v2->_failedDownloadsNeedingDialog;
    v2->_failedDownloadsNeedingDialog = v5;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v7 = objc_claimAutoreleasedReturnValue();
    delegates = v2->_delegates;
    v2->_delegates = (NSPointerArray *)v7;

    if (+[VUIUtilities isTVApp](VUIUtilities, "isTVApp"))
    {
      v9 = (void *)sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isAppRunning");
        v13 = CFSTR("NO");
        if (v12)
          v13 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIDownloadManager init - is app running: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__appDidStartRunning_, CFSTR("VUITVAppLauncherDidStartRunningNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__isPlaybackUIBeingShownDidChange_, v16, v17);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel__activeAccountDidChange_, *MEMORY[0x1E0DAF710], 0);

  }
  return v2;
}

- (void)initializeDownloadManager
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sidebandMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videosWithDownloadState:entitlementTypes:useMainThreadContext:", 1, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "adamID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
        {
          -[VUIDownloadManager _createMediaItemForVideoManagedObject:isForStartingDownload:downloadQuality:](self, "_createMediaItemForVideoManagedObject:isForStartingDownload:downloadQuality:", v11, 0, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v3, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }

  v14 = (void *)sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v24 = v16;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Found %lu media item(s) that were previously being downloaded (according to database)", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0DB1930], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0DB1930], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "initializeWithDownloadingMediaItems:", v3);

}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[VUIDownloadManager delegates](self, "delegates");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addPointer:", v4);

  }
}

- (void)_notifyDelegatesThatManagerDidBecomeInitialized
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;

  -[VUIDownloadManager delegates](self, "delegates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[VUIDownloadManager delegates](self, "delegates");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "pointerAtIndex:", v5);

      if (v7)
      {
        v8 = v7;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "downloadManagerDidBecomeInitialized:", self);

      }
      ++v5;
      -[VUIDownloadManager delegates](self, "delegates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v5 < v10);
  }
}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_29 != -1)
    dispatch_once(&sharedInstance_onceToken_29, &__block_literal_global_131);
  return (id)sharedInstance_instance_5;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

void __36__VUIDownloadManager_sharedInstance__block_invoke()
{
  os_log_t v0;
  void *v1;
  VUIDownloadManager *v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIDownloadManager");
  v1 = (void *)sLogObject_20;
  sLogObject_20 = (uint64_t)v0;

  v2 = objc_alloc_init(VUIDownloadManager);
  v3 = (void *)sharedInstance_instance_5;
  sharedInstance_instance_5 = (uint64_t)v2;

}

- (void)downloadSession:(id)a3 didAddRestoredDownloads:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VUIDownloadManager *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  void *v27;
  NSObject *log;
  uint8_t v29;
  _BYTE v30[15];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    v25 = *MEMORY[0x1E0DB1A08];
    v23 = *MEMORY[0x1E0DB1CB8];
    v8 = &unk_1EDACA000;
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[VUIDownloadManager mutableDownloads](self, "mutableDownloads");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v10);

        v12 = *((_QWORD *)v8 + 110);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          log = v12;
          objc_msgSend(v10, "mediaItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "mediaItemMetadataForProperty:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "mediaItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mediaItemMetadataForProperty:", v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIDownloadManager mutableDownloads](self, "mutableDownloads");
          v16 = v8;
          v17 = self;
          v18 = v6;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");
          *(_DWORD *)buf = 138413058;
          v36 = v10;
          v37 = 2112;
          v38 = v27;
          v39 = 2112;
          v40 = v15;
          v41 = 2048;
          v42 = v20;
          _os_log_impl(&dword_1D96EE000, log, OS_LOG_TYPE_DEFAULT, "Added restored download %@ for canonical ID %@ adam ID %@ to list of downloads.  Number of downloads is now %lu", buf, 0x2Au);

          v6 = v18;
          self = v17;
          v8 = v16;

          v7 = v24;
        }
        objc_msgSend(v10, "addDelegate:", self);
        v21 = objc_msgSend(v10, "state");
        v22 = *((_QWORD *)v8 + 110);
        if (v21 == 5)
        {
          if (os_log_type_enabled(*((os_log_t *)v8 + 110), OS_LOG_TYPE_ERROR))
            -[VUIDownloadManager downloadSession:didAddRestoredDownloads:].cold.1(&v29, v30, v22);
          -[VUIDownloadManager download:didChangeStateTo:](self, "download:didChangeStateTo:", v10, 5);
        }
        else
        {
          if (os_log_type_enabled(*((os_log_t *)v8 + 110), OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "Resuming restored download", buf, 2u);
          }
          objc_msgSend(v10, "start");
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v6);
  }
  if (objc_msgSend(obj, "count"))
    -[VUIDownloadManager _notifyDelegatesThatDownloadsDidChange](self, "_notifyDelegatesThatDownloadsDidChange");
  -[VUIDownloadManager setIsInitialized:](self, "setIsInitialized:", 1);
  -[VUIDownloadManager _notifyDelegatesThatManagerDidBecomeInitialized](self, "_notifyDelegatesThatManagerDidBecomeInitialized");

}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (NSMutableArray)failedDownloadsNeedingDialog
{
  return self->_failedDownloadsNeedingDialog;
}

- (void)_showDownloadErrorDialogIfAppropriate
{
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  void *v8;
  char v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaybackUIBeingShown");

  if (v4)
  {
    v5 = sLogObject_20;
    if (!os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      return;
    v12 = 0;
    v6 = "Playback is happening.  Delaying error dialog until playback ends.";
    v7 = (uint8_t *)&v12;
    goto LABEL_11;
  }
  if (-[VUIDownloadManager dialogBeingPresented](self, "dialogBeingPresented"))
  {
    v5 = sLogObject_20;
    if (!os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      return;
    v11 = 0;
    v6 = "Error dialog is already being presented.  Delaying error dialog until existing dialog ends.";
    v7 = (uint8_t *)&v11;
    goto LABEL_11;
  }
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppRunning");

  if ((v9 & 1) != 0)
  {
    -[VUIDownloadManager _showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:](self, "_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:", 1);
    return;
  }
  v5 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 0;
    v6 = "App hasn't finished launching.  Delaying error dialog until app finishes launching.";
    v7 = (uint8_t *)&v10;
LABEL_11:
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
  }
}

- (void)_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Not showing error dialog because no failed downloads exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id *location;
  id *locationa;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  BOOL v34;
  BOOL v35;
  char v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[VUIDownloadManager failedDownloadsNeedingDialog](self, "failedDownloadsNeedingDialog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)sLogObject_20;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[VUIDownloadManager failedDownloadsNeedingDialog](self, "failedDownloadsNeedingDialog");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v38 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Will show error dialog for %lu failed downloads", buf, 0xCu);

    }
    v36 = 0;
    -[VUIDownloadManager failedDownloadsNeedingDialog](self, "failedDownloadsNeedingDialog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadManager _alertControllerForFailedDownloads:outIncludeGoToSettingsButton:](self, "_alertControllerForFailedDownloads:outIncludeGoToSettingsButton:", v10, &v36);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIDownloadManager failedDownloadsNeedingDialog](self, "failedDownloadsNeedingDialog");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VUIDownloadManager _anyDownloadsFailedDueToInvalidUserToken:](self, "_anyDownloadsFailedDueToInvalidUserToken:", v12);

    -[VUIDownloadManager failedDownloadsNeedingDialog](self, "failedDownloadsNeedingDialog");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllObjects");

    objc_initWeak((id *)buf, self);
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:", CFSTR("OK"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke;
    v32[3] = &unk_1E9FA27A8;
    location = &v33;
    objc_copyWeak(&v33, (id *)buf);
    v34 = v13;
    v35 = a3;
    +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v16, 0, v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "vui_addAction:", v18);
    if (v36)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance", &v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_ALERT_ACTION_GO_TO_SETTINGS"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v17;
      v28 = 3221225472;
      v29 = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_2_53;
      v30 = &unk_1E9FA1028;
      objc_copyWeak(&v31, (id *)buf);
      +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v20, 0, &v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "vui_addAction:", v21);
      objc_destroyWeak(&v31);
    }
    +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController", location, v27, v28, v29, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       || (objc_msgSend(v22, "presentedViewController"),
           v23 = (void *)objc_claimAutoreleasedReturnValue(),
           v24 = v23 == 0,
           v23,
           v24)))
    {
      -[VUIDownloadManager setDialogBeingPresented:](self, "setDialogBeingPresented:", 1);
      objc_msgSend(v11, "vui_presentAlertFromPresentingController:animated:completion:", v22, 1, 0);
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
    {
      -[VUIDownloadManager _showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:].cold.2();
    }

    objc_destroyWeak(locationa);
    objc_destroyWeak((id *)buf);

  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager _showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:].cold.1();
  }
}

- (void)_appDidStartRunning:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "App did start running", v5, 2u);
  }
  -[VUIDownloadManager _showDownloadErrorDialogIfAppropriateAfterDelay](self, "_showDownloadErrorDialogIfAppropriateAfterDelay");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadManager;
  -[VUIDownloadManager dealloc](&v4, sel_dealloc);
}

- (void)removeDelegate:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    -[VUIDownloadManager delegates](self, "delegates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = 0;
      while (1)
      {
        -[VUIDownloadManager delegates](self, "delegates");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "pointerAtIndex:", v6);

        if ((id)v8 == v12)
          break;
        ++v6;
        -[VUIDownloadManager delegates](self, "delegates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v6 >= v10)
          goto LABEL_8;
      }
      -[VUIDownloadManager delegates](self, "delegates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removePointerAtIndex:", v6);

    }
  }
LABEL_8:

}

- (void)addDownloadForVideoManagedObject:(id)a3 allowCellular:(BOOL)a4 quality:(int64_t)a5 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a6 prefer3DOrImmersiveDownload:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  char isKindOfClass;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  const __CFString *v45;
  _QWORD v46[2];

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v46[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sidebandMediaLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mainContextVideoForVideo:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "adamID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadManager existingDownloadForAdamID:](self, "existingDownloadForAdamID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
        -[VUIDownloadManager addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:].cold.2();
    }
    else
    {
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sidebandMediaLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeDownloadedMediaForVideoManagedObject:markAsDeleted:invalidateImmediately:", v15, 0, 0);

      objc_msgSend(v15, "setShouldMarkAsDeletedAfterCancellationOrFailure:", v8);
      objc_msgSend(v15, "setAllowsCellular:", v10);
      objc_msgSend(v15, "setDownloadFailedDueToError:", 0);
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sidebandMediaLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "saveChangesToManagedObjects");

      -[VUIDownloadManager _createMediaItemForVideoManagedObject:isForStartingDownload:downloadQuality:](self, "_createMediaItemForVideoManagedObject:isForStartingDownload:downloadQuality:", v15, 1, a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DB1930], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "downloadForMediaItem:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = CFSTR("Download Quality");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setUserInfo:", v26);

      -[VUIDownloadManager _configureDownloadFromUserPrefs:allowCellular:quality:prefer3DOrImmersiveDownload:](self, "_configureDownloadFromUserPrefs:allowCellular:quality:prefer3DOrImmersiveDownload:", v24, v10, a5, v7);
      -[VUIDownloadManager mutableDownloads](self, "mutableDownloads");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v24);

      objc_msgSend(v24, "addDelegate:", self);
      v28 = (void *)sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        objc_msgSend(v15, "canonicalID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "adamID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDownloadManager mutableDownloads](self, "mutableDownloads");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138413058;
        v38 = v24;
        v39 = 2112;
        v40 = v30;
        v41 = 2112;
        v42 = v31;
        v43 = 2048;
        v44 = objc_msgSend(v32, "count");
        _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Added download %@ for canonical ID %@ adam ID %@ to list of downloads.  Number of downloads is now %lu", (uint8_t *)&v37, 0x2Au);

      }
      objc_msgSend(v24, "start");
      if (!-[VUIDownloadManager performingAddDownloadsBatch](self, "performingAddDownloadsBatch"))
        -[VUIDownloadManager _notifyDelegatesThatDownloadsDidChange](self, "_notifyDelegatesThatDownloadsDidChange");
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v15, "series");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          -[VUIDownloadManager _loadImageForSeriesManagedObject:imageType:download:useForStorageSettings:](self, "_loadImageForSeriesManagedObject:imageType:download:useForStorageSettings:", v34, 0, v24, 1);
          -[VUIDownloadManager _loadImageForSeriesManagedObject:imageType:download:useForStorageSettings:](self, "_loadImageForSeriesManagedObject:imageType:download:useForStorageSettings:", v34, 1, v24, 0);
        }

      }
      -[VUIDownloadManager _loadImageForVideoManagedObject:imageType:download:useForStorageSettings:](self, "_loadImageForVideoManagedObject:imageType:download:useForStorageSettings:", v15, 0, v24, (isKindOfClass & 1) == 0);
      -[VUIDownloadManager _loadImageForVideoManagedObject:imageType:download:useForStorageSettings:](self, "_loadImageForVideoManagedObject:imageType:download:useForStorageSettings:", v15, 1, v24, 0);
      -[VUIDownloadManager _loadImageForVideoManagedObject:imageType:download:useForStorageSettings:](self, "_loadImageForVideoManagedObject:imageType:download:useForStorageSettings:", v15, 2, v24, 0);
      objc_msgSend(v15, "entitlementType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "integerValue");

      if ((v36 & 0xFFFFFFFFFFFFFFFELL) == 2)
        -[VUIDownloadManager _loadStorageSettingsImageFromMediaLibraryForVideoManagedObject:download:](self, "_loadStorageSettingsImageFromMediaLibraryForVideoManagedObject:download:", v15, v24);

    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:].cold.1();
  }

}

- (void)performBatchAddDownloadsWithBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[VUIDownloadManager setPerformingAddDownloadsBatch:](self, "setPerformingAddDownloadsBatch:", 1);
  if (v4)
  {
    v4[2]();
    -[VUIDownloadManager _notifyDelegatesThatDownloadsDidChange](self, "_notifyDelegatesThatDownloadsDidChange");
  }
  -[VUIDownloadManager setPerformingAddDownloadsBatch:](self, "setPerformingAddDownloadsBatch:", 0);

}

- (void)fetchNewKeysForDownloadedVideoManagedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  VUIStoreAuxMediaItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sidebandMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainContextVideoForVideo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "downloadState") == 2)
    {
      v8 = objc_msgSend(v7, "allowsManualRenewal");
      v9 = (void *)sLogObject_20;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          objc_msgSend(v7, "canonicalID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "adamID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412546;
          v20 = v11;
          v21 = 2112;
          v22 = v12;
          _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Fetching new keys for canonical ID %@ adam ID %@", (uint8_t *)&v19, 0x16u);

        }
        v13 = -[VUIStoreAuxMediaItem initWithVideoManagedObject:isForStartingDownload:]([VUIStoreAuxMediaItem alloc], "initWithVideoManagedObject:isForStartingDownload:", v7, 0);
        objc_msgSend(MEMORY[0x1E0DB1930], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "downloadForMediaItem:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setShouldMarkAsDeletedAfterCancellationOrFailure:", 0);
        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sidebandMediaLibrary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "saveChangesToManagedObjects");

        -[VUIStoreAuxMediaItem setIgnoreExistingOfflineKeyData:](v13, "setIgnoreExistingOfflineKeyData:", 1);
        objc_msgSend(v15, "setPerformKeyFetchOnly:", 1);
        objc_msgSend(v15, "addDelegate:", self);
        -[VUIDownloadManager mutableDownloads](self, "mutableDownloads");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v15);

        objc_msgSend(v15, "start");
        -[VUIDownloadManager _notifyDelegatesThatDownloadsDidChange](self, "_notifyDelegatesThatDownloadsDidChange");

      }
      else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
      {
        -[VUIDownloadManager fetchNewKeysForDownloadedVideoManagedObject:].cold.2();
      }
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
    {
      -[VUIDownloadManager fetchNewKeysForDownloadedVideoManagedObject:].cold.3();
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager fetchNewKeysForDownloadedVideoManagedObject:].cold.1();
  }

}

- (void)addDownloadOrRenewKeysForMediaItem:(id)a3 allowCellular:(BOOL)a4 quality:(int64_t)a5 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  int v13;

  v6 = a6;
  v8 = a4;
  v10 = a3;
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataDownloadVideoManagedObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataDownloadAllowsManualRenewal"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
      -[VUIDownloadManager fetchNewKeysForDownloadedVideoManagedObject:](self, "fetchNewKeysForDownloadedVideoManagedObject:", v11);
    else
      -[VUIDownloadManager addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:](self, "addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:", v11, v8, a5, v6, 1);
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager addDownloadOrRenewKeysForMediaItem:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:].cold.1();
  }

}

- (void)cancelAndRemoveDownloadForMediaItem:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataDownloadVideoManagedObject"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "downloadState");
  -[VUIDownloadManager cancelDownloadForAdamID:](self, "cancelDownloadForAdamID:", v4);
  if (v8)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sidebandMediaLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeDownloadedMediaForVideoManagedObject:markAsDeleted:invalidateImmediately:", v8, v5 != 1, 1);

  }
}

- (id)existingDownloadForAdamID:(id)a3
{
  id v4;
  void *v5;
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
  v14 = __Block_byref_object_copy__28;
  v15 = __Block_byref_object_dispose__28;
  v16 = 0;
  if (objc_msgSend(v4, "length"))
  {
    -[VUIDownloadManager downloads](self, "downloads");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__VUIDownloadManager_existingDownloadForAdamID___block_invoke;
    v8[3] = &unk_1E9FA2780;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __48__VUIDownloadManager_existingDownloadForAdamID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v8))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)cancelDownloadForAdamID:(id)a3
{
  id v3;

  -[VUIDownloadManager existingDownloadForAdamID:](self, "existingDownloadForAdamID:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (void)preflightDownloadForVideosPlayable:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVideosPlayable:", v12);

  -[VUIDownloadManager _preflightDownloadForPresentingViewController:contentAllowsCellularDownload:completion:](self, "_preflightDownloadForPresentingViewController:contentAllowsCellularDownload:completion:", v11, v6, v10);
}

- (void)preflightDownloadForLibraryMediaEntity:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMediaEntity:", v12);

  -[VUIDownloadManager _preflightDownloadForPresentingViewController:contentAllowsCellularDownload:completion:](self, "_preflightDownloadForPresentingViewController:contentAllowsCellularDownload:completion:", v11, v6, v10);
}

- (void)preflightDownloadForTVPMediaItem:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMediaItem:", v12);

  -[VUIDownloadManager _preflightDownloadForPresentingViewController:contentAllowsCellularDownload:completion:](self, "_preflightDownloadForPresentingViewController:contentAllowsCellularDownload:completion:", v11, v6, v10);
}

- (void)preflightDownloadForContentRating:(id)a3 presentingViewController:(id)a4 contentAllowsCellularDownload:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentRating:", v12);

  -[VUIDownloadManager _preflightDownloadForPresentingViewController:contentAllowsCellularDownload:completion:](self, "_preflightDownloadForPresentingViewController:contentAllowsCellularDownload:completion:", v11, v6, v10);
}

- (void)_preflightDownloadForPresentingViewController:(id)a3 contentAllowsCellularDownload:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPresentingController:", v8);

  objc_msgSend(v9, "setRestrictionsCheckType:", 1);
  objc_msgSend(v9, "setContentAllowsCellularDownload:", v5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __109__VUIDownloadManager__preflightDownloadForPresentingViewController_contentAllowsCellularDownload_completion___block_invoke;
  v11[3] = &unk_1E9FA12E8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "preflightWithOptions:completion:", 11, v11);

}

void __109__VUIDownloadManager__preflightDownloadForPresentingViewController_contentAllowsCellularDownload_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  id v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = VUIPreflightCellularAllowedKey[0];
    v5 = a3;
    objc_msgSend(v5, "objectForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", VUIPreflightDownloadQualityKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "BOOLValue");
      if (!v6)
      {
LABEL_7:
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        return;
      }
    }
    else if (!v6)
    {
      goto LABEL_7;
    }
    objc_msgSend(v6, "integerValue");
    goto LABEL_7;
  }
}

- (void)download:(id)a3 didChangeStateTo:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, void *, uint64_t, _BYTE *);
  void *v55;
  id v56;
  _BYTE *v57;
  uint8_t v58[4];
  id v59;
  __int16 v60;
  uint64_t v61;
  _BYTE buf[24];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    goto LABEL_40;
  v7 = (void *)sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v6, "descriptionForState:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Download %@ state did change to %@", buf, 0x16u);

  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    switch(a4)
    {
      case 6:
        goto LABEL_16;
      case 3:
        objc_msgSend(v6, "mediaItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sidebandMediaLibrary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "videoForAdamID:useMainThreadContext:", v11, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setDownloadState:", 2);
        v33 = sLogObject_20;
        if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v33, OS_LOG_TYPE_DEFAULT, "Setting managed object's task identifier to nil", buf, 2u);
        }
        goto LABEL_28;
      case 1:
LABEL_16:
        objc_msgSend(v6, "mediaItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sidebandMediaLibrary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "videoForAdamID:useMainThreadContext:", v24, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "setDownloadState:", 1);
        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sidebandMediaLibrary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "saveChangesToManagedObjects");

        break;
    }
    if ((unint64_t)(a4 - 3) >= 3)
      goto LABEL_40;
    goto LABEL_30;
  }
  objc_msgSend(v6, "mediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sidebandMediaLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "videoForAdamID:useMainThreadContext:", v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (objc_msgSend(v6, "performKeyFetchOnly"))
    {
      if (a4 == 5)
      {
        objc_msgSend(v6, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((TVPErrorIsSKDError() & 1) != 0)
        {
          objc_msgSend(v6, "error");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "code") == -345015;

          if (v17)
          {
            v18 = sLogObject_20;
            if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "Will remove download after performing key fetch because user is no longer entitled", buf, 2u);
            }
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v34 = sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_DEFAULT, "Not removing download on cancellation/failure since download was only performing a key fetch.  Resetting state to Downloaded.", buf, 2u);
      }
      objc_msgSend(v14, "setDownloadState:", 2);
      objc_msgSend(v6, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDownloadFailedDueToError:", v21 != 0);
      goto LABEL_26;
    }
LABEL_12:
    objc_msgSend(v6, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDownloadFailedDueToError:", v19 != 0);

    v20 = objc_msgSend(v14, "shouldMarkAsDeletedAfterCancellationOrFailure");
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sidebandMediaLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeDownloadedMediaForVideoManagedObject:markAsDeleted:invalidateImmediately:", v14, v20, 1);

LABEL_26:
    v35 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v35, OS_LOG_TYPE_DEFAULT, "Setting managed object's task identifier to nil", buf, 2u);
    }
LABEL_28:
    objc_msgSend(v14, "setDownloadTaskIdentifier:", 0);
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sidebandMediaLibrary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "saveChangesToManagedObjects");

  }
LABEL_30:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v63 = 0x7FFFFFFFFFFFFFFFLL;
  -[VUIDownloadManager mutableDownloads](self, "mutableDownloads");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = MEMORY[0x1E0C809B0];
  v53 = 3221225472;
  v54 = __48__VUIDownloadManager_download_didChangeStateTo___block_invoke;
  v55 = &unk_1E9FA2780;
  v39 = v6;
  v56 = v39;
  v57 = buf;
  objc_msgSend(v38, "enumerateObjectsUsingBlock:", &v52);

  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v39, "removeDelegate:", self, v52, v53, v54, v55);
    -[VUIDownloadManager mutableDownloads](self, "mutableDownloads");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "removeObjectAtIndex:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));

    v41 = (id)sLogObject_20;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIDownloadManager mutableDownloads](self, "mutableDownloads");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");
      *(_DWORD *)v58 = 138412546;
      v59 = v39;
      v60 = 2048;
      v61 = v43;
      _os_log_impl(&dword_1D96EE000, v41, OS_LOG_TYPE_DEFAULT, "Removed download %@ from list of downloads.  Number of downloads is now %lu", v58, 0x16u);

    }
    -[VUIDownloadManager _notifyDelegatesThatDownloadsDidChange](self, "_notifyDelegatesThatDownloadsDidChange");
  }

  _Block_object_dispose(buf, 8);
  if (a4 == 5)
  {
    objc_msgSend(v39, "error");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "userInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKey:", CFSTR("VUIDownloadManagerSuppressErrorDialogKey"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "BOOLValue");

    if ((v47 & 1) != 0)
    {
      v48 = (void *)sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        v49 = v48;
        objc_msgSend(v39, "error");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v50;
        _os_log_impl(&dword_1D96EE000, v49, OS_LOG_TYPE_DEFAULT, "Suppressing error dialog for %@", buf, 0xCu);

      }
    }
    else
    {
      -[VUIDownloadManager failedDownloadsNeedingDialog](self, "failedDownloadsNeedingDialog");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObject:", v39);

    }
    -[VUIDownloadManager _showDownloadErrorDialogIfAppropriateAfterDelay](self, "_showDownloadErrorDialogIfAppropriateAfterDelay", v52, v53, v54, v55);
  }
LABEL_40:

}

void __48__VUIDownloadManager_download_didChangeStateTo___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToMediaItem:", v8);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)download:(id)a3 willDownloadToURL:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Download %@ will download to %@", (uint8_t *)&v15, 0x16u);
  }
  objc_msgSend(v5, "mediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sidebandMediaLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "videoForAdamID:useMainThreadContext:", v9, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "setLocalPlaybackURL:", v6);
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sidebandMediaLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "saveChangesToManagedObjects");

    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager download:willDownloadToURL:].cold.1();
  }

}

- (void)download:(id)a3 didReceiveTaskIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Download %@ did receive task identifier %@", (uint8_t *)&v16, 0x16u);
  }
  objc_msgSend(v5, "mediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sidebandMediaLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "videoForAdamID:useMainThreadContext:", v9, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v6;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Setting managed object's task identifier to %@", (uint8_t *)&v16, 0xCu);
      }
      objc_msgSend(v12, "setDownloadTaskIdentifier:", v6);
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sidebandMediaLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "saveChangesToManagedObjects");

    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager download:didReceiveTaskIdentifier:].cold.1();
  }

}

- (void)download:(id)a3 processFinishedDownloadWithCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = (void *)sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v5, "mediaItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Calling processFinishedDownloadWithCompletion for mediaItem %@", buf, 0xCu);

    }
    objc_msgSend(v5, "mediaItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__VUIDownloadManager_download_processFinishedDownloadWithCompletion___block_invoke;
    v13[3] = &unk_1E9F9E5B8;
    v14 = v6;
    objc_msgSend(v12, "processFinishedDownloadWithCompletion:", v13);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __69__VUIDownloadManager_download_processFinishedDownloadWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)download:(id)a3 willDownloadVariants:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sidebandMediaLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "videoForAdamID:useMainThreadContext:", v8, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v30 = v11;
      v31 = v8;
      v12 = CFSTR("Monoscopic");
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v32 = v6;
      obj = v6;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v39 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            objc_msgSend(v17, "videoAttributes", v30);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "videoLayoutAttributes");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v35;
              while (2)
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v35 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                  if ((~objc_msgSend(v24, "stereoViewComponents") & 3) == 0)
                  {
                    v25 = objc_msgSend(v24, "projectionType");
                    v26 = CFSTR("Stereoscopic");
                    if (v25 == 1718186856)
                      v26 = CFSTR("Immersive");
                    v27 = v26;

                    v12 = v27;
                    goto LABEL_20;
                  }
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
                if (v21)
                  continue;
                break;
              }
            }
LABEL_20:

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v14);
      }

      v11 = v30;
      objc_msgSend(v30, "setDownloadedPlaybackMode:", v12);
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sidebandMediaLibrary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "saveChangesToManagedObjects");

      v6 = v32;
      v8 = v31;
    }

  }
  else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
  {
    -[VUIDownloadManager download:willDownloadVariants:].cold.1();
  }

}

- (void)_notifyDelegatesThatDownloadsDidChange
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;

  -[VUIDownloadManager delegates](self, "delegates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[VUIDownloadManager delegates](self, "delegates");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "pointerAtIndex:", v5);

      if (v7)
      {
        v8 = v7;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "downloadManagerDownloadsDidChange:", self);

      }
      ++v5;
      -[VUIDownloadManager delegates](self, "delegates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v5 < v10);
  }
}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaybackUIBeingShown");

  v6 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "isPlaybackUIBeingShown did change to %@", (uint8_t *)&v9, 0xCu);
  }
  if ((v5 & 1) == 0)
  {
    v8 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Will show error dialog (if needed) after playback transition finishes", (uint8_t *)&v9, 2u);
    }
    -[VUIDownloadManager _showDownloadErrorDialogIfAppropriateAfterDelay](self, "_showDownloadErrorDialogIfAppropriateAfterDelay");
  }
}

- (void)_showDownloadErrorDialogIfAppropriateAfterDelay
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Will show error dialog (if needed) after delay", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showDownloadErrorDialogIfAppropriate, 0);
  -[VUIDownloadManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showDownloadErrorDialogIfAppropriate, 0, 1.0);
}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  __int16 v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_2;
  v2[3] = &unk_1E9F9D330;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  v4 = *(_WORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  v2 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Done presenting download error dialog", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (*(_BYTE *)(a1 + 40) && *(_BYTE *)(a1 + 41))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_48;
    v5[3] = &unk_1E9F9C6F8;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:withCompletionHandler:](VUIAuthenticationManager, "requestAuthenticationAlwaysPrompt:withCompletionHandler:", 1, v5);
    objc_destroyWeak(&v6);
  }
  else
  {
    objc_msgSend(WeakRetained, "setDialogBeingPresented:", 0);
    objc_msgSend(v4, "_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:", 1);
  }

}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_48(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDialogBeingPresented:", 0);
  objc_msgSend(WeakRetained, "_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:", 0);

}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_2_53(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=USAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_3;
  block[3] = &unk_1E9F99C98;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v5);
}

void __80__VUIDownloadManager__showDownloadErrorDialogIfAppropriateAllowingSignInPrompt___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Done presenting download error dialog", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDialogBeingPresented:", 0);
  objc_msgSend(WeakRetained, "_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:", 1);

}

- (BOOL)_anyDownloadsFailedDueToInvalidUserToken:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "error", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TVPlaybackErrorDomain")) & 1) != 0)
        {
          objc_msgSend(v8, "error");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "code");

          if (v12 == 813)
          {
            v13 = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)_alertControllerForFailedDownloads:(id)a3 outIncludeGoToSettingsButton:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v88;

  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = 0;
  if (TVPErrorIsSKDError())
  {
    if (objc_msgSend(v8, "code") == -345015)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_NOT_ENTITLED_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v7, "performKeyFetchOnly");
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
        v14 = CFSTR("DOWNLOAD_RENEWAL_FAILED_NOT_ENTITLED_MESSAGE");
      else
        v14 = CFSTR("DOWNLOAD_FAILED_NOT_ENTITLED_MESSAGE");
      goto LABEL_18;
    }
    if (objc_msgSend(v8, "code") == -345024)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_CONTENT_NOT_DOWNLOADABLE_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("DOWNLOAD_FAILED_CONTENT_NOT_DOWNLOADABLE_MESSAGE");
LABEL_18:
      objc_msgSend(v12, "localizedStringForKey:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    if (objc_msgSend(v8, "code") == -345025)
    {
      objc_msgSend(v7, "mediaItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "mediaItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_DEVICE_LIMIT_REACHED_TITLE_FORMAT"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v30, CFSTR("%@"), 0, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v29) = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0DB1DD8]);
      v31 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if ((_DWORD)v29)
        v34 = CFSTR("EPISODE_DOWNLOAD_FAILED_DEVICE_LIMIT_REACHED_FORMAT");
      else
        v34 = CFSTR("MOVIE_DOWNLOAD_FAILED_DEVICE_LIMIT_REACHED_FORMAT");
      objc_msgSend(v32, "localizedStringForKey:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v35, CFSTR("%@"), 0, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_39;
    }
    if (objc_msgSend(v8, "code") == -345026)
    {
      objc_msgSend(v7, "mediaItem");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DB1DD8]);
      objc_msgSend(v7, "mediaItem");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v42)
      {
        objc_msgSend(v43, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C48]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "mediaItem");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C40]);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "integerValue");

        objc_msgSend(v7, "mediaItem");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A98]);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "integerValue");

        v51 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_TOO_MANY_DEVICES_WITH_THIS_EPISODE_TITLE"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v53, CFSTR("%@ %d %d"), 0, v27, v47, v50);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_TOO_MANY_DEVICES_WITH_THIS_EPISODE_FORMAT"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v56, CFSTR("%@"), 0, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v43, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_TOO_MANY_DEVICES_WITH_THIS_MOVIE_TITLE"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v68, CFSTR("%@"), 0, v27);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_TOO_MANY_DEVICES_WITH_THIS_MOVIE_MESSAGE"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_39;
    }
    if (objc_msgSend(v8, "code") == -345027)
    {
      objc_msgSend(v7, "mediaItem");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_DOWNLOAD_LIMIT_REACHED_TITLE_FORMAT"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v60, CFSTR("%@"), 0, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_DOWNLOAD_LIMIT_REACHED_FORMAT"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v62, CFSTR("%@"), 0, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
LABEL_40:

      if (v10)
        goto LABEL_52;
      goto LABEL_50;
    }
    if (objc_msgSend(v8, "code") == -345023)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_NOT_ENTITLED_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("VIDEO_UNAVAILABLE_IN_THIS_REGION_ERROR");
      goto LABEL_18;
    }
    goto LABEL_44;
  }
  if (-[VUIDownloadManager _anyDownloadsFailedDueToInvalidUserToken:](self, "_anyDownloadsFailedDueToInvalidUserToken:", v6))
  {
    if (objc_msgSend(v8, "code") == 813)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString localizedStringForKey:](v15, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_SIGN_IN_TO_DOWNLOAD_MESSAGE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:

      goto LABEL_50;
    }
  }
  else
  {
    objc_msgSend(v8, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("TVPlaybackErrorDomain")))
    {
      v19 = objc_msgSend(v8, "code");

      if (v19 == 812)
      {
        objc_msgSend(v6, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "mediaItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!-[__CFString length](v15, "length"))
        {

          v15 = &stru_1E9FF3598;
        }
        v22 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:", CFSTR("UNABLE_TO_DOWNLOAD_RENTAL_ALREADY_DOWNLOADED_ON_ANOTHER_DEVICE_FORMAT"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@"), 0, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_49;
      }
    }
    else
    {

    }
    objc_msgSend(v8, "domain");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("CoreMediaErrorDomain")))
    {
      v16 = 0;
      goto LABEL_49;
    }
    v36 = objc_msgSend(v8, "code");

    if (v36 == 28)
    {
      objc_msgSend(v7, "mediaItem");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString length](v15, "length"))
      {
        v38 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_NOT_ENOUGH_SPACE_SPECIFIC_TITLE"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v40, CFSTR("%@ %lu"), 0, v15, objc_msgSend(v6, "count") - 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v63 = objc_msgSend(v6, "count");
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v64;
        if (v63 == 1)
          v65 = CFSTR("DOWNLOAD_FAILED_NOT_ENOUGH_SPACE_GENERIC_ONE");
        else
          v65 = CFSTR("DOWNLOAD_FAILED_NOT_ENOUGH_SPACE_GENERIC_MANY");
        objc_msgSend(v64, "localizedStringForKey:", v65);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (a4)
        *a4 = 1;
      goto LABEL_49;
    }
  }
LABEL_44:
  v16 = 0;
LABEL_50:
  if (objc_msgSend(v8, "code") != 812)
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      v70 = objc_msgSend(v7, "performKeyFetchOnly");
      v71 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      if (v70)
        v74 = CFSTR("DOWNLOAD_RENEWAL_FAILED_TITLE_FORMAT");
      else
        v74 = CFSTR("DOWNLOAD_FAILED_TITLE_FORMAT_ONE");
    }
    else
    {
      v71 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      v74 = CFSTR("DOWNLOAD_FAILED_TITLE_FORMAT_MANY");
    }
    objc_msgSend(v72, "localizedStringForKey:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v75, CFSTR("%lu"), 0, objc_msgSend(v6, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_67;
    goto LABEL_60;
  }
  v10 = 0;
LABEL_52:
  if (v16)
    goto LABEL_67;
LABEL_60:
  objc_msgSend(v6, "firstObject");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "mediaItem");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v78, "length"))
  {
    v79 = objc_msgSend(v76, "performKeyFetchOnly");
    v80 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v81;
    if (v79)
      v83 = CFSTR("DOWNLOAD_RENEWAL_FAILED_MESSAGE_FORMAT");
    else
      v83 = CFSTR("DOWNLOAD_FAILED_MESSAGE_FORMAT");
    objc_msgSend(v81, "localizedStringForKey:", v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v85, CFSTR("%@ %lu"), 0, v78, objc_msgSend(v6, "count") - 1);
  }
  else
  {
    v84 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "localizedStringForKey:", CFSTR("DOWNLOAD_FAILED_MESSAGE_GENERIC_FORMAT"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v85, CFSTR("%lu"), 0, objc_msgSend(v6, "count") - 1, v88);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_67:
  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v10, v16, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  return v86;
}

- (void)_loadImageForVideoManagedObject:(id)a3 imageType:(unint64_t)a4 download:(id)a5 useForStorageSettings:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  v14 = a5;
  v10 = a3;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sidebandMediaLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageInfoForVideo:imageType:createIfNeeded:wasCreated:", v10, a4, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[VUIDownloadManager _loadImageForImageInfoManagedObject:imageType:download:useForStorageSettings:](self, "_loadImageForImageInfoManagedObject:imageType:download:useForStorageSettings:", v13, a4, v14, v6);

}

- (void)_loadImageForSeriesManagedObject:(id)a3 imageType:(unint64_t)a4 download:(id)a5 useForStorageSettings:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  v14 = a5;
  v10 = a3;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sidebandMediaLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageInfoForSeries:imageType:createIfNeeded:wasCreated:", v10, a4, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[VUIDownloadManager _loadImageForImageInfoManagedObject:imageType:download:useForStorageSettings:](self, "_loadImageForImageInfoManagedObject:imageType:download:useForStorageSettings:", v13, a4, v14, v6);

}

- (void)_loadImageForImageInfoManagedObject:(id)a3 imageType:(unint64_t)a4 download:(id)a5 useForStorageSettings:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double Width;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27[2];
  BOOL v28;
  id location;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  CGRect v35;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "urlFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "canonicalWidth");
  v13 = v12;
  objc_msgSend(v9, "canonicalHeight");
  v15 = v14;
  if (objc_msgSend(v11, "length") && v13 > 0.0 && v15 > 0.0)
  {
    if (v13 <= v15)
      v16 = v15;
    else
      v16 = v13;
    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      Width = CGRectGetWidth(v35);

    }
    else
    {
      Width = 400.0;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1890]), "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v11, 0, CFSTR("jpeg"), v13 * (Width / v16), v15 * (Width / v16), 0.0);
    objc_msgSend(MEMORY[0x1E0DB18A0], "imageURLWithDescription:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_initWeak(&location, v10);
      v21 = (id)sLogObject_20;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        VUIImageTypeString(a4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v22;
        v32 = 2112;
        v33 = v9;
        _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Loading image of type %@ for %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke;
      v25[3] = &unk_1E9FA27F8;
      v27[1] = (id)a4;
      v26 = v9;
      objc_copyWeak(v27, &location);
      v28 = a6;
      objc_msgSend(v23, "dataTaskWithURL:completionHandler:", v20, v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "resume");
      objc_destroyWeak(v27);

      objc_destroyWeak(&location);
    }

  }
}

void __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19[2];
  char v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2;
  block[3] = &unk_1E9FA27D0;
  v10 = *(void **)(a1 + 48);
  v15 = v8;
  v19[1] = v10;
  v16 = *(id *)(a1 + 32);
  v17 = v9;
  v18 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v8;
  objc_copyWeak(v19, (id *)(a1 + 40));
  v20 = *(_BYTE *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v19);

}

void __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = *(void **)(a1 + 32);
  else
    v2 = 0;
  v3 = v2;
  v4 = (void *)sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = objc_msgSend(v3, "statusCode");
    VUIImageTypeString(*(_QWORD *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v21 = 134218498;
    v22 = v6;
    v23 = 2112;
    v24 = (uint64_t)v7;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Received image response with http status %ld for type %@ of %@", (uint8_t *)&v21, 0x20u);

  }
  if (*(_QWORD *)(a1 + 48) || objc_msgSend(v3, "statusCode") < 200 || objc_msgSend(v3, "statusCode") > 399)
  {
    v20 = (void *)sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
      __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2_cold_2(a1, v20, (uint64_t *)(a1 + 48));
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 56), "length");
    v10 = (void *)sLogObject_20;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 72);
        v12 = v10;
        VUIImageTypeString(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(*(id *)(a1 + 56), "length");
        v21 = 138412546;
        v22 = (uint64_t)v13;
        v23 = 2048;
        v24 = v14;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Received image of type %@ with length %lu", (uint8_t *)&v21, 0x16u);

      }
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 40), "imageData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 80))
        objc_msgSend(WeakRetained, "setStorageSettingsImageData:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v16, "setData:", *(_QWORD *)(a1 + 56));
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sidebandMediaLibrary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "saveChangesToManagedObjects");

      if (v16)
      {
        objc_msgSend(v16, "managedObjectContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "refreshObject:mergeChanges:", v16, 0);

      }
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_ERROR))
    {
      __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2_cold_1();
    }
  }

}

- (void)_loadStorageSettingsImageFromMediaLibraryForVideoManagedObject:(id)a3 download:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "adamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Looking up artwork for adam ID %@ to use with storage settings", buf, 0xCu);
    }
    v8 = (void *)MEMORY[0x1E0CC23F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vui_mediaItemForStoreIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = _loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download__dispatchQueueNum++;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VUIDownloadManager media library image load queue %d"), v11);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);

      objc_initWeak((id *)buf, v5);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke;
      block[3] = &unk_1E9F9C058;
      v15 = v10;
      objc_copyWeak(&v17, (id *)buf);
      v16 = v6;
      dispatch_async(v13, block);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);

    }
  }

}

void __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  UIImage *v4;
  UIImage *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  objc_msgSend(a1[4], "artworkCatalog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "hasImageOnDisk"))
    {
      objc_msgSend(v3, "bestImageFromDisk");
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        UIImageJPEGRepresentation(v4, 1.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_2;
        block[3] = &unk_1E9F99000;
        objc_copyWeak(&v14, a1 + 6);
        v12 = v6;
        v13 = a1[5];
        v7 = v6;
        dispatch_async(MEMORY[0x1E0C80D38], block);

        objc_destroyWeak(&v14);
      }

    }
    else
    {
      objc_msgSend(v3, "setFittingSize:", *MEMORY[0x1E0CC1D20], *(double *)(MEMORY[0x1E0CC1D20] + 8));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_135;
      v8[3] = &unk_1E9FA2820;
      objc_copyWeak(&v10, a1 + 6);
      v9 = a1[5];
      objc_msgSend(v3, "requestImageWithCompletion:", v8);

      objc_destroyWeak(&v10);
    }
  }

}

void __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v3 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Retrieved image data (on-disk) for adam ID %@ to use with storage settings", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(WeakRetained, "setStorageSettingsImageData:", *(_QWORD *)(a1 + 32));
  }

}

void __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_135(uint64_t a1, UIImage *image)
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  if (image)
  {
    UIImageJPEGRepresentation(image, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_2_136;
    block[3] = &unk_1E9F99000;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    v4 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v8);
  }
}

void __94__VUIDownloadManager__loadStorageSettingsImageFromMediaLibraryForVideoManagedObject_download___block_invoke_2_136(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v3 = sLogObject_20;
    if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Retrieved image data (requested from network) for adam ID %@ to use with storage settings", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(WeakRetained, "setStorageSettingsImageData:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_activeAccountDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = sLogObject_20;
  if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Active account did change.  Cancelling in-progress downloads for user that is no longer signed in.", buf, 2u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VUIDownloadManager__activeAccountDidChange___block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __46__VUIDownloadManager__activeAccountDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  uint8_t v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "downloads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = *MEMORY[0x1E0DB1A50];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "mediaItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mediaItemMetadataForProperty:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v14 = v4 == 0;
        else
          v14 = 1;
        if (v14 || (objc_msgSend(v13, "isEqualToNumber:", v4) & 1) == 0)
        {
          objc_msgSend(v11, "cancel");
        }
        else
        {
          v15 = sLogObject_20;
          if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Allowing download to continue after account change since download is for the current user", v16, 2u);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

- (id)_createMediaItemForVideoManagedObject:(id)a3 isForStartingDownload:(BOOL)a4 downloadQuality:(int64_t)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  VUIStoreMediaItem_iOS *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "entitlementType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(v7, "adamID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[VUIStoreMediaItem_iOS initWithAdamID:videoManagedObject:isForStartingDownload:]([VUIStoreMediaItem_iOS alloc], "initWithAdamID:videoManagedObject:isForStartingDownload:", objc_msgSend(v10, "longLongValue"), v7, v6);

    -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](v11, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iTunesLibraryPlaybackMediaMetricsForAdamID:mediaType:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v15, *MEMORY[0x1E0DB1B88]);
    v7 = v10;
  }
  else
  {
    v11 = -[VUIStoreAuxMediaItem initWithVideoManagedObject:isForStartingDownload:]([VUIStoreAuxMediaItem alloc], "initWithVideoManagedObject:isForStartingDownload:", v7, v6);
  }

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v16, CFSTR("VUIContentMetadataDownloadQuality"));

  }
  return v11;
}

- (void)_configureDownloadFromUserPrefs:(id)a3 allowCellular:(BOOL)a4 quality:(int64_t)a5 prefer3DOrImmersiveDownload:(BOOL)a6
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  __CFString *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v40;
  _BOOL4 v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v41 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredAudioDownloadLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "useDefaultSubtitleDownloadLanguages");

  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredSubtitleDownloadLanguages");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "preferAVAdapterCompatibility");

  v15 = objc_msgSend(v9, "containsObject:", CFSTR("DEFAULT_LANGUAGE"));
  if ((_DWORD)v15)
    objc_msgSend(v9, "removeObject:", CFSTR("DEFAULT_LANGUAGE"));
  v16 = objc_msgSend(v9, "containsObject:", CFSTR("ORIGINAL_AUDIO_LANGUAGE"));
  if ((_DWORD)v16)
    objc_msgSend(v9, "removeObject:", CFSTR("ORIGINAL_AUDIO_LANGUAGE"));
  v17 = objc_msgSend(v9, "containsObject:", CFSTR("DEVICE_AUDIO_LANGUAGE"));
  if ((_DWORD)v17)
    objc_msgSend(v9, "removeObject:", CFSTR("DEVICE_AUDIO_LANGUAGE"));
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferredAudioLanguageCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preferredAudioLanguageCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v21);

  }
  if ((v11 & 1) != 0)
    v22 = 0;
  else
    v22 = v40;
  objc_msgSend(v6, "setAllowCellularUsage:", v41);
  objc_msgSend(v6, "setIncludeDefaultAudioOption:", v15);
  objc_msgSend(v6, "setIncludeOriginalAudio:", v16);
  objc_msgSend(v6, "setIncludeDeviceLanguageAudio:", v17);
  objc_msgSend(v6, "setPreferredAudioLanguageCodes:", v9);
  objc_msgSend(v6, "setAllowMultichannelAudio:", 1);
  objc_msgSend(v6, "setIncludesAllSubtitles:", 0);
  objc_msgSend(v6, "setPreferredSubtitleLanguageCodes:", v22);
  objc_msgSend(v6, "setPreferMostCompatibleRendition:", v14);
  objc_msgSend(v6, "setLimitMultichannelAudioToSingleLanguage:", 1);
  v23 = objc_msgSend(MEMORY[0x1E0CFDA50], "deviceIsiPad");
  if (!a5)
  {
    if ((v23 & 1) == 0)
    {
      v37 = MGGetSInt32Answer();
      v38 = sLogObject_20;
      if (os_log_type_enabled((os_log_t)sLogObject_20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v43 = v37;
        _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "Screen class: %ld", buf, 0xCu);
      }
      if (v37 > 8)
      {
        if (v37 == 9)
        {
          v27 = 0;
          v26 = &unk_1EA0B9E20;
          v25 = &unk_1EA0B9DF0;
          v24 = &unk_1EA0B9E08;
          v28 = &unk_1EA0BBD38;
          goto LABEL_23;
        }
        if (v37 == 19)
        {
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 1;
          v28 = &unk_1EA0BBD48;
          goto LABEL_23;
        }
      }
      else
      {
        if (v37 == 5)
        {
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 1;
          v28 = &unk_1EA0BBD78;
          goto LABEL_23;
        }
        if (v37 == 8)
        {
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 1;
          v28 = &unk_1EA0BBD68;
          goto LABEL_23;
        }
      }
    }
    v27 = 0;
    v25 = &unk_1EA0B9E20;
    v24 = &unk_1EA0B9E38;
    v28 = &unk_1EA0BBD38;
    v26 = &unk_1EA0B9E20;
    goto LABEL_23;
  }
  if ((v23 & 1) != 0)
  {
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 1;
    v28 = &unk_1EA0BBD58;
  }
  else
  {
    v29 = MGGetSInt32Answer();
    v30 = &unk_1EA0BBD68;
    if (v29 == 8)
      v30 = &unk_1EA0BBD78;
    if (v29 == 5)
      v28 = &unk_1EA0BBD88;
    else
      v28 = v30;
    v27 = 1;
    v24 = 0;
    v25 = 0;
    v26 = 0;
  }
LABEL_23:
  objc_msgSend(v6, "setMaximumPresentationWidth:", v28);
  objc_msgSend(v6, "setMaximumAverageBitrateForHDR:", v24);
  objc_msgSend(v6, "setMaximumAverageBitrateForSDRHEVC:", v25);
  objc_msgSend(v6, "setMaximumAverageBitrateForAVC:", v26);
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v31, "setObject:forKey:", v28, CFSTR("maxWidth"));
  if ((v27 & 1) == 0)
  {
    objc_msgSend(v31, "setObject:forKey:", v24, CFSTR("maximumAverageBitrateForHDR"));
    objc_msgSend(v31, "setObject:forKey:", v25, CFSTR("maximumAverageBitrateForSDRHEVC"));
    objc_msgSend(v31, "setObject:forKey:", v26, CFSTR("maximumAverageBitrateForAVC"));
  }
  v32 = CFSTR("Fast Downloads");
  if (!a5)
    v32 = CFSTR("High Quality");
  v33 = (void *)MEMORY[0x1E0CB37E8];
  v34 = v32;
  objc_msgSend(v33, "numberWithBool:", v41);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKey:", v35, CFSTR("cellularAllowed"));

  objc_msgSend(v31, "setObject:forKey:", v34, CFSTR("downloadQualitySetting"));
  objc_msgSend(v31, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("preferHDR"));
  objc_msgSend(v6, "mediaItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setMediaItemMetadata:forProperty:", v31, *MEMORY[0x1E0DB1A70]);

}

- (void)setMutableDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_mutableDownloads, a3);
}

- (void)setFailedDownloadsNeedingDialog:(id)a3
{
  objc_storeStrong((id *)&self->_failedDownloadsNeedingDialog, a3);
}

- (BOOL)dialogBeingPresented
{
  return self->_dialogBeingPresented;
}

- (void)setDialogBeingPresented:(BOOL)a3
{
  self->_dialogBeingPresented = a3;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (BOOL)performingAddDownloadsBatch
{
  return self->_performingAddDownloadsBatch;
}

- (void)setPerformingAddDownloadsBatch:(BOOL)a3
{
  self->_performingAddDownloadsBatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_failedDownloadsNeedingDialog, 0);
  objc_storeStrong((id *)&self->_mutableDownloads, 0);
}

- (void)addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to add download because video managed object is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Not adding download since one already exists for this item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)fetchNewKeysForDownloadedVideoManagedObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to fetch new keys because video managed object is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)fetchNewKeysForDownloadedVideoManagedObject:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to fetch new keys because video managed object does not allow manual renewal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)fetchNewKeysForDownloadedVideoManagedObject:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to fetch new keys because video managed object is not in state Downloaded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)addDownloadOrRenewKeysForMediaItem:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to fetch new keys or redownload because video managed object is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)download:willDownloadToURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to persist download URL because media item has no adam ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)download:didReceiveTaskIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to persist task identifier because media item has no adam ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)downloadSession:(os_log_t)log didAddRestoredDownloads:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Restored download is failed", buf, 2u);
}

- (void)download:willDownloadVariants:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to save downloaded playback mode because media item has no adam ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_showDownloadErrorDialogIfAppropriateAllowingSignInPrompt:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to find view controller from which to present download error dialog, or another dialog is already being presented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Image has zero length", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __99__VUIDownloadManager__loadImageForImageInfoManagedObject_imageType_download_useForStorageSettings___block_invoke_2_cold_2(uint64_t a1, void *a2, uint64_t *a3)
{
  unint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 72);
  v6 = a2;
  VUIImageTypeString(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = 138412802;
  v11 = v7;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_error_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_ERROR, "Error loading image of type %@: %@ for %@", (uint8_t *)&v10, 0x20u);

}

@end
