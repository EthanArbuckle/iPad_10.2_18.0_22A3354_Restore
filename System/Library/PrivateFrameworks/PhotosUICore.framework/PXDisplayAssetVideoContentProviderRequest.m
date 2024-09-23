@implementation PXDisplayAssetVideoContentProviderRequest

- (PXDisplayAssetVideoContentProviderRequest)initWithAsset:(id)a3 mediaProvider:(id)a4 strategies:(id)a5 priority:(int64_t)a6 requestURLOnly:(BOOL)a7 delegate:(id)a8 loadingQueue:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  PXDisplayAssetVideoContentProviderRequest *v19;
  PXDisplayAssetVideoContentProviderRequest *v20;
  id v23;
  objc_super v24;

  v23 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)PXDisplayAssetVideoContentProviderRequest;
  v19 = -[PXDisplayAssetVideoContentProviderRequest init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_asset, a3);
    objc_storeStrong((id *)&v20->_mediaProvider, a4);
    objc_storeStrong((id *)&v20->_strategies, a5);
    v20->_priority = a6;
    v20->_requestURLOnly = a7;
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_loadingQueue, a9);
  }

  return v20;
}

- (void)cancel
{
  void *v3;

  -[PXDisplayAssetVideoContentProviderRequest mediaProvider](self, "mediaProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", self->_requestID);

  self->_isCancelled = 1;
}

- (void)_start
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (-[PXDisplayAssetVideoContentProviderRequest priority](self, "priority") < 0)
  {
    v3 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PXDisplayAssetVideoContentProviderRequest__start__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[PXDisplayAssetVideoContentProviderRequest _loadMediaWithStrategyAtIndex:](self, "_loadMediaWithStrategyAtIndex:", 0);
  }
}

