@implementation PXPhotoKitAssetActionManager

- (void)registerPerformerClass:(Class)a3 forType:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, v6);

}

- (NSMutableDictionary)_performerClassByType
{
  return self->__performerClassByType;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (PXPhotoKitAssetActionManager)initWithSelectionManager:(id)a3
{
  id v4;
  PXPhotoKitAssetActionManager *v5;
  void *v6;
  PXPhotoKitAssetsDataSourceManager *v7;
  PXPhotoKitAssetsDataSourceManager *dataSourceManager;
  PXPhotoKitAssetsDataSourceManager *v9;
  uint64_t v10;
  NSMapTable *actionTypeByBarButtonItem;
  NSMutableDictionary *v12;
  NSMutableDictionary *performerClassByType;
  uint64_t v14;
  NSMutableDictionary *v15;
  __CFString *v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  __CFString *v19;
  uint64_t v20;
  NSMutableDictionary *v21;
  __CFString *v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  __CFString *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PXPhotoKitAssetActionManager;
  v5 = -[PXAssetActionManager initWithSelectionManager:](&v27, sel_initWithSelectionManager_, v4);
  if (v5)
  {
    objc_msgSend(v4, "dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    dataSourceManager = v5->_dataSourceManager;
    v5->_dataSourceManager = v7;
    v9 = v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    actionTypeByBarButtonItem = v5->__actionTypeByBarButtonItem;
    v5->__actionTypeByBarButtonItem = (NSMapTable *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    performerClassByType = v5->__performerClassByType;
    v5->__performerClassByType = v12;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypePersonMakeKeyPhoto"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeSocialGroupMakeKeyPhoto"));
    v14 = objc_opt_class();
    v15 = v5->__performerClassByType;
    v16 = CFSTR("PXAssetActionTypeVariationNone");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, CFSTR("PXAssetActionTypeVariationNone"));

    v17 = objc_opt_class();
    v18 = v5->__performerClassByType;
    v19 = CFSTR("PXAssetActionTypeVariationAutoloop");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, CFSTR("PXAssetActionTypeVariationAutoloop"));

    v20 = objc_opt_class();
    v21 = v5->__performerClassByType;
    v22 = CFSTR("PXAssetActionTypeVariationMirror");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v20, CFSTR("PXAssetActionTypeVariationMirror"));

    v23 = objc_opt_class();
    v24 = v5->__performerClassByType;
    v25 = CFSTR("PXAssetActionTypeVariationLongExposure");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v23, CFSTR("PXAssetActionTypeVariationLongExposure"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeAddToLibrary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeShowInLibrary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeCopy"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeHide"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeDuplicate"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeTrash"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeTrashNoConfirm"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeDelete"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeRestore"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeRecover"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeUnifiedDestructive"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeRemove"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeRemoveNoConfirm"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeExpunge"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeToggleFavorite"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeAlbumMakeKeyPhoto"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeStoryRemoveAsset"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeStoryMakeKeyPhoto"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeEditDateTime"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeEditLocation"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeMergeDuplicates"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeMergeDuplicatesWithoutConfirmation"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeToggleSelection"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypePickAsset"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeRemoveFromFeaturedPhotos"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeFileRadar"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeInternalContentSyndicationFileRadar"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeInternalAssetDetails"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeInternalAssetSearchDetails"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeInternalCopyURL"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypePrint"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeFeatureLess"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeInternalFileRadarForSharedLibrary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeSyndicationSaveToLibrary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeInternalToggleStacks"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeMoveToLibrary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeMoveToSharedLibrary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeMoveToPersonalLibrary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeRemoveSharingSuggestion"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeShowActionsMenu"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypePlayMovie"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->__performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeNotThisPerson"));

    -[PXAssetActionManager px_registerAdditionalPerformerClasses](v5, "px_registerAdditionalPerformerClasses");
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->__activePerformer, 0);
  objc_storeStrong((id *)&self->__actionTypeByBarButtonItem, 0);
  objc_storeStrong((id *)&self->__performerClassByType, 0);
  objc_storeStrong((id *)&self->_radarConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
}

