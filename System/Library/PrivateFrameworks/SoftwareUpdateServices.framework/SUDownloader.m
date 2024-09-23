@implementation SUDownloader

- (SUDownloader)initWithCore:(id)a3
{
  id v4;
  SUDownloader *v5;
  SUDownloader *v6;
  MAAsset *downloadAsset;
  SUDownload *download;
  SUOperationProgress *downloadProgressSnapshot;
  uint64_t v10;
  NSDate *downloadProgressSnapshotDate;
  void *v12;
  SUDescriptor *brainLoadedForDescriptor;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUDownloader;
  v5 = -[SUDownloader init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_core, v4);
    *(_DWORD *)&v6->_foreground = 0;
    downloadAsset = v6->_downloadAsset;
    v6->_downloadAsset = 0;

    download = v6->_download;
    v6->_download = 0;

    downloadProgressSnapshot = v6->_downloadProgressSnapshot;
    v6->_downloadProgressSnapshot = 0;

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = objc_claimAutoreleasedReturnValue();
    downloadProgressSnapshotDate = v6->_downloadProgressSnapshotDate;
    v6->_downloadProgressSnapshotDate = (NSDate *)v10;

    +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:", v6);

    v6->_goNonDiscretionaryOnDownload = 0;
    brainLoadedForDescriptor = v6->_brainLoadedForDescriptor;
    v6->_brainLoadedForDescriptor = 0;

    v6->_brainLoadAttemptsForDescriptor = 0;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SUDownloader;
  -[SUDownloader dealloc](&v5, sel_dealloc);
}

- (BOOL)isDownloading
{
  void *v3;
  NSObject *v4;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_downloading;
}

- (void)setDownloading:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  id v7;

  v3 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_downloading != v3)
  {
    self->_downloading = v3;
    if (v3)
    {
      +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "beginTransaction:keepAlive:", CFSTR("downloading"), 1);
    }
    else
    {
      self->_downloadStateResetSinceStartup = 1;
      +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endTransaction:", CFSTR("downloading"));
    }

  }
}

- (BOOL)isForeground
{
  void *v3;
  NSObject *v4;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_foreground;
}

- (void)setForeground:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_foreground != v3)
  {
    self->_foreground = v3;
    v14 = CFSTR("No");
    if (v3)
      v14 = CFSTR("Yes");
    SULogDebug(CFSTR("Foreground status changed: isForeground? %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
    if (self->_downloading && self->_foreground)
    {
      SULogDebug(CFSTR("Updating download options for foreground status change if necessary."), v15, v16, v17, v18, v19, v20, v21, v22);
      -[SUDownloader _setDownloadDiscretionary:](self, "_setDownloadDiscretionary:", 0);
    }
  }
}

- (BOOL)isClearingSpace
{
  void *v3;
  NSObject *v4;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_clearingSpace;
}

- (void)setClearingSpace:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;

  v3 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_clearingSpace != v3)
  {
    self->_clearingSpace = v3;
    v14 = CFSTR("No");
    if (v3)
      v14 = CFSTR("Yes");
    SULogDebug(CFSTR("ClearingSpace status changed: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
    -[SUDownloader notifyClientOfClearingSpace:](self, "notifyClientOfClearingSpace:", self->_clearingSpace);
  }
}

- (MAAsset)downloadAsset
{
  void *v3;
  NSObject *v4;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_downloadAsset;
}

- (void)setDownloadAsset:(id)a3
{
  MAAsset *v4;
  void *v5;
  NSObject *v6;
  MAAsset *downloadAsset;

  v4 = (MAAsset *)a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  downloadAsset = self->_downloadAsset;
  self->_downloadAsset = v4;

}

- (SUDownload)download
{
  void *v3;
  NSObject *v4;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_download;
}

- (void)setDownload:(id)a3
{
  SUDownload *v4;
  void *v5;
  NSObject *v6;
  SUDownload *download;
  SUDownload *v8;

  v4 = (SUDownload *)a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  download = self->_download;
  self->_download = v4;
  v8 = v4;

  LODWORD(download) = -[SUDownload isPromoted](v8, "isPromoted");
  if ((_DWORD)download)
    -[SUDownloader setGoNonDiscretionaryOnDownload:](self, "setGoNonDiscretionaryOnDownload:", 1);
}

- (void)_setDownloadDiscretionary:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MAAsset *v16;
  NSObject *v17;
  MAAsset *v18;
  _QWORD block[4];
  MAAsset *v20;
  SUDownloader *v21;
  BOOL v22;

  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!a3)
  {
    -[SUDownloader download](self, "download");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SUDownloader download](self, "download");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPromoted:", 1);

      -[SUDownloader core](self, "core");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastDownload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "setPromoted:", 1);
        -[SUDownloader core](self, "core");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "state");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setLastDownload:", v11);

        -[SUDownloader core](self, "core");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "state");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "save");

      }
    }
  }
  v16 = self->_downloadAsset;
  dispatch_get_global_queue(2, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUDownloader__setDownloadDiscretionary___block_invoke;
  block[3] = &unk_24CE3C498;
  v22 = a3;
  v20 = v16;
  v21 = self;
  v18 = v16;
  dispatch_async(v17, block);

}

void __42__SUDownloader__setDownloadDiscretionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  _QWORD block[5];

  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    if ((objc_msgSend(v10, "refreshState") & 1) == 0)
      SULogInfo(CFSTR("Could not determine state of asset while trying to adjust priority, attempting anyway"), v11, v12, v13, v14, v15, v16, v17, v35);
    if (objc_msgSend(*(id *)(a1 + 32), "state") == 4)
    {
      v36 = (id)objc_opt_new();
      objc_msgSend(v36, "setDiscretionary:", *(unsigned __int8 *)(a1 + 48));
      if (objc_msgSend(*(id *)(a1 + 32), "configDownloadSync:", v36))
        SULogInfo(CFSTR("Attempt to change download priority failed"), v18, v19, v20, v21, v22, v23, v24, v35);

    }
    else if (!*(_BYTE *)(a1 + 48))
    {
      v25 = *(void **)(a1 + 32);
      objc_msgSend(v25, "state");
      SULogInfo(CFSTR("Attempt to change download priority for asset:%@, asset state is %ld, postponing to download start"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)v25);
      objc_msgSend(*(id *)(a1 + 40), "core");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "workQueue");
      v34 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__SUDownloader__setDownloadDiscretionary___block_invoke_2;
      block[3] = &unk_24CE3B5C0;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(v34, block);

    }
  }
  else
  {
    SULogInfo(CFSTR("Attempted to change download priority of a nil asset"), a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t __42__SUDownloader__setDownloadDiscretionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  SULogInfo(CFSTR("Setting goNonDiscretionaryOnDownload to YES"), a2, a3, a4, a5, a6, a7, a8, v10);
  return objc_msgSend(*(id *)(a1 + 32), "setGoNonDiscretionaryOnDownload:", 1);
}

- (void)resetDownloadStateOnStartup
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (self->_downloadStateResetSinceStartup)
  {
    SULogInfo(CFSTR("Not resetting download state on start up since it was already reset"), v5, v6, v7, v8, v9, v10, v11, v15);
  }
  else
  {
    -[SUDownloader core](self, "core");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLastDownload:", 0);

    -[SUDownloader setDownload:](self, "setDownload:", 0);
    -[SUDownloader setDownloading:](self, "setDownloading:", 0);
    -[SUDownloader setDownloadAsset:](self, "setDownloadAsset:", 0);
    -[SUDownloader setGoNonDiscretionaryOnDownload:](self, "setGoNonDiscretionaryOnDownload:", 0);
    -[SUDownloader core](self, "core");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clearUnlockCallbacks");

  }
}

- (void)autoUpdateFound:(id)a3 downloadNow:(BOOL)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;

  v42 = a3;
  -[SUDownloader core](self, "core");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  SULogInfo(CFSTR("Auto scan found update available: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v42);
  -[SUDownloader download](self, "download");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_14;
  v16 = (void *)v15;
  -[SUDownloader download](self, "download");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "downloadOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isAutoDownload");

  if ((v19 & 1) == 0)
  {
    -[SUDownloader download](self, "download");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "progress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isDone");
    v33 = CFSTR("ing");
    if (v25)
      v33 = CFSTR("ed");
    SULogInfo(CFSTR("User initiated update download%@. Skipping auto download"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)v33);

    +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cancelAllAutodownloadTasks");
  }
  else
  {
LABEL_14:
    if (a4
      || (+[SUPreferences sharedInstance](SUPreferences, "sharedInstance"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "disableAutoDownloadJitter"),
          v20,
          (v21 & 1) != 0))
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)+[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 0, 3600));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Random jittering enabled for this auto download; will start downloading after %@"),
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        (uint64_t)v22);
    }
    +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "scheduleAutoDownloadWithDate:requirePower:minimumPowerRquirement:", v22, 0, 0);

    -[SUDownloader loadBrainOnUnlockForDescriptor:](self, "loadBrainOnUnlockForDescriptor:", v42);
  }

}

