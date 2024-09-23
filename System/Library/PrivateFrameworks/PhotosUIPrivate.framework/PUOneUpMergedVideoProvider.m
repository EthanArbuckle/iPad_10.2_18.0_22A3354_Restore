@implementation PUOneUpMergedVideoProvider

- (PUOneUpMergedVideoProvider)initWithBrowsingViewModel:(id)a3
{
  id v5;
  PUOneUpMergedVideoProvider *v6;
  ISLivePhotoPlayer *v7;
  ISLivePhotoPlayer *livePhotoPlayer;
  NSCache *v9;
  NSCache *dataCache;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUOneUpMergedVideoProvider;
  v6 = -[PUOneUpMergedVideoProvider init](&v12, sel_init);
  if (v6)
  {
    v7 = (ISLivePhotoPlayer *)objc_alloc_init(MEMORY[0x1E0D78268]);
    livePhotoPlayer = v6->_livePhotoPlayer;
    v6->_livePhotoPlayer = v7;

    -[ISLivePhotoPlayer setTargetReadiness:](v6->_livePhotoPlayer, "setTargetReadiness:", 2);
    -[ISLivePhotoPlayer setDelegate:](v6->_livePhotoPlayer, "setDelegate:", v6);
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    dataCache = v6->_dataCache;
    v6->_dataCache = v9;

    v6->_state = 0;
    objc_storeStrong((id *)&v6->_browsingViewModel, a3);
    objc_msgSend(v5, "registerChangeObserver:", v6);
  }

  return v6;
}

- (void)setIsEnabled:(BOOL)a3
{
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    -[PUOneUpMergedVideoProvider _updateRequest](self, "_updateRequest");
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (((objc_msgSend(v6, "currentAssetDidChange") & 1) != 0
     || (objc_msgSend(v6, "videoOverlayPlayStateDidChange") & 1) != 0
     || (objc_msgSend(v6, "isVideoContentAllowedDidChange") & 1) != 0
     || (objc_msgSend(v6, "isScrubbingDidChange") & 1) != 0
     || objc_msgSend(v6, "currentAssetTransitionProgressDidChange"))
    && !objc_msgSend(v7, "videoOverlayPlayState"))
  {
    -[PUOneUpMergedVideoProvider _updateRequest](self, "_updateRequest");
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = v6;
    px_dispatch_on_main_queue();

  }
}

- (id)wrappedVideoPlayerForPlayer:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D7BBD0], "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkOutReusableWrappedPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)playerWillRelinquishVideoPlayer:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D7BBD0];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkInReusableWrappedPlayer:", v4);

}

- (void)_updateRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PUMergedLivePhotosVideoRequest *v17;
  void *v18;
  PUMergedLivePhotosVideoRequest *v19;
  void *v20;
  _BOOL4 v21;
  _QWORD v22[5];

  -[PUOneUpMergedVideoProvider browsingViewModel](self, "browsingViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpMergedVideoProvider currentRequest](self, "currentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isVideoContentAllowed");
  if (v4 && v7 && (objc_msgSend(v3, "isScrubbing") & 1) == 0)
  {
    objc_msgSend(v6, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      v12 = objc_msgSend(v9, "isContentEqualTo:", v10);
      if (!v12)
        v12 = objc_msgSend(v11, "isContentEqualTo:", v9);

      if (v12 != 2)
      {
LABEL_12:
        objc_msgSend(v5, "cancel");
        objc_msgSend(v3, "assetsDataSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v4, "asset");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "playbackStyle");

          if (v16 == 3)
          {
            v17 = [PUMergedLivePhotosVideoRequest alloc];
            -[PUOneUpMergedVideoProvider dataCache](self, "dataCache");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[PUMergedLivePhotosVideoRequest initWithAssetReference:dataSource:dataCache:](v17, "initWithAssetReference:dataSource:dataCache:", v4, v14, v18);

            -[PUMergedLivePhotosVideoRequest registerChangeObserver:context:](v19, "registerChangeObserver:context:", self, 0);
            -[PUOneUpMergedVideoProvider setCurrentRequest:](self, "setCurrentRequest:", v19);

          }
        }

LABEL_16:
        objc_msgSend(v3, "assetViewModelForCurrentAssetReference");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isFullyInFocus"))
        {
          v21 = -[PUOneUpMergedVideoProvider isEnabled](self, "isEnabled");

          if (!v21)
          {
LABEL_20:

            goto LABEL_21;
          }
          -[PUOneUpMergedVideoProvider currentRequest](self, "currentRequest");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "start");
        }

        goto LABEL_20;
      }
    }
    v13 = objc_opt_class();
    if (v13 == objc_opt_class())
      goto LABEL_16;
    goto LABEL_12;
  }
  objc_msgSend(v5, "cancel");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __44__PUOneUpMergedVideoProvider__updateRequest__block_invoke;
  v22[3] = &unk_1E58AB370;
  v22[4] = self;
  -[PUOneUpMergedVideoProvider performChanges:](self, "performChanges:", v22);