- (PXPhotoKitAssetActionManager)initWithSuggestion:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PXPhotoKitAssetActionManager *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CD1390];
  v5 = a3;
  objc_msgSend(v4, "fetchKeyAssetsInAssetCollection:options:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:existingAssetsFetchResult:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v7);
  objc_msgSend(v8, "performChanges:", &__block_literal_global_24893);
  v9 = -[PXPhotoKitAssetActionManager initWithSelectionManager:](self, "initWithSelectionManager:", v8);
  if (v9)
  {
    v12[0] = CFSTR("PXAssetActionTypeDuplicate");
    v12[1] = CFSTR("PXAssetActionTypeEditDateTime");
    v12[2] = CFSTR("PXAssetActionTypeEditLocation");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetActionManager setExcludedContextMenuActionTypes:](v9, "setExcludedContextMenuActionTypes:", v10);

  }
  return v9;
}

uint64_t __65__PXPhotoKitAssetActionManager_PHSuggestion__initWithSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

- (PXPhotoKitAssetActionManager)initWithAsset:(id)a3
{
  void *v4;
  void *v5;
  PXPhotoKitAssetActionManager *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  +[PXPhotoKitAssetsDataSourceManager dataSourceManagerWithAsset:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerWithAsset:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v4);
  objc_msgSend(v5, "performChanges:", &__block_literal_global_143);
  v6 = -[PXPhotoKitAssetActionManager initWithSelectionManager:](self, "initWithSelectionManager:", v5);
  if (v6)
  {
    v9[0] = CFSTR("PXAssetActionTypeDuplicate");
    v9[1] = CFSTR("PXAssetActionTypeEditDateTime");
    v9[2] = CFSTR("PXAssetActionTypeEditLocation");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetActionManager setExcludedContextMenuActionTypes:](v6, "setExcludedContextMenuActionTypes:", v7);

  }
  return v6;
}

uint64_t __55__PXPhotoKitAssetActionManager_PHAsset__initWithAsset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

- (void)setAdditionalPropertiesFromActionManager:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotoKitAssetActionManager;
  -[PXAssetActionManager setAdditionalPropertiesFromActionManager:](&v14, sel_setAdditionalPropertiesFromActionManager_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "importSessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionManager setImportSessionID:](self, "setImportSessionID:", v6);

    objc_msgSend(v5, "importStatusManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionManager setImportStatusManager:](self, "setImportStatusManager:", v7);

    objc_msgSend(v5, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionManager setPerson:](self, "setPerson:", v8);

    objc_msgSend(v5, "socialGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionManager setSocialGroup:](self, "setSocialGroup:", v9);

    -[PXPhotoKitAssetActionManager dataSourceManager](self, "dataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v5, "dataSourceManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetActionManager setDataSourceManager:](self, "setDataSourceManager:", v11);

    }
    -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_performerClassByType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addEntriesFromDictionary:", v13);

  }
}

- (PHPhotoLibrary)photoLibrary
{
  void *v2;
  void *v3;

  -[PXPhotoKitAssetActionManager dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPhotoLibrary *)v3;
}

- (void)setPerson:(id)a3
{
  PHPerson **p_person;
  PHPerson *v6;
  void *v7;
  char v8;
  void *v9;
  PHPerson *v10;

  v10 = (PHPerson *)a3;
  p_person = &self->_person;
  v6 = self->_person;
  v7 = v10;
  if (v6 == v10)
  {
LABEL_6:

    goto LABEL_7;
  }
  v8 = -[PHPerson isEqual:](v10, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    -[PHPerson photoLibrary](*p_person, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_person, a3);
    -[PHPerson photoLibrary](*p_person, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v9)
    {
      objc_msgSend(v7, "px_unregisterChangeObserver:", self);
      objc_msgSend(v9, "px_registerChangeObserver:", self);
    }

    goto LABEL_6;
  }
LABEL_7:

}

