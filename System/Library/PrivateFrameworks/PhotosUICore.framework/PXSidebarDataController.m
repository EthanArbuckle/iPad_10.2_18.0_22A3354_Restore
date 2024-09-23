@implementation PXSidebarDataController

- (PXSidebarDataController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4 sectionEnablementProvider:(id)a5
{
  return -[PXSidebarDataController initWithPhotoLibrary:libraryFilterState:sectionEnablementProvider:options:additionalAssetsFilterPredicate:pickerAllPhotosVirtualCollection:](self, "initWithPhotoLibrary:libraryFilterState:sectionEnablementProvider:options:additionalAssetsFilterPredicate:pickerAllPhotosVirtualCollection:", a3, a4, a5, 0, 0, 0);
}

- (PXSidebarDataController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4 sectionEnablementProvider:(id)a5 options:(unint64_t)a6 additionalAssetsFilterPredicate:(id)a7 pickerAllPhotosVirtualCollection:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PXSidebarDataController *v19;
  PXSidebarDataController *v20;
  uint64_t v21;
  PXPhotoLibraryLocalDefaults *localDefaults;
  uint64_t v23;
  NSMutableDictionary *dataSectionManagers;
  uint64_t v25;
  NSMutableDictionary *dataSectionObjects;
  uint64_t v27;
  NSMapTable *requestDetailsBySidebarImageRequestID;
  void *v29;
  uint64_t v30;
  NSArray *arrangedObjectIdentifiers;
  id v32;
  PXSidebarDataContext *v33;
  PXSidebarDataContext *context;
  void *v35;
  PXOutlineDataSectionManager *v36;
  PXOutlineDataSectionManager *rootDataSectionManager;
  id v39;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v39 = a8;
  v40.receiver = self;
  v40.super_class = (Class)PXSidebarDataController;
  v19 = -[PXSidebarDataController init](&v40, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_photoLibrary, a3);
    objc_storeStrong((id *)&v20->_libraryFilterState, a4);
    v20->_options = a6;
    objc_storeStrong((id *)&v20->_assetsFilterPredicate, a7);
    objc_storeStrong((id *)&v20->_pickerAllPhotosVirtualCollection, a8);
    objc_msgSend(v15, "px_localDefaults");
    v21 = objc_claimAutoreleasedReturnValue();
    localDefaults = v20->_localDefaults;
    v20->_localDefaults = (PXPhotoLibraryLocalDefaults *)v21;

    v23 = objc_opt_new();
    dataSectionManagers = v20->_dataSectionManagers;
    v20->_dataSectionManagers = (NSMutableDictionary *)v23;

    v25 = objc_opt_new();
    dataSectionObjects = v20->_dataSectionObjects;
    v20->_dataSectionObjects = (NSMutableDictionary *)v25;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v27 = objc_claimAutoreleasedReturnValue();
    requestDetailsBySidebarImageRequestID = v20->_requestDetailsBySidebarImageRequestID;
    v20->_requestDetailsBySidebarImageRequestID = (NSMapTable *)v27;

    -[PXPhotoLibraryLocalDefaults arrayForKey:](v20->_localDefaults, "arrayForKey:", CFSTR("ArrangedSidebarSectionIdentifiers"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    PXFilterArrayForObjectsOfClass();
    v30 = objc_claimAutoreleasedReturnValue();
    arrangedObjectIdentifiers = v20->_arrangedObjectIdentifiers;
    v20->_arrangedObjectIdentifiers = (NSArray *)v30;

    v32 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v32, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v32, "setQualityOfService:", 25);
    objc_msgSend(v32, "setName:", CFSTR("PXSidebarDataController.workQueue"));
    v33 = -[PXSidebarDataContext initWithLibraryFilterState:workQueue:enablementProvider:assetsFilterPredicate:]([PXSidebarDataContext alloc], "initWithLibraryFilterState:workQueue:enablementProvider:assetsFilterPredicate:", v16, v32, v17, v18);
    context = v20->_context;
    v20->_context = v33;

    -[PXSidebarDataController makeSectionManagers](v20, "makeSectionManagers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[PXDataSectionManager initWithChildDataSectionManagers:]([PXOutlineDataSectionManager alloc], "initWithChildDataSectionManagers:", v35);
    rootDataSectionManager = v20->_rootDataSectionManager;
    v20->_rootDataSectionManager = v36;

    -[PXOutlineDataSectionManager registerChangeObserver:context:](v20->_rootDataSectionManager, "registerChangeObserver:context:", v20, PXDataSectionManagerChangeContext);
    -[PXOutlineDataSectionManager setDelegate:](v20->_rootDataSectionManager, "setDelegate:", v20);

  }
  return v20;
}

- (PXDataSectionManager)mediaTypesSectionManager
{
  PXDataSectionManager **p_mediaTypesSectionManager;
  PXDataSectionManager *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  p_mediaTypesSectionManager = &self->_mediaTypesSectionManager;
  v4 = self->_mediaTypesSectionManager;
  if (!v4)
  {
    PLSidebarGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);
    v7 = v5;
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PXSidebarDataController.mediaTypesSectionManager", ", buf, 2u);
    }

    -[PXSidebarDataController photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_virtualCollections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaTypesCollectionList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXNavigationListItemWithObject(v11, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSidebarDataController _childDataSectionManagerForListItem:](self, "_childDataSectionManagerForListItem:", v12);
    v4 = (PXDataSectionManager *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_mediaTypesSectionManager, v4);
    v13 = v8;
    v14 = v13;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_END, v6, "PXSidebarDataController.mediaTypesSectionManager", ", v16, 2u);
    }

  }
  return v4;
}