- (BOOL)isReadyForDownload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  SUDownload *download;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  char v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  int v66;
  id *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  const __CFString *v83;
  void *v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SUDownloader core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUDownloader core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coreDescriptorForSUDescriptor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[SUDownloader core](self, "core");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredLastScannedDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", a4, 3);
      goto LABEL_8;
    }
  }
  if (-[SUDownloader isDownloading](self, "isDownloading"))
    goto LABEL_6;
  if (!-[SUDownloader isClearingSpace](self, "isClearingSpace"))
  {
    -[SUDownloader core](self, "core");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isInstalling");

    if (v24)
    {
      v20 = a4;
      v21 = 14;
      goto LABEL_7;
    }
    -[SUDownloader core](self, "core");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "preferredLastScannedDescriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v20 = a4;
      v21 = 3;
      goto LABEL_7;
    }
    download = self->_download;
    if (download)
    {
      -[SUDownload descriptor](download, "descriptor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = +[SUManagerEngine SUDescriptor:matchesSUCoreDescriptor:](SUManagerEngine, "SUDescriptor:matchesSUCoreDescriptor:", v28, v11);

      if (v29)
      {
        SULogInfo(CFSTR("Attempted to download update that's already on disk and downloaded."), v30, v31, v32, v33, v34, v35, v36, v76);
        v20 = a4;
        v21 = 41;
        goto LABEL_7;
      }
    }
    -[SUDownloader core](self, "core");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "state");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "failedPatchDescriptors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v40 = v39;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v80;
      while (2)
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v80 != v43)
            objc_enumerationMutation(v40);
          if (+[SUManagerEngine SUDescriptor:matchesSUCoreDescriptor:](SUManagerEngine, "SUDescriptor:matchesSUCoreDescriptor:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i), v11))
          {
            v45 = 1;
            goto LABEL_28;
          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
        if (v42)
          continue;
        break;
      }
    }
    v45 = 0;
LABEL_28:

    if (objc_msgSend(v6, "isAutoDownload"))
    {
      objc_msgSend(v11, "prerequisiteBuild");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = v45 ^ 1;
      if (!v46)
        v54 = 1;
      if ((v54 & 1) == 0)
      {
        SULogInfo(CFSTR("Auto download attempted to download failed patch descriptor"), v47, v48, v49, v50, v51, v52, v53, v76);
        v78 = 0;
        +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v78, 53);
        v55 = v78;
        if (!a4)
        {
LABEL_43:

          goto LABEL_9;
        }
        v83 = CFSTR("SUAutodownloadWillRetry");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v56;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUtility translateError:withAddedUserInfo:](SUUtility, "translateError:withAddedUserInfo:", v55, v57);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_40:
        LOBYTE(a4) = 0;
        goto LABEL_43;
      }
    }
    objc_msgSend(v11, "getMASoftwareUpdateAsset");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v65, "isCurrentNetworkTypeCellular"))
      {
        v66 = objc_msgSend(v6, "downloadFeeAgreementStatus");

        if (v66 == 2)
        {
          v67 = a4;
          v68 = 81;
LABEL_39:
          +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", v67, v68);
          goto LABEL_40;
        }
      }
      else
      {

      }
      LOBYTE(a4) = 1;
      goto LABEL_43;
    }
    SULogInfo(CFSTR("assetToDownloadFromLastScan is nil, trying to locally find a matching asset for descriptor:%@"), v58, v59, v60, v61, v62, v63, v64, (uint64_t)v11);
    SULogInfo(CFSTR("Could not find a matching asset, fail with no update found"), v69, v70, v71, v72, v73, v74, v75, v77);
    v67 = a4;
    v68 = 3;
    goto LABEL_39;
  }
  SULogInfo(CFSTR("Another download is already clearing space for download"), v13, v14, v15, v16, v17, v18, v19, v76);
LABEL_6:
  v20 = a4;
  v21 = 11;
LABEL_7:
  +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", v20, v21);

LABEL_8:
  LOBYTE(a4) = 0;
LABEL_9:

  return (char)a4;
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  SUDownloadOptions *v14;
  SUDownloadOptions *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SUDownloadOptions *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  SUDownloadOptions *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  SUDownloadOptions *v47;
  SUDownloader *v48;
  SUDownloadOptions *v49;
  id v50;
  id v51;
  id v52;
  id v53;

  v6 = a3;
  v7 = a4;
  -[SUDownloader core](self, "core");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v53 = 0;
  LOBYTE(v8) = -[SUDownloader isReadyForDownload:error:](self, "isReadyForDownload:error:", v6, &v53);
  v10 = v53;
  if ((v8 & 1) != 0)
  {
    if (+[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal"))
    {
      if ((objc_msgSend(v6, "isAutoDownload") & 1) == 0)
      {
        +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "suppressSSOTokenInDownload");

        if ((v12 & 1) == 0)
        {
          +[SUAuthSSO sharedInstance](SUAuthSSO, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "invokeSSOAuth");

        }
      }
    }
    v14 = (SUDownloadOptions *)v6;
    v15 = v14;
    v42 = v7;
    v43 = v6;
    v41 = v10;
    if (v14)
    {
      -[SUDownloadOptions descriptor](v14, "descriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[SUDownloader core](self, "core");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "coreDescriptorForSUDescriptor:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "getMASoftwareUpdateAsset");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v23;
        v28 = v25;
        v29 = v15;
        if (v26)
        {
LABEL_18:
          -[SUDownloader setClearingSpace:](self, "setClearingSpace:", 1);
          -[SUDownloader core](self, "core");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "workQueue");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[SUDownloader purgeOptionsForDescriptor:downloadOptions:completionQueue:](SUDownloader, "purgeOptionsForDescriptor:downloadOptions:completionQueue:", v27, v29, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          +[SUUtility taskQueue](SUUtility, "taskQueue");
          v35 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke;
          block[3] = &unk_24CE3E3D0;
          v45 = v34;
          v46 = v27;
          v47 = v29;
          v48 = self;
          v7 = v42;
          v52 = v42;
          v49 = v15;
          v50 = v26;
          v51 = v28;
          v36 = v28;
          v37 = v26;
          v38 = v29;
          v39 = v27;
          v40 = v34;
          dispatch_async(v35, block);

          v6 = v43;
          v10 = v41;
          goto LABEL_19;
        }
LABEL_15:
        -[SUDownloader core](self, "core");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "preferredLastScannedDescriptor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v28);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUDownloader core](self, "core");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "preferredAssetToDownloadFromLastScan");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          v29 = v15;
        else
          v29 = -[SUDownloadOptions initWithDescriptor:]([SUDownloadOptions alloc], "initWithDescriptor:", v27);
        goto LABEL_18;
      }
      SULogInfo(CFSTR("descriptor not found in download options: %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);
    }
    else
    {
      v23 = 0;
    }
    v25 = 0;
    goto LABEL_15;
  }
  if (v7)
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v10);
LABEL_19:

}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_2;
  v5[3] = &unk_24CE3E3A8;
  v2 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  v12 = *(id *)(a1 + 88);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v11 = *(id *)(a1 + 80);
  +[SUSpace makeRoomForUpdate:completion:](SUSpace, "makeRoomForUpdate:completion:", v2, v5);

}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  SUDownloadOptions *v15;
  SUDownloadOptions *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SUDownload *v25;
  SUOperationProgress *v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  dispatch_time_t v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  SUManagerEngineDownloadDescriptor *v98;
  SUManagerEngineDownloadDescriptor *v99;
  void *v100;
  SUOperationProgress *v101;
  SUDownload *v102;
  _QWORD v103[5];
  _QWORD v104[5];
  SUDownload *v105;
  id v106;
  uint64_t v107;
  id v108;
  id v109;
  _QWORD v110[5];
  id v111;
  _QWORD block[5];
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  uint64_t v117;
  id v118;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v114[0] = MEMORY[0x24BDAC760];
  v114[1] = 3221225472;
  v114[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_3;
  v114[3] = &unk_24CE3E340;
  v115 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v116 = v7;
  v117 = v8;
  v118 = *(id *)(a1 + 80);
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BF6094](v114);
  objc_msgSend(*(id *)(a1 + 48), "setClearingSpace:", 0);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "core");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_4;
    block[3] = &unk_24CE3B610;
    block[4] = *(_QWORD *)(a1 + 48);
    v113 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)v11, block);

    v12 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v108 = 0;
    LOBYTE(v11) = objc_msgSend(v12, "isReadyForDownload:error:", v13, &v108);
    v14 = v108;
    if ((v11 & 1) != 0)
    {
      v15 = (SUDownloadOptions *)*(id *)(a1 + 56);
      if (!*(_QWORD *)(a1 + 56))
      {
        v16 = -[SUDownloadOptions initWithDescriptor:]([SUDownloadOptions alloc], "initWithDescriptor:", *(_QWORD *)(a1 + 32));

        v15 = v16;
      }
      v107 = 0;
      -[SUDownloadOptions activeDownloadPolicy](v15, "activeDownloadPolicy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isDownloadableForCurrentNetworkConditions:cellularFeesApply:", &v107, 0) & 1) == 0)
      {
        SULogInfo(CFSTR("Download policy prevents download: %ld"), v18, v19, v20, v21, v22, v23, v24, v107);
        v106 = v14;
        +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v106, v107);
        v45 = v106;

        ((void (**)(_QWORD, id))v9)[2](v9, v45);
        v14 = v45;