- (void)setSocialGroup:(id)a3
{
  PHSocialGroup **p_socialGroup;
  PHSocialGroup *v6;
  void *v7;
  char v8;
  void *v9;
  PHSocialGroup *v10;

  v10 = (PHSocialGroup *)a3;
  p_socialGroup = &self->_socialGroup;
  v6 = self->_socialGroup;
  v7 = v10;
  if (v6 == v10)
  {
LABEL_6:

    goto LABEL_7;
  }
  v8 = -[PHSocialGroup isEqual:](v10, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    -[PHSocialGroup photoLibrary](*p_socialGroup, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_socialGroup, a3);
    -[PHSocialGroup photoLibrary](*p_socialGroup, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v9)
    {
      objc_msgSend(v7, "px_unregisterChangeObserver:", self);
      objc_msgSend(v9, "px_registerChangeObserver:", self);
    }

    goto LABEL_6;
  }
LABEL_7:

}

- (unint64_t)presentationSource
{
  return 0;
}

- (PXPhotosDataSource)_dataSourceSnapshot
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  -[PXAssetActionManager selectionManager](self, "selectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (PXPhotosDataSource *)v7;
}

- (id)_selectionSnapshotForPerformerClass:(Class)a3 applySubsetIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  Class v34;

  v4 = a4;
  -[PXAssetActionManager effectiveSelectionSnapshot](self, "effectiveSelectionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetActionManager.m"), 246, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectionSnapshot.dataSource"), v26, v28);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetActionManager.m"), 246, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectionSnapshot.dataSource"), v26);
  }

LABEL_3:
  if ((objc_msgSend(v8, "isAnyItemSelected") & 1) != 0)
  {
    if (-[objc_class canPerformOnSubsetOfSelection](a3, "canPerformOnSubsetOfSelection") && v4)
    {
      v10 = objc_alloc_init((Class)off_1E50B3668);
      objc_msgSend(v9, "photosDataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectedIndexPaths");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetActionManager person](self, "person");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetActionManager socialGroup](self, "socialGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __88__PXPhotoKitAssetActionManager__selectionSnapshotForPerformerClass_applySubsetIfNeeded___block_invoke;
      v29[3] = &unk_1E5137010;
      v33 = v10;
      v34 = a3;
      v30 = v11;
      v31 = v13;
      v32 = v14;
      v15 = v10;
      v16 = v14;
      v17 = v13;
      v18 = v11;
      objc_msgSend(v12, "enumerateItemIndexPathsUsingBlock:", v29);
      v19 = objc_msgSend(objc_alloc((Class)off_1E50B4A80), "initWithDataSource:selectedIndexPaths:", v9, v15);

      v8 = v18;
LABEL_9:

      v8 = (void *)v19;
    }
  }
  else
  {
    objc_msgSend(v9, "containerCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[objc_class canPerformOnImplicitSelectionInContainerCollection:](a3, "canPerformOnImplicitSelectionInContainerCollection:", v20);

    if (v21)
    {
      v22 = objc_alloc((Class)off_1E50B4A80);
      objc_msgSend(v9, "allItemIndexPaths");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v22, "initWithDataSource:selectedIndexPaths:", v9, v12);
      goto LABEL_9;
    }
  }

  return v8;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  char v14;
  void *v16;

  v4 = a3;
  -[PXPhotoKitAssetActionManager _dataSourceSnapshot](self, "_dataSourceSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_11;
  }
  v7 = -[PXActionManager isActionTypeAllowed:](self, "isActionTypeAllowed:", v4);

  if (!v7)
    goto LABEL_11;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", v4);

  if (!v9)
    goto LABEL_11;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeToggleSelection"))
    || (-[PXActionManager allowedActionTypes](self, "allowedActionTypes"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "containsObject:", CFSTR("PXAssetActionTypeToggleSelection")),
        v10,
        (v11 & 1) != 0))
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypePickAsset"))
      || (-[PXActionManager allowedActionTypes](self, "allowedActionTypes"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "containsObject:", CFSTR("PXAssetActionTypePickAsset")),
          v12,
          v13))
    {
      v14 = objc_msgSend(v9, "canPerformWithActionManager:", self);
      goto LABEL_12;
    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  -[PXActionManager allowedActionTypes](self, "allowedActionTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "containsObject:", CFSTR("PXAssetActionTypeToggleSelection")) & 1) != 0)
    v14 = 1;
  else
    v14 = -[PXPhotoKitAssetActionManager canPerformActionType:](self, "canPerformActionType:", CFSTR("PXAssetActionTypeMergeDuplicates"));

LABEL_12:
  return v14;
}

- (BOOL)supportsActionType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  return v6 != 0;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  return objc_msgSend(v6, "isActionDestructive");
}

