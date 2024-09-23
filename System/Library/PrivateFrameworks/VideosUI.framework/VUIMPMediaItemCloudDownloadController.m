@implementation VUIMPMediaItemCloudDownloadController

- (VUIMPMediaItemCloudDownloadController)initWithMediaItem:(id)a3 serialProcessingDispatchQueue:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  VUIMPMediaItemCloudDownloadController *v13;
  VUIMPMediaItemCloudDownloadController *v14;
  VUIMPMediaItemCloudDownloadController *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "downloadForStoreID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "_stateFromStoreDownload:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20.receiver = self;
    v20.super_class = (Class)VUIMPMediaItemCloudDownloadController;
    v13 = -[VUIMPMediaItemDownloadController initWithMediaItem:state:serialProcessingDispatchQueue:](&v20, sel_initWithMediaItem_state_serialProcessingDispatchQueue_, v6, v12, v7);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_storeDownload, v11);
      if (objc_msgSend(v12, "status") || objc_msgSend(v12, "status") != 1)
      {
        objc_initWeak(&location, v14);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __89__VUIMPMediaItemCloudDownloadController_initWithMediaItem_serialProcessingDispatchQueue___block_invoke;
        v17[3] = &unk_1E9F99C98;
        objc_copyWeak(&v18, &location);
        dispatch_async(v7, v17);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        -[VUIMPMediaItemCloudDownloadController _addStoreObserver](v14, "_addStoreObserver");
      }
    }
    self = v14;

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __89__VUIMPMediaItemCloudDownloadController_initWithMediaItem_serialProcessingDispatchQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_addStoreObserver");
    WeakRetained = v2;
  }

}

- (VUIMPMediaItemCloudDownloadController)initWithMediaItem:(id)a3 state:(id)a4 serialProcessingDispatchQueue:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("The %@ initializer is not available."), v8);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[VUIMPMediaItemCloudDownloadController _removeStoreObserver](self, "_removeStoreObserver");
  v3.receiver = self;
  v3.super_class = (Class)VUIMPMediaItemCloudDownloadController;
  -[VUIMPMediaItemCloudDownloadController dealloc](&v3, sel_dealloc);
}

- (BOOL)supportsPausing
{
  return 1;
}

- (BOOL)isRestoreDownload
{
  void *v2;
  char v3;

  -[VUIMPMediaItemCloudDownloadController storeDownload](self, "storeDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestore");

  return v3;
}

- (void)_onProcessingQueue_invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIMPMediaItemCloudDownloadController;
  -[VUIMPMediaItemDownloadController _onProcessingQueue_invalidate](&v3, sel__onProcessingQueue_invalidate);
  -[VUIMPMediaItemCloudDownloadController setStoreDownload:](self, "setStoreDownload:", 0);
  -[VUIMPMediaItemCloudDownloadController _removeStoreObserver](self, "_removeStoreObserver");
}

- (void)_onProcessingQueue_cancelDownload
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[VUIMPMediaItemCloudDownloadController storeDownload](self, "storeDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelDownloads:", v4);

  }
}

- (void)_onProcessingQueue_pauseDownload
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[VUIMPMediaItemCloudDownloadController storeDownload](self, "storeDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseDownloads:", v4);

  }
}

- (void)_onProcessingQueue_resumeDownload
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[VUIMPMediaItemCloudDownloadController storeDownload](self, "storeDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resumeDownloads:", v4);

  }
}

- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a4;
  -[VUIMPMediaItemCloudDownloadController storeDownload](self, "storeDownload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v7)
  {
    objc_msgSend((id)objc_opt_class(), "_stateFromStoreDownload:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMPMediaItemDownloadController _setState:](self, "_setState:", v6);

  }
}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a4;
  -[VUIMPMediaItemCloudDownloadController storeDownload](self, "storeDownload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v7)
  {
    objc_msgSend((id)objc_opt_class(), "_stateFromStoreDownload:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMPMediaItemDownloadController _setState:](self, "_setState:", v6);

  }
}

+ (id)_stateFromStoreDownload:(id)a3
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  VUIMPMediaItemDownloadControllerState *v12;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a3;
  objc_msgSend(v3, "percentComplete");
  v5 = v4;
  v6 = objc_msgSend(v3, "bytesDownloaded");
  v7 = objc_msgSend(v3, "bytesTotal");
  objc_msgSend(v3, "phaseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC2280]) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC22A8]) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC22B0]) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC2298]))
  {
    v9 = v5 > 0.00000011920929;
    v10 = 0;
    v11 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC2288]))
  {
    objc_msgSend(v3, "failureError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v3, "purchaseError");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v16;

    goto LABEL_17;
  }
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC2278]) & 1) != 0)
  {
    v10 = 0;
LABEL_17:
    v11 = 0;
LABEL_18:
    v9 = 3;
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC2290]))
  {
    objc_msgSend(v3, "failureError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(v3, "purchaseError");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v19;

    v11 = v10 == 0;
    goto LABEL_18;
  }
  v10 = 0;
  v11 = 0;
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC22A0]))
    v9 = 2;
  else
    v9 = 0;
LABEL_6:
  v12 = objc_alloc_init(VUIMPMediaItemDownloadControllerState);
  -[VUIMPMediaItemDownloadControllerState setStatus:](v12, "setStatus:", v9);
  -[VUIMPMediaItemDownloadControllerState setDownloadProgress:](v12, "setDownloadProgress:", v5);
  -[VUIMPMediaItemDownloadControllerState setBytesToDownload:](v12, "setBytesToDownload:", v7);
  -[VUIMPMediaItemDownloadControllerState setBytesDownloaded:](v12, "setBytesDownloaded:", v6);
  -[VUIMPMediaItemDownloadControllerState setDownloadSucceeded:](v12, "setDownloadSucceeded:", v11);
  -[VUIMPMediaItemDownloadControllerState setError:](v12, "setError:", v10);

  return v12;
}

- (void)_addStoreObserver
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[VUIMPMediaItemCloudDownloadController storeDownload](self, "storeDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:forDownloads:", self, v5);

  }
}

- (void)_removeStoreObserver
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[VUIMPMediaItemCloudDownloadController storeDownload](self, "storeDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forDownloads:", self, v5);

  }
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
}

@end
