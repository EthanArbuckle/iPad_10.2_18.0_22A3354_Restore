@implementation PXAssetCollectionActionManager

- (PXAssetCollectionActionManager)initWithAssetCollection:(id)a3 displayTitleInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  PXAssetCollectionActionManager *v10;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)off_1E50B1668);
  v12 = *(_QWORD *)off_1E50B7E98;
  v13 = xmmword_1A7C0C1F0;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (void *)objc_msgSend(v8, "initWithAssetCollection:keyAssetReference:indexPath:", v7, 0, &v12);

  v10 = -[PXAssetCollectionActionManager initWithAssetCollectionReference:displayTitleInfo:](self, "initWithAssetCollectionReference:displayTitleInfo:", v9, v6);
  return v10;
}

- (PXAssetCollectionActionManager)initWithAssetCollectionReference:(id)a3 displayTitleInfo:(id)a4
{
  id v7;
  id v8;
  PXAssetCollectionActionManager *v9;
  PXAssetCollectionActionManager *v10;
  uint64_t v11;
  NSDictionary *assetCollectionActionTypeByGenericType;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXAssetCollectionActionManager;
  v9 = -[PXAssetCollectionActionManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialAssetCollectionReference, a3);
    objc_storeStrong((id *)&v10->_internalDisplayTitleInfo, a4);
    v15 = *(_QWORD *)off_1E50B7D40;
    v16[0] = CFSTR("PXAssetCollectionActionTypeAddContent");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    assetCollectionActionTypeByGenericType = v10->_assetCollectionActionTypeByGenericType;
    v10->_assetCollectionActionTypeByGenericType = (NSDictionary *)v11;

  }
  return v10;
}

- (PXAssetCollectionActionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetCollectionActionManager.m"), 90, CFSTR("%s is not available as initializer"), "-[PXAssetCollectionActionManager init]");

  abort();
}

- (PXAssetCollectionReference)assetCollectionReference
{
  void *v3;
  void *v4;
  void *v5;
  PXAssetCollectionReference *v6;
  PXAssetCollectionReference *initialAssetCollectionReference;
  PXAssetCollectionReference *v8;

  -[PXAssetCollectionActionManager assetsDataSourceManager](self, "assetsDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_3;
  -[PXAssetCollectionActionManager assetsDataSourceManager](self, "assetsDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollectionReferenceForAssetCollectionReference:", self->_initialAssetCollectionReference);
  v6 = (PXAssetCollectionReference *)objc_claimAutoreleasedReturnValue();

  initialAssetCollectionReference = v6;
  if (!v6)
  {
LABEL_3:
    v6 = 0;
    initialAssetCollectionReference = self->_initialAssetCollectionReference;
  }
  v8 = initialAssetCollectionReference;

  return v8;
}

- (PXDisplayTitleInfo)displayTitleInfo
{
  PXDisplayTitleInfo *internalDisplayTitleInfo;
  void *v4;
  void *v5;
  PXDisplayTitleInfo *v6;
  PXDisplayTitleInfo *v7;

  internalDisplayTitleInfo = self->_internalDisplayTitleInfo;
  if (!internalDisplayTitleInfo)
  {
    -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = -[PXDisplayTitleInfo initWithAssetCollection:useVerboseSmartDescription:]([PXDisplayTitleInfo alloc], "initWithAssetCollection:useVerboseSmartDescription:", v5, 0);
    else
      v6 = 0;
    v7 = self->_internalDisplayTitleInfo;
    self->_internalDisplayTitleInfo = v6;

    internalDisplayTitleInfo = self->_internalDisplayTitleInfo;
  }
  return internalDisplayTitleInfo;
}

- (id)displayTitleInfoForAssetCollection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PXDisplayTitleInfo *v8;
  PXDisplayTitleInfo *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetCollectionActionManager.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

  }
  -[PXAssetCollectionActionManager displayTitleInfo](self, "displayTitleInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = -[PXDisplayTitleInfo initWithAssetCollection:useVerboseSmartDescription:]([PXDisplayTitleInfo alloc], "initWithAssetCollection:useVerboseSmartDescription:", v5, 0);
  v9 = v8;

  return v9;
}

