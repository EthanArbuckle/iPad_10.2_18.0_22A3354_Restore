@implementation PXPhotoKitAssetActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "localizedTitleForUseCase:actionManager:", a3, 0);
}

- (PXPhotosDataSource)photosDataSourceSnapshot
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetActionManager.m"), 719, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[[self selectionSnapshot] dataSource] isKindOfClass:[PXPhotoKitAssetsDataSource class]]"));

  }
  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photosDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPhotosDataSource *)v9;
}

- (NSDictionary)dataSourceUserInfo
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetActionManager.m"), 725, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.selectionSnapshot.dataSource"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetActionManager.m"), 725, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.selectionSnapshot.dataSource"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (void)instantlyExcludeAssetsFromDataSource
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotoKitAssetActionPerformer photoKitDataSourceManager](self, "photoKitDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer _indexPathsInPhotosDataSource:](self, "_indexPathsInPhotosDataSource:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceExcludeAssetsAtIndexPaths:", v4);

}

- (void)stopExcludingAssetsFromDataSource
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotoKitAssetActionPerformer photoKitDataSourceManager](self, "photoKitDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopExcludingAssets:", v4);

}

- (void)forceIncludeAssetsInDataSource
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotoKitAssetActionPerformer photoKitDataSourceManager](self, "photoKitDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer _indexPathsInPhotosDataSource:](self, "_indexPathsInPhotosDataSource:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceIncludeAssetsAtIndexPaths:", v4);

}

- (id)_indexPathsInPhotosDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__PXPhotoKitAssetActionPerformer__indexPathsInPhotosDataSource___block_invoke;
  v14[3] = &unk_1E5131F30;
  v15 = v4;
  v9 = v7;
  v16 = v9;
  v10 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (PHFetchResult)assetsFetchResult
{
  PHFetchResult *assetsFetchResult;
  void *v4;
  void *v5;
  void *v6;
  PHFetchResult *v7;
  PHFetchResult *v8;

  assetsFetchResult = self->_assetsFetchResult;
  if (!assetsFetchResult)
  {
    -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedIndexPaths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotoKitAssetActionPerformer photosDataSourceSnapshot](self, "photosDataSourceSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchResultWithAssetsAtIndexPaths:", v5);
    v7 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v8 = self->_assetsFetchResult;
    self->_assetsFetchResult = v7;

    assetsFetchResult = self->_assetsFetchResult;
  }
  return assetsFetchResult;
}

- (NSArray)assets
{
  NSArray *assets;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  assets = self->_assets;
  if (!assets)
  {
    -[PXPhotoKitAssetActionPerformer assetsFetchResult](self, "assetsFetchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchedObjects");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_assets;
    self->_assets = v5;

    assets = self->_assets;
  }
  return assets;
}

- (NSDictionary)assetsByAssetCollection
{
  NSDictionary *assetsByAssetCollection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  id v9;
  NSDictionary *v10;
  NSDictionary *v11;
  _QWORD v13[4];
  id v14;
  NSDictionary *v15;

  assetsByAssetCollection = self->_assetsByAssetCollection;
  if (!assetsByAssetCollection)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedIndexPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotoKitAssetActionPerformer photosDataSourceSnapshot](self, "photosDataSourceSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__PXPhotoKitAssetActionPerformer_assetsByAssetCollection__block_invoke;
    v13[3] = &unk_1E5131F58;
    v14 = v7;
    v8 = v4;
    v15 = v8;
    v9 = v7;
    objc_msgSend(v6, "enumerateItemIndexSetsUsingBlock:", v13);
    v10 = self->_assetsByAssetCollection;
    self->_assetsByAssetCollection = v8;
    v11 = v8;

    assetsByAssetCollection = self->_assetsByAssetCollection;
  }
  return assetsByAssetCollection;
}

- (id)createPerformerWithClass:(Class)a3 actionType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = (void *)objc_msgSend([a3 alloc], "initWithActionType:", v6);

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectionSnapshot:", v8);

  -[PXPhotoKitAssetActionPerformer photoKitDataSourceManager](self, "photoKitDataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPhotoKitDataSourceManager:", v9);

  -[PXPhotoKitAssetActionPerformer person](self, "person");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPerson:", v10);

  -[PXActionPerformer sender](self, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSender:", v11);

  -[PXActionPerformer delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v12);

  return v7;
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  void *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotoKitAssetActionPerformer;
  if (!-[PXAssetActionPerformer shouldExitSelectModeForState:](&v7, sel_shouldExitSelectModeForState_, a3))
    return 0;
  -[PXPhotoKitAssetActionPerformer objectReference](self, "objectReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (PXPhotoKitAssetsDataSourceManager)photoKitDataSourceManager
{
  return self->_photoKitDataSourceManager;
}

- (void)setPhotoKitDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_photoKitDataSourceManager, a3);
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (void)setSocialGroup:(id)a3
{
  objc_storeStrong((id *)&self->_socialGroup, a3);
}

- (PXSectionedObjectReference)objectReference
{
  return self->_objectReference;
}

- (void)setObjectReference:(id)a3
{
  objc_storeStrong((id *)&self->_objectReference, a3);
}

- (BOOL)shouldSkipUserConfirmation
{
  return self->_shouldSkipUserConfirmation;
}

- (void)setShouldSkipUserConfirmation:(BOOL)a3
{
  self->_shouldSkipUserConfirmation = a3;
}

- (PXPhotoKitImportStatusManager)importStatusManager
{
  return self->_importStatusManager;
}

- (void)setImportStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_importStatusManager, a3);
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (void)setImportSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_importSessionID, a3);
}

