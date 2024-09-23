@implementation VUIUniversalAssetController

- (VUIUniversalAssetController)initWithVideoManagedObject:(id)a3
{
  return -[VUIUniversalAssetController initWithVideoManagedObject:mpMediaItem:videosPlayable:](self, "initWithVideoManagedObject:mpMediaItem:videosPlayable:", a3, 0, 0);
}

- (VUIUniversalAssetController)initWithVideosPlayable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  VUIUniversalAssetController *v13;

  v4 = a3;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sidebandMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoForAdamID:useMainThreadContext:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "isiTunesPurchaseOrRental")
    || (objc_msgSend(v4, "isFamilySharingContent") & 1) != 0)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x1E0CC23F0];
  objc_msgSend(v4, "adamID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vui_mediaItemForStoreIdentifierString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[VUIUniversalAssetController initWithVideosPlayable:].cold.1(v4, v12);

    goto LABEL_7;
  }
LABEL_8:
  v13 = -[VUIUniversalAssetController initWithVideoManagedObject:mpMediaItem:videosPlayable:](self, "initWithVideoManagedObject:mpMediaItem:videosPlayable:", v8, v11, v4);

  return v13;
}

- (VUIUniversalAssetController)initWithMPMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VUIUniversalAssetController *v9;

  v4 = a3;
  objc_msgSend(v4, "vui_adamIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sidebandMediaLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoForAdamID:useMainThreadContext:", v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = -[VUIUniversalAssetController initWithVideoManagedObject:mpMediaItem:videosPlayable:](self, "initWithVideoManagedObject:mpMediaItem:videosPlayable:", v8, v4, 0);

  return v9;
}

- (VUIUniversalAssetController)initWithVideoManagedObject:(id)a3 mpMediaItem:(id)a4 videosPlayable:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUIUniversalAssetController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  VUIMediaEntityAssetControllerState *v15;
  VUIMediaEntityAssetControllerState *stateInternal;
  VUIVideoManagedObject *videoManagedObject;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_super v31;
  uint8_t buf[4];
  VUIUniversalAssetController *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)VUIUniversalAssetController;
  v11 = -[VUIUniversalAssetController init](&v31, sel_init);
  if (v11)
  {
    if (v8)
    {
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sidebandMediaLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mainContextVideoForVideo:", v8);
      v14 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v14;
    }
    objc_storeStrong((id *)&v11->_videoManagedObject, v8);
    objc_storeStrong((id *)&v11->_mpMediaItem, a4);
    objc_storeStrong((id *)&v11->_videosPlayable, a5);
    objc_storeStrong((id *)&v11->_completionDispatchQueueInternal, MEMORY[0x1E0C80D38]);
    v15 = objc_alloc_init(VUIMediaEntityAssetControllerState);
    stateInternal = v11->_stateInternal;
    v11->_stateInternal = v15;

    -[VUIMediaEntityAssetControllerState setStatus:](v11->_stateInternal, "setStatus:", 0);
    -[VUIMediaEntityAssetControllerState setDownloadProgress:](v11->_stateInternal, "setDownloadProgress:", -1.0);
    -[VUIMediaEntityAssetControllerState setSupportsCancellation:](v11->_stateInternal, "setSupportsCancellation:", 1);
    -[VUIMediaEntityAssetControllerState setSupportsPausing:](v11->_stateInternal, "setSupportsPausing:", 1);
    videoManagedObject = v11->_videoManagedObject;
    if (videoManagedObject)
    {
      -[VUIVideoManagedObject addObserver:forKeyPath:options:context:](videoManagedObject, "addObserver:forKeyPath:options:context:", v11, CFSTR("downloadState"), 0, __VideoManagedObjectDownloadStateKVOContext);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIVideoManagedObject objectID](v11->_videoManagedObject, "objectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", v11, sel__videoManagedObjectPlaybackExpirationDidChange_, CFSTR("VUIVideoManagedObjectPlaybackExpirationDidChangeNotification"), v19);

    }
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x1E0CC1FF8];
      objc_msgSend(v9, "mediaLibrary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", v11, sel__handleMediaLibraryContentsDidChangeNotification_, v21, v22);

      objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:forDownloads:", v11, 0);

      objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "downloadForMediaItem:", v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        VUIDefaultLogObject();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v11;
          v34 = 2112;
          v35 = v25;
          _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "%@ Setting store download to: %@", buf, 0x16u);
        }

        objc_storeStrong((id *)&v11->_storeDownload, v25);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v11, sel__videoManagedObjectWasCreated_, CFSTR("VUIUniversalAssetControllerDidCreateVideoManagedObject"), 0);

    +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addDelegate:", v11);

    -[VUIUniversalAssetController _updateObservedDownload](v11, "_updateObservedDownload");
    -[VUIUniversalAssetController _updateDownloadStateAndNotifyListeners](v11, "_updateDownloadStateAndNotifyListeners");
    VUIDefaultLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v11;
      _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "%@ created ", buf, 0xCu);
    }

  }
  return v11;
}

