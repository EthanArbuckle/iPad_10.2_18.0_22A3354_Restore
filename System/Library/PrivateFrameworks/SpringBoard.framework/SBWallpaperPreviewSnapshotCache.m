@implementation SBWallpaperPreviewSnapshotCache

+ (SBWallpaperPreviewSnapshotCache)sharedInstance
{
  if (sharedInstance_onceToken_36 != -1)
    dispatch_once(&sharedInstance_onceToken_36, &__block_literal_global_245);
  return (SBWallpaperPreviewSnapshotCache *)(id)sharedInstance_sharedInstance_7;
}

void __49__SBWallpaperPreviewSnapshotCache_sharedInstance__block_invoke()
{
  SBWallpaperPreviewSnapshotCache *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = [SBWallpaperPreviewSnapshotCache alloc];
  objc_msgSend(MEMORY[0x1E0D65290], "wallpaperCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageCache");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBWallpaperPreviewSnapshotCache initWithImageCache:iconController:wallpaperController:](v0, "initWithImageCache:iconController:wallpaperController:", v1, v2, v3);
  v5 = (void *)sharedInstance_sharedInstance_7;
  sharedInstance_sharedInstance_7 = v4;

}

- (SBWallpaperPreviewSnapshotCache)initWithImageCache:(id)a3 iconController:(id)a4 wallpaperController:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBWallpaperPreviewSnapshotCache *v12;
  SBWallpaperPreviewSnapshotCache *v13;
  void *v14;
  void *v15;
  SBWallpaperPreviewSnapshotCache *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBWallpaperPreviewSnapshotCache;
  v12 = -[SBWallpaperPreviewSnapshotCache init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageCache, a3);
    objc_storeStrong((id *)&v13->_iconController, a4);
    objc_storeStrong((id *)&v13->_wallpaperController, a5);
    objc_msgSend(v11, "addObserver:forVariant:", v13, 0);
    objc_msgSend(v11, "addObserver:forVariant:", v13, 1);
    -[SBIconController model](v13->_iconController, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWallpaperPreviewSnapshotCache _switchToIconModel:](v13, "_switchToIconModel:", v14);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel__backlightFadeFinished, *MEMORY[0x1E0DAC2F0], 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel__iconControllerDidChangeIconModel_, SBIconControllerIconModelDidChangeNotification, v13->_iconController);
    v16 = v13;

  }
  return v13;
}

- (SBWallpaperPreviewSnapshotCache)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Use designated initializer"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  void *v3;
  SBWallpaperController *v4;
  void *v5;
  objc_super v6;

  -[SBHIconModel rootFolder](self->_model, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNodeObserver:", self);

  v4 = self->_wallpaperController;
  -[SBWallpaperController removeObserver:forVariant:](v4, "removeObserver:forVariant:", self, 0);
  -[SBWallpaperController removeObserver:forVariant:](v4, "removeObserver:forVariant:", self, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SBWallpaperPreviewSnapshotCache;
  -[SBWallpaperPreviewSnapshotCache dealloc](&v6, sel_dealloc);
}

- (void)invalidateSnapshotsForLocations:(int64_t)a3
{
  id v5;
  void *v6;

  -[BSUIMappedImageCache allKeys](self->_imageCache, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  PBUIWallpaperEnumerateVariantsForLocations();
  self->_invalidatedLocations |= a3;

}

void __67__SBWallpaperPreviewSnapshotCache_invalidateSnapshotsForLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if ((PBUIWallpaperLocationForVariant() & v4) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "cacheKeyForVariant:options:", a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeImageForKey:", v5);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = *(id *)(a1 + 40);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
            if (objc_msgSend(v11, "hasPrefix:", v5, (_QWORD)v12))
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeImageForKey:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

    }
  }
}

+ (id)cacheKeyForVariant:(int64_t)a3 options:(unint64_t)a4 scalingWidth:(double)a5
{
  void *v5;
  void *v7;
  void *v8;

  if (a4)
  {
    v5 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    PBUIStringForWallpaperVariant();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("WallpaperPreview-%@-%f"), v8, *(_QWORD *)&a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)cacheKeyForVariant:(int64_t)a3 options:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    PBUIStringForWallpaperVariant();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("WallpaperPreview-%@"), v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)mappedWallpaperPreviewForKey:(id)a3
{
  return (id)-[BSUIMappedImageCache imageForKey:](self->_imageCache, "imageForKey:", a3);
}

