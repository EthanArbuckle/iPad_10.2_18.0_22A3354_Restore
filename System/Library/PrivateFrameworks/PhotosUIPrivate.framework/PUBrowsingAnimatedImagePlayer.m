@implementation PUBrowsingAnimatedImagePlayer

- (PUBrowsingAnimatedImagePlayer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingAnimatedImagePlayer.m"), 42, CFSTR("unavailable method"));

  return 0;
}

- (PUBrowsingAnimatedImagePlayer)initWithAsset:(id)a3 mediaProvider:(id)a4
{
  id v8;
  id v9;
  PUBrowsingAnimatedImagePlayer *v10;
  NSMutableSet *v11;
  NSMutableSet *animatedImageLoadingDisablingReasons;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUBrowsingAnimatedImagePlayer;
  v10 = -[PUViewModel init](&v16, sel_init);
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_asset, a3);
        objc_storeStrong((id *)&v10->_mediaProvider, a4);
        v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        animatedImageLoadingDisablingReasons = v10->__animatedImageLoadingDisablingReasons;
        v10->__animatedImageLoadingDisablingReasons = v11;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PUBrowsingAnimatedImagePlayer.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PUBrowsingAnimatedImagePlayer.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider != nil"));

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PUBrowsingAnimatedImagePlayer _cancelLoading](self, "_cancelLoading");
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingAnimatedImagePlayer;
  -[PUBrowsingAnimatedImagePlayer dealloc](&v3, sel_dealloc);
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUBrowsingAnimatedImagePlayerChange);
}

- (void)_cancelLoading
{
  void *v3;

  if (-[PUBrowsingAnimatedImagePlayer _animatedImageRequestID](self, "_animatedImageRequestID"))
  {
    -[PUBrowsingAnimatedImagePlayer mediaProvider](self, "mediaProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelImageRequest:", -[PUBrowsingAnimatedImagePlayer _animatedImageRequestID](self, "_animatedImageRequestID"));

    -[PUBrowsingAnimatedImagePlayer _setAnimatedImageRequestID:](self, "_setAnimatedImageRequestID:", 0);
  }
}

- (void)unloadAnimatedImage
{
  -[PUBrowsingAnimatedImagePlayer _setAnimatedImage:](self, "_setAnimatedImage:", 0);
  -[PUBrowsingAnimatedImagePlayer _invalidateAnimatedImage](self, "_invalidateAnimatedImage");
}

- (void)setAsset:(id)a3
{
  PUDisplayAsset *v5;
  PUDisplayAsset *asset;
  PUDisplayAsset *v7;
  PUDisplayAsset *v8;
  PUDisplayAsset *v9;
  uint64_t v10;
  PUDisplayAsset *v11;

  v5 = (PUDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    asset = self->_asset;
    v7 = v11;
    v8 = asset;
    if (v8 == v7)
    {

      goto LABEL_8;
    }
    v9 = v8;
    v10 = -[PUDisplayAsset isContentEqualTo:](v7, "isContentEqualTo:", v8);
    if (!v10)
      v10 = -[PUDisplayAsset isContentEqualTo:](v9, "isContentEqualTo:", v7);

    v5 = v11;
    if (v10 != 2)
    {
      -[PUBrowsingAnimatedImagePlayer _setAnimatedImage:](self, "_setAnimatedImage:", 0);
      -[PUBrowsingAnimatedImagePlayer _invalidateAnimatedImage](self, "_invalidateAnimatedImage");
LABEL_8:
      v5 = v11;
    }
  }

}

- (void)_setAnimatedImage:(id)a3
{
  PHAnimatedImage *v5;
  void *v6;
  PHAnimatedImage *v7;

  v5 = (PHAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    -[PUViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAnimatedImageDidChange:", 1);

    v5 = v7;
  }

}

- (void)setAnimatedImageLoadingDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingAnimatedImagePlayer.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[PUBrowsingAnimatedImagePlayer _animatedImageLoadingDisablingReasons](self, "_animatedImageLoadingDisablingReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "addObject:", v10);
  else
    objc_msgSend(v7, "removeObject:", v10);
  -[PUBrowsingAnimatedImagePlayer _setAnimatedImageLoadingAllowed:](self, "_setAnimatedImageLoadingAllowed:", objc_msgSend(v8, "count") == 0);

}

- (void)_setAnimatedImageLoadingAllowed:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_isAnimatedImageLoadingAllowed != a3)
  {
    self->_isAnimatedImageLoadingAllowed = a3;
    -[PUViewModel currentChange](self, "currentChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setAnimatedImageLoadingAllowedDidChange:", 1);

    -[PUBrowsingAnimatedImagePlayer animatedImage](self, "animatedImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[PUBrowsingAnimatedImagePlayer _invalidateAnimatedImage](self, "_invalidateAnimatedImage");
  }
}

