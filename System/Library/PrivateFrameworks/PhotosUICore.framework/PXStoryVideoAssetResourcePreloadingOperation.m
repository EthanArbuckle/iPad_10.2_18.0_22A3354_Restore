@implementation PXStoryVideoAssetResourcePreloadingOperation

- (PXStoryVideoAssetResourcePreloadingOperation)initWithVideoAssetResource:(id)a3 mediaProvider:(id)a4 downloadTimeRange:(id *)a5 videoSessionManager:(id)a6 isExporting:(BOOL)a7 isInline:(BOOL)a8
{
  id v15;
  char *v16;
  PXStoryVideoAssetResourcePreloadingOperation *v17;
  __int128 v18;
  __int128 v19;
  objc_super v21;

  v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryVideoAssetResourcePreloadingOperation;
  v16 = -[PXStoryDisplayAssetResourcePreloadingOperation initWithDisplayAssetResource:mediaProvider:](&v21, sel_initWithDisplayAssetResource_mediaProvider_, a3, a4);
  v17 = (PXStoryVideoAssetResourcePreloadingOperation *)v16;
  if (v16)
  {
    v19 = *(_OWORD *)&a5->var0.var3;
    v18 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)(v16 + 328) = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)(v16 + 344) = v19;
    *(_OWORD *)(v16 + 360) = v18;
    objc_storeStrong((id *)v16 + 39, a6);
    v17->_isExporting = a7;
    v17->_isInline = a8;
  }

  return v17;
}

- (PXStoryVideoAssetResourcePreloadingOperation)initWithDisplayAssetResource:(id)a3 mediaProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryVideoAssetResourcePreloadingOperation.m"), 46, CFSTR("%s is not available as initializer"), "-[PXStoryVideoAssetResourcePreloadingOperation initWithDisplayAssetResource:mediaProvider:]");

  abort();
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  _BYTE v11[48];

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXStoryDisplayAssetResourcePreloadingOperation displayAsset](self, "displayAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryVideoAssetResourcePreloadingOperation downloadTimeRange](self, "downloadTimeRange");
  PXCMTimeRangeDescription((uint64_t)v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryVideoAssetResourcePreloadingOperation videoContentProvider](self, "videoContentProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadingProgress");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Video %@, time range %@ – %.0f%%"), v5, v6, v8 * 100.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)px_start
{
  PXVideoSessionManagerDisplayAssetOptions *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  PXVideoSessionManagerDisplayAssetOptions *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[48];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[48];
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PXStoryVideoAssetResourcePreloadingOperation;
  -[PXStoryDisplayAssetResourcePreloadingOperation px_start](&v28, sel_px_start);
  v3 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
  if (-[PXStoryVideoAssetResourcePreloadingOperation isExporting](self, "isExporting"))
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "exportVideoQuality");

    -[PXStoryVideoAssetResourcePreloadingOperation downloadTimeRange](self, "downloadTimeRange");
    -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:](v3, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:", v5, v27, 0);
    v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v24 = *MEMORY[0x1E0CA2E40];
    v25 = v6;
    v26 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v7 = v3;
    v8 = v5;
  }
  else
  {
    -[PXStoryVideoAssetResourcePreloadingOperation downloadTimeRange](self, "downloadTimeRange");
    -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:networkAccessAllowed:](v3, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:networkAccessAllowed:", 2, v23, 0, 0);
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "videoQuality");

    -[PXStoryVideoAssetResourcePreloadingOperation downloadTimeRange](self, "downloadTimeRange");
    -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:](v3, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:", v10, &v22, 0);
    v11 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v24 = *MEMORY[0x1E0CA2E40];
    v25 = v11;
    v26 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v7 = v3;
    v8 = 3;
  }
  -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:](v7, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:", v8, &v24, 0);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "videoInlineStabilization");

  if (v13
    && (-[PXStoryDisplayAssetResourcePreloadingOperation displayAsset](self, "displayAsset"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "playbackStyle"),
        v14,
        v15 == 3))
  {
    -[PXVideoSessionManagerDisplayAssetOptions setShouldStabilizeLivePhotosIfPossible:](v3, "setShouldStabilizeLivePhotosIfPossible:", 1);
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  -[PXStoryVideoAssetResourcePreloadingOperation videoSessionManager](self, "videoSessionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDisplayAssetResourcePreloadingOperation displayAsset](self, "displayAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDisplayAssetResourcePreloadingOperation mediaProvider](self, "mediaProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentProviderForAsset:withOptions:mediaProvider:requestURLOnly:", v18, v3, v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryVideoAssetResourcePreloadingOperation setVideoContentProvider:](self, "setVideoContentProvider:", v20);
  objc_msgSend(v20, "registerChangeObserver:context:", self, VideoContentProviderObservationContext);
  if (-[PXStoryVideoAssetResourcePreloadingOperation isInline](self, "isInline"))
    v21 = 6;
  else
    v21 = 1;
  objc_msgSend(v20, "beginLoadingWithPriority:", v21);

}

- (void)cancel
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryVideoAssetResourcePreloadingOperation;
  -[PXAsyncOperation cancel](&v5, sel_cancel);
  -[PXStoryVideoAssetResourcePreloadingOperation videoContentProvider](self, "videoContentProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:context:", self, VideoContentProviderObservationContext);

  -[PXStoryVideoAssetResourcePreloadingOperation videoContentProvider](self, "videoContentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelLoading");

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v8 = a3;
  if ((void *)VideoContentProviderObservationContext == a5)
  {
    v14 = v8;
    if ((v6 & 2) != 0)
    {
      -[PXStoryDisplayAssetResourcePreloadingOperation progressHandler](self, "progressHandler");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[PXStoryVideoAssetResourcePreloadingOperation videoContentProvider](self, "videoContentProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "loadingProgress");
        v9[2](v9, 0);

      }
      v8 = v14;
    }
    if ((v6 & 1) != 0)
    {
      -[PXStoryVideoAssetResourcePreloadingOperation videoContentProvider](self, "videoContentProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loadingResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryDisplayAssetResourcePreloadingOperation setError:](self, "setError:", v13);

        -[PXStoryDisplayAssetResourcePreloadingOperation px_finishIfPossible](self, "px_finishIfPossible");
      }

      v8 = v14;
    }
  }

}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)downloadTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[6].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[7].var1.var0;
  return self;
}

- (PXVideoSessionManager)videoSessionManager
{
  return self->_videoSessionManager;
}

- (PXVideoContentProvider)videoContentProvider
{
  return (PXVideoContentProvider *)objc_getProperty(self, a2, 320, 1);
}

- (void)setVideoContentProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (BOOL)isExporting
{
  return self->_isExporting;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoContentProvider, 0);
  objc_storeStrong((id *)&self->_videoSessionManager, 0);
}

@end
