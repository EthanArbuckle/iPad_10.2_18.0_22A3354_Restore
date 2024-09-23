@implementation PXDisplayAssetLivePhotoContentView

- (int64_t)playbackStyle
{
  return 3;
}

- (id)contentView
{
  ISLivePhotoUIView *livePhotoView;
  ISLivePhotoUIView *v4;
  ISLivePhotoUIView *v5;
  void *v6;

  livePhotoView = self->_livePhotoView;
  if (!livePhotoView)
  {
    v4 = (ISLivePhotoUIView *)objc_alloc_init(MEMORY[0x1E0D78270]);
    v5 = self->_livePhotoView;
    self->_livePhotoView = v4;

    -[PXDisplayAssetLivePhotoContentView _updateLivePhotoContentMode](self, "_updateLivePhotoContentMode");
    -[ISLivePhotoUIView layer](self->_livePhotoView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMasksToBounds:", 1);

    livePhotoView = self->_livePhotoView;
  }
  return livePhotoView;
}

- (void)contentModeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView contentModeDidChange](&v3, sel_contentModeDidChange);
  -[PXDisplayAssetLivePhotoContentView _updateLivePhotoContentMode](self, "_updateLivePhotoContentMode");
}

- (void)_updateLivePhotoContentMode
{
  -[ISLivePhotoUIView setContentMode:](self->_livePhotoView, "setContentMode:", -[PXDisplayAssetLivePhotoContentView contentMode](self, "contentMode"));
}

- (void)updateContent
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  PXVideoRequestOptions *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  uint64_t *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView updateContent](&v23, sel_updateContent);
  -[PXDisplayAssetContentView asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetContentView mediaProvider](self, "mediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetContentView targetSize](self, "targetSize");
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v4 && v3 && v5 > 0.0 && v6 > 0.0)
  {
    v7 = objc_alloc_init(PXVideoRequestOptions);
    -[PXVideoRequestOptions setNetworkAccessAllowed:](v7, "setNetworkAccessAllowed:", 1);
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke;
    v16[3] = &unk_1E5145AC0;
    objc_copyWeak(&v17, &location);
    -[PXVideoRequestOptions setProgressHandler:](v7, "setProgressHandler:", v16);
    v10 = v8;
    v11 = 3221225472;
    v12 = __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke_3;
    v13 = &unk_1E5125F30;
    objc_copyWeak(&v15, &location);
    v14 = &v19;
    v9 = objc_msgSend(v4, "requestPlayerItemForVideo:options:resultHandler:", v3, v7, &v10);
    v20[3] = v9;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PXDisplayAssetLivePhotoContentView setVideoPlayerItem:](self, "setVideoPlayerItem:", 0);
  }
  -[PXDisplayAssetContentView setRequestID:](self, "setRequestID:", v20[3], v10, v11, v12, v13);
  _Block_object_dispose(&v19, 8);

}

- (void)setPlayerItemLoadingProgress:(double)a3
{
  if (self->_playerItemLoadingProgress != a3)
  {
    self->_playerItemLoadingProgress = a3;
    -[PXDisplayAssetContentView invalidateLoadingProgress](self, "invalidateLoadingProgress");
  }
}

- (void)imageProgressDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView imageProgressDidChange](&v3, sel_imageProgressDidChange);
  -[PXDisplayAssetContentView invalidateLoadingProgress](self, "invalidateLoadingProgress");
}

- (void)effectivePreferredImageDynamicRangeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView effectivePreferredImageDynamicRangeDidChange](&v3, sel_effectivePreferredImageDynamicRangeDidChange);
  -[PXDisplayAssetContentView effectivePreferredImageDynamicRange](self, "effectivePreferredImageDynamicRange");
  -[ISLivePhotoUIView setPreferredImageDynamicRange:](self->_livePhotoView, "setPreferredImageDynamicRange:", PXPlatformImageDynamicRangeFromPXImageDynamicRange());
}

- (double)loadingProgress
{
  double v3;
  double v4;
  double v5;

  -[PXDisplayAssetContentView imageProgress](self, "imageProgress");
  v4 = v3;
  -[PXDisplayAssetLivePhotoContentView playerItemLoadingProgress](self, "playerItemLoadingProgress");
  return v5 * 0.33 + v4 * 0.67;
}

- (void)_handlePlayerItemResult:(id)a3 info:(id)a4 requestID:(int64_t)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8420);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (-[PXDisplayAssetContentView requestID](self, "requestID") == a5 && (v10 & 1) == 0)
  {
    -[PXDisplayAssetLivePhotoContentView setVideoPlayerItem:](self, "setVideoPlayerItem:", v12);
    if (!v12)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8430);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDisplayAssetContentView handleError:](self, "handleError:", v11);

    }
  }

}

