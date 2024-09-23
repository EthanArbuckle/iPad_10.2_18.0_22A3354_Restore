@implementation PXNavigationListDataSectionManager

- (PXNavigationListDataSectionManager)initWithConfiguration:(id)a3
{
  id v4;
  PXNavigationListDataSectionManager *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PXPhotoKitCollectionsDataSourceManager *collectionsDataSourceManager;
  uint64_t v10;
  NSMutableDictionary *childDataSectionManagers;
  uint64_t v12;
  NSMutableDictionary *childDataSectionIndexes;
  NSMutableDictionary *v14;
  NSMutableDictionary *collectionsByPrivacyControllerId;
  NSMutableDictionary *v16;
  NSMutableDictionary *privacyControllersById;
  uint64_t v18;
  NSMapTable *parentListItems;
  uint64_t v20;
  PHCollectionList *collectionList;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXNavigationListDataSectionManager;
  v5 = -[PXDataSectionManager initWithChildDataSectionManagers:](&v23, sel_initWithChildDataSectionManagers_, MEMORY[0x1E0C9AA60]);
  if (v5)
  {
    objc_msgSend(v4, "collectionList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXNavigationListItemWithObject(v6, 0x7FFFFFFFFFFFFFFFLL, 0, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDataSectionManager setOutlineObject:](v5, "setOutlineObject:", v7);

    objc_msgSend((id)objc_opt_class(), "makeCollectionsDataSourceManagerForConfiguration:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    collectionsDataSourceManager = v5->_collectionsDataSourceManager;
    v5->_collectionsDataSourceManager = (PXPhotoKitCollectionsDataSourceManager *)v8;

    v10 = objc_opt_new();
    childDataSectionManagers = v5->_childDataSectionManagers;
    v5->_childDataSectionManagers = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    childDataSectionIndexes = v5->_childDataSectionIndexes;
    v5->_childDataSectionIndexes = (NSMutableDictionary *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    collectionsByPrivacyControllerId = v5->_collectionsByPrivacyControllerId;
    v5->_collectionsByPrivacyControllerId = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    privacyControllersById = v5->_privacyControllersById;
    v5->_privacyControllersById = v16;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    parentListItems = v5->_parentListItems;
    v5->_parentListItems = (NSMapTable *)v18;

    objc_msgSend(v4, "collectionList");
    v20 = objc_claimAutoreleasedReturnValue();
    collectionList = v5->_collectionList;
    v5->_collectionList = (PHCollectionList *)v20;

    v5->_skipAssetCountFetches = objc_msgSend(v4, "skipAssetCountFetches");
    -[PXCollectionsDataSourceManager registerChangeObserver:context:](v5->_collectionsDataSourceManager, "registerChangeObserver:context:", v5, CollectionsDataSourceManagerObservationContext);
  }

  return v5;
}

- (PXNavigationListDataSectionManager)initWithCollectionList:(id)a3
{
  void *v4;
  PXNavigationListDataSectionManager *v5;

  +[PXNavigationListDataSectionConfiguration configurationWithCollectionList:](PXNavigationListDataSectionConfiguration, "configurationWithCollectionList:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXNavigationListDataSectionManager initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (PXNavigationListDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListDataSectionManager.m"), 109, CFSTR("%s is not available as initializer"), "-[PXNavigationListDataSectionManager initWithChildDataSectionManagers:]");

  abort();
}

- (id)collectionsDataSourceIfExisting
{
  return self->_collectionsDataSource;
}

- (PXPhotoKitCollectionsDataSource)collectionsDataSource
{
  PXPhotoKitCollectionsDataSource **p_collectionsDataSource;
  PXPhotoKitCollectionsDataSource *v4;

  p_collectionsDataSource = &self->_collectionsDataSource;
  v4 = self->_collectionsDataSource;
  if (!v4)
  {
    -[PXSectionedDataSourceManager dataSource](self->_collectionsDataSourceManager, "dataSource");
    v4 = (PXPhotoKitCollectionsDataSource *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_collectionsDataSource, v4);
  }
  return v4;
}

- (id)_changeDetailsForItemAtIndex:(int64_t)a3 childDataSection:(id)a4 expanding:(BOOL)a5
{
  _BOOL4 v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a5;
  v7 = a3 + 1;
  v8 = objc_msgSend(a4, "count");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = !v5;
  if (v5)
    v11 = (void *)v9;
  else
    v11 = 0;
  if (v10)
    v12 = (void *)v9;
  else
    v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v12, v11, 0, 0, v13);

  return v14;
}

- (void)_requestParentForListItem:(id)a3 hintIndex:(int64_t)a4 resultHandler:(id)a5 recursionHandler:(id)a6
{
  void (**v10)(id, uint64_t);
  void (**v11)(id, uint64_t, uint64_t);
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v10 = (void (**)(id, uint64_t))a5;
  v11 = (void (**)(id, uint64_t, uint64_t))a6;
  v12 = a3;
  -[PXDataSectionManager dataSection](self, "dataSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "validatedIndexOfListItem:hintIndex:", v12, a4);

  v18 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v13, "parentOfListItemAtIndex:localIndex:", v14, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_childDataSectionManagers, "objectForKeyedSubscript:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15 && v16)
    v11[2](v11, v16, v18);
  else
    v10[2](v10, v14);

}

- (void)setAllowsEmptyDataSection:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_allowsEmptyDataSection != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __64__PXNavigationListDataSectionManager_setAllowsEmptyDataSection___block_invoke;
    v3[3] = &unk_1E5142B28;
    v3[4] = self;
    v4 = a3;
    -[PXNavigationListDataSectionManager performChanges:](self, "performChanges:", v3);
  }
}