- (id)_adamIDString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vui_adamIDString");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v4, "adamID");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = (void *)v6;

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  VUIUniversalAssetController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[VUIVideoManagedObject removeObserver:forKeyPath:context:](self->_videoManagedObject, "removeObserver:forKeyPath:context:", self, CFSTR("downloadState"), __VideoManagedObjectDownloadStateKVOContext);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_mpMediaItem)
  {
    objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forDownloads:", self, 0);

  }
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "%@ deallocated ", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)VUIUniversalAssetController;
  -[VUIUniversalAssetController dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if ((void *)__VideoManagedObjectDownloadStateKVOContext == a6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__VUIUniversalAssetController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E9F98DF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUIUniversalAssetController;
    -[VUIUniversalAssetController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __78__VUIUniversalAssetController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDownloadStateAndNotifyListeners");
}

- (void)setVideoManagedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  VUIVideoManagedObject *v8;
  VUIVideoManagedObject *videoManagedObject;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VUIVideoManagedObject *obja;
  VUIVideoManagedObject *obj;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sidebandMediaLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mainContextVideoForVideo:", v5);
    obja = (VUIVideoManagedObject *)objc_claimAutoreleasedReturnValue();

    v8 = obja;
  }
  else
  {
    v8 = 0;
  }
  videoManagedObject = self->_videoManagedObject;
  if (videoManagedObject != v8)
  {
    obj = v8;
    if (videoManagedObject)
    {
      -[VUIVideoManagedObject removeObserver:forKeyPath:context:](videoManagedObject, "removeObserver:forKeyPath:context:", self, CFSTR("downloadState"), __VideoManagedObjectDownloadStateKVOContext);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIVideoManagedObject objectID](self->_videoManagedObject, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("VUIVideoManagedObjectPlaybackExpirationDidChangeNotification"), v11);

      v8 = obj;
    }
    objc_storeStrong((id *)&self->_videoManagedObject, v8);
    if (obj)
    {
      -[VUIVideoManagedObject addObserver:forKeyPath:options:context:](obj, "addObserver:forKeyPath:options:context:", self, CFSTR("downloadState"), 0, __VideoManagedObjectDownloadStateKVOContext);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIVideoManagedObject objectID](self->_videoManagedObject, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__videoManagedObjectPlaybackExpirationDidChange_, CFSTR("VUIVideoManagedObjectPlaybackExpirationDidChangeNotification"), v13);

    }
    -[VUIUniversalAssetController _updateObservedDownload](self, "_updateObservedDownload");
    -[VUIUniversalAssetController _updateDownloadStateAndNotifyListeners](self, "_updateDownloadStateAndNotifyListeners");
    v8 = obj;
  }

}

- (BOOL)supportsStartingDownload
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ams_activeiTunesAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ams_DSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11 != 0;
LABEL_8:

    goto LABEL_9;
  }
  -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  if (!v6)
    return 0;
  -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0CC1F68]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqual:", &unk_1EA0B9568) & 1) == 0)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ams_activeiTunesAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ams_DSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "isEqual:", v8);

      goto LABEL_8;
    }
    return 0;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)supportsRedownloadingContent
{
  void *v2;
  BOOL v3;

  -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)contentAllowsCellularDownload
{
  return 1;
}