- (BOOL)shouldEnableActionType:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PXAssetActionTypeAddToLibrary")))
  {
    -[PXPhotoKitAssetActionManager importStatusManager](self, "importStatusManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
    if (v7 && v8)
    {
      v11 = objc_msgSend(v8, "importStateForAsset:", v7);
      if (v11)
        v12 = v11 == 3;
      else
        v12 = 1;
      v10 = v12;
    }

  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("PXAssetActionTypeMergeDuplicates")))
    {
      -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", v6);

      v15 = objc_msgSend(v14, "shouldEnableWithActionManager:", self);
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)PXPhotoKitAssetActionManager;
      v15 = -[PXAssetActionManager shouldEnableActionType:onAsset:](&v17, sel_shouldEnableActionType_onAsset_, v6, v7);
    }
    v10 = v15;
  }

  return v10;
}

- (BOOL)canPerformAssetVariationActions
{
  __CFString *v3;

  v3 = CFSTR("PXAssetActionTypeVariationAutoloop");
  LOBYTE(self) = -[PXPhotoKitAssetActionManager canPerformActionType:](self, "canPerformActionType:", CFSTR("PXAssetActionTypeVariationAutoloop"));

  return (char)self;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (-[PXPhotoKitAssetActionManager canPerformActionType:](self, "canPerformActionType:", v4)
    && (-[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (objc_class *)objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v5,
        v6))
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithActionType:", v4);
    -[PXPhotoKitAssetActionManager _selectionSnapshotForPerformerClass:applySubsetIfNeeded:](self, "_selectionSnapshotForPerformerClass:applySubsetIfNeeded:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectionSnapshot:", v8);

    -[PXPhotoKitAssetActionManager dataSourceManager](self, "dataSourceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhotoKitDataSourceManager:", v9);

    -[PXPhotoKitAssetActionManager person](self, "person");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPerson:", v10);

    -[PXPhotoKitAssetActionManager socialGroup](self, "socialGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSocialGroup:", v11);

    -[PXAssetActionManager objectReference](self, "objectReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObjectReference:", v12);

    -[PXPhotoKitAssetActionManager importStatusManager](self, "importStatusManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImportStatusManager:", v13);

    -[PXPhotoKitAssetActionManager importSessionID](self, "importSessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImportSessionID:", v14);

    objc_msgSend(v7, "setPresentationSource:", -[PXPhotoKitAssetActionManager presentationSource](self, "presentationSource"));
    -[PXAssetActionManager selectionManager](self, "selectionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectionManager:", v15);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v16);

    -[PXPhotoKitAssetActionManager radarConfigurationProvider](self, "radarConfigurationProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRadarConfigurationProvider:", v17);

    objc_msgSend(v7, "setSupportsAirPlay:", -[PXPhotoKitAssetActionManager supportsAirPlay](self, "supportsAirPlay"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  if (v6)
  {
    objc_msgSend(v6, "createBarButtonItemWithTarget:action:actionManager:", self, sel__handleBarButtonItem_, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PXPhotoKitAssetActionManager _actionTypeByBarButtonItem](self, "_actionTypeByBarButtonItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v4, v6);

    }
  }

  return v6;
}

- (id)previewActionForActionType:(id)a3 image:(id)a4
{
  return -[PXPhotoKitAssetActionManager menuElementForActionType:image:willStartActionHandler:didEndActionHandler:](self, "menuElementForActionType:image:willStartActionHandler:didEndActionHandler:", a3, a4, 0, 0);
}

- (id)menuElementForActionType:(id)a3 image:(id)a4 willStartActionHandler:(id)a5 didEndActionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", v10);

  if (v15)
  {
    -[PXPhotoKitAssetActionManager localizedTitleForActionType:useCase:](self, "localizedTitleForActionType:useCase:", v10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __106__PXPhotoKitAssetActionManager_menuElementForActionType_image_willStartActionHandler_didEndActionHandler___block_invoke;
    v19[3] = &unk_1E5131E90;
    v21 = v12;
    v19[4] = self;
    v20 = v10;
    v22 = v13;
    objc_msgSend(v15, "createPreviewActionWithTitle:image:handler:", v16, v11, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)standardActionForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  if (v6)
  {
    objc_initWeak(&location, self);
    -[PXPhotoKitAssetActionManager localizedTitleForActionType:useCase:](self, "localizedTitleForActionType:useCase:", v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionManager systemImageNameForActionType:](self, "systemImageNameForActionType:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PXPhotoKitAssetActionManager_standardActionForActionType___block_invoke;
    v11[3] = &unk_1E5139028;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    objc_msgSend(v6, "createStandardActionWithTitle:image:handler:", v7, v9, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)activityForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  if (v6)
  {
    objc_msgSend(v6, "createActivityWithActionManager:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActionDelegate:", self);
  }
  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  void *v5;

  objc_msgSend(a4, "actionType", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PXPhotoKitAssetActionManager canPerformActionType:](self, "canPerformActionType:", v5);

  return (char)self;
}

- (void)performActivity:(id)a3
{
  id v4;

  objc_msgSend(a3, "actionType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionManager executeActionForActionType:sender:completionHandler:](self, "executeActionForActionType:sender:completionHandler:", v4, 0, 0);

}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", v6);

  return (id)objc_msgSend(v8, "localizedTitleForUseCase:actionManager:", a4, self);
}

- (id)systemImageNameForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotoKitAssetActionManager _performerClassByType](self, "_performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  return (id)objc_msgSend(v6, "systemImageNameForActionManager:", self);
}

- (void)_handleAction:(id)a3 actionType:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "sender");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionManager executeActionForActionType:sender:completionHandler:](self, "executeActionForActionType:sender:completionHandler:", v9, v10, v8);

}

- (void)_handleBarButtonItem:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  if (v5)
  {
    v11 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetActionManager.m"), 517, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      objc_msgSend(v11, "barButtonItem");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetActionManager.m"), 515, CFSTR("Invalid bar button item"));

        v6 = 0;
      }
    }
    -[PXPhotoKitAssetActionManager _actionTypeByBarButtonItem](self, "_actionTypeByBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotoKitAssetActionManager executeActionForActionType:sender:completionHandler:](self, "executeActionForActionType:sender:completionHandler:", v8, v11, 0);
    v5 = v11;
  }

}