LABEL_27:

        goto LABEL_28;
      }
      if (-[SUDownloadOptions activeDownloadPolicyType](v15, "activeDownloadPolicyType") != 1)
        objc_msgSend(*(id *)(a1 + 48), "endAutodownloadTasksAndResetState");
      objc_msgSend(*(id *)(a1 + 48), "cleanupPreviousDownloadState:", 0);
      objc_msgSend(*(id *)(a1 + 48), "setDownloadAsset:", *(_QWORD *)(a1 + 64));
      -[SUDownloadOptions setActiveDownloadPolicy:](v15, "setActiveDownloadPolicy:", v17);
      v25 = objc_alloc_init(SUDownload);
      v26 = objc_alloc_init(SUOperationProgress);
      -[SUOperationProgress setIsDone:](v26, "setIsDone:", 0);
      -[SUOperationProgress setPhase:](v26, "setPhase:", CFSTR("SUDownloadPhaseStarting"));
      -[SUDownload setProgress:](v25, "setProgress:", v26);
      -[SUDownload setDescriptor:](v25, "setDescriptor:", *(_QWORD *)(a1 + 32));
      -[SUDownload setDownloadOptions:](v25, "setDownloadOptions:", v15);
      v27 = *(_BYTE **)(a1 + 48);
      v101 = v26;
      if (v27[16])
      {
        if (-[SUDownloadOptions isAutoDownload](v15, "isAutoDownload"))
        {
          SULogInfo(CFSTR("Starting auto download while client in foreground, go non discretionary once download start"), v28, v29, v30, v31, v32, v33, v34, v94);
          objc_msgSend(*(id *)(a1 + 48), "setGoNonDiscretionaryOnDownload:", 1);
          -[SUDownload setPromoted:](v25, "setPromoted:", 1);
LABEL_19:
          objc_msgSend(*(id *)(a1 + 48), "setDownload:", v25);
          objc_msgSend(*(id *)(a1 + 48), "core");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "state");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v25;
          objc_msgSend(v47, "setLastDownload:", v25);

          objc_msgSend(*(id *)(a1 + 48), "core");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "state");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "save");

          objc_msgSend(*(id *)(a1 + 48), "core");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "core");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "updateInstallPolicyAutoUpdateEnabled:", objc_msgSend(v51, "isAutoUpdateEnabled"));

          objc_msgSend(*(id *)(a1 + 48), "setDownloading:", 1);
          objc_msgSend(*(id *)(a1 + 48), "core");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "delegate");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_opt_respondsToSelector();

          if ((v54 & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 48), "core");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "externWorkQueue");
            v56 = objc_claimAutoreleasedReturnValue();
            v104[0] = v6;
            v104[1] = 3221225472;
            v104[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_6;
            v104[3] = &unk_24CE3B610;
            v104[4] = *(_QWORD *)(a1 + 48);
            v105 = v102;
            dispatch_async(v56, v104);

          }
          if ((objc_msgSend(*(id *)(a1 + 48), "_reapplyExistingDownloadPolicyIfDownloadable:", 0) & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 48), "core");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "engine");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "createBrainLoadLockAssertion:", &__block_literal_global_21);

            +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v58) = objc_msgSend(v59, "skipDownload");

            if ((_DWORD)v58)
            {
              SULogInfo(CFSTR("SUSkipDownload is set, skip the download phase and return YES."), v60, v61, v62, v63, v64, v65, v66, v94);
              v67 = dispatch_time(0, 5000000000);
              objc_msgSend(*(id *)(a1 + 48), "core");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "workQueue");
              v69 = objc_claimAutoreleasedReturnValue();
              v103[0] = v6;
              v103[1] = 3221225472;
              v103[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_8;
              v103[3] = &unk_24CE3B5C0;
              v103[4] = *(_QWORD *)(a1 + 48);
              dispatch_after(v67, v69, v103);

              v9[2](v9, 0);
            }
            else
            {
              v98 = [SUManagerEngineDownloadDescriptor alloc];
              v96 = *(_QWORD *)(a1 + 64);
              objc_msgSend(*(id *)(a1 + 32), "releaseDate");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "core");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "sessionID");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "core");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "lastScannedDescriptorScanOptions");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "core");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v17;
              v83 = (void *)objc_msgSend(v82, "newInstallTonightConfig");
              v99 = -[SUManagerEngineDownloadDescriptor initWithAsset:releaseDate:sessionID:scanOptions:downloadOptions:installTonightConfig:coreDescriptor:downloadAtPhase:](v98, "initWithAsset:releaseDate:sessionID:scanOptions:downloadOptions:installTonightConfig:coreDescriptor:downloadAtPhase:", v96, v79, v80, v81, v15, v83, *(_QWORD *)(a1 + 72), 1);

              objc_msgSend(*(id *)(a1 + 48), "core");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", 0, 1);

              SULogInfo(CFSTR("Starting SU download with options: %@"), v85, v86, v87, v88, v89, v90, v91, (uint64_t)v15);
              objc_msgSend(*(id *)(a1 + 48), "core");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "engine");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "downloadUpdate:", v99);

              v17 = v100;
              v9[2](v9, 0);

            }
          }
          else
          {
            v9[2](v9, 0);
            SULogInfo(CFSTR("_reapplyExistingDownloadPolicyIfDownloadable returned NO. Bailing on download"), v70, v71, v72, v73, v74, v75, v76, v94);
            v77 = *(void **)(a1 + 48);
            +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 31);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "_downloadFailedWithError:", v78);

          }
          goto LABEL_27;
        }
        v27 = *(_BYTE **)(a1 + 48);
      }
      objc_msgSend(v27, "setGoNonDiscretionaryOnDownload:", 0);
      goto LABEL_19;
    }
    v44 = *(_QWORD *)(a1 + 80);
    if (v44)
      (*(void (**)(uint64_t, _QWORD, id))(v44 + 16))(v44, 0, v14);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isAutoDownload"))
    {
      objc_msgSend(*(id *)(a1 + 48), "core");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "workQueue");
      v43 = objc_claimAutoreleasedReturnValue();
      v110[0] = v6;
      v110[1] = 3221225472;
      v110[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_5;
      v110[3] = &unk_24CE3B610;
      v110[4] = *(_QWORD *)(a1 + 48);
      v111 = *(id *)(a1 + 32);
      dispatch_async(v43, v110);

    }
    SULogInfo(CFSTR("Download failed due to insufficient space: %@"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)v5);
    v109 = 0;
    +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v109, objc_msgSend(v5, "code"));
    v14 = v109;
    ((void (**)(_QWORD, id))v9)[2](v9, v14);
  }
LABEL_28:

}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_3(uint64_t a1, void *a2)
{
  SUDownload *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = objc_alloc_init(SUDownload);
    -[SUDownload setDescriptor:](v3, "setDescriptor:", *(_QWORD *)(a1 + 32));
    -[SUDownload setDownloadOptions:](v3, "setDownloadOptions:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "setDownload:", v3);

  }
  objc_msgSend(*(id *)(a1 + 48), "core");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportOTAStartedDownloadingEvent:", v8);

  objc_msgSend(*(id *)(a1 + 48), "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportCoreAnalyticsOTAStartedDownloadingEvent:", v8);

  v6 = v8;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "setDownload:", 0);
    v6 = v8;
  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, v6 == 0, v8);
    v6 = v8;
  }

}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", *(_QWORD *)(a1 + 40), 0);

}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_5(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDownloading") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isUpdateDownloaded") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "showInsufficientDiskSpaceFollowupForUpdate:", *(_QWORD *)(a1 + 40));

  }
}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadDidStart:", *(_QWORD *)(a1 + 40));

}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    SULogInfo(CFSTR("Failed to create brain load lock assertion: %@"), a2, a3, a4, a5, a6, a7, a8, a2);
}

uint64_t __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastDownload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhase:", CFSTR("SUDownloadPhasePreparingForInstallation"));

  return objc_msgSend(*(id *)(a1 + 32), "downloadCompleted:", 0);
}

- (void)notifyClientOfClearingSpace:(BOOL)a3
{
  void *v5;
  void *v6;
  char v7;
  SUDownload *v8;
  void *v9;
  NSObject *v10;
  SUDownload *v11;
  _QWORD block[5];
  SUDownload *v13;
  BOOL v14;

  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = self->_download;
    -[SUDownloader core](self, "core");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "externWorkQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__SUDownloader_notifyClientOfClearingSpace___block_invoke;
    block[3] = &unk_24CE3C498;
    block[4] = self;
    v13 = v8;
    v14 = a3;
    v11 = v8;
    dispatch_async(v10, block);

  }
}

void __44__SUDownloader_notifyClientOfClearingSpace___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearingSpaceForDownload:clearing:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (BOOL)_reapplyExistingDownloadPolicyIfDownloadable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;

  v3 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUDownload downloadOptions](self->_download, "downloadOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeDownloadPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDownloadable");
  if (v9)
  {
    objc_msgSend(v7, "setActiveDownloadPolicy:", v8);
    if (v3)
      -[SUDownloader _setDownloadDiscretionary:](self, "_setDownloadDiscretionary:", 0);
    -[SUDownloader _updateLastSavedDownloadsOptions:](self, "_updateLastSavedDownloadsOptions:", v7);
  }

  return v9;
}

- (void)_updateLastSavedDownloadsOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUDownloader core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastDownload");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setDownloadOptions:", v4);
  -[SUDownloader core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastDownload:", v13);

  -[SUDownloader core](self, "core");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "save");

}

- (void)_loadBrainOnUnlockCallback
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  _QWORD v63[5];
  id v64;
  id v65;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeUnlockCallback:", CFSTR("unlockCallbackLoadBrain"));

  -[SUDownloader loadBrainForDescriptor](self, "loadBrainForDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    SULogInfo(CFSTR("%s: No descriptor, skip preloading brain on unlock"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
    goto LABEL_12;
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "autoInstallSecurityResponse");

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isAutoDownloadDisabled");

  if (objc_msgSend(v13, "isSplatOnly"))
  {
    if ((v15 & 1) == 0)
    {
      SULogInfo(CFSTR("%s: Auto install security response disabled. No need to preload brain"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
      goto LABEL_12;
    }
  }
  else if (v17)
  {
    SULogInfo(CFSTR("%s: Auto download disabled via preferences. No need to preload brain"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
    goto LABEL_12;
  }
  -[SUDownloader download](self, "download");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    SULogInfo(CFSTR("%s: Found existing download, skip preloading brain"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
  }
  else if (objc_msgSend(v13, "rampEnabled"))
  {
    SULogInfo(CFSTR("%s: Ramp is enabled for asset, skip preloading brain"), v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
  }
  else
  {
    +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "currentNetworkType");

    if (v41 == 1)
    {
      -[SUDownloader core](self, "core");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "coreDescriptorForSUDescriptor:", v13);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = (void *)objc_opt_new();
      objc_msgSend(v51, "setDiscretionary:", 1);
      objc_msgSend(v51, "setAllowsCellularAccess:", 0);
      -[SUDownloader core](self, "core");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isManaged");

      if (v53)
      {
        objc_msgSend(v51, "setSupervised:", 1);
        objc_msgSend(v50, "productVersion");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setRequestedProductVersion:", v54);

      }
      objc_msgSend(v50, "assetAudienceUUID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend(v50, "assetAudienceUUID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(v56, "copy");
        objc_msgSend(v51, "setLiveAssetAudienceUUID:", v57);

      }
      objc_msgSend(v50, "getMASoftwareUpdateAsset");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v58)
      {
        -[SUDownloader core](self, "core");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "preferredAssetToDownloadFromLastScan");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE67268]), "initWithUpdateAsset:", v58);
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __42__SUDownloader__loadBrainOnUnlockCallback__block_invoke;
      v63[3] = &unk_24CE3E3F8;
      v63[4] = self;
      v64 = v58;
      v65 = v13;
      v61 = v58;
      objc_msgSend(v60, "loadUpdateBrainWithMAOptions:progressHandler:", v51, v63);

    }
    else
    {
      SULogInfo(CFSTR("%s: Skip brain preload when not on wifi"), v42, v43, v44, v45, v46, v47, v48, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
      -[SUDownloader core](self, "core");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "addUnlockCallback:forKey:", sel__loadBrainOnUnlockCallback, CFSTR("unlockCallbackLoadBrain"));

    }
  }