- (void)setCompletionDispatchQueue:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    v5 = MEMORY[0x1E0C80D38];
    v4 = (id)MEMORY[0x1E0C80D38];
  }
  v6 = v4;
  -[VUIUniversalAssetController setCompletionDispatchQueueInternal:](self, "setCompletionDispatchQueueInternal:", v4);

}

- (void)startDownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 prefer3DOrImmersiveDownload:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id *v17;
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a6;
  v8 = a5;
  v10 = a3;
  v12 = a7;
  if (-[VUIUniversalAssetController supportsStartingDownload](self, "supportsStartingDownload"))
  {
    if (_os_feature_enabled_impl())
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaDownloadQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "addDownload:allowCellular:downloadQuality:markAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:", self, v10, a4, v8, v7);
    }
    else
    {
      -[VUIUniversalAssetController startDownloadImmediatelyWithoutEnqueueingAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:](self, "startDownloadImmediatelyWithoutEnqueueingAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:", v10, a4, v8, v7);
    }
    -[VUIUniversalAssetController completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __151__VUIUniversalAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_2;
    v21[3] = &unk_1E9F98E68;
    v17 = &v22;
    v22 = v12;
    v20 = v12;
    v19 = v21;
  }
  else
  {
    VUIDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[VUIUniversalAssetController startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:].cold.1();

    -[VUIUniversalAssetController completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __151__VUIUniversalAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke;
    v23[3] = &unk_1E9F98E68;
    v17 = &v24;
    v24 = v12;
    v18 = v12;
    v19 = v23;
  }
  dispatch_async(v16, v19);

}

uint64_t __151__VUIUniversalAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __151__VUIUniversalAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)startDownloadImmediatelyWithoutEnqueueingAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 prefer3DOrImmersiveDownload:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v9;
  void *v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  -[VUIUniversalAssetController _createAndSaveVideoManagedObjectForDownloadInitiation](self, "_createAndSaveVideoManagedObjectForDownloadInitiation");
  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addDownloadForVideoManagedObject:allowCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:", v12, v9, a4, v7, v6);

}

- (void)deleteAndRedownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  id v13;

  v6 = a5;
  v8 = a3;
  v13 = a6;
  -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = -[VUIUniversalAssetController _isVideoFullyDownloadedCheckingSidebandLibrary:](self, "_isVideoFullyDownloadedCheckingSidebandLibrary:", 0);

    if (v12)
      -[VUIUniversalAssetController cancelAndRemoveDownload](self, "cancelAndRemoveDownload");
  }
  -[VUIUniversalAssetController startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:](self, "startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:", v8, a4, v6, 1, v13);

}

- (void)fetchNewKeysForDownloadedVideo
{
  void *v2;
  id v3;

  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchNewKeysForDownloadedVideoManagedObject:", v3);

}

- (void)pauseDownload
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adamID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingDownloadForAdamID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pause");
}

- (void)resumeDownload
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adamID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingDownloadForAdamID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "start");
}

- (void)cancelAndRemoveDownload
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "%@ Unable to delete download", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

void __54__VUIUniversalAssetController_cancelAndRemoveDownload__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  +[VUIRentalManager sharedInstance](VUIRentalManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__VUIUniversalAssetController_cancelAndRemoveDownload__block_invoke_2;
  v5[3] = &unk_1E9F9C6F8;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  objc_msgSend(v2, "checkInRentalWithID:dsid:completion:", v3, v4, v5);

  objc_destroyWeak(&v6);
}

void __54__VUIUniversalAssetController_cancelAndRemoveDownload__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    VUIBoolLogString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "%@ Finished checking-in rental, success:[%@], error:[%@]", (uint8_t *)&v9, 0x20u);

  }
}

- (void)cancelKeyFetch
{
  void *v2;
  void *v3;
  id v4;

  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adamID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelDownloadForAdamID:", v2);

}