- (void)executeActionForActionType:(id)a3 sender:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXPhotoKitAssetActionManager _activePerformer](self, "_activePerformer");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (id)v11;
    -[PXPhotoKitAssetActionManager _activePerformer](self, "_activePerformer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v13, "state") <= 0xA)
    {

      goto LABEL_8;
    }
    v14 = -[PXPhotoKitAssetActionManager canPerformActionType:](self, "canPerformActionType:", v8);

    if (!v14)
      goto LABEL_9;
LABEL_6:
    -[PXPhotoKitAssetActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionManager _setActivePerformer:](self, "_setActivePerformer:", v15);
    objc_initWeak(&location, self);
    objc_msgSend(v15, "setSender:", v9);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __84__PXPhotoKitAssetActionManager_executeActionForActionType_sender_completionHandler___block_invoke;
    v16[3] = &unk_1E5131EB8;
    objc_copyWeak(&v19, &location);
    v12 = v15;
    v17 = v12;
    v18 = v10;
    objc_msgSend(v12, "performActionWithCompletionHandler:", v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
LABEL_8:

    goto LABEL_9;
  }
  if (-[PXPhotoKitAssetActionManager canPerformActionType:](self, "canPerformActionType:", v8))
    goto LABEL_6;
LABEL_9:

}