- (void)_loadMediaWithStrategyAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  PXVideoRequestOptions *v7;
  int v8;
  void *v9;
  uint64_t v10;
  int v11;
  int64_t v12;
  uint64_t v13;
  _OWORD *v14;
  NSObject *v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id *v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26[2];
  _QWORD v27[4];
  id v28[2];
  _QWORD v29[4];
  id v30;
  id location[2];
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[3];
  uint64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  -[PXDisplayAssetVideoContentProviderRequest strategies](self, "strategies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isCancelled)
  {
    v43 = *MEMORY[0x1E0CD1BE0];
    v44[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v7 = (PXVideoRequestOptions *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetVideoContentProviderRequest _handleLoadedPlayerItem:videoURL:info:strategyAtIndex:](self, "_handleLoadedPlayerItem:videoURL:info:strategyAtIndex:", 0, 0, v7, a3);
    goto LABEL_29;
  }
  v7 = objc_alloc_init(PXVideoRequestOptions);
  -[PXVideoRequestOptions setNetworkAccessAllowed:](v7, "setNetworkAccessAllowed:", objc_msgSend(v6, "isNetworkAccessAllowed"));
  objc_msgSend(v6, "targetSize");
  -[PXVideoRequestOptions setTargetSize:](v7, "setTargetSize:");
  -[PXVideoRequestOptions setIncludeTimeRangeMapper:](v7, "setIncludeTimeRangeMapper:", 1);
  -[PXVideoRequestOptions setRestrictToPlayableOnCurrentDevice:](v7, "setRestrictToPlayableOnCurrentDevice:", 1);
  PXSetupPXVideoRequestOptionsForDeliveryQuality(v7, objc_msgSend(v6, "quality"));
  if (v6)
  {
    objc_msgSend(v6, "segmentTimeRange");
    if ((BYTE12(v40) & 1) == 0
      || (objc_msgSend(v6, "segmentTimeRange"), (v39 & 1) == 0)
      || (objc_msgSend(v6, "segmentTimeRange"), v38)
      || (objc_msgSend(v6, "segmentTimeRange"), v37 < 0))
    {
      v8 = 0;
    }
    else
    {
      +[PXVideoPlaybackSettings sharedInstance](PXVideoPlaybackSettings, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v22, "isDownloadingVideoSegmentsEnabled");

    }
  }
  else
  {
    v8 = 0;
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
  }
  -[PXDisplayAssetVideoContentProviderRequest asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playbackStyle");

  v11 = objc_msgSend(v6, "isStreamingAllowed") ^ 1;
  if (v10 != 4)
    v11 = 1;
  if (((v11 | v8) & 1) == 0)
  {
    -[PXVideoRequestOptions setStreamingAllowed:](v7, "setStreamingAllowed:", 1);
    v12 = -[PXDisplayAssetVideoContentProviderRequest priority](self, "priority");
    v13 = 2;
    switch(v12)
    {
      case 0:
      case 5:
      case 6:
        break;
      case 1:
        PXAssertGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(location[0]) = 0;
          _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Memories preloading shouldn't request streaming videos", (uint8_t *)location, 2u);
        }

        v13 = 2;
        break;
      case 2:
        v13 = 3;
        break;
      case 3:
      case 4:
        v13 = 1;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXVideoRequestOptionsStreamingVideoIntent _streamingVideoIntentForPriority(PXVideoLoadingPriority)");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXDisplayAssetVideoContentProvider.m"), 635, CFSTR("Code which should be unreachable has been reached"));

        abort();
    }
    -[PXVideoRequestOptions setStreamingVideoIntent:](v7, "setStreamingVideoIntent:", v13);
    -[PXVideoRequestOptions setDownloadIntent:](v7, "setDownloadIntent:", _downloadIntentForPriority(-[PXDisplayAssetVideoContentProviderRequest priority](self, "priority")));
    -[PXVideoRequestOptions setDownloadPriority:](v7, "setDownloadPriority:", _downloadPriorityForPriority(-[PXDisplayAssetVideoContentProviderRequest priority](self, "priority")));
    v16 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v36[0] = *MEMORY[0x1E0CA2E40];
    v36[1] = v16;
    v36[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v14 = v36;
    goto LABEL_24;
  }
  -[PXVideoRequestOptions setStreamingAllowed:](v7, "setStreamingAllowed:", 0);
  -[PXVideoRequestOptions setDownloadIntent:](v7, "setDownloadIntent:", _downloadIntentForPriority(-[PXDisplayAssetVideoContentProviderRequest priority](self, "priority")));
  -[PXVideoRequestOptions setDownloadPriority:](v7, "setDownloadPriority:", _downloadPriorityForPriority(-[PXDisplayAssetVideoContentProviderRequest priority](self, "priority")));
  if (v8)
  {
    if (v6)
    {
      objc_msgSend(v6, "segmentTimeRange");
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
    }
    v32[0] = v33;
    v32[1] = v34;
    v32[2] = v35;
    v14 = v32;
LABEL_24:
    -[PXVideoRequestOptions setTimeRange:](v7, "setTimeRange:", v14);
  }
  objc_initWeak(location, self);
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke;
  v29[3] = &unk_1E5145AC0;
  objc_copyWeak(&v30, location);
  -[PXVideoRequestOptions setProgressHandler:](v7, "setProgressHandler:", v29);
  if (-[PXDisplayAssetVideoContentProviderRequest requestURLOnly](self, "requestURLOnly"))
  {
    -[PXDisplayAssetVideoContentProviderRequest mediaProvider](self, "mediaProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetVideoContentProviderRequest asset](self, "asset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke_2;
    v27[3] = &unk_1E5115810;
    v20 = v28;
    objc_copyWeak(v28, location);
    v28[1] = (id)a3;
    v21 = objc_msgSend(v18, "requestURLForVideo:options:resultHandler:", v19, v7, v27);
  }
  else
  {
    -[PXDisplayAssetVideoContentProviderRequest mediaProvider](self, "mediaProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetVideoContentProviderRequest asset](self, "asset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke_3;
    v25[3] = &unk_1E5115838;
    v20 = v26;
    objc_copyWeak(v26, location);
    v26[1] = (id)a3;
    v21 = objc_msgSend(v18, "requestPlayerItemForVideo:options:resultHandler:", v19, v7, v25);
  }
  self->_requestID = v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
LABEL_29:

}

- (void)_handleLoadingProgress:(double)a3
{
  id v4;

  self->_loadingProgress = a3;
  -[PXDisplayAssetVideoContentProviderRequest delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestLoadingProgressDidChange:", self);

}

- (void)_handleLoadedPlayerItem:(id)a3 videoURL:(id)a4 info:(id)a5 strategyAtIndex:(int64_t)a6
{
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  void *v17;
  NSObject *v18;
  __CFString *v19;
  unint64_t v20;
  __CFString *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  unint64_t v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  unint64_t v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  dispatch_time_t v40;
  NSObject *v41;
  __CFString *v42;
  void *v43;
  _OWORD v44[3];
  _QWORD block[6];
  _QWORD v46[6];
  uint8_t buf[4];
  __CFString *v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  __CFString *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  -[PXDisplayAssetVideoContentProviderRequest strategies](self, "strategies");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", a6);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[PXDisplayAssetVideoContentProviderRequest requestURLOnly](self, "requestURLOnly"))
    v15 = v11;
  else
    v15 = v10;
  if (v15)
    goto LABEL_5;
  -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXDisplayAssetVideoContentProviderRequest _isTransientError:](self, "_isTransientError:", v22)
    || self->_retriesAfterTransientErrorCount > 0)
  {
    v23 = a6 + 1;

    -[PXDisplayAssetVideoContentProviderRequest strategies](self, "strategies");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v23 < v25)
    {
      PLVideoPlaybackGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[PXDisplayAssetVideoContentProviderRequest priority](self, "priority");
        if (v27 > 6)
          v28 = CFSTR("??");
        else
          v28 = off_1E513B6C0[v27];
        v36 = v28;
        -[PXDisplayAssetVideoContentProviderRequest asset](self, "asset");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v48 = v12;
        v49 = 2114;
        v50 = v36;
        v51 = 2114;
        v52 = v14;
        v53 = 2114;
        v54 = (uint64_t)v38;
        _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEFAULT, "VideoContentProvider failed to load. info:%{public}@, priority:%{public}@, strategy:%{public}@, displayAsset:%{public}@", buf, 0x2Au);

      }
      -[PXDisplayAssetVideoContentProviderRequest loadingQueue](self, "loadingQueue");
      v32 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke_295;
      block[3] = &unk_1E5144EB8;
      block[4] = self;
      block[5] = v23;
      dispatch_async(v32, block);
      goto LABEL_26;
    }