- (VUIContentRating)contentRating
{
  void *v3;
  void *v4;
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

  -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vui_contentRating");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    return (VUIContentRating *)v5;
  }
  -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ratingName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ratingSystem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length") && objc_msgSend(v4, "length"))
    {
      -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ratingValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC69A0]), "initWithRatingSystemString:ratingLabel:rank:ratingDescription:", v11, v4, objc_msgSend(v14, "unsignedIntegerValue"), 0);
    }
    else
    {
      v5 = 0;
    }

    goto LABEL_10;
  }
  v5 = 0;
  return (VUIContentRating *)v5;
}

- (NSString)brandName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "brandName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "channelName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)brandID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "brandID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "channelID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (BOOL)allowsManualDownloadRenewal
{
  void *v2;
  char v3;

  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsManualRenewal");

  return v3;
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  -[VUIUniversalAssetController _updateObservedDownload](self, "_updateObservedDownload", a3);
  -[VUIUniversalAssetController _updateDownloadStateAndNotifyListeners](self, "_updateDownloadStateAndNotifyListeners");
}

- (void)downloadManager:(id)a3 didAddDownloads:(id)a4 removeDownloads:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__VUIUniversalAssetController_downloadManager_didAddDownloads_removeDownloads___block_invoke;
  block[3] = &unk_1E9F99840;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __79__VUIUniversalAssetController_downloadManager_didAddDownloads_removeDownloads___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "mpMediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = a1[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v10, "storeItemIdentifier") == v4)
        {
          VUIDefaultLogObject();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = a1[4];
            *(_DWORD *)buf = 138412546;
            v38 = v12;
            v39 = 2112;
            v40 = v10;
            _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "%@ Store download added: %@", buf, 0x16u);
          }

          objc_msgSend(a1[4], "setStoreDownload:", v10);
          objc_msgSend(a1[4], "_updateDownloadStateAndNotifyListeners");
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v7);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = a1[6];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v29;
    *(_QWORD *)&v15 = 138412290;
    v27 = v15;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        if (objc_msgSend(v19, "storeItemIdentifier", v27) == v4)
        {
          VUIDefaultLogObject();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = a1[4];
            *(_DWORD *)buf = 138412546;
            v38 = v21;
            v39 = 2112;
            v40 = v19;
            _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "%@ Store download removed: %@", buf, 0x16u);
          }

          objc_msgSend(a1[4], "storeDownload");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isFinished");

          if ((v23 & 1) == 0)
          {
            objc_msgSend(a1[4], "storeDownload");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              VUIDefaultLogObject();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = a1[4];
                *(_DWORD *)buf = v27;
                v38 = v26;
                _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "%@ Setting store download to nil", buf, 0xCu);
              }

              objc_msgSend(a1[4], "setStoreDownload:", 0);
              objc_msgSend(a1[4], "_updateDownloadStateAndNotifyListeners");
            }
          }
        }
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

}

- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  VUIUniversalAssetController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__VUIUniversalAssetController_downloadManager_downloadDidProgress___block_invoke;
  v7[3] = &unk_1E9F98FD8;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __67__VUIUniversalAssetController_downloadManager_downloadDidProgress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "storeDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 40), "_updateDownloadStateAndNotifyListeners");
}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  VUIUniversalAssetController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__VUIUniversalAssetController_downloadManager_downloadDidFinish___block_invoke;
  v7[3] = &unk_1E9F98FD8;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __65__VUIUniversalAssetController_downloadManager_downloadDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "storeDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 40), "_updateDownloadStateAndNotifyListeners");
}

- (void)_updateObservedDownload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIUniversalAssetController download](self, "download");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingDownloadForAdamID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v3)
  {
    objc_msgSend(v6, "addDelegate:", self);
    objc_msgSend(v3, "removeDelegate:", self);
    -[VUIUniversalAssetController setDownload:](self, "setDownload:", v6);
  }

}