- (PXNavigationListItemDataSectionManager)mediaTypesItemManager
{
  PXNavigationListItemDataSectionManager **p_mediaTypesItemManager;
  PXNavigationListItemDataSectionManager *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  p_mediaTypesItemManager = &self->_mediaTypesItemManager;
  v4 = self->_mediaTypesItemManager;
  if (!v4)
  {
    PLSidebarGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);
    v7 = v5;
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PXSidebarDataController.mediaTypesItemManager", ", buf, 2u);
    }

    v9 = (void *)objc_opt_class();
    -[PXSidebarDataController photoLibrary](self, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_virtualCollections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaTypesCollectionList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSidebarDataController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSectionManagerForCollection:context:", v12, v13);
    v4 = (PXNavigationListItemDataSectionManager *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_mediaTypesItemManager, v4);
    v14 = v8;
    v15 = v14;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_END, v6, "PXSidebarDataController.mediaTypesItemManager", ", v17, 2u);
    }

    -[PXSidebarDataController _updateMediaTypesItemManager](self, "_updateMediaTypesItemManager");
  }
  return v4;
}

- (id)makeSectionManagers
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  -[PXSidebarDataController photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSidebarDataController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  v7 = (void *)objc_opt_class();
  if (v5)
  {
    objc_msgSend(v7, "libraryDataSectionManagerForLibrary:context:", v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

    objc_msgSend((id)objc_opt_class(), "devicesDataSectionManagerForLibrary:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

    v10 = (void *)objc_opt_class();
    -[PXSidebarDataController mediaTypesItemManager](self, "mediaTypesItemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionsDataSectionManagerForLibrary:mediaTypesItemManager:context:", v3, v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

    objc_msgSend((id)objc_opt_class(), "sharingDataSectionManagerForLibrary:context:", v3, v4);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "photosDataSectionManagerForLibrary:context:", v3, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

    if ((-[PXSidebarDataController options](self, "options") & 4) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "devicesDataSectionManagerForLibrary:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v15);

    }
    v16 = (void *)objc_opt_class();
    -[PXSidebarDataController mediaTypesItemManager](self, "mediaTypesItemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "albumsDataSectionManagerForLibrary:mediaTypesItemManager:context:", v3, v17, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

    objc_msgSend((id)objc_opt_class(), "projectsDataSectionManagerForLibrary:context:", v3, v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v19);

    objc_msgSend((id)objc_opt_class(), "prototypesDataSectionManagerForLibrary:context:", v3, v4);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v13;
  objc_msgSend(v6, "addObject:", v13);

  v21 = (void *)objc_msgSend(v6, "copy");
  return v21;
}

- (PXSidebarDataController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPhotoLibrary_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSidebarDataController.m"), 416, CFSTR("Use the designated initializer %@"), v5);

  return 0;
}

- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4
{
  -[PXDataSectionManager setChangeProcessingPaused:forReason:](self->_rootDataSectionManager, "setChangeProcessingPaused:forReason:", a3, a4);
}

- (id)beginRequestForMediaProvider:(id)a3 mediaRequestIDs:(id)a4
{
  id v6;
  id v7;
  PXSidebarImageRequestDetails *v8;
  NSMapTable *requestDetailsBySidebarImageRequestID;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[PXSidebarImageRequestDetails initWithMediaProvider:mediaRequestIDs:]([PXSidebarImageRequestDetails alloc], "initWithMediaProvider:mediaRequestIDs:", v7, v6);

  requestDetailsBySidebarImageRequestID = self->_requestDetailsBySidebarImageRequestID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXSidebarImageRequestDetails sidebarRequestID](v8, "sidebarRequestID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](requestDetailsBySidebarImageRequestID, "setObject:forKey:", v8, v10);

  return v8;
}

- (void)cancelRequestDetails:(id)a3
{
  NSMapTable *requestDetailsBySidebarImageRequestID;
  void *v4;
  void *v5;
  id v6;

  requestDetailsBySidebarImageRequestID = self->_requestDetailsBySidebarImageRequestID;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "sidebarRequestID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](requestDetailsBySidebarImageRequestID, "removeObjectForKey:", v5);

  objc_msgSend(v6, "cancel");
}

- (void)_setDataSectionManager:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *dataSectionManagers;
  id v7;

  dataSectionManagers = self->_dataSectionManagers;
  v7 = a3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](dataSectionManagers, "setObject:forKeyedSubscript:", v7, a4);
  objc_msgSend(v7, "registerChangeObserver:context:", self, PXDataSectionManagerChangeContext);

}

- (void)_removeDataSectionManagerForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSectionManagers, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataSectionManagers, "setObject:forKeyedSubscript:", 0, v5);
    objc_msgSend(v4, "unregisterChangeObserver:context:", self, PXDataSectionManagerChangeContext);
  }

}

- (void)_updateDataSectionForRemovedItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PXMediaTypesVirtualCollection")) & 1) == 0)
        {
          -[PXSidebarDataController _removeDataSectionManagerForKey:](self, "_removeDataSectionManagerForKey:", v9);
          -[NSMutableDictionary removeObjectForKey:](self->_dataSectionObjects, "removeObjectForKey:", v9);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_updateMediaTypesItemManager
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  PXNavigationListItemDataSectionManager *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  PLSidebarGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PXSidebarDataController._updateMediaTypesItemManager", ", buf, 2u);
  }

  v7 = self->_mediaTypesItemManager;
  if (v7)
  {
    -[PXSidebarDataController mediaTypesSectionManager](self, "mediaTypesSectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "allowsEmptyDataSection") & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(v8, "isDataSectionEmpty") ^ 1;
    -[PXNavigationListItemDataSectionManager setEnabled:](v7, "setEnabled:", v9);

  }
  v10 = v6;
  v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_END, v4, "PXSidebarDataController._updateMediaTypesItemManager", ", v12, 2u);
  }

}

- (id)_childDataSectionManagerForListItem:(id)a3
{
  id v4;
  void *v5;
  PXStackedDataSectionManager *v6;
  void *v7;
  PXNavigationListItemDataSectionManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXNavigationListItemDataSectionManager *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PXNavigationListDataSectionManager *v19;
  PXStackedDataSectionManager *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  PXNavigationListDataSectionManager *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  void *v41;
  PXStackedDataSectionManager *v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSectionManagers, "objectForKeyedSubscript:", v5);
  v6 = (PXStackedDataSectionManager *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (!objc_msgSend(v4, "isExpandable")
      || (-[PXOutlineDataSectionManager childDataSectionManagerForOutlineObject:](self->_rootDataSectionManager, "childDataSectionManagerForOutlineObject:", v4), v6 = (PXStackedDataSectionManager *)objc_claimAutoreleasedReturnValue(), -[PXSidebarDataController _setDataSectionManager:forKey:](self, "_setDataSectionManager:forKey:", v6, v5), !v6))
    {
      objc_msgSend(v4, "collection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "px_isSharedAlbumsAndActivityFolder"))
        goto LABEL_19;
      v8 = [PXNavigationListItemDataSectionManager alloc];
      -[PXSidebarDataController photoLibrary](self, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_virtualCollections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sharedActivityCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSidebarDataController context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PXNavigationListItemDataSectionManager initWithCollection:context:](v8, "initWithCollection:context:", v11, v12);

      -[PXSidebarDataController photoLibrary](self, "photoLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_virtualCollections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sharedAlbumsCollectionList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      +[PXNavigationListDataSectionConfiguration configurationWithCollectionList:](PXNavigationListDataSectionConfiguration, "configurationWithCollectionList:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setIncludeKeyAssetFetches:", 1);
      objc_msgSend(v17, "setSkipAssetFetches:", 1);
      objc_msgSend(v17, "setSkipAssetCountFetches:", 1);
      -[PXSidebarDataController assetsFilterPredicate](self, "assetsFilterPredicate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAssetsFilterPredicate:", v18);

      v19 = -[PXNavigationListDataSectionManager initWithConfiguration:]([PXNavigationListDataSectionManager alloc], "initWithConfiguration:", v17);
      -[PXNavigationListDataSectionManager startBackgroundFetchingIfNeeded](v19, "startBackgroundFetchingIfNeeded");
      v20 = [PXStackedDataSectionManager alloc];
      v43[0] = v13;
      v43[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PXStackedDataSectionManager initWithChildDataSectionManagers:](v20, "initWithChildDataSectionManagers:", v21);

      PXNavigationListItemWithObject(v7, 0x7FFFFFFFFFFFFFFFLL, 0, 1, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDataSectionManager setOutlineObject:](v6, "setOutlineObject:", v22);

      if (!v6)
      {
LABEL_19:
        if (!objc_msgSend(v7, "px_isUtilitiesFolder"))
          goto LABEL_8;
        v23 = (void *)objc_opt_class();
        -[PXSidebarDataController photoLibrary](self, "photoLibrary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSidebarDataController context](self, "context");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "utilitiesDataSectionManagerForLibrary:context:", v24, v25);
        v6 = (PXStackedDataSectionManager *)objc_claimAutoreleasedReturnValue();

        -[PXDataSectionManager setOutlineObject:](v6, "setOutlineObject:", v4);
        if (!v6)
        {
LABEL_8:
          if (!objc_msgSend(v7, "canContainCollections"))
          {
            v6 = 0;
            goto LABEL_15;
          }
          if (objc_msgSend(v7, "px_isProjectsFolder"))
          {
            -[PXSidebarDataController libraryFilterState](self, "libraryFilterState");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "viewMode");

            if (v27)
            {
              v28 = (void *)MEMORY[0x1E0CD14E0];
              objc_msgSend(v7, "localizedTitle");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[PXSidebarDataController photoLibrary](self, "photoLibrary");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "transientCollectionListWithCollections:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], v29, 0, v30);
              v31 = objc_claimAutoreleasedReturnValue();

              v7 = (void *)v31;
            }
          }
          +[PXNavigationListDataSectionConfiguration configurationWithCollectionList:](PXNavigationListDataSectionConfiguration, "configurationWithCollectionList:", v7);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v7, "px_isMediaTypesFolder") ^ 1;
          -[PXSidebarDataController assetsFilterPredicate](self, "assetsFilterPredicate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setAssetsFilterPredicate:", v34);

          objc_msgSend(v32, "setEmptyCollectionsHidden:", -[PXSidebarDataController options](self, "options") & 1);
          objc_msgSend(v32, "setIncludeKeyAssetFetches:", v33);
          objc_msgSend(v32, "setIncludeUserSmartAlbums:", 1);
          objc_msgSend(v32, "setEmptyCollectionsHidden:", objc_msgSend(v7, "px_isMediaTypesFolder"));
          objc_msgSend(v32, "setSkipKeyAssetFetchesForSmartAlbums:", 1);
          objc_msgSend(v32, "setSkipAssetFetches:", 1);
          objc_msgSend(v32, "setSkipAssetCountFetches:", 1);
          v35 = -[PXNavigationListDataSectionManager initWithConfiguration:]([PXNavigationListDataSectionManager alloc], "initWithConfiguration:", v32);
          -[PXDataSectionManager setOutlineObject:](v35, "setOutlineObject:", v4);
          +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = MEMORY[0x1E0C809B0];
          v39 = 3221225472;
          v40 = __63__PXSidebarDataController__childDataSectionManagerForListItem___block_invoke;
          v41 = &unk_1E5149198;
          v6 = v35;
          v42 = v6;
          objc_msgSend(v36, "scheduleTaskAfterCATransactionCommits:", &v38);

          if (!v6)
            goto LABEL_15;
        }
      }
      -[PXSidebarDataController _setDataSectionManager:forKey:](self, "_setDataSectionManager:forKey:", v6, v5, v38, v39, v40, v41);
LABEL_15:

    }
  }

  return v6;
}