- (id)createDataSection
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  PXCollectionsDataSection *v39;
  void *v40;
  PXCollectionsDataSection *v41;
  PXNavigationListDataSection *v42;
  int64_t v43;
  void *v44;
  PXNavigationListDataSection *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSMutableDictionary *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v4 = self->_childDataSectionManagers;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v65 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_childDataSectionManagers, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dataSection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v6);
  }

  v12 = 0x1E0C99000uLL;
  v13 = (NSMutableDictionary *)objc_opt_new();
  -[PXDataSectionManager dataSectionIfCreated](self, "dataSectionIfCreated");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = v13;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v13 = self->_childDataSectionIndexes;
    v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v61 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_childDataSectionIndexes, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "integerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v50, "indexInCollectionsDataSectionOfListItem:hintIndex:", v18, v20));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v51, "setObject:forKeyedSubscript:", v21, v18);

        }
        v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      }
      while (v15);
      v12 = 0x1E0C99000;
    }
  }
  else
  {
    v51 = self->_childDataSectionIndexes;
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[NSMutableDictionary allValues](self->_privacyControllersById, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v57 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "unregisterChangeObserver:context:", self, PrivacyControllerObservationContext_102973);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    }
    while (v24);
  }

  -[NSMutableDictionary removeAllObjects](self->_privacyControllersById, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_collectionsByPrivacyControllerId, "removeAllObjects");
  -[PXNavigationListDataSectionManager collectionsDataSource](self, "collectionsDataSource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allItemsEnumerator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v12 + 3592), "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v29 = v28;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v53;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v53 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v33);
        +[PXContentPrivacyController privacyControllerForCollection:](PXContentPrivacyController, "privacyControllerForCollection:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v35)
        {
          objc_msgSend(v35, "registerChangeObserver:context:", self, PrivacyControllerObservationContext_102973);
          objc_msgSend(v36, "identifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_privacyControllersById, "setObject:forKeyedSubscript:", v36, v48);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_collectionsByPrivacyControllerId, "setObject:forKeyedSubscript:", v34, v48);
          if (objc_msgSend(v36, "isContentPrivacyEnabled"))
          {
            if (objc_msgSend(v36, "isLocked"))
              v37 = 1;
            else
              v37 = 2;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v47, v34);

          }
        }

        ++v33;
      }
      while (v31 != v33);
      v38 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
      v31 = v38;
    }
    while (v38);
  }

  v39 = [PXCollectionsDataSection alloc];
  -[PXNavigationListDataSectionManager collectionsDataSource](self, "collectionsDataSource");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PXCollectionsDataSection initWithCollectionsDataSource:lockStatePerCollection:](v39, "initWithCollectionsDataSource:lockStatePerCollection:", v40, v49);

  v42 = [PXNavigationListDataSection alloc];
  v43 = -[PXNavigationListDataSectionManager indentationLevel](self, "indentationLevel");
  -[PXDataSectionManager outlineObject](self, "outlineObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[PXNavigationListDataSection initWithCollectionsDataSection:indentationLevel:outlineObject:childDataSections:childIndexHints:skipAssetCountFetches:](v42, "initWithCollectionsDataSection:indentationLevel:outlineObject:childDataSections:childIndexHints:skipAssetCountFetches:", v41, v43, v44, v3, v51, -[PXNavigationListDataSectionManager skipAssetCountFetches](self, "skipAssetCountFetches"));

  return v45;
}

