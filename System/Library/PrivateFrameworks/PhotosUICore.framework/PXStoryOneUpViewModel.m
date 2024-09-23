@implementation PXStoryOneUpViewModel

- (PXStoryOneUpViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryOneUpViewModel.m"), 43, CFSTR("%s is not available as initializer"), "-[PXStoryOneUpViewModel init]");

  abort();
}

- (PXStoryOneUpViewModel)initWithResourcesDataSourceManager:(id)a3 mediaProvider:(id)a4
{
  id v7;
  id v8;
  PXStoryOneUpViewModel *v9;
  PXStoryOneUpViewModel *v10;
  uint64_t v11;
  PXUpdater *updater;
  _QWORD v14[4];
  PXStoryOneUpViewModel *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryOneUpViewModel;
  v9 = -[PXStoryOneUpViewModel init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourcesDataSourceManager, a3);
    -[PXStoryResourcesDataSourceManager registerChangeObserver:context:](v10->_resourcesDataSourceManager, "registerChangeObserver:context:", v10, ResourcesDataSourceManagerObservationContext_169543);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
    v11 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v10, sel__setNeedsUpdate);
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v11;

    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateAssetsDataSourceManager);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateInitialAssetReference);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateVisibleClipIdentifier);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateHiddenClipIdentifier);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__PXStoryOneUpViewModel_initWithResourcesDataSourceManager_mediaProvider___block_invoke;
    v14[3] = &unk_1E51479C8;
    v15 = v10;
    -[PXStoryOneUpViewModel performChanges:](v15, "performChanges:", v14);

  }
  return v10;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryOneUpViewModel;
  -[PXStoryOneUpViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryOneUpViewModel;
  -[PXStoryOneUpViewModel didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryOneUpViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)setTimeline:(id)a3
{
  PXStoryTimeline *v5;
  char v6;
  PXStoryTimeline *v7;

  v7 = (PXStoryTimeline *)a3;
  v5 = self->_timeline;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryTimeline isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timeline, a3);
      -[PXStoryOneUpViewModel _invalidateInitialAssetReference](self, "_invalidateInitialAssetReference");
      -[PXStoryOneUpViewModel _invalidateVisibleClipIdentifier](self, "_invalidateVisibleClipIdentifier");
      -[PXStoryOneUpViewModel _invalidateHiddenClipIdentifier](self, "_invalidateHiddenClipIdentifier");
    }
  }

}

- (id)spriteReferenceForAssetReference:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PXStoryOneUpViewModel_spriteReferenceForAssetReference___block_invoke;
    v11[3] = &unk_1E5149198;
    v12 = v4;
    v6 = -[PXStoryOneUpViewModel _clipIdentifierForAssetReference:failureHandler:](self, "_clipIdentifierForAssetReference:failureHandler:", v12, v11);
    if (v6 && self->_spriteReferencesProviderRespondsTo.spriteReferenceForClipWithIdentifier)
    {
      v7 = v6;
      -[PXStoryOneUpViewModel spriteReferencesProvider](self, "spriteReferencesProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "spriteReferenceForClipWithIdentifier:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canPresentOneUp
{
  void *v3;
  void *v4;
  char v5;

  -[PXStoryOneUpViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryOneUpViewModel oneUpPresentation](self, "oneUpPresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canStart");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setInitialClipIdentifier:(int64_t)a3
{
  self->_initialClipIdentifier = a3;
  -[PXStoryOneUpViewModel _invalidateInitialAssetReference](self, "_invalidateInitialAssetReference");
}

- (void)setVisibleAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_visibleAssetReference, a3);
  -[PXStoryOneUpViewModel _invalidateVisibleClipIdentifier](self, "_invalidateVisibleClipIdentifier");
}

- (void)setVisibleClipIdentifier:(int64_t)a3
{
  self->_visibleClipIdentifier = a3;
  -[PXStoryOneUpViewModel signalChange:](self, "signalChange:", 1);
}

- (void)setHiddenAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenAssetReference, a3);
  -[PXStoryOneUpViewModel _invalidateHiddenClipIdentifier](self, "_invalidateHiddenClipIdentifier");
}

