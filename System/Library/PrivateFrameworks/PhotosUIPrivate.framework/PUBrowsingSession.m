@implementation PUBrowsingSession

- (PUBrowsingSession)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingSession.m"), 49, CFSTR("%s is not available as initializer"), "-[PUBrowsingSession init]");

  abort();
}

- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5
{
  return -[PUBrowsingSession initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:](self, "initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:", a3, a4, a5, 0, 0);
}

- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7
{
  return -[PUBrowsingSession initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:importStatusManager:](self, "initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:importStatusManager:", a3, a4, a5, a6, a7, 0);
}

- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7 importStatusManager:(id)a8
{
  return -[PUBrowsingSession initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:importStatusManager:privacyController:](self, "initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:importStatusManager:privacyController:", a3, a4, a5, a6, a7, a8, 0);
}

- (PUBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7 importStatusManager:(id)a8 privacyController:(id)a9
{
  _BOOL8 v10;
  id v15;
  PUPhotoKitAssetActionManager *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PUBrowsingSession *v21;
  void *v22;
  PUBrowsingViewModel *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PUPhotoKitAssetActionManager *v30;
  uint64_t v31;
  PXAssetEditOperationManager *editOperationManager;
  PUOneUpContentTileProvider *v33;
  PUOneUpContentTileProvider *contentTileProvider;
  void *v35;
  int v36;
  PUOneUpMergedVideoProvider *v37;
  PUOneUpMergedVideoProvider *mergedVideoProvider;
  PUBrowsingViewModel *v39;
  PXLoadingStatusManager *v40;
  PXLoadingStatusManager *loadingStatusManager;
  void *v43;
  void *v44;
  char isKindOfClass;
  id v47;
  id v48;
  void *v50;
  _QWORD v51[4];
  PUBrowsingViewModel *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  objc_super v57;

  v10 = a7;
  v15 = a3;
  v16 = (PUPhotoKitAssetActionManager *)a4;
  v17 = a5;
  v48 = a6;
  v18 = a6;
  v47 = a8;
  v19 = a8;
  v20 = a9;
  v57.receiver = self;
  v57.super_class = (Class)PUBrowsingSession;
  v21 = -[PUBrowsingSession init](&v57, sel_init);
  if (!v21)
  {
    v26 = v20;
    goto LABEL_20;
  }
  v50 = v17;
  objc_msgSend(v15, "assetsDataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PUBrowsingSession.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataSourceManager assetsDataSource] != nil"));

  }
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("PUBrowsingSession.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider != nil"));

  }
  v23 = -[PUBrowsingViewModel initWithLowMemoryMode:]([PUBrowsingViewModel alloc], "initWithLowMemoryMode:", v10);
  objc_storeStrong((id *)&v21->_viewModel, v23);
  objc_storeStrong((id *)&v21->_mediaProvider, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v15;
    objc_msgSend(v24, "underlyingDataSourceManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      goto LABEL_12;
    }
    objc_msgSend(v24, "underlyingDataSourceManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
LABEL_12:
      v28 = v48;
      v26 = v20;
      if (v16)
      {
        objc_opt_class();
        v29 = v47;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = objc_alloc_init(PUPhotoKitAssetActionManager);
          -[PUPhotoKitAssetActionManager setDataSourceManager:](v30, "setDataSourceManager:", v15);
          -[PUPhotoKitAssetActionManager setFallbackActionManager:](v16, "setFallbackActionManager:", v30);

        }
      }
      else
      {
        v16 = objc_alloc_init(PUPhotoKitAssetActionManager);
        -[PUPhotoKitAssetActionManager setDataSourceManager:](v16, "setDataSourceManager:", v15);
        v29 = v47;
      }
      goto LABEL_17;
    }
  }
  v26 = v20;
  v29 = v47;
  v28 = v48;