- (void)_handleActionPerformerComplete:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  _BYTE v13[22];
  __int16 v14;
  id v15;
  uint64_t v16;

  v6 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PXPhotoKitAssetActionManager _activePerformer](self, "_activePerformer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    if (v9)
    {
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = CFSTR("NO");
        *(_DWORD *)v13 = 138412802;
        *(_QWORD *)&v13[4] = v8;
        *(_WORD *)&v13[12] = 2112;
        if (v6)
          v12 = CFSTR("YES");
        *(_QWORD *)&v13[14] = v12;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Error performing action:%@ success:%@ error:%@", v13, 0x20u);
      }

    }
    -[PXPhotoKitAssetActionManager _setActivePerformer:](self, "_setActivePerformer:", 0, *(_OWORD *)v13);
  }

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXPhotoKitAssetActionManager person](self, "person");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForObject:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectAfterChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionManager setPerson:](self, "setPerson:", v6);

  }
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PHPerson)person
{
  return self->_person;
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
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

- (NSMapTable)_actionTypeByBarButtonItem
{
  return self->__actionTypeByBarButtonItem;
}

- (PXAssetActionPerformer)_activePerformer
{
  return self->__activePerformer;
}

- (void)_setActivePerformer:(id)a3
{
  objc_storeStrong((id *)&self->__activePerformer, a3);
}

- (PXPhotoKitAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

void __84__PXPhotoKitAssetActionManager_executeActionForActionType_sender_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  uint64_t v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleActionPerformerComplete:success:error:", *(_QWORD *)(a1 + 32), a2, v7);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

void __60__PXPhotoKitAssetActionManager_standardActionForActionType___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "executeActionForActionType:sender:completionHandler:", v5, v6, 0);
}

void __106__PXPhotoKitAssetActionManager_menuElementForActionType_image_willStartActionHandler_didEndActionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_handleAction:actionType:completionHandler:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

void __88__PXPhotoKitAssetActionManager__selectionSnapshotForPerformerClass_applySubsetIfNeeded___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "assetCollectionForSection:", *((_QWORD *)a2 + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = a2[1];
  v10 = *a2;
  v11 = v6;
  objc_msgSend(v5, "assetAtSimpleIndexPath:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 64), "canPerformOnAsset:inAssetCollection:person:socialGroup:", v7, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    v8 = *(void **)(a1 + 56);
    v9 = a2[1];
    v10 = *a2;
    v11 = v9;
    objc_msgSend(v8, "addIndexPath:", &v10);
  }

}

+ (id)selectedAssetForActionManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;

  v3 = a3;
  objc_msgSend(v3, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v3, "objectReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_6;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXPhotoKitAssetActionManager.m"), 373, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("actionManager.objectReference"), v17, v19);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXPhotoKitAssetActionManager.m"), 373, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("actionManager.objectReference"), v17);
    }

LABEL_6:
    objc_msgSend(v8, "asset");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXPhotoKitAssetActionManager.m"), 374, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetReference.asset"), v12, v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXPhotoKitAssetActionManager.m"), 374, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetReference.asset"), v12, v23);
    }
LABEL_16:

    goto LABEL_8;
  }
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXPhotoKitAssetActionManager selectedAssetForActionManager:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXPhotoKitAssetActionManager.m"), 376, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectedObject"), v11, v12);
    goto LABEL_16;
  }
LABEL_9:

  return v7;
}

@end