LABEL_12:

}

void __42__SUDownloader__loadBrainOnUnlockCallback__block_invoke(id *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;

  v18 = a2;
  SULogInfo(CFSTR("%s: Got brain load progress: %@, error: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]_block_invoke");
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE66B40]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE66B20]);
  if (a3 || v13)
  {
    objc_msgSend(a1[4], "core");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__SUDownloader__loadBrainOnUnlockCallback__block_invoke_2;
    block[3] = &unk_24CE3BB38;
    v16 = a1[5];
    v17 = a1[4];
    v20 = v16;
    v21 = v17;
    v22 = a1[6];
    dispatch_async(v15, block);

  }
}

void __42__SUDownloader__loadBrainOnUnlockCallback__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SUCoreBorder_MSUBrainIsLoadable();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setBrainLoadAttemptsForDescriptor:", objc_msgSend(*(id *)(a1 + 40), "brainLoadAttemptsForDescriptor") + 1);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "brainLoadAttemptsForDescriptor") < 5)
    {
      objc_msgSend(*(id *)(a1 + 40), "brainLoadAttemptsForDescriptor");
      SULogInfo(CFSTR("%s: brain is not loaded on attempt %lu, add unlock callback"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]_block_invoke_2");
      objc_msgSend(*(id *)(a1 + 40), "core");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addUnlockCallback:forKey:", sel__loadBrainOnUnlockCallback, CFSTR("unlockCallbackLoadBrain"));

    }
    else
    {
      SULogInfo(CFSTR("%s: brain is not loaded, but reached max attempts"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]_block_invoke_2");
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setBrainLoadedForDescriptor:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setLoadBrainForDescriptor:", 0);
    SULogInfo(CFSTR("%s: brain is loaded"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]_block_invoke_2");
  }
}

- (void)loadBrainOnUnlockForDescriptor:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  -[SUDownloader core](self, "core");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v22)
  {
    -[SUDownloader brainLoadedForDescriptor](self, "brainLoadedForDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v22);

    if (v14)
    {
      SULogInfo(CFSTR("%s: Already loaded brain for this descriptor. No need to preload brain"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUDownloader loadBrainOnUnlockForDescriptor:]");
    }
    else
    {
      -[SUDownloader setLoadBrainForDescriptor:](self, "setLoadBrainForDescriptor:", v22);
      -[SUDownloader setBrainLoadAttemptsForDescriptor:](self, "setBrainLoadAttemptsForDescriptor:", 0);
      -[SUDownloader _loadBrainOnUnlockCallback](self, "_loadBrainOnUnlockCallback");
    }
  }
  else
  {
    SULogInfo(CFSTR("%s: No descriptor, skip preloading brain"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDownloader loadBrainOnUnlockForDescriptor:]");
  }

}

- (BOOL)needToWaitForUnlockForLoadingBrainForDescriptor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  __CFString *v39;

  v4 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    SULogInfo(CFSTR("%s: No descriptor, skip loading brain"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDownloader needToWaitForUnlockForLoadingBrainForDescriptor:]");
    goto LABEL_5;
  }
  -[SUDownloader brainLoadedForDescriptor](self, "brainLoadedForDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v4);

  if (!v15)
  {
    -[SUDownloader core](self, "core");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "coreDescriptorForSUDescriptor:", v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "getMASoftwareUpdateAsset");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      -[SUDownloader core](self, "core");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "preferredAssetToDownloadFromLastScan");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v26, "attributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    SUCoreBorder_MSUBrainIsLoadable();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isPasscodeLocked");

      if ((v38 & 1) != 0)
      {
        v23 = 1;
LABEL_14:

        goto LABEL_15;
      }
      v39 = CFSTR("%s: device is not locked, should be able to load brain");
    }
    else
    {
      v39 = CFSTR("%s: brain is loadable");
    }
    SULogInfo(v39, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"-[SUDownloader needToWaitForUnlockForLoadingBrainForDescriptor:]");
    v23 = 0;
    goto LABEL_14;
  }
  SULogInfo(CFSTR("%s: Already loaded brain for this descriptor. No need to reload brain"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[SUDownloader needToWaitForUnlockForLoadingBrainForDescriptor:]");
LABEL_5:
  v23 = 0;
LABEL_15:

  return v23;
}

- (void)tryAutodownload
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  SUAutoDownloadPolicy *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __CFString *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __CFString *v76;
  SUDownloadOptions *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  _QWORD v91[5];
  id v92;
  id v93;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateToAutoDownload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v18 = CFSTR("Unable to autodownload with nil download descriptor");
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "isSplatOnly"))
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "autoInstallSecurityResponse");

    if ((v15 & 1) == 0)
    {
      v18 = CFSTR("Auto install security response disabled. Skipping auto download attempt");
      goto LABEL_16;
    }
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isAutoDownloadDisabled");

  if (!v17)
  {
    +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "currentNetworkType");

    if (v20 != 1)
    {
      v18 = CFSTR("Auto download only allowed over wifi");
      goto LABEL_16;
    }
    objc_msgSend(v6, "assetID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownloader core](self, "core");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "state");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastDeletedSUAssetID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", v24))
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "autoDownloadDeletedBuild");

      if ((v26 & 1) == 0)
      {
        v18 = CFSTR("Attempting to auto-download previously deleted update. Skipping auto downlaod attempt");
        goto LABEL_16;
      }
    }
    else
    {

    }
    if (objc_msgSend(v6, "rampEnabled"))
    {
      v18 = CFSTR("Ramp is enabled for asset. Skipping auto downlaod attempt");
      goto LABEL_16;
    }
    v27 = -[SUAutoDownloadPolicy initWithDescriptor:]([SUAutoDownloadPolicy alloc], "initWithDescriptor:", v6);
    if (!-[SUDefaultDownloadPolicy isDownloadable](v27, "isDownloadable"))
    {
      SULogInfo(CFSTR("SUAutoDownloadPolicy prevents SU asset download: %@"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);
      +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 31);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUDownloader noteAutodownloadFailedToStart:withError:](self, "noteAutodownloadFailedToStart:withError:", v6, v51);
LABEL_23:

LABEL_34:
      goto LABEL_17;
    }
    -[SUDownloader core](self, "core");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "download");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "descriptor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v6, "isEqual:", v37);

    if (v38)
    {
      -[SUDownloader core](self, "core");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "download");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "progress");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isDone");

      if (v42)
      {
        v50 = CFSTR("Background scan found build already downloaded; Skipping auto downlaod attempt");
LABEL_33:
        SULogInfo(v50, v43, v44, v45, v46, v47, v48, v49, v89);
        goto LABEL_34;
      }
    }
    v52 = -[SUDownloader _isWithinAutodownloadWindowForPolicy:descriptor:](self, "_isWithinAutodownloadWindowForPolicy:descriptor:", v27, v6);
    if (v52)
    {
      SULogInfo(CFSTR("%s: Scheduling a new auto download in 4 hours in case this one fails"), v43, v44, v45, v46, v47, v48, v49, (uint64_t)"-[SUDownloader tryAutodownload]");
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 14400.0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "disableAutoDownloadJitter");

      if ((v55 & 1) == 0)
      {
        objc_msgSend(v53, "dateByAddingTimeInterval:", (double)+[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 0, 1800));
        v56 = objc_claimAutoreleasedReturnValue();

        +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v56);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("%s: Random jittering enabled to retry the auto download; will retry after %@"),
          v57,
          v58,
          v59,
          v60,
          v61,
          v62,
          v63,
          (uint64_t)"-[SUDownloader tryAutodownload]");

        v53 = (void *)v56;
      }
      +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "scheduleAutoDownloadWithDate:requirePower:minimumPowerRquirement:", v53, 0, 0);

    }
    if (v38)
    {
      v50 = CFSTR("Background scan found build already downloading; Skipping auto downlaod attempt");
      goto LABEL_33;
    }
    if (-[SUDownloader isDownloading](self, "isDownloading")
      || (-[SUDownloader core](self, "core"),
          v65 = (void *)objc_claimAutoreleasedReturnValue(),
          v66 = objc_msgSend(v65, "isInstalling"),
          v65,
          v66))
    {
      v50 = CFSTR("Currently downloading or installing. Skipping auto download attempt");
      goto LABEL_33;
    }
    -[SUDownloader core](self, "core");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productBuildVersion");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "fullyUnrampedDateForBuildVersion:", v68);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (SUHasEnoughBatteryForAutoDownloadForDescriptor(v6, v51))
    {
      if (v52)
      {
        if (-[SUDownloader needToWaitForUnlockForLoadingBrainForDescriptor:](self, "needToWaitForUnlockForLoadingBrainForDescriptor:", v6))
        {
          v76 = CFSTR("We can't load the brain now, skipping auto download attempt");
LABEL_40:
          SULogInfo(v76, v69, v70, v71, v72, v73, v74, v75, v89);
          goto LABEL_23;
        }
        +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "beginTransaction:", CFSTR("auto-tryDownload"));
        SULogInfo(CFSTR("Attempting to autodownload..."), v79, v80, v81, v82, v83, v84, v85, v89);
        v77 = -[SUDownloadOptions initWithDescriptor:]([SUDownloadOptions alloc], "initWithDescriptor:", v6);
        -[SUDownloadOptions setAutoDownload:](v77, "setAutoDownload:", 1);
        -[SUDownloadOptions setActiveDownloadPolicyType:](v77, "setActiveDownloadPolicyType:", 1);
        +[SUState currentState](SUState, "currentState");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setLastAutoDownloadDate:", v87);

        -[SUDownloadOptions setClientName:](v77, "setClientName:", CFSTR("com.apple.softwareupdateservicesd.autodownload"));
        v91[0] = MEMORY[0x24BDAC760];
        v91[1] = 3221225472;
        v91[2] = __31__SUDownloader_tryAutodownload__block_invoke;
        v91[3] = &unk_24CE3CD90;
        v91[4] = self;
        v92 = v6;
        v93 = v78;
        v88 = v78;
        -[SUDownloader startDownloadWithOptions:withResult:](self, "startDownloadWithOptions:withResult:", v77, v91);

      }
      else
      {
        SULogInfo(CFSTR("No longer in auto download window. No longer attempting auto download for this update"), v69, v70, v71, v72, v73, v74, v75, v89);
        +[SUUtility autoDownloadExpiredError:](SUUtility, "autoDownloadExpiredError:", 0);
        v77 = (SUDownloadOptions *)objc_claimAutoreleasedReturnValue();
        -[SUDownloader noteAutodownloadFailedToStart:withError:](self, "noteAutodownloadFailedToStart:withError:", v6, v77);
      }

      goto LABEL_23;
    }
    v76 = CFSTR("Auto-download power policy not satisfied. Skipping auto download attempt");
    goto LABEL_40;
  }
  v18 = CFSTR("Auto download disabled via preferences. Skipping auto download attempt");