- (void)imageDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView imageDidChange](&v3, sel_imageDidChange);
  -[PXDisplayAssetLivePhotoContentView _updateLivePhotoPlayerItem](self, "_updateLivePhotoPlayerItem");
}

- (void)placeholderImageFiltersDidChange
{
  NSObject *v2;
  uint8_t v3[16];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView placeholderImageFiltersDidChange](&v4, sel_placeholderImageFiltersDidChange);
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Warning: PXDisplayAssetContentView placeholder image filters are not currnetly supported for Live Photos", v3, 2u);
  }

}

- (void)contentsRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView contentsRectDidChange](&v3, sel_contentsRectDidChange);
  -[PXDisplayAssetContentView contentsRect](self, "contentsRect");
  -[ISLivePhotoUIView setContentsRect:](self->_livePhotoView, "setContentsRect:");
}

- (void)setVideoPlayerItem:(id)a3
{
  AVPlayerItem *v5;
  AVPlayerItem *v6;

  v5 = (AVPlayerItem *)a3;
  if (self->_videoPlayerItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_videoPlayerItem, a3);
    -[PXDisplayAssetLivePhotoContentView _updateLivePhotoPlayerItem](self, "_updateLivePhotoPlayerItem");
    -[PXDisplayAssetContentView isDisplayingFullQualityContentDidChange](self, "isDisplayingFullQualityContentDidChange");
    v5 = v6;
  }

}

- (BOOL)isDisplayingFullQualityContent
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PXDisplayAssetContentView imageRequester](self, "imageRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasFullQuality"))
  {
    -[PXDisplayAssetLivePhotoContentView videoPlayerItem](self, "videoPlayerItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateLivePhotoPlayerItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  -[PXDisplayAssetContentView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVPlayerItem asset](self->_videoPlayerItem, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageOrientation");
    v5 = PLExifOrientationFromImageOrientation();
    if (v4)
    {
      objc_msgSend(v4, "duration");
      v6 = (float)((float)v14 * 0.5);
    }
    else
    {
      v6 = 0.0;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D78260]), "initWithVideoAsset:UIImage:photoTime:photoEXIFOrientation:options:", v4, v3, v5, 0, v6);
    v8 = (void *)MEMORY[0x1E0D78278];
    -[PXDisplayAssetContentView targetSize](self, "targetSize");
    objc_msgSend(v8, "playerItemWithAsset:targetSize:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerItem videoComposition](self->_videoPlayerItem, "videoComposition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVideoComposition:", v10);

    -[ISLivePhotoUIView player](self->_livePhotoView, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      if (!v11)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0D78268]);
        objc_msgSend(v12, "setAudioEnabled:", 0);
        -[ISLivePhotoUIView setPlayer:](self->_livePhotoView, "setPlayer:", v12);
      }
      v11 = v12;
      v13 = v9;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v11, "setPlayerItem:", v13);

  }
  else
  {
    -[ISLivePhotoUIView player](self->_livePhotoView, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlayerItem:", 0);
  }

}

- (void)imageRequesterDidChange:(unint64_t)a3
{
  char v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView imageRequesterDidChange:](&v5, sel_imageRequesterDidChange_);
  if ((v3 & 8) != 0)
    -[PXDisplayAssetContentView isDisplayingFullQualityContentDidChange](self, "isDisplayingFullQualityContentDidChange");
}

- (void)viewModelDidChange:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  int v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView viewModelDidChange:](&v8, sel_viewModelDidChange_);
  if ((v3 & 0x10) != 0)
  {
    -[ISLivePhotoUIView player](self->_livePhotoView, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetContentView viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wantsLivePhotoPlayback");

    if (v7)
      objc_msgSend(v5, "startPlaybackWithStyle:settleAutomatically:", 1, 1);
    else
      objc_msgSend(v5, "stopPlayback");

  }
}

- (AVPlayerItem)videoPlayerItem
{
  return self->_videoPlayerItem;
}

- (double)playerItemLoadingProgress
{
  return self->_playerItemLoadingProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerItem, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

void __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10[2];

  v8 = a2;
  v9 = a5;
  objc_copyWeak(v10, (id *)(a1 + 32));
  v10[1] = *(id *)&a3;
  px_dispatch_on_main_queue();
  objc_destroyWeak(v10);

}

void __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v5;
  v8 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handlePlayerItemResult:info:requestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

void __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke_2(uint64_t a1)
{
  double v1;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPlayerItemLoadingProgress:", v1);

}

@end