- (id)auxiliaryObjectForKey:(id)a3 dataSectionObject:(id)a4 hintIndex:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v8 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__102991;
  v38 = __Block_byref_object_dispose__102992;
  v39 = 0;
  v9 = a4;
  objc_msgSend(v9, "collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "px_allowsKeyAssetDisplay");
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PXNavigationListItemKeyAsset")) & v11) == 1)
  {
    v12 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke;
    v31[3] = &unk_1E5126558;
    v31[4] = self;
    v32 = v10;
    v33 = &v34;
    v27[0] = v12;
    v27[1] = 3221225472;
    v27[2] = __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_2;
    v27[3] = &unk_1E5126580;
    v30 = &v34;
    v28 = v8;
    v29 = v9;
    -[PXNavigationListDataSectionManager _requestParentForListItem:hintIndex:resultHandler:recursionHandler:](self, "_requestParentForListItem:hintIndex:resultHandler:recursionHandler:", v29, a5, v31, v27);

    v13 = v32;
  }
  else
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PXNavigationListItemFolderKeyAssets")) & v11) != 1)
    {
      v19.receiver = self;
      v19.super_class = (Class)PXNavigationListDataSectionManager;
      -[PXDataSectionManager auxiliaryObjectForKey:dataSectionObject:hintIndex:](&v19, sel_auxiliaryObjectForKey_dataSectionObject_hintIndex_, v8, v9, a5);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v35[5];
      v35[5] = v15;

      goto LABEL_7;
    }
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_3;
    v24[3] = &unk_1E5126558;
    v24[4] = self;
    v25 = v10;
    v26 = &v34;
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_4;
    v20[3] = &unk_1E5126580;
    v23 = &v34;
    v21 = v8;
    v22 = v9;
    -[PXNavigationListDataSectionManager _requestParentForListItem:hintIndex:resultHandler:recursionHandler:](self, "_requestParentForListItem:hintIndex:resultHandler:recursionHandler:", v22, a5, v24, v20);

    v13 = v25;
  }

LABEL_7:
  v17 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  return v17;
}

- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXNavigationListDataSectionManager;
  v6 = a4;
  -[PXDataSectionManager setChangeProcessingPaused:forReason:](&v8, sel_setChangeProcessingPaused_forReason_, v4, v6);
  -[PXNavigationListDataSectionManager collectionsDataSourceManager](self, "collectionsDataSourceManager", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setChangeProcessingPaused:forReason:", v4, v6);

}

- (void)startBackgroundFetchingIfNeeded
{
  id v2;

  -[PXNavigationListDataSectionManager collectionsDataSourceManager](self, "collectionsDataSourceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareBackgroundFetchingIfNeeded");
  objc_msgSend(v2, "startBackgroundFetchingIfNeeded");

}

- (void)pauseBackgroundFetching
{
  id v2;

  -[PXNavigationListDataSectionManager collectionsDataSourceManager](self, "collectionsDataSourceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pauseBackgroundFetching");

}

- (void)expandListItem:(id)a3 hintIndex:(int64_t)a4
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  PXNavigationListDataSectionManager *v14;
  SEL v15;

  v7 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PXNavigationListDataSectionManager_expandListItem_hintIndex___block_invoke;
  v12[3] = &unk_1E5131330;
  v13 = v7;
  v14 = self;
  v15 = a2;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __63__PXNavigationListDataSectionManager_expandListItem_hintIndex___block_invoke_2;
  v10[3] = &unk_1E51265A8;
  v11 = v13;
  v9 = v13;
  -[PXNavigationListDataSectionManager _requestParentForListItem:hintIndex:resultHandler:recursionHandler:](self, "_requestParentForListItem:hintIndex:resultHandler:recursionHandler:", v9, a4, v12, v10);

}