- (void)setHiddenClipIdentifier:(int64_t)a3
{
  self->_hiddenClipIdentifier = a3;
  -[PXStoryOneUpViewModel signalChange:](self, "signalChange:", 2);
}

- (void)setSpriteReferencesProvider:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_spriteReferencesProvider);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_spriteReferencesProvider, obj);
    self->_spriteReferencesProviderRespondsTo.spriteReferenceForClipWithIdentifier = objc_opt_respondsToSelector() & 1;

  }
}

- (void)setOneUpPresentation:(id)a3
{
  PXOneUpPresentation *v5;
  PXOneUpPresentation *v6;

  v5 = (PXOneUpPresentation *)a3;
  if (self->_oneUpPresentation != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_oneUpPresentation, a3);
    v5 = v6;
  }

}

- (int64_t)_clipIdentifierForAssetReference:(id)a3 failureHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v13;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    objc_msgSend(v6, "indexPath");
    -[PXStoryOneUpViewModel timeline](self, "timeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryOneUpViewModel resourcesDataSourceManager](self, "resourcesDataSourceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "identifierOfFirstClipContainingResourceAtIndex:inResourcesDataSource:resourceKind:", v13, v10, 1);

    if (v7 && !v11)
      v7[2](v7);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_setNeedsUpdate
{
  -[PXStoryOneUpViewModel signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateAssetsDataSourceManager
{
  id v2;

  -[PXStoryOneUpViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAssetsDataSourceManager);

}

- (void)_updateAssetsDataSourceManager
{
  void *v3;
  void *v4;
  PXPhotosDataSourceConfiguration *v5;
  PXPhotosDataSource *v6;
  PXPhotoKitAssetsDataSourceManager *v7;
  id v8;

  -[PXStoryOneUpViewModel resourcesDataSourceManager](self, "resourcesDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[PXPhotosDataSourceConfiguration initWithAssetFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithAssetFetchResult:options:", v4, 0);
    v6 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v5);
    v7 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v6);
    -[PXStoryOneUpViewModel setAssetsDataSourceManager:](self, "setAssetsDataSourceManager:", v7);

  }
}

- (void)_invalidateInitialAssetReference
{
  id v2;

  -[PXStoryOneUpViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInitialAssetReference);

}

- (void)_updateInitialAssetReference
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[PXStoryOneUpViewModel initialClipIdentifier](self, "initialClipIdentifier");
  -[PXStoryOneUpViewModel timeline](self, "timeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryOneUpViewModel resourcesDataSourceManager](self, "resourcesDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v3 && v4 && v6)
  {
    v8 = objc_msgSend(v4, "indexOfResourceForClipWithIdentifier:inResourcesDataSource:resourceKind:", v3, v6, 1);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PLStoryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v15 = 134217984;
        *(_QWORD *)&v15[4] = v3;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Can't resolve an initial asset reference for 1up from resource of clip with id %lu", v15, 0xCu);
      }
      v7 = 0;
    }
    else
    {
      v10 = v8;
      objc_msgSend(v6, "displayAssetResourceAtIndex:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject px_storyResourceKind](v9, "px_storyResourceKind") == 1)
      {
        -[NSObject px_storyResourceDisplayAsset](v9, "px_storyResourceDisplayAsset");
        v11 = objc_claimAutoreleasedReturnValue();
        -[PXStoryOneUpViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "identifier");

        *(_QWORD *)v15 = v14;
        *(_QWORD *)&v15[8] = 0;
        *(_QWORD *)&v15[16] = v10;
        v16 = 0x7FFFFFFFFFFFFFFFLL;
        v7 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1688), "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v11, 0, v15);
      }
      else
      {
        PLStoryGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v15 = 138412546;
          *(_QWORD *)&v15[4] = v9;
          *(_WORD *)&v15[12] = 2048;
          *(_QWORD *)&v15[14] = v3;
          _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Can't resolve an initial asset reference for 1up from resource %@ of clip with id %lu", v15, 0x16u);
        }
        v7 = 0;
      }

    }
  }
  -[PXStoryOneUpViewModel setInitialAssetReference:](self, "setInitialAssetReference:", v7);

}