- (int64_t)numberOfChildrenOfItem:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXSidebarDataController childDataSectionForItem:](self, "childDataSectionForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)child:(int64_t)a3 ofItem:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PXSidebarDataController childDataSectionForItem:](self, "childDataSectionForItem:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataSectionObjects, "setObject:forKeyedSubscript:", v7, v8);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSectionManagers, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOutlineObject:", v7);

  }
  return v7;
}

- (id)childrenOfListItem:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXSidebarDataController childDataSectionForItem:](self, "childDataSectionForItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v4, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataSectionObjects, "setObject:forKeyedSubscript:", v9, v10);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSectionManagers, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setOutlineObject:", v9);

      }
      objc_msgSend(v7, "addObject:", v9);

    }
    if (v6 != objc_msgSend(v7, "count"))
    {
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "%@ contains duplicate items", (uint8_t *)&v15, 0xCu);
      }

    }
    objc_msgSend(v7, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (id)itemForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dataSectionObjects, "objectForKeyedSubscript:", a3);
}

- (BOOL)moveGroupItem:(id)a3 afterGroupItem:(id)a4
{
  id v6;
  NSArray *arrangedObjectIdentifiers;
  void *v8;
  NSArray *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;

  v6 = a4;
  arrangedObjectIdentifiers = self->_arrangedObjectIdentifiers;
  objc_msgSend(a3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray indexOfObject:](arrangedObjectIdentifiers, "indexOfObject:", v8);

  if (v6)
  {
    v9 = self->_arrangedObjectIdentifiers;
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray indexOfObject:](v9, "indexOfObject:", v10);

  }
  PXArrayByMovingObjectFromIndexToIndex();
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[PXSidebarDataController localDefaults](self, "localDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setArray:forKey:", v11, CFSTR("ArrangedSidebarSectionIdentifiers"));

  v13 = self->_arrangedObjectIdentifiers;
  self->_arrangedObjectIdentifiers = v11;
  v14 = v11;

  -[PXOutlineDataSectionManager rearrangeSectionContent](self->_rootDataSectionManager, "rearrangeSectionContent");
  return 1;
}

- (void)setExpanded:(BOOL)a3 forItem:(id)a4
{
  _BOOL4 v4;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  v6 = objc_msgSend(v10, "isGroup");
  -[PXSidebarDataController localDefaults](self, "localDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v9 = CFSTR("ExpandedSidebarItemIdentifiers");
    if (!v4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v7, "addIdentifier:forKey:", v8, v9);
    goto LABEL_6;
  }
  v9 = CFSTR("CollapsedSidebarSectionIdentifiers");
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "removeIdentifier:forKey:", v8, v9);
LABEL_6:

}