- (BOOL)canPerformActionType:(id)a3 assetCollectionReference:(id)a4
{
  return 0;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PXAssetCollectionActionManager canPerformActionType:assetCollectionReference:](self, "canPerformActionType:assetCollectionReference:", v4, v5);
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "canPerformActionType: \"%@\" with no assetCollection", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (id)actionTypeForGenericType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_assetCollectionActionTypeByGenericType, "objectForKeyedSubscript:", a3);
}

- (id)actionPerformerForActionType:(id)a3 assetCollectionReference:(id)a4
{
  return 0;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXAssetCollectionActionManager actionPerformerForActionType:assetCollectionReference:](self, "actionPerformerForActionType:assetCollectionReference:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "actionPerformerForActionType: \"%@\" with no assetCollection", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4 assetCollectionReference:(id)a5
{
  return 0;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PXAssetCollectionActionManager localizedTitleForActionType:useCase:assetCollectionReference:](self, "localizedTitleForActionType:useCase:assetCollectionReference:", v6, a4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "localizedTitleForActionType: \"%@\" with no assetCollection", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)systemImageNameForActionType:(id)a3 assetCollectionReference:(id)a4
{
  return 0;
}

- (id)systemImageNameForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXAssetCollectionActionManager systemImageNameForActionType:assetCollectionReference:](self, "systemImageNameForActionType:assetCollectionReference:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "systemImageNameForActionType: \"%@\" with no assetCollection", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (PHFetchResult)people
{
  return self->_people;
}

- (void)setPeople:(id)a3
{
  objc_storeStrong((id *)&self->_people, a3);
}

- (PHFetchResult)socialGroups
{
  return self->_socialGroups;
}

- (void)setSocialGroups:(id)a3
{
  objc_storeStrong((id *)&self->_socialGroups, a3);
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (void)setDropTargetAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
}

- (UIDragSession)dragSession
{
  return (UIDragSession *)objc_loadWeakRetained((id *)&self->_dragSession);
}

- (void)setDragSession:(id)a3
{
  objc_storeWeak((id *)&self->_dragSession, a3);
}

- (UIDropSession)dropSession
{
  return (UIDropSession *)objc_loadWeakRetained((id *)&self->_dropSession);
}

- (void)setDropSession:(id)a3
{
  objc_storeWeak((id *)&self->_dropSession, a3);
}

- (UITraitEnvironment)traitEnvironment
{
  return (UITraitEnvironment *)objc_loadWeakRetained((id *)&self->_traitEnvironment);
}

- (void)setTraitEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_traitEnvironment, a3);
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (void)setAssetsDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetsDataSourceManager, a3);
}

- (PHFetchResult)assetsFetchResult
{
  return self->_assetsFetchResult;
}

- (void)setAssetsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_assetsFetchResult, a3);
}

- (PHAssetCollection)containingAlbum
{
  return self->_containingAlbum;
}

- (void)setContainingAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_containingAlbum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingAlbum, 0);
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_destroyWeak((id *)&self->_traitEnvironment);
  objc_destroyWeak((id *)&self->_dropSession);
  objc_destroyWeak((id *)&self->_dragSession);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_socialGroups, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionTypeByGenericType, 0);
  objc_storeStrong((id *)&self->_internalDisplayTitleInfo, 0);
  objc_storeStrong((id *)&self->_initialAssetCollectionReference, 0);
}

- (id)menuElementsForActionType:(id)a3 assetCollectionReference:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)menuElementsForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXAssetCollectionActionManager menuElementsForActionType:assetCollectionReference:](self, "menuElementsForActionType:assetCollectionReference:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "canPerformActionType: \"%@\" with no assetCollection", (uint8_t *)&v9, 0xCu);
    }

    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

@end