- (void)_updateDownloadStateAndNotifyListeners
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  VUIMediaEntityAssetControllerState *v26;
  void *v27;
  id v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  NSObject *queue;
  _QWORD block[4];
  id v41;
  id v42;
  const __CFString *v43;
  VUIMediaEntityAssetControllerState *v44;
  uint8_t buf[4];
  VUIUniversalAssetController *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIUniversalAssetController completionDispatchQueueInternal](self, "completionDispatchQueueInternal");
  queue = objc_claimAutoreleasedReturnValue();
  -[VUIUniversalAssetController download](self, "download");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIUniversalAssetController _isVideoFullyDownloadedCheckingSidebandLibrary:](self, "_isVideoFullyDownloadedCheckingSidebandLibrary:", 1);
  v6 = v5;
  if (v5)
  {
    -[VUIUniversalAssetController storeDownload](self, "storeDownload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      VUIDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = self;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "%@ Setting store download to nil", buf, 0xCu);
      }

      -[VUIUniversalAssetController setStoreDownload:](self, "setStoreDownload:", 0);
    }
    v9 = 4;
    if (v3)
      goto LABEL_7;
LABEL_10:
    v17 = 0;
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v11 = 0;
    goto LABEL_12;
  }
  v9 = 0;
  if (!v3)
    goto LABEL_10;
LABEL_7:
  v10 = objc_msgSend(v3, "downloadState");
  objc_msgSend(v3, "expirationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "offlineKeyRenewalPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availabilityEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "allowsCellular");
  v15 = objc_msgSend(v3, "downloadFailedDueToError");
  if (v10 == 2)
  {
    v16 = -1.0;
    v9 = 4;
    v17 = v15;
    goto LABEL_29;
  }
  v17 = v15;
LABEL_12:
  v16 = -1.0;
  if (v6)
  {
LABEL_13:
    v9 = 4;
  }
  else if (v4)
  {
    switch(objc_msgSend(v4, "state"))
    {
      case 0:
      case 4:
      case 5:
        v9 = 0;
        break;
      case 1:
        objc_msgSend(v4, "progress");
        v16 = v29;
        v9 = 2;
        break;
      case 2:
        v9 = 3;
        break;
      case 3:
        goto LABEL_13;
      case 6:
        v9 = 1;
        break;
      default:
        break;
    }
  }
  else
  {
    v37 = v14;
    v38 = v17;
    -[VUIUniversalAssetController storeDownload](self, "storeDownload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[VUIUniversalAssetController storeDownload](self, "storeDownload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "percentComplete");
      v16 = v20;

      -[VUIUniversalAssetController storeDownload](self, "storeDownload");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "phaseIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CC2280]) & 1) != 0
        || (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CC22A8]) & 1) != 0
        || (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CC22B0]) & 1) != 0
        || objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CC2298]))
      {
        v23 = v22;
        if (v16 > 0.00000011920929)
          v9 = 2;
        else
          v9 = 1;
      }
      else if ((objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CC2288]) & 1) != 0)
      {
        v23 = v22;
        v9 = 0;
        v38 = 1;
      }
      else if ((objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CC2278]) & 1) != 0)
      {
        v23 = v22;
        v9 = 0;
      }
      else if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CC2290]))
      {
        v23 = v22;
        -[VUIUniversalAssetController storeDownload](self, "storeDownload");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "failureError");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31)
        {
          v33 = v31;
        }
        else
        {
          -[VUIUniversalAssetController storeDownload](self, "storeDownload");
          v36 = v30;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "purchaseError");
          v33 = (id)objc_claimAutoreleasedReturnValue();

          v30 = v36;
        }

        v9 = 4 * (v33 == 0);
        v35 = v38;
        if (v33)
          v35 = 1;
        v38 = v35;

      }
      else
      {
        v23 = v22;
        if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CC22A0]))
          v9 = 3;
        else
          v9 = 1;
      }
      -[VUIUniversalAssetController storeDownload](self, "storeDownload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isCanceled");

      if (v25)
        v9 = 0;

    }
    v14 = v37;
    v17 = v38;
  }