LABEL_21:

}

- (void)_handleRequestChanges:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_4;
      v8[3] = &unk_1E58AB370;
      v8[4] = self;
      -[PUOneUpMergedVideoProvider performChanges:](self, "performChanges:", v8);
      break;
    case 2:
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_3;
      v9[3] = &unk_1E58AB370;
      v9[4] = self;
      -[PUOneUpMergedVideoProvider performChanges:](self, "performChanges:", v9);
      objc_msgSend(v4, "unregisterChangeObserver:context:", self, 0);
      break;
    case 3:
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke;
      v12[3] = &unk_1E58AB398;
      v12[4] = self;
      v5 = v4;
      v13 = v5;
      -[PUOneUpMergedVideoProvider performChanges:](self, "performChanges:", v12);
      objc_msgSend(v5, "unregisterChangeObserver:context:", self, 0);
      v6 = v13;
      goto LABEL_6;
    case 4:
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_2;
      v10[3] = &unk_1E58AB398;
      v10[4] = self;
      v7 = v4;
      v11 = v7;
      -[PUOneUpMergedVideoProvider performChanges:](self, "performChanges:", v10);
      objc_msgSend(v7, "unregisterChangeObserver:context:", self, 0);
      v6 = v11;
LABEL_6:

      break;
    default:
      break;
  }

}

- (void)setMergedVideo:(id)a3
{
  PUMergedLivePhotosVideo *v5;
  PUMergedLivePhotosVideo *v6;

  v5 = (PUMergedLivePhotosVideo *)a3;
  if (self->_mergedVideo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mergedVideo, a3);
    -[PUOneUpMergedVideoProvider _updateLivePhotoPlayerItem](self, "_updateLivePhotoPlayerItem");
    -[PUOneUpMergedVideoProvider signalChange:](self, "signalChange:", 2);
    v5 = v6;
  }

}

- (void)setError:(id)a3
{
  NSError *v5;
  NSError *v6;

  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    -[PUOneUpMergedVideoProvider signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PUOneUpMergedVideoProvider signalChange:](self, "signalChange:", 1);
  }
}

- (void)_updateLivePhotoPlayerItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PUOneUpMergedVideoProvider mergedVideo](self, "mergedVideo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mergedVideoAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mergedVideoComposition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 2 * (objc_msgSend(v4, "options") & 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D78260]), "initWithVideoAsset:UIImage:photoTime:photoEXIFOrientation:options:", v5, 0, 0, v7, 0.0);
    v9 = (void *)MEMORY[0x1E0D78278];
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "videoAspectRatio");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerItemWithAsset:targetSize:contentAspectRatio:", v8, v11, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setVideoComposition:", v6);
  }
  else
  {
    v13 = 0;
  }
  -[PUOneUpMergedVideoProvider livePhotoPlayer](self, "livePhotoPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPlayerItem:", v13);

}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUMergedLivePhotosVideo)mergedVideo
{
  return self->_mergedVideo;
}

- (ISLivePhotoPlayer)livePhotoPlayer
{
  return self->_livePhotoPlayer;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (PUMergedLivePhotosVideoRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (NSCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
  objc_storeStrong((id *)&self->_dataCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_livePhotoPlayer, 0);
  objc_storeStrong((id *)&self->_mergedVideo, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

uint64_t __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "mergedVideo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMergedVideo:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setError:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
}

uint64_t __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setMergedVideo:", 0);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setError:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
}

uint64_t __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMergedVideo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setError:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
}

uint64_t __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMergedVideo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setError:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
}

uint64_t __44__PUOneUpMergedVideoProvider__updateRequest__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMergedVideo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setError:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRequest:", 0);
}

void __59__PUOneUpMergedVideoProvider_observable_didChange_context___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  id v12;

  v12 = *(id *)(a1 + 32);
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("PUOneUpMergedVideoProvider.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v7, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v4, v5, CFSTR("PUOneUpMergedVideoProvider.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v7);
  }

LABEL_3:
  objc_msgSend(*(id *)(a1 + 40), "currentRequest");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v2)
    objc_msgSend(*(id *)(a1 + 40), "_handleRequestChanges:", v12);
  else
    objc_msgSend(v12, "unregisterChangeObserver:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

@end