LABEL_16:
  SULogInfo(v18, v7, v8, v9, v10, v11, v12, v13, v89);
LABEL_17:

}

void __31__SUDownloader_tryAutodownload__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  dispatch_time_t v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "core");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if ((a2 & 1) == 0)
  {
    if (!v5)
    {
      +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", -1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v5, "code") != 41)
    {
      if (objc_msgSend(v5, "code") == 53)
      {
        v15 = dispatch_time(0, 3600000000000);
        objc_msgSend(*(id *)(a1 + 32), "core");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "workQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __31__SUDownloader_tryAutodownload__block_invoke_2;
        block[3] = &unk_24CE3B5C0;
        block[4] = *(_QWORD *)(a1 + 32);
        dispatch_after(v15, v17, block);

      }
      SULogInfo(CFSTR("tryAutodownload: Error starting autodownload: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v5);
      objc_msgSend(*(id *)(a1 + 32), "noteAutodownloadFailedToStart:withError:", *(_QWORD *)(a1 + 40), v5);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "endTransaction:", CFSTR("auto-tryDownload"));

}

void __31__SUDownloader_tryAutodownload__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "autoScanAndDownloadIfAvailable:withResult:", 0, 0);

}

- (void)endAutodownloadTasksAndResetState
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  -[SUDownloader core](self, "core");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  SULogInfo(CFSTR("Ending/clearing any oustanding autodownload tasks and state"), v4, v5, v6, v7, v8, v9, v10, v11);
  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancelAllAutodownloadTasks");

}

- (BOOL)updateDownloadOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  SUDownload *v20;
  void *v21;
  NSObject *v22;
  SUDownload *v23;
  BOOL v24;
  id *v25;
  uint64_t v26;
  _QWORD block[5];
  SUDownload *v29;

  v6 = a3;
  -[SUDownloader core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!self->_downloadAsset || !self->_download)
  {
    v25 = a4;
    v26 = 3;
LABEL_17:
    +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", v25, v26);
    v24 = 0;
    goto LABEL_18;
  }
  if (!-[SUDownloader isDownloading](self, "isDownloading"))
  {
    v25 = a4;
    v26 = 12;
    goto LABEL_17;
  }
  if (!v6)
  {
    v25 = a4;
    v26 = 22;
    goto LABEL_17;
  }
  -[SUDownload downloadOptions](self->_download, "downloadOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isAutoDownload")
    && objc_msgSend(v6, "activeDownloadPolicyType") != 1
    || objc_msgSend(v9, "isAutoDownload") && (objc_msgSend(v6, "isAutoDownload") & 1) == 0)
  {
    -[SUDownloader endAutodownloadTasksAndResetState](self, "endAutodownloadTasksAndResetState");
    if ((objc_msgSend(v9, "isEqual:", v6) & 1) == 0)
      -[SUDownloader _setDownloadDiscretionary:](self, "_setDownloadDiscretionary:", 0);
  }
  -[SUDownload setDownloadOptions:](self->_download, "setDownloadOptions:", v6);
  SULogInfo(CFSTR("Download options changed from: %@ \nto:\n %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  -[SUDownloader core](self, "core");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v20 = self->_download;
    -[SUDownloader core](self, "core");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "externWorkQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__SUDownloader_updateDownloadOptions_error___block_invoke;
    block[3] = &unk_24CE3B610;
    block[4] = self;
    v29 = v20;
    v23 = v20;
    dispatch_async(v22, block);

  }
  -[SUDownloader _updateLastSavedDownloadsOptions:](self, "_updateLastSavedDownloadsOptions:", v6);

  v24 = 1;
LABEL_18:

  return v24;
}

void __44__SUDownloader_updateDownloadOptions_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadProgressDidChange:", *(_QWORD *)(a1 + 40));

}

- (void)noteAutodownloadFailedToStart:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  -[SUDownloader core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[SUDownloader endAutodownloadTasksAndResetState](self, "endAutodownloadTasksAndResetState");
  SULogInfo(CFSTR("Sending autodownload did fail to start notification to clients."), v10, v11, v12, v13, v14, v15, v16, v22);
  -[SUDownloader core](self, "core");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[SUDownloader core](self, "core");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "externWorkQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__SUDownloader_noteAutodownloadFailedToStart_withError___block_invoke;
    block[3] = &unk_24CE3BB38;
    block[4] = self;
    v24 = v6;
    v25 = v7;
    dispatch_async(v21, block);

  }
}

void __56__SUDownloader_noteAutodownloadFailedToStart_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "automaticDownloadDidFailToStartForNewUpdateAvailable:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)noteAutodownloadFailedToStartWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;

  v4 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUDownload descriptor](self->_download, "descriptor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUDownloader noteAutodownloadFailedToStart:withError:](self, "noteAutodownloadFailedToStart:withError:", v7, v4);

}

- (void)deviceIsUpToDate
{
  void *v3;
  NSObject *v4;
  void *v5;
  MAAsset *downloadAsset;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllAutodownloadTasks");

  downloadAsset = self->_downloadAsset;
  if (downloadAsset
    && (!-[MAAsset refreshState](downloadAsset, "refreshState")
     || -[MAAsset state](self->_downloadAsset, "state") == 3
     || -[MAAsset isDownloading](self->_downloadAsset, "isDownloading")))
  {
    SULogInfo(CFSTR("Purging SU asset because server says device is up to date"), v7, v8, v9, v10, v11, v12, v13, v17);
    -[SUDownloader core](self, "core");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clearKeybagStash");

    -[SUDownloader core](self, "core");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "engine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeUpdateKeepingDocAssets:", 0);

    -[SUDownloader cleanupPreviousDownloadState:](self, "cleanupPreviousDownloadState:", 1);
  }
}

- (void)sendDownloadInvalidatedForNewDescriptors:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUDownloader core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SUDownloader core](self, "core");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[SUDownloader core](self, "core");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "externWorkQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __57__SUDownloader_sendDownloadInvalidatedForNewDescriptors___block_invoke;
      v15[3] = &unk_24CE3B610;
      v15[4] = self;
      v16 = v4;
      dispatch_async(v14, v15);

    }
  }
  else
  {

  }
}

void __57__SUDownloader_sendDownloadInvalidatedForNewDescriptors___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadWasInvalidatedForNewUpdatesAvailable:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isDownloadHalted
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char IsStalled;
  void *v8;
  void *v9;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!-[SUDownloader isDownloading](self, "isDownloading"))
    return 0;
  -[SUDownload progress](self->_download, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SUDownloadPhaseIsHalted(v6) & 1) != 0)
  {
    IsStalled = 1;
  }
  else
  {
    -[SUDownload progress](self->_download, "progress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IsStalled = SUDownloadPhaseIsStalled(v9);

  }
  return IsStalled;
}

- (BOOL)isUpdateDownloaded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUDownload progress](self->_download, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("SUDownloadPhasePreparingForInstallation")))
  {
    -[SUDownload progress](self->_download, "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDone");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isSplatDownload
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUDownloader download](self, "download");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "updateType") == 4;

  return (char)v4;
}

- (BOOL)cancelDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;
  NSObject *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  -[SUDownloader core](self, "core");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  +[SUUtility setCacheable:](SUUtility, "setCacheable:", 1);
  if (-[SUDownloader isDownloading](self, "isDownloading"))
    return -[SUDownloader killDownload:userRequested:keepDocAssets:error:](self, "killDownload:userRequested:keepDocAssets:error:", v9, v8, v7, a6);
  +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", a6, 12);
  return 0;
}

- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id *v15;
  uint64_t v16;
  void *v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  SUCoreScanResults *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SUCoreScanResults *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  _QWORD v43[2];

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v43[1] = *MEMORY[0x24BDAC8D0];
  -[SUDownloader core](self, "core");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (!self->_downloadAsset || !self->_download)
  {
    v15 = a6;
    v16 = 3;
    goto LABEL_6;
  }
  -[SUDownloader core](self, "core");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isInstalling");

  if (v14)
  {
    v15 = a6;
    v16 = 14;
LABEL_6:
    +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", v15, v16);
    return 0;
  }
  -[SUDownloader core](self, "core");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isInstalled");

  if (v19)
  {
    v15 = a6;
    v16 = 42;
    goto LABEL_6;
  }
  v20 = -[SUDownloader isDownloading](self, "isDownloading");
  -[SUDownloader core](self, "core");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "engine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeUpdateKeepingDocAssets:", v7);

  if (v8)
  {
    -[SUDownloader core](self, "core");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "state");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownload descriptor](self->_download, "descriptor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "assetID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setLastDeletedSUAssetID:", v26);

  }
  -[SUDownload downloadOptions](self->_download, "downloadOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isAutoDownload");

  if (v28)
    -[SUDownloader endAutodownloadTasksAndResetState](self, "endAutodownloadTasksAndResetState");
  -[SUDownloader core](self, "core");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "clearKeybagStash");

  if (v9)
  {
    if (v20)
    {
      v30 = objc_alloc(MEMORY[0x24BDD1540]);
      v42 = CFSTR("SUUserRequested");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v31;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v30, "initWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 16, v32);

      -[SUDownloader _downloadFailedWithError:](self, "_downloadFailedWithError:", v33);
    }
    else
    {
      v34 = [SUCoreScanResults alloc];
      -[SUDownloader core](self, "core");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "preferredLastScannedDescriptor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUDownloader core](self, "core");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "alternateLastScannedDescriptor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[SUCoreScanResults initWithPreferredDescriptor:alternateDescriptor:](v34, "initWithPreferredDescriptor:alternateDescriptor:", v36, v38);

      -[SUDownloader sendDownloadInvalidatedForNewDescriptors:](self, "sendDownloadInvalidatedForNewDescriptors:", v39);
      -[SUDownloader cleanupPreviousDownloadState:](self, "cleanupPreviousDownloadState:", 1);
      -[SUDownloader setDownloading:](self, "setDownloading:", 0);

    }
  }
  else
  {
    -[SUDownloader cleanupPreviousDownloadState:](self, "cleanupPreviousDownloadState:", 1);
    -[SUDownloader setDownloading:](self, "setDownloading:", 0);
  }
  -[SUDownloader core](self, "core");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownload descriptor](self->_download, "descriptor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", v41, 0);

  return 1;
}

- (BOOL)_isWithinAutodownloadWindowForPolicy:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownloader core](self, "core");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "productBuildVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "discoveryDateForBuildVersion:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "computAutoDownloadEndDateFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "laterDate:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == v12;

    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
    v8 = 0;
  }

  return v14;
}

- (void)_changeDownloadPhase:(id)a3 progress:(float)a4 timeRemaining:(double)a5
{
  void *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;

  v42 = a3;
  -[SUDownloader core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = v42;
  if (v42)
  {
    v11 = -[SUDownloader isDownloading](self, "isDownloading");
    v10 = v42;
    if (v11)
    {
      -[SUDownload progress](self->_download, "progress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "phase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", v42) & 1) == 0)
      {
        -[SUDownload progress](self->_download, "progress");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "phase");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("Software update download phase changed from %@ to %@."), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);

        LODWORD(v23) = 0;
        objc_msgSend(v12, "setPercentComplete:", v23);
      }
      objc_msgSend(v12, "setPhase:", v42);
      if (a4 == 0.0)
        a4 = 0.0;
      v24 = a4;
      if (a4 > 0.001 || (SUDownloadPhaseIsFetchingAnything(v42, 1) & 1) == 0)
      {
        *(float *)&v24 = fminf(fmaxf(a4, 0.0), 1.0);
        objc_msgSend(v12, "setPercentComplete:", v24);
      }
      v25 = -1.0;
      if (a5 != 0.0)
        v25 = a5;
      objc_msgSend(v12, "setTimeRemaining:", v25);
      -[SUDownload downloadOptions](self->_download, "downloadOptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "isAutoDownload"))
      {
        -[SUDownload downloadOptions](self->_download, "downloadOptions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "activeDownloadPolicyType") == 1
          && -[SUDownloader isDownloadHalted](self, "isDownloadHalted"))
        {
          -[SUDownload downloadOptions](self->_download, "downloadOptions");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "activeDownloadPolicy");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUDownload descriptor](self->_download, "descriptor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[SUDownloader _isWithinAutodownloadWindowForPolicy:descriptor:](self, "_isWithinAutodownloadWindowForPolicy:descriptor:", v29, v30);

          if (!v31)
          {
            SULogDebug(CFSTR("Download halted after wifi window; attempting to cancel download silently."),
              v32,
              v33,
              v34,
              v35,
              v36,
              v37,
              v38,
              v41);
            if (-[SUDownloader cancelDownload:userRequested:keepDocAssets:error:](self, "cancelDownload:userRequested:keepDocAssets:error:", 0, 0, 1, 0))
            {
              -[SUDownload descriptor](self->_download, "descriptor");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              +[SUUtility autoDownloadExpiredError:](SUUtility, "autoDownloadExpiredError:", 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUDownloader noteAutodownloadFailedToStart:withError:](self, "noteAutodownloadFailedToStart:withError:", v39, v40);

LABEL_21:
              v10 = v42;
              goto LABEL_22;
            }
          }
LABEL_20:
          -[SUDownloader _updateNormalizedDownloadProgressAndNotifyDelegate](self, "_updateNormalizedDownloadProgressAndNotifyDelegate");
          goto LABEL_21;
        }

      }
      goto LABEL_20;
    }
  }
LABEL_22:

}

- (void)_notePhaseCompleted:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v4 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUDownload progress](self->_download, "progress");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPhase:", v4);

  LODWORD(v7) = 1.0;
  objc_msgSend(v20, "setPercentComplete:", v7);
  objc_msgSend(v20, "setTimeRemaining:", 0.0);
  -[SUDownloader _updateNormalizedDownloadProgress](self, "_updateNormalizedDownloadProgress");
  -[SUDownloader core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastDownload:", self->_download);

  -[SUDownloader core](self, "core");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "save");

  objc_msgSend(v20, "phase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Download %@ phase completed."), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);

}

- (void)_updateNormalizedDownloadProgressAndNotifyDelegate
{
  void *v3;
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (self->_download)
  {
    -[SUDownloader _updateNormalizedDownloadProgress](self, "_updateNormalizedDownloadProgress");
    -[SUDownloader core](self, "core");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = -[SUDownloader _shouldSendUpdatedProgressToDelegate](self, "_shouldSendUpdatedProgressToDelegate");

      if (v6)
      {
        -[SUDownloader _snapshotProgress](self, "_snapshotProgress");
        -[SUDownloader core](self, "core");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "externWorkQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __66__SUDownloader__updateNormalizedDownloadProgressAndNotifyDelegate__block_invoke;
        block[3] = &unk_24CE3B5C0;
        block[4] = self;
        dispatch_async(v8, block);

      }
    }
    else
    {

    }
  }
}

void __66__SUDownloader__updateNormalizedDownloadProgressAndNotifyDelegate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadProgressDidChange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

}

- (BOOL)_shouldSendUpdatedProgressToDelegate
{
  void *v3;
  NSObject *v4;
  SUOperationProgress *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  int v10;
  float v11;
  float v12;
  float v13;
  double v14;
  void *v15;
  double v16;
  BOOL v17;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = self->_downloadProgressSnapshot;
  -[SUDownload progress](self->_download, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "normalizedPercentComplete");
  if (v7 >= 1.0)
    goto LABEL_8;
  -[SUOperationProgress phase](v5, "phase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (!v10)
    goto LABEL_8;
  -[SUOperationProgress percentComplete](v5, "percentComplete");
  v12 = v11;
  objc_msgSend(v6, "percentComplete");
  if ((float)(v13 - v12) < 0.01)
  {
    if (-[SUDownloader isForeground](self, "isForeground"))
      v14 = 10.0;
    else
      v14 = 60.0;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", self->_downloadProgressSnapshotDate);
    v17 = v16 > v14;

  }
  else
  {
LABEL_8:
    v17 = 1;
  }

  return v17;
}

- (void)_updateNormalizedDownloadProgress
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  float *v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUDownload progress](self->_download, "progress");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "phase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUDownloader _orderForPhase:](self, "_orderForPhase:", v5);
  -[SUDownload descriptor](self->_download, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isStreamingZipCapable");

  if (v31 && v6 >= 1 && v6 <= 7)
  {
    v9 = (float *)&_SUDownloadPhaseOrderWeightsNonStreamable;
    if (v8)
      v9 = (float *)&_SUDownloadPhaseOrderWeightsStreamable;
    v10 = v6;
    v11 = v9[v6];
    v12 = 0.0;
    do
    {
      v13 = *v9++;
      v12 = v12 + v13;
      --v10;
    }
    while (v10);
    objc_msgSend(v31, "percentComplete");
    *(float *)&v15 = v12 + fminf(v11 * v14, v11);
    objc_msgSend(v31, "setNormalizedPercentComplete:", v15);
    v16 = (void *)MEMORY[0x24BDD16F0];
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v31, "percentComplete");
    objc_msgSend(v17, "numberWithFloat:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringFromNumber:numberStyle:", v18, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD16F0];
    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v31, "normalizedPercentComplete");
    objc_msgSend(v21, "numberWithFloat:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringFromNumber:numberStyle:", v22, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    SULogDebug(CFSTR("Download Phase: %@, Phase Progress: %@, Overall Progress: %@"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)v5);

  }
}

