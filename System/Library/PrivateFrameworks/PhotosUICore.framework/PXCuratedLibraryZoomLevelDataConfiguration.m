@implementation PXCuratedLibraryZoomLevelDataConfiguration

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (PXCuratedLibraryZoomLevelDataConfiguration)initWithZoomLevel:(int64_t)a3 assetsDataSourceManager:(id)a4
{
  return -[PXCuratedLibraryZoomLevelDataConfiguration initWithZoomLevel:assetsDataSourceManager:enableDays:](self, "initWithZoomLevel:assetsDataSourceManager:enableDays:", a3, a4, 1);
}

- (PXCuratedLibraryZoomLevelDataConfiguration)initWithZoomLevel:(int64_t)a3
{
  return -[PXCuratedLibraryZoomLevelDataConfiguration initWithZoomLevel:assetsDataSourceManager:](self, "initWithZoomLevel:assetsDataSourceManager:", a3, 0);
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  PXPhotoKitAssetsDataSourceManager *v3;

  v3 = self->_assetsDataSourceManager;
  if (!v3)
    v3 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSourceProvider:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSourceProvider:", self);
  return (PXAssetsDataSourceManager *)v3;
}

- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  PXPhotosDataSourceConfiguration *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  PXPhotosDataSource *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  _BOOL4 enableDays;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  PHPhotoLibrary *photoLibrary;
  void *v58;
  PXPhotosDataSourceConfiguration *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v64;
  void *v65;
  SEL v66;
  PXCuratedLibraryZoomLevelDataConfiguration *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  PXPhotosDataSource *v72;
  id v73;
  _QWORD aBlock[4];
  id v75;
  int64_t v76;
  uint64_t v77;
  _QWORD block[4];
  id v79;
  uint64_t v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PHPhotoLibrary px_standardLibrarySpecificFetchOptions](self->_photoLibrary, "px_standardLibrarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhotoLibrary:", self->_photoLibrary);
  v70 = v6;
  if (-[PXCuratedLibraryZoomLevelDataConfiguration zoomLevel](self, "zoomLevel") == 4)
  {
    objc_msgSend(v6, "setIncludeAllPhotosSmartAlbum:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000205, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "simulateMinimumPhotoCount");
    v10 = 0x1E0C99000;
    if (v9 >= 1)
    {
      v11 = v9;
      v12 = (void *)MEMORY[0x1E0CD1390];
      objc_msgSend(v7, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchAssetsInAssetCollection:options:", v13, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = v14;
      objc_msgSend(v14, "fetchedObjectIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", i % objc_msgSend(v15, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v18);

      }
      v19 = objc_alloc(MEMORY[0x1E0CD1620]);
      v20 = (void *)objc_msgSend(v19, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v16, self->_photoLibrary, *MEMORY[0x1E0CD1B90], 0, 0, 1);
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v20, CFSTR("All Photos"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CD13B8];
      v23 = (void *)MEMORY[0x1E0CD14E0];
      v81[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "transientCollectionListWithCollections:title:", v24, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fetchCollectionsInCollectionList:options:", v25, v70);
      v26 = objc_claimAutoreleasedReturnValue();

      v10 = 0x1E0C99000uLL;
      v7 = (id)v26;
    }
    v27 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v7, 33921);
    objc_msgSend(v5, "filterPredicate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setFilterPredicate:](v27, "setFilterPredicate:", v28);

    -[PXPhotosDataSourceConfiguration setLibraryFilter:](v27, "setLibraryFilter:", objc_msgSend(v5, "libraryFilter"));
    -[PXPhotosDataSourceConfiguration setLibraryFilterState:](v27, "setLibraryFilterState:", 0);
    objc_msgSend(v5, "sortDescriptors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setSortDescriptors:](v27, "setSortDescriptors:", v29);

    v80 = *MEMORY[0x1E0CD1A70];
    objc_msgSend(*(id *)(v10 + 3360), "arrayWithObjects:count:", &v80, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "allPhotosCaptionsVisible");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "BOOLValue");

    if (v33)
    {
      objc_msgSend(v30, "arrayByAddingObject:", *MEMORY[0x1E0CD19A0]);
      v34 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v34;
    }
    -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v27, "setFetchPropertySets:", v30);
    +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setCanIncludeUnsavedSyndicatedAssets:](v27, "setCanIncludeUnsavedSyndicatedAssets:", objc_msgSend(v35, "showUnsavedSyndicatedContentInPhotosGrids"));

    v36 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v27);
    v37 = objc_msgSend(v8, "maxPhotoCount");
    if (v37)
      -[PXPhotosDataSource setFetchLimit:](v36, "setFetchLimit:", v37);
    if (objc_msgSend(v8, "onlyPhotosFromToday"))
    {
      v38 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v38, "setDay:", -1);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "dateByAddingComponents:toDate:options:", v38, v40, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated >= %@"), v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDataSource setFilterPredicate:](v36, "setFilterPredicate:", v42);

    }
    -[PXPhotosDataSource assetsInSection:](v36, "assetsInSection:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(33, 0);
    v44 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke;
    block[3] = &unk_1E5149198;
    v79 = v43;
    v45 = v43;
    dispatch_async(v44, block);

  }
  else
  {
    enableDays = self->_enableDays;
    switch(-[PXCuratedLibraryZoomLevelDataConfiguration zoomLevel](self, "zoomLevel"))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v64;
        v66 = a2;
        v67 = self;
        v68 = 258;
        goto LABEL_30;
      case 1:
        v47 = -1;
        v48 = 6641;
        goto LABEL_21;
      case 2:
        v47 = -1;
        v48 = 7153;
        goto LABEL_21;
      case 3:
        if (enableDays)
          v47 = -1;
        else
          v47 = -49;
        v48 = 6385;
        goto LABEL_21;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v64;
        v66 = a2;
        v67 = self;
        v68 = 276;
LABEL_30:
        objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", v66, v67, CFSTR("PXCuratedLibraryAssetsDataSourceManagerConfiguration.m"), v68, CFSTR("Code which should be unreachable has been reached"));

        abort();
      default:
        v47 = -1;
        v48 = 6321;
LABEL_21:
        v49 = -[PXCuratedLibraryZoomLevelDataConfiguration zoomLevel](self, "zoomLevel");
        -[PXCuratedLibraryZoomLevelDataConfiguration photoLibrary](self, "photoLibrary");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v5, "libraryFilter");
        v52 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_208;
        aBlock[3] = &unk_1E5145278;
        v76 = v49;
        v7 = v50;
        v75 = v7;
        v77 = v51;
        v53 = _Block_copy(aBlock);
        v54 = v53;
        if (enableDays)
        {
          (*((void (**)(void *))v53 + 2))(v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v56 = objc_alloc(MEMORY[0x1E0CD1620]);
          photoLibrary = self->_photoLibrary;
          objc_msgSend(MEMORY[0x1E0CD1708], "fetchType");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)objc_msgSend(v56, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], photoLibrary, v58, 0, 0, 0);

        }
        v59 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v55, v47 & v48);
        objc_msgSend(v5, "filterPredicate");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosDataSourceConfiguration setFilterPredicate:](v59, "setFilterPredicate:", v60);

        -[PXPhotosDataSourceConfiguration setLibraryFilter:](v59, "setLibraryFilter:", objc_msgSend(v5, "libraryFilter"));
        -[PXPhotosDataSourceConfiguration setLibraryFilterState:](v59, "setLibraryFilterState:", 0);
        -[PXPhotosDataSourceConfiguration setWantsCurationByDefault:](v59, "setWantsCurationByDefault:", 1);
        +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosDataSourceConfiguration setCanIncludeUnsavedSyndicatedAssets:](v59, "setCanIncludeUnsavedSyndicatedAssets:", objc_msgSend(v61, "showUnsavedSyndicatedContentInPhotosGrids"));

        v36 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v59);
        if (!enableDays)
        {
          +[PXPhotosDataSource sharedPrefetchQueue](PXPhotosDataSource, "sharedPrefetchQueue");
          v62 = objc_claimAutoreleasedReturnValue();
          v71[0] = v52;
          v71[1] = 3221225472;
          v71[2] = __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_2;
          v71[3] = &unk_1E5148CE0;
          v73 = v54;
          v72 = v36;
          dispatch_async(v62, v71);

        }
        v8 = v75;
        break;
    }
  }

  return v36;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
}

- (PXCuratedLibraryZoomLevelDataConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManagerConfiguration.m"), 148, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryZoomLevelDataConfiguration init]");

  abort();
}

- (PXCuratedLibraryZoomLevelDataConfiguration)initWithZoomLevel:(int64_t)a3 assetsDataSourceManager:(id)a4 enableDays:(BOOL)a5
{
  id v9;
  PXCuratedLibraryZoomLevelDataConfiguration *v10;
  PXCuratedLibraryZoomLevelDataConfiguration *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryZoomLevelDataConfiguration;
  v10 = -[PXCuratedLibraryZoomLevelDataConfiguration init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_zoomLevel = a3;
    objc_storeStrong((id *)&v10->_assetsDataSourceManager, a4);
    v11->_enableDays = a5;
  }

  return v11;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)enableDays
{
  return self->_enableDays;
}

- (void)setEnableDays:(BOOL)a3
{
  self->_enableDays = a3;
}

void __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    PLCuratedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
    v4 = v2;
    v5 = v4;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Prefetch Assets", ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 32), "count") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "prefetchObjectsAtIndexes:", v6);
    objc_msgSend(*(id *)(a1 + 32), "prefetchThumbnailAssetsAtIndexes:", v6);
    v7 = v5;
    v8 = v7;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v3, "Prefetch Assets", ", v9, 2u);
    }

  }
}

id __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_208(uint64_t a1)
{
  return PXCuratedLibraryFetchHighlights(*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v2, "count"));
  objc_msgSend(v2, "prefetchObjectsAtIndexes:", v3);
  objc_msgSend(off_1E50B4758, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_3;
  v6[3] = &unk_1E5148D08;
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  v5 = v2;
  objc_msgSend(v4, "dispatchOnMainThreadWhenNotScrolling:", v6);

}

uint64_t __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCollectionListFetchResult:", *(_QWORD *)(a1 + 40));
}

@end