LABEL_29:
  v26 = objc_alloc_init(VUIMediaEntityAssetControllerState);
  -[VUIMediaEntityAssetControllerState setStatus:](v26, "setStatus:", v9);
  -[VUIMediaEntityAssetControllerState setDownloadProgress:](v26, "setDownloadProgress:", v16);
  -[VUIMediaEntityAssetControllerState setDownloadFailedDueToError:](v26, "setDownloadFailedDueToError:", v17);
  -[VUIMediaEntityAssetControllerState setSupportsCancellation:](v26, "setSupportsCancellation:", 1);
  -[VUIMediaEntityAssetControllerState setSupportsPausing:](v26, "setSupportsPausing:", 1);
  -[VUIMediaEntityAssetControllerState setDownloadExpirationDate:](v26, "setDownloadExpirationDate:", v11);
  -[VUIMediaEntityAssetControllerState setRenewsOfflineKeysAutomatically:](v26, "setRenewsOfflineKeysAutomatically:", objc_msgSend(v12, "integerValue") == 1);
  -[VUIMediaEntityAssetControllerState setAvailabilityEndDate:](v26, "setAvailabilityEndDate:", v13);
  -[VUIMediaEntityAssetControllerState setAllowsCellular:](v26, "setAllowsCellular:", v14);
  if (v4)
    -[VUIMediaEntityAssetControllerState setPerformsKeyFetchOnly:](v26, "setPerformsKeyFetchOnly:", objc_msgSend(v4, "performKeyFetchOnly"));
  -[VUIUniversalAssetController setStateInternal:](self, "setStateInternal:", v26);
  if (v26)
  {
    v43 = CFSTR("VUIMediaEntityAssetControllerStateKey");
    v44 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VUIUniversalAssetController__updateDownloadStateAndNotifyListeners__block_invoke;
  block[3] = &unk_1E9F9A938;
  objc_copyWeak(&v42, (id *)buf);
  v41 = v27;
  v28 = v27;
  dispatch_async(queue, block);

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);

}

void __69__VUIUniversalAssetController__updateDownloadStateAndNotifyListeners__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VUIMediaEntityAssetControllerStateDidChangeNotification"), WeakRetained, *(_QWORD *)(a1 + 32));

  }
}

- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD block[5];

  -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CC1ED0];
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0CC1ED0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CC2438]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFilterPredicates:", v9);

    objc_msgSend(v10, "setEntityLimit:", 1);
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__VUIUniversalAssetController__handleMediaLibraryContentsDidChangeNotification___block_invoke;
    block[3] = &unk_1E9F98DF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __80__VUIUniversalAssetController__handleMediaLibraryContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDownloadStateAndNotifyListeners");
}

- (void)_videoManagedObjectPlaybackExpirationDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (v7 == v6)
    {
      -[VUIUniversalAssetController _updateDownloadStateAndNotifyListeners](self, "_updateDownloadStateAndNotifyListeners");
      v4 = v7;
    }
  }

}

- (void)_videoManagedObjectWasCreated:(id)a3
{
  id v4;
  VUIUniversalAssetController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  VUIUniversalAssetController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (VUIUniversalAssetController *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("VUIUniversalAssetControllerAdamIDStringKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "vui_adamIDString");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
        else
          -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "adamID");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v10;

      if (v12 && objc_msgSend(v12, "isEqualToString:", v7))
      {
        VUIDefaultLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138412546;
          v17 = self;
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "%@ updating videoManagedObject with adam ID %@", (uint8_t *)&v16, 0x16u);
        }

        objc_msgSend(v4, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("VUIUniversalAssetControllerVideoManagedObjectkey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[VUIUniversalAssetController setVideoManagedObject:](self, "setVideoManagedObject:", v15);
      }

    }
  }

}

- (void)_createAndSaveVideoManagedObjectForDownloadInitiation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "%@ Unable to create video managed object since MPMediaItem and playable are both nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (id)_createAndSaveVideoManagedObjectForPlayable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VUIMediaStartTimeCollection *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sidebandMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoForPlayable:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "startTimeInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(VUIMediaStartTimeCollection);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        -[VUIMediaStartTimeCollection addStartTimeInfo:](v8, "addStartTimeInfo:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13++), (_QWORD)v21);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  -[VUIMediaStartTimeCollection preferredStartTimeInfo](v8, "preferredStartTimeInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "type"))
  {
    objc_msgSend(v14, "startTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBookmarkTime:", v17);

    objc_msgSend(v14, "timestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBookmarkTimeStamp:", v16);
    goto LABEL_12;
  }
  if (objc_msgSend(v14, "type") == 1)
  {
    objc_msgSend(v14, "startTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMainContentRelativeBookmarkTime:", v15);

    objc_msgSend(v14, "timestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMainContentRelativeBookmarkTimeStamp:", v16);
LABEL_12:

  }
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager", (_QWORD)v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sidebandMediaLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "saveChangesToManagedObjects");

  return v6;
}