- (void)_invalidateVisibleClipIdentifier
{
  id v2;

  -[PXStoryOneUpViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateVisibleClipIdentifier);

}

- (void)_updateVisibleClipIdentifier
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[PXStoryOneUpViewModel visibleAssetReference](self, "visibleAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PXStoryOneUpViewModel__updateVisibleClipIdentifier__block_invoke;
  v5[3] = &unk_1E5149198;
  v6 = v3;
  v4 = v3;
  -[PXStoryOneUpViewModel setVisibleClipIdentifier:](self, "setVisibleClipIdentifier:", -[PXStoryOneUpViewModel _clipIdentifierForAssetReference:failureHandler:](self, "_clipIdentifierForAssetReference:failureHandler:", v4, v5));

}

- (void)_invalidateHiddenClipIdentifier
{
  id v2;

  -[PXStoryOneUpViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateHiddenClipIdentifier);

}

- (void)_updateHiddenClipIdentifier
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[PXStoryOneUpViewModel hiddenAssetReference](self, "hiddenAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PXStoryOneUpViewModel__updateHiddenClipIdentifier__block_invoke;
  v5[3] = &unk_1E5149198;
  v6 = v3;
  v4 = v3;
  -[PXStoryOneUpViewModel setHiddenClipIdentifier:](self, "setHiddenClipIdentifier:", -[PXStoryOneUpViewModel _clipIdentifierForAssetReference:failureHandler:](self, "_clipIdentifierForAssetReference:failureHandler:", v4, v5));

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PXStoryOneUpViewModel_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5140090;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXStoryOneUpViewModel performChanges:](self, "performChanges:", v5);
}

- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager
{
  return self->_resourcesDataSourceManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (void)setAssetsDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetsDataSourceManager, a3);
}

- (PXAssetReference)initialAssetReference
{
  return self->_initialAssetReference;
}

- (void)setInitialAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_initialAssetReference, a3);
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (int64_t)initialClipIdentifier
{
  return self->_initialClipIdentifier;
}

- (int64_t)visibleClipIdentifier
{
  return self->_visibleClipIdentifier;
}

- (int64_t)hiddenClipIdentifier
{
  return self->_hiddenClipIdentifier;
}

- (PXOneUpPresentation)oneUpPresentation
{
  return self->_oneUpPresentation;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryClipSpriteReferencesProvider)spriteReferencesProvider
{
  return (PXStoryClipSpriteReferencesProvider *)objc_loadWeakRetained((id *)&self->_spriteReferencesProvider);
}

- (PXAssetReference)visibleAssetReference
{
  return self->_visibleAssetReference;
}

- (PXAssetReference)hiddenAssetReference
{
  return self->_hiddenAssetReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenAssetReference, 0);
  objc_storeStrong((id *)&self->_visibleAssetReference, 0);
  objc_destroyWeak((id *)&self->_spriteReferencesProvider);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_oneUpPresentation, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_initialAssetReference, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_resourcesDataSourceManager, 0);
}

void __54__PXStoryOneUpViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40) != ResourcesDataSourceManagerObservationContext_169543)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryOneUpViewModel.m"), 259, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_invalidateAssetsDataSourceManager");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateInitialAssetReference");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateVisibleClipIdentifier");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateHiddenClipIdentifier");
    v3 = v5;
  }

}

void __52__PXStoryOneUpViewModel__updateHiddenClipIdentifier__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLStoryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Can't resolve a hidden clip identifier for 1up from hidden asset reference %@", (uint8_t *)&v4, 0xCu);
  }

}

void __53__PXStoryOneUpViewModel__updateVisibleClipIdentifier__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLStoryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Can't resolve a visible clip identifier for 1up from visible asset reference %@", (uint8_t *)&v4, 0xCu);
  }

}

void __58__PXStoryOneUpViewModel_spriteReferenceForAssetReference___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLStoryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Can't resolve a clip identifier for 1up from asset reference %@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __74__PXStoryOneUpViewModel_initWithResourcesDataSourceManager_mediaProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAssetsDataSourceManager");
}

@end