- (int)_orderForPhase:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (_orderForPhase____onceToken != -1)
    dispatch_once(&_orderForPhase____onceToken, &__block_literal_global_370);
  objc_msgSend((id)_orderForPhase____downloadPhaseOrderMap, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "intValue");
  else
    v8 = -1;

  return v8;
}

void __31__SUDownloader__orderForPhase___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[10];
  _QWORD v13[12];

  v13[10] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0, CFSTR("SUDownloadPhaseStarting"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v0;
  v12[1] = CFSTR("SUDownloadPhaseBrainFetching");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v1;
  v12[2] = CFSTR("SUDownloadPhaseBrainFetchingQueuedLocal");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v2;
  v12[3] = CFSTR("SUDownloadPhaseBrainFetchingQueuedRemote");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v3;
  v12[4] = CFSTR("SUDownloadPhaseBrainFetchingStalled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v4;
  v12[5] = CFSTR("SUDownloadPhaseBrainVerifying");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v5;
  v12[6] = CFSTR("SUDownloadPhaseBrainExtracting");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v6;
  v12[7] = CFSTR("SUDownloadPhaseFetching");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v7;
  v12[8] = CFSTR("SUDownloadPhaseFetchingStalled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v8;
  v12[9] = CFSTR("SUDownloadPhasePreparingForInstallation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[9] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_orderForPhase____downloadPhaseOrderMap;
  _orderForPhase____downloadPhaseOrderMap = v10;

}

- (void)downloadProgress:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  double v11;
  void *v12;
  int IsUpdateDownloading;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  id v27;

  v27 = a3;
  -[SUDownloader core](self, "core");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v27, "phase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "isEqualToString:", CFSTR("SUDownloadPhaseStarting"));

  if ((_DWORD)v5)
    notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8C0], "UTF8String"));
  objc_msgSend(v27, "phase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "percentComplete");
  v9 = v8;
  objc_msgSend(v27, "timeRemaining");
  v11 = v10;
  LODWORD(v10) = v9;
  -[SUDownloader _changeDownloadPhase:progress:timeRemaining:](self, "_changeDownloadPhase:progress:timeRemaining:", v7, v10, v11);

  if (-[SUDownloader goNonDiscretionaryOnDownload](self, "goNonDiscretionaryOnDownload"))
  {
    if (-[SUDownloader isDownloading](self, "isDownloading"))
    {
      objc_msgSend(v27, "phase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IsUpdateDownloading = SUDownloadPhaseIsUpdateDownloading(v12);

      if (IsUpdateDownloading)
      {
        SULogInfo(CFSTR("Download in progress and we need to go non-discretionary"), v14, v15, v16, v17, v18, v19, v20, v26);
        -[SUDownloader setGoNonDiscretionaryOnDownload:](self, "setGoNonDiscretionaryOnDownload:", 0);
        -[SUDownloader _setDownloadDiscretionary:](self, "_setDownloadDiscretionary:", 0);
      }
    }
  }
  if (objc_msgSend(v27, "isDone"))
  {
    objc_msgSend(v27, "phase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownloader _notePhaseCompleted:](self, "_notePhaseCompleted:", v21);

    objc_msgSend(v27, "phase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", CFSTR("SUDownloadPhaseBrainExtracting")))
    {

LABEL_11:
      -[SUDownloader core](self, "core");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "reporterFlushEvent");

      goto LABEL_12;
    }
    objc_msgSend(v27, "phase");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("SUDownloadPhaseFetching"));

    if (v24)
      goto LABEL_11;
  }
LABEL_12:

}

- (void)downloadCompleted:(id)a3
{
  -[SUDownloader downloadCompleted:informClients:](self, "downloadCompleted:informClients:", a3, 1);
}

- (void)downloadCompleted:(id)a3 informClients:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  unint64_t v47;
  uint64_t v48;
  id v49;
  id v50;

  v4 = a4;
  v6 = a3;
  -[SUDownloader core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8C0], "UTF8String"));
  -[SUDownloader core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    objc_msgSend(v6, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDdmPersistedErrorDescription:", v12);

    notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8B8], "UTF8String"));
    v13 = v6;
    v14 = *MEMORY[0x24BDBD270];
    v15 = *MEMORY[0x24BDD1398];
    v49 = v13;
    v16 = v13;
    while (1)
    {
      objc_msgSend(v16, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "valueForKey:", CFSTR("MSUFullReplacementRecommened"));

      if (v18 == v14)
        break;
      objc_msgSend(v16, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", v15);
      v20 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v20;
      if (!v20)
      {
        v21 = v49;
        goto LABEL_13;
      }
    }
    +[SUUtility errorWithCode:originalError:](SUUtility, "errorWithCode:originalError:", 53, v49);
    v39 = objc_claimAutoreleasedReturnValue();

    -[SUDownloader core](self, "core");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "state");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownload descriptor](self->_download, "descriptor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addFailedPatchDescriptor:", v42);

    -[SUDownloader core](self, "core");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "state");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "save");

    v21 = (void *)v39;
LABEL_13:
    v50 = v21;
    objc_msgSend(v21, "domain");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors"));

    if (!v46 || (v47 = objc_msgSend(v50, "code"), v47 > 0x2A) || ((1 << v47) & 0x40000004800) == 0)
      -[SUDownloader _downloadFailedWithError:](self, "_downloadFailedWithError:", v50);
  }
  else
  {
    objc_msgSend(v10, "setDdmPersistedError:", 0);

    -[SUDownloader core](self, "core");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "state");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastDownload");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "progress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "phase");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v26 != CFSTR("SUDownloadPhasePreparingForInstallation"))
    {
      -[SUDownloader core](self, "core");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v4)
        v29 = 0;
      else
        v29 = CFSTR("followup event");
      objc_msgSend(v27, "reportOTADownloadedEvent:", v29);

      -[SUDownloader core](self, "core");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "reportCoreAnalyticsOTADownloadedEvent");

    }
    -[SUDownloader _notePhaseCompleted:](self, "_notePhaseCompleted:", CFSTR("SUDownloadPhasePreparingForInstallation"));
    -[SUDownloader _downloadFinished:](self, "_downloadFinished:", v4);
    SULogInfo(CFSTR("Update is prepared. Re-registering for RecordDataForBrain unlock callback"), v31, v32, v33, v34, v35, v36, v37, v48);
    -[SUDownloader core](self, "core");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "removeUnlockCallback:", CFSTR("unlockCallbackRecordDataForBrain"));

    -[SUDownloader core](self, "core");
    v50 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addUnlockCallback:forKey:", sel__recordLastUnlockTimePostPrepare, CFSTR("unlockCallbackRecordDataForBrain"));
  }

}

- (void)_downloadFinished:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  _QWORD block[5];
  id v67;

  v3 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUDownloader core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passcodePolicy");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SUDownloader core](self, "core");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isAutoUpdateEnabled") & 1) != 0)
    {
      -[SUDownload downloadOptions](self->_download, "downloadOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isAutoDownload");

      if (!v12)
        goto LABEL_11;
      -[SUDownloader download](self, "download");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "descriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "updateType");

      -[SUDownloader core](self, "core");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "passcodePolicy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v16;
      if (v15 == 4)
        v17 = 2;
      else
        v17 = 1;
      objc_msgSend(v16, "setCurrentPolicyType:", v17);
    }
    else
    {

    }
  }

LABEL_11:
  -[SUDownloader core](self, "core");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownload descriptor](self->_download, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coreDescriptorForSUDescriptor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  SULogInfo(CFSTR("%s: Found SUCoreDescriptor: %@"), v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[SUDownloader _downloadFinished:]");
  if (v20)
  {
    -[SUDownload descriptor](self->_download, "descriptor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "installationSize");
    SULogInfo(CFSTR("%s: Old installationSize: %llu"), v29, v30, v31, v32, v33, v34, v35, (uint64_t)"-[SUDownloader _downloadFinished:]");

    objc_msgSend(v20, "refreshInstallationSize");
    -[SUDownload descriptor](self->_download, "descriptor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setInstallationSize:", objc_msgSend(v20, "installationSize"));

    -[SUDownload descriptor](self->_download, "descriptor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "installationSize");
    SULogInfo(CFSTR("%s: Refreshed installationSize: %llu"), v38, v39, v40, v41, v42, v43, v44, (uint64_t)"-[SUDownloader _downloadFinished:]");

  }
  -[SUDownload progress](self->_download, "progress");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setIsDone:", 1);

  -[SUDownloader core](self, "core");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "state");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setLastDownload:", self->_download);

  -[SUDownloader core](self, "core");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "state");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "save");

  SULogInfo(CFSTR("%s: Download finished, cancel the recommended notification UI"), v50, v51, v52, v53, v54, v55, v56, (uint64_t)"-[SUDownloader _downloadFinished:]");
  -[SUDownloader core](self, "core");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "unscheduleRecommendedUpdateNotification");

  if (v3)
  {
    -[SUDownloader core](self, "core");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "delegate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_opt_respondsToSelector();

    if ((v60 & 1) != 0)
    {
      -[SUDownloader core](self, "core");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "installPolicy");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUDownloader core](self, "core");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "externWorkQueue");
      v64 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __34__SUDownloader__downloadFinished___block_invoke;
      block[3] = &unk_24CE3B610;
      block[4] = self;
      v67 = v62;
      v65 = v62;
      dispatch_async(v64, block);

    }
  }
  -[SUDownloader endAutodownloadTasksAndResetState](self, "endAutodownloadTasksAndResetState");
  +[SUUtility setCacheable:](SUUtility, "setCacheable:", 1);
  -[SUDownloader setDownloading:](self, "setDownloading:", 0);

}

void __34__SUDownloader__downloadFinished___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadDidFinish:withInstallPolicy:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40));

}