LABEL_5:
    v16 = -[__CFString isAudioAllowed](v14, "isAudioAllowed");
    if (v10 && (v16 & 1) == 0)
    {
      -[__CFString tracks](v10, "tracks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", &__block_literal_global_297);

    }
    PLVideoPlaybackGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (v10)
        v19 = v10;
      else
        v19 = v11;
      v20 = -[PXDisplayAssetVideoContentProviderRequest priority](self, "priority");
      if (v20 > 6)
        v21 = CFSTR("??");
      else
        v21 = off_1E513B6C0[v20];
      v29 = v21;
      -[PXDisplayAssetVideoContentProviderRequest asset](self, "asset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "uuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v48 = v19;
      v49 = 2114;
      v50 = v12;
      v51 = 2114;
      v52 = v29;
      v53 = 2114;
      v54 = (uint64_t)v14;
      v55 = 2114;
      v56 = v31;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "VideoContentProvider received result:%{public}@, info:%{public}@, priority:%{public}@, strategy:%{public}@, displayAsset:%{public}@", buf, 0x34u);

    }
    -[PXDisplayAssetVideoContentProviderRequest delegate](self, "delegate");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v14)
      -[__CFString segmentTimeRange](v14, "segmentTimeRange");
    else
      memset(v44, 0, sizeof(v44));
    -[NSObject request:didFinishWithPlayerItem:videoURL:downloadedTimeRange:info:](v32, "request:didFinishWithPlayerItem:videoURL:downloadedTimeRange:info:", self, v10, v11, v44, v12);