- (void)didNavigateToListItem:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "px_isSharedLibrarySharingSuggestionsSmartAlbum"))
  {
    objc_msgSend(v5, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_sharedLibrarySharingSuggestionsCountsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markAnyNotificationsAsRead");

  }
}

- (void)markListItemAsRead:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "px_isSharedLibrarySharingSuggestionsSmartAlbum"))
  {
    objc_msgSend(v5, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_sharedLibrarySharingSuggestionsCountsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markAllSuggestionsAsRead");

  }
}

- (id)infoForItem:(id)a3 childIndex:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PXSidebarItemChildInfo *v12;
  int64_t v14;

  v6 = a3;
  -[PXSidebarDataController childDataSectionForItem:](self, "childDataSectionForItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = objc_msgSend(v8, "indexOfChildDataSourceForObjectAtIndex:localIndex:", a4, &v14);
    v7 = v8;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9;
      objc_msgSend(v8, "childDataSections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      a4 = v14;
    }

  }
  v12 = -[PXSidebarItemChildInfo initWithListItem:dataSection:childIndex:]([PXSidebarItemChildInfo alloc], "initWithListItem:dataSection:childIndex:", v6, v7, a4);

  return v12;
}

- (int64_t)requestImageForItem:(id)a3 parentItem:(id)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD, id, id))a5 + 2))(a5, 0, a3, a4);
  return 0;
}

- (void)cancelImageRequest:(int64_t)a3
{
  NSMapTable *requestDetailsBySidebarImageRequestID;
  void *v5;
  void *v6;
  id v7;

  requestDetailsBySidebarImageRequestID = self->_requestDetailsBySidebarImageRequestID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](requestDetailsBySidebarImageRequestID, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[PXSidebarDataController cancelRequestDetails:](self, "cancelRequestDetails:", v7);
    v6 = v7;
  }

}

- (id)childDataSectionForItem:(id)a3
{
  PXOutlineDataSectionManager *v3;
  PXOutlineDataSectionManager *v4;
  void *v5;

  if (a3)
  {
    -[PXSidebarDataController _childDataSectionManagerForListItem:](self, "_childDataSectionManagerForListItem:");
    v3 = (PXOutlineDataSectionManager *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_rootDataSectionManager;
  }
  v4 = v3;
  -[PXDataSectionManager dataSection](v3, "dataSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataSectionManagerForItem:(id)a3
{
  NSMutableDictionary *dataSectionManagers;
  void *v4;
  void *v5;

  dataSectionManagers = self->_dataSectionManagers;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](dataSectionManagers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isItemExpanded:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  if (objc_msgSend(v4, "isExpandable"))
  {
    v5 = objc_msgSend(v4, "isGroup");
    -[PXSidebarDataController localDefaults](self, "localDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v6, "identifiersForKey:", CFSTR("CollapsedSidebarSectionIdentifiers"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "containsObject:", v9) ^ 1;
    }
    else
    {
      objc_msgSend(v6, "identifiersForKey:", CFSTR("ExpandedSidebarItemIdentifiers"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_msgSend(v8, "containsObject:", v9);
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)fetchCollectionsInDisplayCollectionList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "px_isUtilitiesFolder"))
  {
    v5 = (void *)objc_opt_class();
    -[PXSidebarDataController photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSidebarDataController context](self, "context");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "utilitiesDataSectionManagerForLibrary:context:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_7;
    }
    v7 = v4;
    objc_msgSend(v7, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setIncludeUserSmartAlbums:", 1);
    objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v9;
}

- (id)outlineDataSectionManager:(id)a3 arrangedSectionContent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id *location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);
        objc_msgSend(v7, "addObject:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  location = (id *)&self->_arrangedObjectIdentifiers;
  v16 = self->_arrangedObjectIdentifiers;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKeyedSubscript:", v21);
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          objc_msgSend(v6, "removeAllObjects");
          goto LABEL_18;
        }
        v23 = (void *)v22;
        objc_msgSend(v6, "addObject:", v22);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v21);

      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_18:

  if (!*location || objc_msgSend(v8, "count"))
    objc_storeStrong(location, v7);
  if (objc_msgSend(v6, "count"))
    v24 = v6;
  else
    v24 = v9;
  v25 = v24;

  return v25;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  PXDataSectionManager *v7;
  void *v8;
  void *v9;
  void *v10;
  PXSidebarItemChangeDetails *v11;
  void *v12;
  void *v13;
  PXDataSectionManager *v14;

  v7 = (PXDataSectionManager *)a3;
  if ((void *)PXDataSectionManagerChangeContext == a5)
  {
    v14 = v7;
    -[PXDataSectionManager outlineObject](v7, "outlineObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDataSectionManager previousDataSection](v14, "previousDataSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDataSectionManager changeDetailsFromPreviousDataSection](v14, "changeDetailsFromPreviousDataSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXSidebarItemChangeDetails initWithArrayChangeDetails:previousDataSection:]([PXSidebarItemChangeDetails alloc], "initWithArrayChangeDetails:previousDataSection:", v10, v9);
    -[PXSidebarItemChangeDetails removedItems](v11, "removedItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSidebarDataController _updateDataSectionForRemovedItems:](self, "_updateDataSectionForRemovedItems:", v12);

    -[PXSidebarDataController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sidebarDataSourceController:didChangeChildrenOfItem:changeDetails:", self, v8, v11);

    if (self->_mediaTypesSectionManager == v14)
      -[PXSidebarDataController _updateMediaTypesItemManager](self, "_updateMediaTypesItemManager");

    v7 = v14;
  }

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (PHAssetCollection)pickerAllPhotosVirtualCollection
{
  return self->_pickerAllPhotosVirtualCollection;
}

- (PXSidebarDataSourceControllerDelegate)delegate
{
  return (PXSidebarDataSourceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXPhotoLibraryLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (NSMapTable)requestDetailsBySidebarImageRequestID
{
  return self->_requestDetailsBySidebarImageRequestID;
}

- (void)setRequestDetailsBySidebarImageRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestDetailsBySidebarImageRequestID, a3);
}

- (PXSidebarDataContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_requestDetailsBySidebarImageRequestID, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pickerAllPhotosVirtualCollection, 0);
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_mediaTypesItemManager, 0);
  objc_storeStrong((id *)&self->_mediaTypesSectionManager, 0);
  objc_storeStrong((id *)&self->_arrangedObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataSectionObjects, 0);
  objc_storeStrong((id *)&self->_dataSectionManagers, 0);
  objc_storeStrong((id *)&self->_rootDataSectionManager, 0);
}

uint64_t __63__PXSidebarDataController__childDataSectionManagerForListItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startBackgroundFetchingIfNeeded");
}

+ (id)dataSectionManagerForCollection:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  PXNavigationListItemDataSectionManager *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PXNavigationListItemDataSectionManager initWithCollection:context:]([PXNavigationListItemDataSectionManager alloc], "initWithCollection:context:", v6, v5);

  return v7;
}

+ (id)dataSectionManagerForTransientCollection:(id)a3 context:(id)a4
{
  void *v4;

  objc_msgSend(a1, "dataSectionManagerForCollection:context:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHiddenWhenEmpty:", 1);
  return v4;
}

+ (id)dataSectionManagerForCollection:(id)a3 context:(id)a4 enablementItem:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enablementProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "configureEnablementOfSectionManager:enablementItem:", v9, a5);
  return v9;
}