- (void)collapseListItem:(id)a3 hintIndex:(int64_t)a4
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v7 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PXNavigationListDataSectionManager_collapseListItem_hintIndex___block_invoke;
  v12[3] = &unk_1E5131330;
  v12[4] = self;
  v13 = v7;
  v14 = a2;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __65__PXNavigationListDataSectionManager_collapseListItem_hintIndex___block_invoke_2;
  v10[3] = &unk_1E51265A8;
  v11 = v13;
  v9 = v13;
  -[PXNavigationListDataSectionManager _requestParentForListItem:hintIndex:resultHandler:recursionHandler:](self, "_requestParentForListItem:hintIndex:resultHandler:recursionHandler:", v9, a4, v12, v10);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; collectionsDataSourceManager = %@>"),
                       objc_opt_class(),
                       self,
                       self->_collectionsDataSourceManager);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  v9 = a3;
  v10 = v9;
  if ((void *)ChildDataSectionManagerObservationContext == a5)
  {
    v22 = v9;
    -[NSMapTable objectForKey:](self->_parentListItems, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_childDataSectionIndexes, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v22, "changeDetailsFromPreviousDataSection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "changeDetailsShiftedBy:", objc_msgSend(v14, "integerValue") + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v11);
    goto LABEL_13;
  }
  if ((void *)CollectionsDataSourceManagerObservationContext == a5)
  {
    v22 = v9;
    -[PXNavigationListDataSectionManager collectionsDataSourceIfExisting](self, "collectionsDataSourceIfExisting");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNavigationListDataSectionManager collectionsDataSourceManager](self, "collectionsDataSourceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNavigationListDataSectionManager setCollectionsDataSource:](self, "setCollectionsDataSource:", v18);

    -[PXNavigationListDataSectionManager collectionsDataSource](self, "collectionsDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "changeDetailsFromDataSource:toDataSource:", v11, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "itemChangesInSection:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemsWithSubitemChangesInSection:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "changeDetailsByAddingChangedIndexes:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v20);

LABEL_10:
LABEL_13:

    goto LABEL_14;
  }
  if ((void *)PrivacyControllerObservationContext_102973 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListDataSectionManager.m"), 337, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 3) != 0)
  {
    v22 = v9;
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_collectionsByPrivacyControllerId, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_14:

      v10 = v22;
      goto LABEL_15;
    }
    -[PXNavigationListDataSectionManager collectionsDataSource](self, "collectionsDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathForCollection:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v14, "item"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexes:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v16);
    goto LABEL_10;
  }
LABEL_15:

}

- (BOOL)allowsEmptyDataSection
{
  return self->_allowsEmptyDataSection;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (void)setIndentationLevel:(int64_t)a3
{
  self->_indentationLevel = a3;
}

- (PXPhotoKitCollectionsDataSourceManager)collectionsDataSourceManager
{
  return self->_collectionsDataSourceManager;
}

- (void)setCollectionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsDataSource, a3);
}

- (BOOL)skipAssetCountFetches
{
  return self->_skipAssetCountFetches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionsDataSource, 0);
  objc_storeStrong((id *)&self->_collectionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_privacyControllersById, 0);
  objc_storeStrong((id *)&self->_collectionsByPrivacyControllerId, 0);
  objc_storeStrong((id *)&self->_parentListItems, 0);
  objc_storeStrong((id *)&self->_childDataSectionIndexes, 0);
  objc_storeStrong((id *)&self->_childDataSectionManagers, 0);
}

void __65__PXNavigationListDataSectionManager_collapseListItem_hintIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "unregisterChangeObserver:context:", *(_QWORD *)(a1 + 32), ChildDataSectionManagerObservationContext);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObjectForKey:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v8, "dataSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_changeDetailsForItemAtIndex:childDataSection:expanding:", a2, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "updateDataSectionWithChangeDetails:", v7);
    v4 = v8;
  }

}

uint64_t __65__PXNavigationListDataSectionManager_collapseListItem_hintIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "collapseListItem:hintIndex:", *(_QWORD *)(a1 + 32), a3);
}

void __63__PXNavigationListDataSectionManager_expandListItem_hintIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  PXNavigationListDataSectionManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "collection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (PXNavigationListDataSectionManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = -[PXNavigationListDataSectionManager initWithCollectionList:]([PXNavigationListDataSectionManager alloc], "initWithCollectionList:", v9);
      -[PXNavigationListDataSectionManager setIndentationLevel:](v4, "setIndentationLevel:", objc_msgSend(*(id *)(a1 + 40), "indentationLevel") + 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "setObject:forKey:", *(_QWORD *)(a1 + 32), v4);
      -[PXNavigationListDataSectionManager registerChangeObserver:context:](v4, "registerChangeObserver:context:", *(_QWORD *)(a1 + 40), ChildDataSectionManagerObservationContext);
      v6 = *(void **)(a1 + 40);
      -[PXDataSectionManager dataSection](v4, "dataSection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_changeDetailsForItemAtIndex:childDataSection:expanding:", a2, v7, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "updateDataSectionWithChangeDetails:", v8);
    }
    else
    {
      v4 = 0;
    }
  }

}