- (id)_createAndSaveVideoManagedObjectForMPMediaItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sidebandMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoForMPMediaItem:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isVideoFullyDownloadedCheckingSidebandLibrary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  void *v16;

  v3 = a3;
  -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    LOBYTE(v15) = 0;
LABEL_12:
    if (v3)
    {
      -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v16, "downloadState") == 2;

    }
    return v15;
  }
  -[VUIUniversalAssetController mpMediaItem](self, "mpMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CC1E80];
  v8 = *MEMORY[0x1E0CC1EB0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1E80], *MEMORY[0x1E0CC1EB0], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valuesForProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (v14 || !objc_msgSend(v11, "BOOLValue"))
    LOBYTE(v15) = 0;
  else
    v15 = objc_msgSend(v13, "BOOLValue") ^ 1;

  if ((v15 & 1) == 0)
    goto LABEL_12;
  return v15;
}

- (id)showCanonicalId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;

  -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "showCanonicalId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v6 = 0;
      return v6;
    }
    -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "series");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "canonicalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)seasonCanonicalId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;

  -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIUniversalAssetController videosPlayable](self, "videosPlayable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "seasonCanonicalId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v6 = 0;
      return v6;
    }
    -[VUIUniversalAssetController videoManagedObject](self, "videoManagedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "season");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "canonicalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIUniversalAssetController;
  v3 = -[VUIUniversalAssetController hash](&v7, sel_hash);
  -[VUIUniversalAssetController _adamIDString](self, "_adamIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 ^= objc_msgSend(v4, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUIUniversalAssetController *v4;
  VUIUniversalAssetController *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = (VUIUniversalAssetController *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[VUIUniversalAssetController _adamIDString](v5, "_adamIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIUniversalAssetController _adamIDString](self, "_adamIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = 0;
    if (v6 && v7)
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[VUIUniversalAssetController _adamIDString](self, "_adamIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("assetController with adamID: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (VUIVideoManagedObject)videoManagedObject
{
  return self->_videoManagedObject;
}

- (MPMediaItem)mpMediaItem
{
  return self->_mpMediaItem;
}

- (void)setMpMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mpMediaItem, a3);
}

- (VUIVideosPlayable)videosPlayable
{
  return self->_videosPlayable;
}

- (void)setVideosPlayable:(id)a3
{
  objc_storeStrong((id *)&self->_videosPlayable, a3);
}

- (OS_dispatch_queue)completionDispatchQueueInternal
{
  return self->_completionDispatchQueueInternal;
}

- (void)setCompletionDispatchQueueInternal:(id)a3
{
  objc_storeStrong((id *)&self->_completionDispatchQueueInternal, a3);
}

- (VUIMediaEntityAssetControllerState)stateInternal
{
  return self->_stateInternal;
}

- (void)setStateInternal:(id)a3
{
  objc_storeStrong((id *)&self->_stateInternal, a3);
}

- (TVPDownload)download
{
  return self->_download;
}

- (void)setDownload:(id)a3
{
  objc_storeStrong((id *)&self->_download, a3);
}

- (MPStoreDownload)storeDownload
{
  return self->_storeDownload;
}

- (void)setStoreDownload:(id)a3
{
  objc_storeStrong((id *)&self->_storeDownload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDownload, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong((id *)&self->_stateInternal, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueueInternal, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
  objc_storeStrong((id *)&self->_mpMediaItem, 0);
  objc_storeStrong((id *)&self->_videoManagedObject, 0);
}

- (void)initWithVideosPlayable:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "adamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_14();
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUIUniversalAssetController unable to retrieve MPMediaItem for adam ID %@", v4, 0xCu);

}

- (void)startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "%@ Not starting download since supportsStartingDownload is NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

@end