+ (id)favoritesDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 203);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHiddenWhenEmpty:", 1);
  return v8;
}

+ (id)recentlySavedDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000218);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHiddenWhenEmpty:", 1);
  return v8;
}

+ (id)unableToUploadDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 216);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHiddenWhenEmpty:", 1);
  return v8;
}

+ (id)dataSectionManagerForUtilityCollectionType:(unsigned __int16)a3 photoLibrary:(id)a4 context:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v8 = a5;
  objc_msgSend(a4, "px_utilityCollectionWithType:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setHiddenWhenEmpty:", 1);
  return v10;
}

+ (id)sharedLibrarySuggestionsDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000214);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enablementProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "configureEnablementOfSectionManager:enablementItem:", v8, 19);
  objc_msgSend(v8, "setHiddenWhenEmpty:", 1);

  return v8;
}

+ (id)allDuplicatesDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000212);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v7, v6, 26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHiddenWhenEmpty:", 1);
  return v8;
}

+ (id)hiddenDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 205);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v7, v6, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHiddenWhenEmpty:", 0);
  return v8;
}

+ (id)recoveredDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000219);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enablementProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "configureEnablementOfSectionManager:enablementItem:", v8, 7);
  objc_msgSend(v8, "setHiddenWhenEmpty:", 1);

  return v8;
}

+ (id)trashDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000201);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enablementProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "configureEnablementOfSectionManager:enablementItem:", v8, 5);
  objc_msgSend(v8, "setHiddenWhenEmpty:", 0);

  return v8;
}