- (id)mappedWallpaperPreviewForScaledSnapshot:(id)a3 variant:(int64_t)a4 cacheKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  SBWallpaperPreviewSnapshotCache *v19;
  int64_t v20;

  v8 = a3;
  v9 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__SBWallpaperPreviewSnapshotCache_mappedWallpaperPreviewForScaledSnapshot_variant_cacheKey___block_invoke;
  v17[3] = &unk_1E8EB5ED0;
  v10 = v8;
  v19 = self;
  v20 = a4;
  v18 = v10;
  v11 = MEMORY[0x1D17E5550](v17);
  v12 = (void *)v11;
  if (v9)
  {
    -[BSUIMappedImageCache imageForKey:generatingIfNecessaryWithBlock:](self->_imageCache, "imageForKey:generatingIfNecessaryWithBlock:", v9, v11);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
    (*(void (**)(uint64_t, uint64_t *))(v11 + 16))(v11, &v16);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

id __92__SBWallpaperPreviewSnapshotCache_mappedWallpaperPreviewForScaledSnapshot_variant_cacheKey___block_invoke(uint64_t a1, _QWORD *a2)
{
  id v4;
  int v5;
  uint64_t v6;

  v4 = *(id *)(a1 + 32);
  v5 = MGGetBoolAnswer();
  v6 = 4;
  if (!v5)
    v6 = 0;
  *a2 |= v6;
  if (MGGetBoolAnswer())
    *a2 |= 2uLL;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) &= ~PBUIWallpaperLocationForVariant();
  return v4;
}

- (void)regenerateSnapshotsForLocations:(int64_t)a3
{
  PBUIWallpaperEnumerateVariantsForLocations();
}

void __67__SBWallpaperPreviewSnapshotCache_regenerateSnapshotsForLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  objc_msgSend((id)objc_opt_class(), "cacheKeyForVariant:options:", a2, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "snapshotProviderForVariant:options:wallpaperImage:", a2, *(_QWORD *)(a1 + 40), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__SBWallpaperPreviewSnapshotCache_regenerateSnapshotsForLocations___block_invoke_2;
    v7[3] = &unk_1E8EB5EF8;
    v6 = *(_QWORD *)(a1 + 32);
    v9 = a2;
    v7[4] = v6;
    v8 = v4;
    objc_msgSend(v5, "snapshotWithImageBlock:", v7);

  }
}

void __67__SBWallpaperPreviewSnapshotCache_regenerateSnapshotsForLocations___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) &= ~PBUIWallpaperLocationForVariant();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 16);
  if (MGGetBoolAnswer())
    v6 = 4;
  else
    v6 = 0;
  objc_msgSend(v5, "setImage:forKey:withPersistenceOptions:", v7, v4, v6);

}

- (void)_switchToIconModel:(id)a3
{
  SBIconModel *v5;
  SBIconModel **p_model;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  SBIconModel *v12;

  v5 = (SBIconModel *)a3;
  p_model = &self->_model;
  if (self->_model != v5)
  {
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)MEMORY[0x1E0DAAA18];
    v9 = (_QWORD *)MEMORY[0x1E0DAAA08];
    if (*p_model)
    {
      -[SBHIconModel rootFolder](*p_model, "rootFolder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeNodeObserver:", self);

      objc_msgSend(v7, "removeObserver:name:object:", self, *v8, self->_model);
      objc_msgSend(v7, "removeObserver:name:object:", self, *v9, self->_model);
    }
    objc_storeStrong((id *)&self->_model, a3);
    if (*p_model)
    {
      -[SBHIconModel rootFolder](*p_model, "rootFolder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addNodeObserver:", self);

      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__modelWillLayout, *v8, self->_model);
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__modelDidLayout, *v9, self->_model);
    }

    v5 = v12;
  }

}

- (void)_iconControllerDidChangeIconModel:(id)a3
{
  id v4;

  -[SBIconController model](self->_iconController, "model", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBWallpaperPreviewSnapshotCache _switchToIconModel:](self, "_switchToIconModel:", v4);

}

- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  -[SBWallpaperPreviewSnapshotCache invalidateSnapshotsForLocations:](self, "invalidateSnapshotsForLocations:", 2, a4);
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  -[SBWallpaperPreviewSnapshotCache invalidateSnapshotsForLocations:](self, "invalidateSnapshotsForLocations:", 2, a4);
}