LABEL_26:

    goto LABEL_27;
  }
  PLVideoPlaybackGetLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = -[PXDisplayAssetVideoContentProviderRequest priority](self, "priority");
    if (v34 > 6)
      v35 = CFSTR("??");
    else
      v35 = off_1E513B6C0[v34];
    v42 = v35;
    -[PXDisplayAssetVideoContentProviderRequest asset](self, "asset");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "uuid");
    *(_DWORD *)buf = 138544386;
    v48 = v12;
    v49 = 2114;
    v50 = v42;
    v51 = 2114;
    v52 = v14;
    v53 = 2114;
    v54 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v54;
    v55 = 2114;
    v56 = v22;
    _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_DEFAULT, "VideoContentProvider failed to load but trying same strategy again. info:%{public}@, priority:%{public}@, strategy:%{public}@, displayAsset:%{public}@ error:%{public}@", buf, 0x34u);

  }
  ++self->_retriesAfterTransientErrorCount;
  v40 = dispatch_time(0, 200000000);
  -[PXDisplayAssetVideoContentProviderRequest loadingQueue](self, "loadingQueue");
  v41 = objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke;
  v46[3] = &unk_1E5144EB8;
  v46[4] = self;
  v46[5] = a6;
  dispatch_after(v40, v41, v46);

LABEL_27:
}

- (void)dealloc
{
  objc_super v3;

  -[PXMediaProvider cancelImageRequest:](self->_mediaProvider, "cancelImageRequest:", self->_requestID);
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetVideoContentProviderRequest;
  -[PXDisplayAssetVideoContentProviderRequest dealloc](&v3, sel_dealloc);
}

- (BOOL)_isTransientError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (v6 && (objc_msgSend(v4, "code") == 4097 || objc_msgSend(v4, "code") == 4099))
  {
    v7 = 1;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "underlyingErrors", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if (-[PXDisplayAssetVideoContentProviderRequest _isTransientError:](self, "_isTransientError:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)))
          {
            v7 = 1;
            goto LABEL_15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_15:

  }
  return v7;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (NSArray)strategies
{
  return self->_strategies;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)requestURLOnly
{
  return self->_requestURLOnly;
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (PXDisplayAssetVideoContentProviderRequestDelegate)delegate
{
  return (PXDisplayAssetVideoContentProviderRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_strategies, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

uint64_t __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke_295(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadMediaWithStrategyAtIndex:", *(_QWORD *)(a1 + 40));
}

uint64_t __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadMediaWithStrategyAtIndex:", *(_QWORD *)(a1 + 40));
}

void __99__PXDisplayAssetVideoContentProviderRequest__handleLoadedPlayerItem_videoURL_info_strategyAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "assetTrack");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == (void *)*MEMORY[0x1E0C8A7A0])
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "isEqualToString:") ^ 1;
  objc_msgSend(v2, "setEnabled:", v5);

}

void __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleLoadingProgress:", a2);

}

void __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleLoadedPlayerItem:videoURL:info:strategyAtIndex:", 0, v7, v6, *(_QWORD *)(a1 + 40));

}

void __75__PXDisplayAssetVideoContentProviderRequest__loadMediaWithStrategyAtIndex___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleLoadedPlayerItem:videoURL:info:strategyAtIndex:", v7, 0, v6, *(_QWORD *)(a1 + 40));

}

void __51__PXDisplayAssetVideoContentProviderRequest__start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Simulating CPLErrorFeatureIsThrottled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *MEMORY[0x1E0CD1BE8];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v7[0] = *MEMORY[0x1E0CA2E40];
  v7[1] = v6;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  objc_msgSend(v3, "request:didFinishWithPlayerItem:videoURL:downloadedTimeRange:info:", v4, 0, 0, v7, v5);

}

+ (id)startRequestWithAsset:(id)a3 mediaProvider:(id)a4 strategies:(id)a5 priority:(int64_t)a6 requestURLOnly:(BOOL)a7 delegate:(id)a8 loadingQueue:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PXDisplayAssetVideoContentProviderRequest *v20;

  v10 = a7;
  v15 = a9;
  v16 = a8;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[PXDisplayAssetVideoContentProviderRequest initWithAsset:mediaProvider:strategies:priority:requestURLOnly:delegate:loadingQueue:]([PXDisplayAssetVideoContentProviderRequest alloc], "initWithAsset:mediaProvider:strategies:priority:requestURLOnly:delegate:loadingQueue:", v19, v18, v17, a6, v10, v16, v15);

  -[PXDisplayAssetVideoContentProviderRequest _start](v20, "_start");
  return v20;
}

@end