+ (id)photosDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXStackedDataSectionManager *v17;
  PXNavigationListGroupItem *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PXStackedDataSectionManager *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[18];

  v39[16] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "px_virtualCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = [PXStackedDataSectionManager alloc];
  objc_msgSend(v8, "photosCollection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v38, v6, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v37;
  objc_msgSend(v8, "momentsCollection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v36, v6, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v35;
  objc_msgSend(a1, "sharedLibrarySuggestionsDataSectionManagerForLibrary:context:", v7, v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v34;
  objc_msgSend(v8, "memoriesCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v33, v6, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v32;
  objc_msgSend(v8, "contentSyndicationCollection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v31, v6, 20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v30;
  objc_msgSend(v8, "peopleCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v28, v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v27;
  objc_msgSend(v7, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000203);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v26, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v25;
  objc_msgSend(a1, "favoritesDataSectionManagerForLibrary:context:", v7, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v24;
  objc_msgSend(v7, "px_assetCollectionForSmartAlbumWithSubtype:", 209);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v23, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v22;
  objc_msgSend(v8, "completeMyMomentCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v21, v6, 18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v20;
  objc_msgSend(v8, "importHistoryCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v10;
  objc_msgSend(a1, "allDuplicatesDataSectionManagerForLibrary:context:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v11;
  objc_msgSend(a1, "unableToUploadDataSectionManagerForLibrary:context:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v12;
  objc_msgSend(a1, "hiddenDataSectionManagerForLibrary:context:", v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v13;
  objc_msgSend(a1, "trashDataSectionManagerForLibrary:context:", v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v14;
  objc_msgSend(a1, "recoveredDataSectionManagerForLibrary:context:", v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v39[15] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 16);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXStackedDataSectionManager initWithChildDataSectionManagers:](v29, "initWithChildDataSectionManagers:", v16);

  v18 = -[PXNavigationListGroupItem initWithIdentifier:]([PXNavigationListGroupItem alloc], "initWithIdentifier:", CFSTR("PXNavigationListGroupItemTypePhotos"));
  -[PXDataSectionManager setOutlineObject:](v17, "setOutlineObject:", v18);

  return v17;
}

+ (id)libraryDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PXStackedDataSectionManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXStackedDataSectionManager *v17;
  PXNavigationListGroupItem *v18;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "px_virtualCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PXStackedDataSectionManager alloc];
  objc_msgSend(v8, "photosCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  objc_msgSend(a1, "favoritesDataSectionManagerForLibrary:context:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(a1, "recentlySavedDataSectionManagerForLibrary:context:", v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20[2] = v13;
  objc_msgSend(v8, "mapCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v14, v6, 21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXStackedDataSectionManager initWithChildDataSectionManagers:](v9, "initWithChildDataSectionManagers:", v16);

  v18 = -[PXNavigationListGroupItem initWithIdentifier:]([PXNavigationListGroupItem alloc], "initWithIdentifier:", CFSTR("PXNavigationListGroupItemTypePhotos"));
  -[PXDataSectionManager setOutlineObject:](v17, "setOutlineObject:", v18);

  return v17;
}

+ (id)sharingDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PXStackedDataSectionManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXStackedDataSectionManager *v17;
  PXNavigationListGroupItem *v18;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "px_virtualCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PXStackedDataSectionManager alloc];
  objc_msgSend(v8, "sharedAlbumsAndActivityCollectionList");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v20, v6, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend(v8, "contentSyndicationCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v11, v6, 20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(v8, "completeMyMomentCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v13, v6, 18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  objc_msgSend(a1, "sharedLibrarySuggestionsDataSectionManagerForLibrary:context:", v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXStackedDataSectionManager initWithChildDataSectionManagers:](v9, "initWithChildDataSectionManagers:", v16);

  v18 = -[PXNavigationListGroupItem initWithIdentifier:]([PXNavigationListGroupItem alloc], "initWithIdentifier:", CFSTR("PXNavigationListGroupItemTypeSharing"));
  -[PXDataSectionManager setOutlineObject:](v17, "setOutlineObject:", v18);

  return v17;
}

+ (id)collectionsDataSectionManagerForLibrary:(id)a3 mediaTypesItemManager:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXStackedDataSectionManager *v18;
  PXNavigationListGroupItem *v19;
  PXNavigationListGroupItem *v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  PXStackedDataSectionManager *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[12];

  v35[10] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v25 = a4;
  objc_msgSend(a3, "px_virtualCollections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = [PXStackedDataSectionManager alloc];
  objc_msgSend(v9, "featuredCollection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v34, v8, 10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v33;
  objc_msgSend(v9, "eventsCollection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v32, v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v31;
  objc_msgSend(v9, "peopleCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v30, v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v29;
  objc_msgSend(v9, "memoriesCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v28, v8, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v26;
  objc_msgSend(v9, "tripsCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v24, v8, 12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v23;
  objc_msgSend(v9, "featuredPhotosCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:enablementItem:", v22, v8, 15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v10;
  objc_msgSend(v9, "rootAlbumCollectionList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v12;
  v35[7] = v25;
  objc_msgSend(v9, "utilitiesCollectionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v14;
  objc_msgSend(v9, "rootProjectCollectionList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v35[9] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXStackedDataSectionManager initWithChildDataSectionManagers:](v27, "initWithChildDataSectionManagers:", v17);

  v19 = [PXNavigationListGroupItem alloc];
  v20 = -[PXNavigationListGroupItem initWithIdentifier:](v19, "initWithIdentifier:", CFSTR("PXNavigationListGroupItemTypeCollections"));
  -[PXDataSectionManager setOutlineObject:](v18, "setOutlineObject:", v20);

  return v18;
}

+ (id)utilitiesDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
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
  PXStackedDataSectionManager *v18;
  PXNavigationListGroupItem *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[16];

  v32[14] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "px_virtualCollections");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unableToUploadDataSectionManagerForLibrary:context:", v7, v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v31;
  objc_msgSend(a1, "hiddenDataSectionManagerForLibrary:context:", v7, v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v30;
  objc_msgSend(a1, "trashDataSectionManagerForLibrary:context:", v7, v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v29;
  objc_msgSend(a1, "recoveredDataSectionManagerForLibrary:context:", v7, v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v28;
  objc_msgSend(a1, "allDuplicatesDataSectionManagerForLibrary:context:", v7, v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v27;
  objc_msgSend(a1, "dataSectionManagerForUtilityCollectionType:photoLibrary:context:", 2, v7, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v25;
  objc_msgSend(a1, "dataSectionManagerForUtilityCollectionType:photoLibrary:context:", 4, v7, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v24;
  objc_msgSend(a1, "dataSectionManagerForUtilityCollectionType:photoLibrary:context:", 3, v7, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v23;
  objc_msgSend(a1, "recentlySavedDataSectionManagerForLibrary:context:", v7, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v22;
  objc_msgSend(v26, "recentlyViewedCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForTransientCollection:context:", v21, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v8;
  objc_msgSend(v26, "recentlyEditedCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForTransientCollection:context:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v10;
  objc_msgSend(v26, "recentlySharedCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForTransientCollection:context:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[11] = v12;
  objc_msgSend(a1, "dataSectionManagerForUtilityCollectionType:photoLibrary:context:", 1, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[12] = v13;
  objc_msgSend(v7, "px_virtualCollections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "importHistoryCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v15, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v32[13] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[PXStackedDataSectionManager initWithChildDataSectionManagers:]([PXStackedDataSectionManager alloc], "initWithChildDataSectionManagers:", v17);
  v19 = -[PXNavigationListGroupItem initWithIdentifier:]([PXNavigationListGroupItem alloc], "initWithIdentifier:", CFSTR("PXNavigationListGroupItemTypeOtherAlbums"));
  -[PXDataSectionManager setOutlineObject:](v18, "setOutlineObject:", v19);

  return v18;
}

+ (id)devicesDataSectionManagerForLibrary:(id)a3
{
  id v3;
  PXImportSourceDataSectionManager *v4;
  PXNavigationListGroupItem *v5;

  v3 = a3;
  v4 = -[PXImportSourceDataSectionManager initWithPhotoLibrary:]([PXImportSourceDataSectionManager alloc], "initWithPhotoLibrary:", v3);

  v5 = -[PXNavigationListGroupItem initWithIdentifier:]([PXNavigationListGroupItem alloc], "initWithIdentifier:", CFSTR("PXNavigationListGroupItemTypeDevices"));
  -[PXDataSectionManager setOutlineObject:](v4, "setOutlineObject:", v5);

  return v4;
}

+ (id)albumsDataSectionManagerForLibrary:(id)a3 mediaTypesItemManager:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXStackedDataSectionManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PXStackedDataSectionManager *v20;
  PXNavigationListGroupItem *v21;
  PXNavigationListGroupItem *v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "px_virtualCollections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedAlbumsAndActivityCollectionList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "enablementProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configureEnablementOfSectionManager:enablementItem:", v13, 9);

  v15 = [PXStackedDataSectionManager alloc];
  objc_msgSend(v10, "px_virtualCollections", v9, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "rootAlbumCollectionList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v17, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PXStackedDataSectionManager initWithChildDataSectionManagers:](v15, "initWithChildDataSectionManagers:", v19);

  v21 = [PXNavigationListGroupItem alloc];
  v22 = -[PXNavigationListGroupItem initWithIdentifier:](v21, "initWithIdentifier:", CFSTR("PXNavigationListGroupItemTypeAlbums"));
  -[PXDataSectionManager setOutlineObject:](v20, "setOutlineObject:", v22);

  return v20;
}

+ (id)projectsDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  PXStackedDataSectionManager *v9;
  void *v10;
  void *v11;
  PXStackedDataSectionManager *v12;
  PXNavigationListGroupItem *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "px_virtualCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootProjectCollectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PXStackedDataSectionManager alloc];
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXStackedDataSectionManager initWithChildDataSectionManagers:](v9, "initWithChildDataSectionManagers:", v11);

  v13 = -[PXNavigationListGroupItem initWithIdentifier:]([PXNavigationListGroupItem alloc], "initWithIdentifier:", CFSTR("PXNavigationListGroupItemTypeProjects"));
  -[PXDataSectionManager setOutlineObject:](v12, "setOutlineObject:", v13);

  return v12;
}

+ (id)prototypesDataSectionManagerForLibrary:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PXStackedDataSectionManager *v10;
  void *v11;
  PXStackedDataSectionManager *v12;
  PXNavigationListGroupItem *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000206);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSectionManagerForCollection:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHiddenWhenEmpty:", 1);
  objc_msgSend(v6, "enablementProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "configureEnablementOfSectionManager:enablementItem:", v8, 6);
  v10 = [PXStackedDataSectionManager alloc];
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXStackedDataSectionManager initWithChildDataSectionManagers:](v10, "initWithChildDataSectionManagers:", v11);

  v13 = -[PXNavigationListGroupItem initWithIdentifier:]([PXNavigationListGroupItem alloc], "initWithIdentifier:", CFSTR("PXNavigationListGroupItemTypePrototypes"));
  -[PXDataSectionManager setOutlineObject:](v12, "setOutlineObject:", v13);

  return v12;
}

@end