- (void)nodeDidMoveContainedNodes:(id)a3
{
  -[SBWallpaperPreviewSnapshotCache invalidateSnapshotsForLocations:](self, "invalidateSnapshotsForLocations:", 2);
}

- (void)_modelWillLayout
{
  id v3;

  -[SBHIconModel rootFolder](self->_model, "rootFolder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNodeObserver:", self);

}

- (void)_modelDidLayout
{
  void *v3;

  -[SBHIconModel rootFolder](self->_model, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addNodeObserver:", self);

  -[SBWallpaperPreviewSnapshotCache invalidateSnapshotsForLocations:](self, "invalidateSnapshotsForLocations:", 2);
}

- (void)_backlightFadeFinished
{
  void *v3;
  char v4;

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "screenIsOn");

  if ((v4 & 1) == 0)
  {
    -[SBWallpaperPreviewSnapshotCache regenerateSnapshotsForLocations:](self, "regenerateSnapshotsForLocations:", self->_invalidatedLocations);
    self->_invalidatedLocations = 0;
  }
}

- (id)_homeScreenSnapshotProviderWithOptions:(unint64_t)a3 wallpaperImage:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SBHomeScreenPreviewView *v16;
  void *v17;
  SBHomeScreenPreviewView *v18;
  void *v19;
  SBViewSnapshotProvider *v20;

  v6 = a4;
  v7 = -[SBWallpaperPreviewSnapshotCache _orientationForOptions:](self, "_orientationForOptions:", a3);
  SBScreenBoundsRotatedRoundCenter(v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = [SBHomeScreenPreviewView alloc];
  -[SBIconController iconManager](self->_iconController, "iconManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:](v16, "initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:", v17, self->_wallpaperController, a3, v6, 0, v9, v11, v13, v15);

  -[SBWallpaperController windowScene](self->_wallpaperController, "windowScene");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBViewSnapshotProvider initWithWindowScene:view:orientation:]([SBViewSnapshotProvider alloc], "initWithWindowScene:view:orientation:", v19, v18, v7);
  -[SBViewSnapshotProvider setIncludeWindowSceneWallpaper:](v20, "setIncludeWindowSceneWallpaper:", (a3 & 0x40) == 0);

  return v20;
}

- (id)_lockScreenSnapshotProviderWithOptions:(unint64_t)a3 wallpaperImage:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBLockScreenPreviewView *v12;
  void *v13;
  SBViewSnapshotProvider *v14;

  v6 = a4;
  v7 = -[SBWallpaperPreviewSnapshotCache _orientationForOptions:](self, "_orientationForOptions:", a3);
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  SBScreenBounds(v7);
  v12 = -[SBLockScreenPreviewView initWithFrame:wallpaperController:options:wallpaperImage:]([SBLockScreenPreviewView alloc], "initWithFrame:wallpaperController:options:wallpaperImage:", self->_wallpaperController, a3, v6, v8, v9, v10, v11);

  -[SBWallpaperController windowScene](self->_wallpaperController, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBViewSnapshotProvider initWithWindowScene:view:orientation:]([SBViewSnapshotProvider alloc], "initWithWindowScene:view:orientation:", v13, v12, v7);

  return v14;
}

- (id)snapshotProviderForVariant:(int64_t)a3 options:(unint64_t)a4 wallpaperImage:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;

  v8 = a5;
  if (a3)
  {
    if (a3 != 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[SBWallpaperPreviewSnapshotCache _homeScreenSnapshotProviderWithOptions:wallpaperImage:](self, "_homeScreenSnapshotProviderWithOptions:wallpaperImage:", a4, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBWallpaperPreviewSnapshotCache _lockScreenSnapshotProviderWithOptions:wallpaperImage:](self, "_lockScreenSnapshotProviderWithOptions:wallpaperImage:", a4, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (int64_t)_orientationForOptions:(unint64_t)a3
{
  if ((a3 & 0x180) == 0x100)
    return 3;
  else
    return 1;
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  -[SBWallpaperPreviewSnapshotCache invalidateSnapshotsForLocations:](self, "invalidateSnapshotsForLocations:", PBUIWallpaperLocationForVariant());
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
}

@end