uint64_t __63__PXNavigationListDataSectionManager_expandListItem_hintIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "expandListItem:hintIndex:", *(_QWORD *)(a1 + 32), a3);
}

void __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 208), "keyAssetsFetchResultForCollection:fetchIfNeeded:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v4;
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v3);

}

void __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "auxiliaryObjectForKey:dataSectionObject:hintIndex:", a1[4], a1[5], a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 208), "displayableAssetsForCollectionList:maximumCount:useCache:correspondingCollections:", a1[5], 4, 1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __88__PXNavigationListDataSectionManager_auxiliaryObjectForKey_dataSectionObject_hintIndex___block_invoke_4(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "auxiliaryObjectForKey:dataSectionObject:hintIndex:", a1[4], a1[5], a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __64__PXNavigationListDataSectionManager_setAllowsEmptyDataSection___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 184) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
}

+ (id)makeCollectionsDataSourceManagerForConfiguration:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v7;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v8;
  uint64_t v9;
  void *v10;
  PXPhotoKitCollectionsDataSourceManager *v11;

  v3 = a3;
  objc_msgSend(v3, "collectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionsFetchResult");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    v7 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration initWithCollectionList:]([PXPhotoKitCollectionsDataSourceManagerConfiguration alloc], "initWithCollectionList:", v4);
LABEL_5:
    v8 = v7;
    goto LABEL_6;
  }
  if (v5)
  {
    v7 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration initWithCollectionsFetchResult:]([PXPhotoKitCollectionsDataSourceManagerConfiguration alloc], "initWithCollectionsFetchResult:", v5);
    goto LABEL_5;
  }
  v8 = 0;
LABEL_6:
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipSyndicatedAssetFetches:](v8, "setSkipSyndicatedAssetFetches:", objc_msgSend(v3, "skipSyndicatedAssetFetches"));
  if ((objc_msgSend(v3, "emptyCollectionsHidden") & 1) != 0)
  {
    v9 = -3;
  }
  else if ((objc_msgSend(v3, "showSyncedFromMacAlbums") & 1) != 0)
  {
    v9 = 0x200000;
  }
  else
  {
    if (!objc_msgSend(v4, "px_isTopLevelFolder"))
      goto LABEL_13;
    v9 = 4980738;
  }
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setCollectionTypesToInclude:](v8, "setCollectionTypesToInclude:", v9);
LABEL_13:
  if (objc_msgSend(v3, "includeUserSmartAlbums"))
    -[PXPhotoKitCollectionsDataSourceManagerConfiguration setCollectionTypesToInclude:](v8, "setCollectionTypesToInclude:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](v8, "collectionTypesToInclude") | 0x400000);
  if (objc_msgSend(v3, "hideHiddenAlbum"))
    -[PXPhotoKitCollectionsDataSourceManagerConfiguration setCollectionTypesToInclude:](v8, "setCollectionTypesToInclude:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](v8, "collectionTypesToInclude") & 0xFFFFFFFFFFFFFEFFLL);
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipKeyAssetFetches:](v8, "setSkipKeyAssetFetches:", objc_msgSend(v3, "includeKeyAssetFetches") ^ 1);
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setUpdateKeyAssetFetchesInBackground:](v8, "setUpdateKeyAssetFetchesInBackground:", objc_msgSend(v3, "includeKeyAssetFetches"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipKeyAssetFetchesForSmartAlbums:](v8, "setSkipKeyAssetFetchesForSmartAlbums:", objc_msgSend(v3, "skipKeyAssetFetchesForSmartAlbums"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipAssetFetches:](v8, "setSkipAssetFetches:", objc_msgSend(v3, "skipAssetFetches"));
  objc_msgSend(v3, "assetsFilterPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setAssetsFilterPredicate:](v8, "setAssetsFilterPredicate:", v10);

  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSimulateNonIncrementalChanges:](v8, "setSimulateNonIncrementalChanges:", objc_msgSend(v3, "simulateNonIncrementalChanges"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setPausedChangeDetailsBufferLength:](v8, "setPausedChangeDetailsBufferLength:", objc_msgSend(v3, "pausedChangeDetailsBufferLength"));
  v11 = -[PXPhotoKitCollectionsDataSourceManager initWithConfiguration:]([PXPhotoKitCollectionsDataSourceManager alloc], "initWithConfiguration:", v8);

  return v11;
}

@end