LABEL_17:
  -[PUBrowsingViewModel setActionManager:](v23, "setActionManager:", v16);
  objc_msgSend(MEMORY[0x1E0D7B1E0], "sharedManager");
  v31 = objc_claimAutoreleasedReturnValue();
  editOperationManager = v21->_editOperationManager;
  v21->_editOperationManager = (PXAssetEditOperationManager *)v31;

  -[PXAssetEditOperationManager registerObserver:context:](v21->_editOperationManager, "registerObserver:context:", v21, PUEditOperationManagerObservationContext);
  objc_storeStrong((id *)&v21->_actionManager, v16);
  -[PUAssetActionManager setDelegate:](v21->_actionManager, "setDelegate:", v21);
  v33 = -[PUOneUpContentTileProvider initWithMediaProvider:]([PUOneUpContentTileProvider alloc], "initWithMediaProvider:", v21->_mediaProvider);
  contentTileProvider = v21->_contentTileProvider;
  v21->_contentTileProvider = v33;

  objc_storeStrong((id *)&v21->_dataSourceManager, a3);
  -[PUAssetsDataSourceManager setDelegate:](v21->_dataSourceManager, "setDelegate:", v21);
  objc_storeStrong((id *)&v21->_importStatusManager, v29);
  objc_storeStrong((id *)&v21->_privacyController, a9);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "shouldMergeOverlappingLivePhotos");

  if (v36)
  {
    v37 = -[PUOneUpMergedVideoProvider initWithBrowsingViewModel:]([PUOneUpMergedVideoProvider alloc], "initWithBrowsingViewModel:", v23);
    mergedVideoProvider = v21->_mergedVideoProvider;
    v21->_mergedVideoProvider = v37;

  }
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __148__PUBrowsingSession_initWithDataSourceManager_actionManager_mediaProvider_photosDetailsContext_lowMemoryMode_importStatusManager_privacyController___block_invoke;
  v51[3] = &unk_1E58A9328;
  v52 = v23;
  v17 = v50;
  v53 = v50;
  v54 = v15;
  v55 = v19;
  v56 = v26;
  v39 = v23;
  -[PUViewModel performChanges:](v39, "performChanges:", v51);
  v40 = (PXLoadingStatusManager *)objc_alloc_init(MEMORY[0x1E0D7CD28]);
  loadingStatusManager = v21->_loadingStatusManager;
  v21->_loadingStatusManager = v40;

  -[PXLoadingStatusManager registerObserver:](v21->_loadingStatusManager, "registerObserver:", v21);
  -[PUMediaProvider setLoadingStatusManager:](v21->_mediaProvider, "setLoadingStatusManager:", v21->_loadingStatusManager);
  objc_storeStrong((id *)&v21->_photosDetailsContext, v28);

LABEL_20:
  return v21;
}

- (PUTileAnimator)tileAnimator
{
  PUTileAnimator *tileAnimator;
  PUBrowsingTileViewAnimator *v4;
  PUTileAnimator *v5;

  tileAnimator = self->_tileAnimator;
  if (!tileAnimator)
  {
    v4 = objc_alloc_init(PUBrowsingTileViewAnimator);
    v5 = self->_tileAnimator;
    self->_tileAnimator = &v4->super.super;

    tileAnimator = self->_tileAnimator;
  }
  return tileAnimator;
}

- (void)assetsDataSourceManager:(id)a3 didChangeAssetsDataSource:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  objc_msgSend(a3, "assetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingSession.m"), 142, CFSTR("Data source must never be nil"));

  }
  -[PUBrowsingSession viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PUBrowsingSession_assetsDataSourceManager_didChangeAssetsDataSource___block_invoke;
  v11[3] = &unk_1E58ABCA8;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "performChanges:", v11);

}

- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3
{
  void *v3;
  void *v4;

  -[PUBrowsingSession viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAssetReferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)assetActionManagerCurrentAssetsDataSource:(id)a3
{
  void *v3;
  void *v4;

  -[PUBrowsingSession viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[PUBrowsingSession viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetSharedViewModelForAssetUUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PUBrowsingSession_loadingStatusManager_didUpdateLoadingStatus_forItemIdentifier___block_invoke;
  v13[3] = &unk_1E58ABCA8;
  v14 = v10;
  v15 = v7;
  v11 = v7;
  v12 = v10;
  objc_msgSend(v12, "performChanges:", v13);

}

- (void)assetEditOperationManager:(id)a3 didChangeEditOperationsPerformedOnAsset:(id)a4 context:(void *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;

  v9 = a3;
  v10 = a4;
  if ((void *)PUEditOperationManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingSession.m"), 193, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v11 = v10;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EEC2D708))
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__17642;
    v21[4] = __Block_byref_object_dispose__17643;
    v12 = MEMORY[0x1E0C809B0];
    v22 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __95__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationsPerformedOnAsset_context___block_invoke;
    v20[3] = &unk_1E589D6D0;
    v20[4] = v21;
    objc_msgSend(v9, "enumerateEditOperationsPerformedOnAsset:usingBlock:", v11, v20);
    -[PUBrowsingSession viewModel](self, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetSharedViewModelForAsset:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __95__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationsPerformedOnAsset_context___block_invoke_2;
    v17[3] = &unk_1E58AAE48;
    v15 = v14;
    v18 = v15;
    v19 = v21;
    objc_msgSend(v15, "performChanges:", v17);

    _Block_object_dispose(v21, 8);
  }

}

- (void)assetEditOperationManager:(id)a3 didChangeEditOperationStatusForAsset:(id)a4 context:(void *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v9 = a3;
  v10 = a4;
  if ((void *)PUEditOperationManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingSession.m"), 224, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v11 = v10;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EEC2D708))
  {
    v12 = objc_msgSend(v9, "editOperationStatusForAsset:", v11);
    -[PUBrowsingSession viewModel](self, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetSharedViewModelForAsset:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationStatusForAsset_context___block_invoke;
    v17[3] = &unk_1E58AACF0;
    v18 = v14;
    v19 = v12;
    v15 = v14;
    objc_msgSend(v15, "performChanges:", v17);

  }
}

- (void)configureTilingView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PUBrowsingSession tileAnimator](self, "tileAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTileAnimator:", v5);

  -[PUBrowsingSession contentTileProvider](self, "contentTileProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerTileControllerClassesWithTilingView:", v4);

  -[PUBrowsingSession description](self, "description");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerPostLayoutBlock:forIdentifier:", &__block_literal_global_17638, v7);

}

- (id)imageWellThumbnailProvider
{
  return 0;
}

- (PUAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (PUAssetActionManager)actionManager
{
  return self->_actionManager;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (PUOneUpContentTileProvider)contentTileProvider
{
  return self->_contentTileProvider;
}

- (void)setContentTileProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contentTileProvider, a3);
}

- (void)setTileAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_tileAnimator, a3);
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (PXAssetImportStatusManager)importStatusManager
{
  return self->_importStatusManager;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (PXPhotosDetailsContext)photosDetailsContext
{
  return self->_photosDetailsContext;
}

- (PUOneUpMergedVideoProvider)mergedVideoProvider
{
  return self->_mergedVideoProvider;
}

- (NSString)emptyPlaceholderTitle
{
  return self->_emptyPlaceholderTitle;
}

- (NSString)emptyPlaceholderSubtitle
{
  return self->_emptyPlaceholderSubtitle;
}

- (PXAssetEditOperationManager)editOperationManager
{
  return self->_editOperationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editOperationManager, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderSubtitle, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderTitle, 0);
  objc_storeStrong((id *)&self->_mergedVideoProvider, 0);
  objc_storeStrong((id *)&self->_photosDetailsContext, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_tileAnimator, 0);
  objc_storeStrong((id *)&self->_contentTileProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

uint64_t __41__PUBrowsingSession_configureTilingView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "is_didLayoutPlayerViews");
}

uint64_t __92__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationStatusForAsset_context___block_invoke(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 40) - 1;
  if (v1 > 2)
    v2 = 0;
  else
    v2 = qword_1AB0EFEE0[v1];
  return objc_msgSend(*(id *)(a1 + 32), "setSaveState:", v2);
}

void __95__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationsPerformedOnAsset_context___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isCancelled") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

uint64_t __95__PUBrowsingSession_assetEditOperationManager_didChangeEditOperationsPerformedOnAsset_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSaveProgress:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __83__PUBrowsingSession_loadingStatusManager_didUpdateLoadingStatus_forItemIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingStatus:", *(_QWORD *)(a1 + 40));
}

uint64_t __71__PUBrowsingSession_assetsDataSourceManager_didChangeAssetsDataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssetsDataSource:", *(_QWORD *)(a1 + 40));
}

uint64_t __148__PUBrowsingSession_initWithDataSourceManager_actionManager_mediaProvider_photosDetailsContext_lowMemoryMode_importStatusManager_privacyController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setMediaProvider:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "assetsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAssetsDataSource:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setImportStatusManager:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "setPrivacyController:", *(_QWORD *)(a1 + 64));
}

+ (id)importBrowsingSessionWithDeviceUUID:(id)a3
{
  return +[PUImportBrowsingSession withDeviceMedia](PUImportBrowsingSession, "withDeviceMedia", a3);
}

@end