- (unint64_t)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(unint64_t)a3
{
  self->_presentationSource = a3;
}

- (PXRadarConfigurationProvider)radarConfigurationProvider
{
  return self->_radarConfigurationProvider;
}

- (void)setRadarConfigurationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_radarConfigurationProvider, a3);
}

- (BOOL)supportsAirPlay
{
  return self->_supportsAirPlay;
}

- (void)setSupportsAirPlay:(BOOL)a3
{
  self->_supportsAirPlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_objectReference, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_photoKitDataSourceManager, 0);
  objc_storeStrong((id *)&self->_assetsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
}

void __57__PXPhotoKitAssetActionPerformer_assetsByAssetCollection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "assetCollectionForSection:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v10);
}

void __64__PXPhotoKitAssetActionPerformer__indexPathsInPhotosDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "indexPathForAsset:hintIndexPath:hintCollection:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), 0, v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "_selectionSnapshotForPerformerClass:applySubsetIfNeeded:", a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "socialGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = objc_msgSend(a1, "canPerformWithSelectionSnapshot:person:socialGroup:", v5, v6, v7);
  else
    v8 = 0;

  return v8;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetActionManager.m"), 597, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectionSnapshot.dataSource"), v21);
LABEL_9:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetActionManager.m"), 597, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectionSnapshot.dataSource"), v21, v23);

    goto LABEL_9;
  }
LABEL_3:
  objc_msgSend(v12, "photosDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  if (v13 && objc_msgSend(v14, "itemCount") >= 1)
  {
    v16 = objc_msgSend(a1, "canPerformOnSubsetOfSelection");
    *((_BYTE *)v32 + 24) = v16 ^ 1;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __85__PXPhotoKitAssetActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v24[3] = &unk_1E5131F08;
    v25 = v13;
    v29 = a1;
    v26 = v10;
    v30 = v16;
    v27 = v11;
    v28 = &v31;
    objc_msgSend(v15, "enumerateItemIndexSetsUsingBlock:", v24);

  }
  v17 = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v31, 8);

  return v17;
}

+ (BOOL)shouldEnableWithActionManager:(id)a3
{
  return 0;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 0;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return 0;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return 0;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  return 0;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isActionDestructive"))
    objc_msgSend(v6, "setAttributes:", 2);
  return v6;
}

+ (id)createStandardActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)createActivityWithActionManager:(id)a3
{
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return 0;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return 0;
}

+ (id)createIndeterminateProgressToastForActionPerformer:(id)a3 title:(id)a4 description:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  PXActionProgressToast *v13;
  void *v14;
  PXActionProgressToast *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
    objc_msgSend(v11, "setTotalUnitCount:", -1);
    objc_msgSend(v11, "setLocalizedDescription:", v8);
    objc_msgSend(v11, "setLocalizedAdditionalDescription:", v9);
    objc_msgSend(v10, "actionPerformerHostViewControllerForPresentingToast:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [PXActionProgressToast alloc];
    objc_msgSend(v12, "px_navigationDestination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PXActionProgressToast initWithTargetDestination:progress:](v13, "initWithTargetDestination:progress:", v14, v11);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "actionPerformerBottomPaddingForPresentingToast:", v7);
      -[PXActionProgressToast setBottomSpacing:](v15, "setBottomSpacing:");
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __85__PXPhotoKitAssetActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v8 = *(void **)(a1 + 32);
  v9 = a4;
  objc_msgSend(v8, "assetCollectionForSection:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PXPhotoKitAssetActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke_2;
  v16[3] = &unk_1E5131EE0;
  v22 = *(_QWORD *)(a1 + 64);
  v17 = v11;
  v18 = v10;
  v19 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v24 = *(_BYTE *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 56);
  v20 = v12;
  v21 = v13;
  v23 = a5;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v16);

}

void __85__PXPhotoKitAssetActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char v5;
  void *v6;
  char v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v8 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 72), "canPerformOnAsset:inAssetCollection:person:socialGroup:");
  if (*(_BYTE *)(a1 + 88))
  {
    v6 = (void *)v8;
    if ((v5 & 1) != 0)
    {
      v7 = 1;
LABEL_6:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v7;
      *a3 = 1;
      **(_BYTE **)(a1 + 80) = 1;
    }
  }
  else
  {
    v6 = (void *)v8;
    if ((v5 & 1) == 0)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }

}

@end