- (void)_downloadFailedWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[5];
  id v26;

  v4 = a3;
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  SULogInfo(CFSTR("Download failed with error: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v4);
  if (self->_download)
  {
    -[SUDownloader core](self, "core");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      if (!v4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), -1, 0);
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      +[SUUtility translateError:](SUUtility, "translateError:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUDownloader core](self, "core");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "externWorkQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __41__SUDownloader__downloadFailedWithError___block_invoke;
      block[3] = &unk_24CE3B610;
      block[4] = self;
      v26 = v17;
      v20 = v17;
      dispatch_async(v19, block);

    }
  }
  -[SUDownloader core](self, "core");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reportOTAAbandonedEventWithError:", v4);

  -[SUDownloader core](self, "core");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reportCoreAnalyticsOTAAbandonedEvent:", v4);

  -[SUDownloader core](self, "core");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "clearUnlockCallbacks");

  +[SUUtility setCacheable:](SUUtility, "setCacheable:", 1);
  -[SUDownloader cleanupPreviousDownloadState:](self, "cleanupPreviousDownloadState:", 1);
  -[SUDownloader core](self, "core");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "clearKeybagStash");

  -[SUDownloader setDownloading:](self, "setDownloading:", 0);
}

void __41__SUDownloader__downloadFailedWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadDidFail:withError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40));

}

- (void)cleanupPreviousDownloadState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  SUDownload *v31;
  _QWORD block[5];
  SUDownload *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x24BDAC8D0];
  -[SUDownloader core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  SULogInfo(CFSTR("Cleaning up previous download state"), v7, v8, v9, v10, v11, v12, v13, v30);
  -[SUDownloader setDownloadAsset:](self, "setDownloadAsset:", 0);
  v31 = self->_download;
  -[SUDownloader core](self, "core");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clearBadgeAndBanner");

  -[SUDownloader setGoNonDiscretionaryOnDownload:](self, "setGoNonDiscretionaryOnDownload:", 0);
  -[SUDownloader setDownloading:](self, "setDownloading:", 0);
  -[SUDownloader setDownload:](self, "setDownload:", 0);
  -[SUDownloader _snapshotProgress](self, "_snapshotProgress");
  -[SUDownloader core](self, "core");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLastDownload:", 0);

  -[SUDownloader core](self, "core");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeUnlockCallback:", CFSTR("unlockCallbackRecordDataForBrain"));

  if (v3)
  {
    -[SUDownloader core](self, "core");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "state");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "save");

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[SUDownloader core](self, "core");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "observers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v26);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SUDownloader core](self, "core");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "externWorkQueue");
          v29 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __45__SUDownloader_cleanupPreviousDownloadState___block_invoke;
          block[3] = &unk_24CE3B610;
          block[4] = v27;
          v33 = v31;
          dispatch_async(v29, block);

        }
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v24);
  }

}

uint64_t __45__SUDownloader_cleanupPreviousDownloadState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "downloadWasInvalidated:", *(_QWORD *)(a1 + 40));
}

- (void)_snapshotProgress
{
  void *v3;
  NSObject *v4;
  void *v5;
  SUOperationProgress *v6;
  SUOperationProgress *downloadProgressSnapshot;
  NSDate *v8;
  NSDate *downloadProgressSnapshotDate;

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUDownload progress](self->_download, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SUOperationProgress *)objc_msgSend(v5, "copy");
  downloadProgressSnapshot = self->_downloadProgressSnapshot;
  self->_downloadProgressSnapshot = v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  downloadProgressSnapshotDate = self->_downloadProgressSnapshotDate;
  self->_downloadProgressSnapshotDate = v8;

}

- (void)operatorBundleChanged
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUDownloader core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SUDownloader_operatorBundleChanged__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __37__SUDownloader_operatorBundleChanged__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  if (objc_msgSend(*(id *)(a1 + 32), "isDownloading"))
  {
    v2 = *(id **)(a1 + 32);
    objc_msgSend(v2[4], "progress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "phase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = objc_msgSend(v2, "_orderForPhase:", v4);

    if ((int)v2 <= 4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "downloadOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "activeDownloadPolicyType") != 2
        && (objc_msgSend(*(id *)(a1 + 32), "_reapplyExistingDownloadPolicyIfDownloadable:", 1) & 1) == 0)
      {
        SULogInfo(CFSTR("Cellular operator status changed, and now the download is not downloadable.  Attempting to cancel the download."), v6, v7, v8, v9, v10, v11, v12, v24);
        v13 = *(void **)(a1 + 32);
        v25 = 0;
        v14 = objc_msgSend(v13, "cancelDownload:userRequested:keepDocAssets:error:", 1, 0, 1, &v25);
        v15 = v25;
        v23 = v15;
        if ((v14 & 1) == 0)
          SULogInfo(CFSTR("Unable to cancel download for cellular bundle change: %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);

      }
    }
  }
}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  int v9;

  -[SUDownloader core](self, "core", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__SUDownloader_networkChangedFromNetworkType_toNetworkType___block_invoke;
  v8[3] = &unk_24CE3BB10;
  v8[4] = self;
  v9 = a4;
  dispatch_async(v7, v8);

}

void __60__SUDownloader_networkChangedFromNetworkType_toNetworkType___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  int v5;
  id *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  if (objc_msgSend(*(id *)(a1 + 32), "isDownloading"))
  {
    if (*(_DWORD *)(a1 + 40) == 1)
      goto LABEL_5;
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allowCellularDownload") & 1) == 0)
    {
      LODWORD(v2) = 0;
      objc_msgSend(*(id *)(a1 + 32), "_changeDownloadPhase:progress:timeRemaining:", CFSTR("SUDownloadPhaseFetchingStalled"), v2, 0.0);
      return;
    }
    if (*(_DWORD *)(a1 + 40) == 1)
    {
LABEL_5:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "progress");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "phase");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SUDownloadPhaseFetchingStalled"));

      if (v5)
      {
        v6 = *(id **)(a1 + 32);
        objc_msgSend(v6[4], "progress");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "percentComplete");
        v8 = v7;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "progress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeRemaining");
        v11 = v10;
        LODWORD(v10) = v8;
        objc_msgSend(v6, "_changeDownloadPhase:progress:timeRemaining:", CFSTR("SUDownloadPhaseFetching"), v10, v11);

      }
    }
  }
}

- (id)slaVersion
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[SUDownloader download](self, "download");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SUDownloader download](self, "download");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptor");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v7 = (void *)v6;
    -[SUDownloader download](self, "download");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SUDownloader download](self, "download");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "descriptor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "documentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "slaVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      return v12;
    }
  }
  v12 = 0;
  return v12;
}

+ (id)purgeOptionsForDescriptor:(id)a3 downloadOptions:(id)a4 completionQueue:(id)a5
{
  id v7;
  id v8;
  id v9;
  SUSpacePurgeOptions *v10;
  unint64_t v11;
  uint64_t v12;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(SUSpacePurgeOptions);
  v11 = +[SUUtility totalDiskSpaceForUpdate:](SUUtility, "totalDiskSpaceForUpdate:", v9);

  -[SUSpacePurgeOptions setNeededBytes:](v10, "setNeededBytes:", v11);
  -[SUSpacePurgeOptions setEnableCacheDelete:](v10, "setEnableCacheDelete:", 1);
  if ((objc_msgSend(v7, "isAutoDownload") & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(v7, "isAppOffloadEnabled");
  -[SUSpacePurgeOptions setEnableAppOffload:](v10, "setEnableAppOffload:", v12);
  -[SUSpacePurgeOptions setCacheDeleteUrgency:](v10, "setCacheDeleteUrgency:", 4);
  -[SUSpacePurgeOptions setAppOffloadUrgency:](v10, "setAppOffloadUrgency:", 4);
  -[SUSpacePurgeOptions setCompletionQueue:](v10, "setCompletionQueue:", v8);

  return v10;
}

- (SUManagerCore)core
{
  return (SUManagerCore *)objc_loadWeakRetained((id *)&self->_core);
}

- (void)setCore:(id)a3
{
  objc_storeWeak((id *)&self->_core, a3);
}

- (BOOL)downloadStateResetSinceStartup
{
  return self->_downloadStateResetSinceStartup;
}

- (void)setDownloadStateResetSinceStartup:(BOOL)a3
{
  self->_downloadStateResetSinceStartup = a3;
}

- (SUOperationProgress)downloadProgressSnapshot
{
  return self->_downloadProgressSnapshot;
}

- (void)setDownloadProgressSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgressSnapshot, a3);
}

- (NSDate)downloadProgressSnapshotDate
{
  return self->_downloadProgressSnapshotDate;
}

- (void)setDownloadProgressSnapshotDate:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgressSnapshotDate, a3);
}

- (BOOL)goNonDiscretionaryOnDownload
{
  return self->_goNonDiscretionaryOnDownload;
}

- (void)setGoNonDiscretionaryOnDownload:(BOOL)a3
{
  self->_goNonDiscretionaryOnDownload = a3;
}

- (SUDescriptor)loadBrainForDescriptor
{
  return self->_loadBrainForDescriptor;
}

- (void)setLoadBrainForDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_loadBrainForDescriptor, a3);
}

- (SUDescriptor)brainLoadedForDescriptor
{
  return self->_brainLoadedForDescriptor;
}

- (void)setBrainLoadedForDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_brainLoadedForDescriptor, a3);
}

- (unint64_t)brainLoadAttemptsForDescriptor
{
  return self->_brainLoadAttemptsForDescriptor;
}

- (void)setBrainLoadAttemptsForDescriptor:(unint64_t)a3
{
  self->_brainLoadAttemptsForDescriptor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brainLoadedForDescriptor, 0);
  objc_storeStrong((id *)&self->_loadBrainForDescriptor, 0);
  objc_storeStrong((id *)&self->_downloadProgressSnapshotDate, 0);
  objc_storeStrong((id *)&self->_downloadProgressSnapshot, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong((id *)&self->_downloadAsset, 0);
  objc_destroyWeak((id *)&self->_core);
}

@end