- (void)_invalidateAnimatedImage
{
  self->_isValid.animatedImage = 0;
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingAnimatedImagePlayer;
  -[PUViewModel didPerformChanges](&v3, sel_didPerformChanges);
  -[PUBrowsingAnimatedImagePlayer _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)_needsUpdate
{
  return !self->_isValid.animatedImage;
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUBrowsingAnimatedImagePlayer _needsUpdate](self, "_needsUpdate"))
  {
    -[PUBrowsingAnimatedImagePlayer _updateAnimatedImage](self, "_updateAnimatedImage");
    if (-[PUBrowsingAnimatedImagePlayer _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingAnimatedImagePlayer.m"), 163, CFSTR("[%@] Update still needed after update pass"), self);

    }
  }
}

- (void)_updateAnimatedImage
{
  BOOL v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  if (!self->_isValid.animatedImage)
  {
    v3 = 1;
    self->_isValid.animatedImage = 1;
    -[PUBrowsingAnimatedImagePlayer animatedImage](self, "animatedImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      v3 = -[PUBrowsingAnimatedImagePlayer _animatedImageRequestID](self, "_animatedImageRequestID") != 0;

    if (-[PUBrowsingAnimatedImagePlayer isAnimatedImageLoadingAllowed](self, "isAnimatedImageLoadingAllowed")
      && (-[PUBrowsingAnimatedImagePlayer asset](self, "asset"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isAnimatedImage"),
          v5,
          v6))
    {
      if (!v3)
      {
        -[PUBrowsingAnimatedImagePlayer mediaProvider](self, "mediaProvider");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUBrowsingAnimatedImagePlayer asset](self, "asset");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        objc_msgSend(v9, "setVersion:", 2);
        objc_msgSend(v9, "setDeliveryMode:", 1);
        objc_msgSend(v9, "setNetworkAccessAllowed:", 1);
        objc_initWeak(&location, self);
        v11 = MEMORY[0x1E0C809B0];
        v12 = 3221225472;
        v13 = __53__PUBrowsingAnimatedImagePlayer__updateAnimatedImage__block_invoke;
        v14 = &unk_1E589D5E0;
        objc_copyWeak(&v15, &location);
        v10 = objc_msgSend(v7, "requestAnimatedImageForAsset:options:resultHandler:", v8, v9, &v11);
        -[PUBrowsingAnimatedImagePlayer _setAnimatedImageRequestID:](self, "_setAnimatedImageRequestID:", v10, v11, v12, v13, v14);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);

      }
    }
    else
    {
      -[PUBrowsingAnimatedImagePlayer _cancelLoading](self, "_cancelLoading");
    }
  }
}

- (void)_handleAnimatedImageRequestComplete:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

- (id)debugDetailedDescription
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBrowsingAnimatedImagePlayer mediaProvider](self, "mediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Media Provider: %@\n"), v4);

  if (-[PUBrowsingAnimatedImagePlayer _animatedImageRequestID](self, "_animatedImageRequestID"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("Waiting on animated image fetch: %@\n"), v6);

  if (-[PUBrowsingAnimatedImagePlayer isAnimatedImageLoadingAllowed](self, "isAnimatedImageLoadingAllowed"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = v7;
  objc_msgSend(v3, "appendFormat:", CFSTR("Loading allowed: %@\n"), v8);

  -[PUBrowsingAnimatedImagePlayer _animatedImageLoadingDisablingReasons](self, "_animatedImageLoadingDisablingReasons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Loading disabled for: %@\n"), v9);

  -[PUBrowsingAnimatedImagePlayer animatedImage](self, "animatedImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("PHAnimatedImage: %@\n"), v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_stringByIndentingNewLines");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@ %p> {\n\t%@}"), v13, self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PHAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (BOOL)isAnimatedImageLoadingAllowed
{
  return self->_isAnimatedImageLoadingAllowed;
}

- (NSMutableSet)_animatedImageLoadingDisablingReasons
{
  return self->__animatedImageLoadingDisablingReasons;
}

- (void)set_animatedImageLoadingDisablingReasons:(id)a3
{
  objc_storeStrong((id *)&self->__animatedImageLoadingDisablingReasons, a3);
}

- (int)_animatedImageRequestID
{
  return self->__animatedImageRequestID;
}

- (void)_setAnimatedImageRequestID:(int)a3
{
  self->__animatedImageRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animatedImageLoadingDisablingReasons, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

void __69__PUBrowsingAnimatedImagePlayer__handleAnimatedImageRequestComplete___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__PUBrowsingAnimatedImagePlayer__handleAnimatedImageRequestComplete___block_invoke_2;
  v2[3] = &unk_1E58ABCA8;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "performChanges:", v2);

}

uint64_t __69__PUBrowsingAnimatedImagePlayer__handleAnimatedImageRequestComplete___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setAnimatedImageRequestID:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setAnimatedImage:", *(_QWORD *)(a1 + 40));
}

void __53__PUBrowsingAnimatedImagePlayer__updateAnimatedImage__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAnimatedImageRequestComplete:", v3);

}

@end
