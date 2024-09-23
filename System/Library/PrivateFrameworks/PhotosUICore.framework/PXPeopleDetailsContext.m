@implementation PXPeopleDetailsContext

- (PXPeopleDetailsContext)initWithPhotosDataSource:(id)a3 displayTitleInfo:(id)a4 parentContext:(id)a5 keyAssetsFetchResult:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleDetailsContext.m"), 47, CFSTR("%s is not available as initializer"), "-[PXPeopleDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]");

  abort();
}

- (PXPeopleDetailsContext)initWithPeople:(id)a3 parentContext:(id)a4
{
  return -[PXPeopleDetailsContext initWithPeople:orSocialGroup:parentContext:assetCollectionsFetch:ignoreSharedLibraryFilters:](self, "initWithPeople:orSocialGroup:parentContext:assetCollectionsFetch:ignoreSharedLibraryFilters:", a3, 0, a4, 0, 0);
}

- (PXPeopleDetailsContext)initWithPeople:(id)a3 parentContext:(id)a4 ignoreSharedLibraryFilters:(BOOL)a5
{
  return -[PXPeopleDetailsContext initWithPeople:orSocialGroup:parentContext:assetCollectionsFetch:ignoreSharedLibraryFilters:](self, "initWithPeople:orSocialGroup:parentContext:assetCollectionsFetch:ignoreSharedLibraryFilters:", a3, 0, a4, 0, a5);
}

- (PXPeopleDetailsContext)initWithPeople:(id)a3 orSocialGroup:(id)a4 parentContext:(id)a5 assetCollectionsFetch:(id)a6 ignoreSharedLibraryFilters:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  PXPeopleDetailsContext *v14;
  PXPeopleDetailsContext *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  void *v19;
  PXPeopleDetailsContext *v20;
  id v21;
  PXPhotosDataSourceConfiguration *v22;
  PXPhotosDataSource *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PXDisplayTitleInfo *v35;
  PXPeopleDetailsContext *v36;
  PXPeopleDetailsContext *v37;
  PXPeopleDetailsContext *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  PXPhotosDataSource *v44;
  id v45;
  NSObject *v46;
  dispatch_queue_t v47;
  OS_dispatch_queue *fetchingQueue;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id obj;
  id obja;
  void *v62;
  PXPeopleDetailsContext *v63;
  void *v64;
  void *v65;
  PXPeopleDetailsContext *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  objc_super v70;
  _QWORD aBlock[4];
  id v72;
  id v73;
  uint64_t v74;
  _QWORD v75[3];

  v7 = a7;
  v75[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  obj = a4;
  v13 = a4;
  v67 = a5;
  v14 = (PXPeopleDetailsContext *)a6;
  v15 = v14;
  if (!v14)
  {
    if (objc_msgSend(v12, "count"))
    {
      v73 = 0;
      +[PXPeopleUtilities assetCollectionListFetchResultForPeople:assetCollectionFetchResults:](PXPeopleUtilities, "assetCollectionListFetchResultForPeople:assetCollectionFetchResults:", v12, &v73);
      v20 = (PXPeopleDetailsContext *)objc_claimAutoreleasedReturnValue();
      v21 = v73;
      v19 = 0;
      v18 = 0;
      if (v20)
      {
LABEL_5:
        v16 = v7;
        v17 = v21;
        goto LABEL_6;
      }
    }
    else
    {
      if (!v13)
      {
        v49 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v13, "px_title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)MEMORY[0x1E0CD13B8];
      objc_msgSend(v13, "photoLibrary");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], v18, 0, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)MEMORY[0x1E0CD14E0];
      v75[0] = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "transientCollectionListWithCollections:title:", v55, v18);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v56, 0);
      v57 = objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke;
      aBlock[3] = &unk_1E513EF80;
      v72 = v13;
      v58 = _Block_copy(aBlock);

      v19 = v58;
      v20 = (PXPeopleDetailsContext *)v57;

      v21 = 0;
      if (v57)
        goto LABEL_5;
    }
    v49 = v21;
    goto LABEL_17;
  }
  v16 = v7;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = v14;
LABEL_6:
  v63 = v20;
  v22 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v20, 0);
  -[PXPhotosDataSourceConfiguration setFilterPersons:](v22, "setFilterPersons:", v12);
  -[PXPhotosDataSourceConfiguration setFilterSocialGroup:](v22, "setFilterSocialGroup:", v13);
  -[PXPhotosDataSourceConfiguration setAssetContainerProvider:](v22, "setAssetContainerProvider:", v19);
  -[PXPhotosDataSourceConfiguration setHideHiddenAssets:](v22, "setHideHiddenAssets:", 1);
  v62 = v17;
  -[PXPhotosDataSourceConfiguration setExistingAssetCollectionFetchResults:](v22, "setExistingAssetCollectionFetchResults:", v17);
  if (v16)
  {
    -[PXPhotosDataSourceConfiguration setLibraryFilterState:](v22, "setLibraryFilterState:", 0);
    -[PXPhotosDataSourceConfiguration setLibraryFilter:](v22, "setLibraryFilter:", 0);
  }
  v23 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v22);
  v65 = v18;
  v66 = v15;
  v64 = v19;
  if (v13)
  {
    if (v18)
    {
      v24 = v18;
    }
    else
    {
      objc_msgSend(v13, "px_title");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v33 = v24;
    v32 = 0;
  }
  else
  {
    PXMap();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CD1570];
    -[PXPhotosDataSource photoLibrary](v23, "photoLibrary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v27 = v12;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fetchOptionsWithPhotoLibrary:orObject:", v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setMinimumUnverifiedFaceCount:", 1);
    v74 = *MEMORY[0x1E0CD1D60];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFetchPropertySets:", v30);

    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setIncludedDetectionTypes:", v31);

    v12 = v27;
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v59, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDetailsContext _displayTitleForPeople:](self, "_displayTitleForPeople:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CD13B8], "titleFontNameForTitleCategory:", 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[PXDisplayTitleInfo initWithTitle:subtitle:fontName:]([PXDisplayTitleInfo alloc], "initWithTitle:subtitle:fontName:", v33, 0, v34);
  v70.receiver = self;
  v70.super_class = (Class)PXPeopleDetailsContext;
  v36 = -[PXPhotosDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:](&v70, sel_initWithPhotosDataSource_displayTitleInfo_parentContext_keyAssetsFetchResult_, v23, v35, v67, 0);
  v37 = v36;
  v38 = v63;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_socialGroup, obj);
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke_3;
    v68[3] = &unk_1E513EFE8;
    v69 = v32;
    -[PXPeopleDetailsContext performChanges:](v37, "performChanges:", v68);
    -[PXPeopleDetailsContext photoLibrary](v63, "photoLibrary");
    obja = v33;
    v39 = v12;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "px_registerChangeObserver:", v37);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v41 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v41, QOS_CLASS_USER_INITIATED, 0);
    v42 = v34;
    v43 = v32;
    v44 = v23;
    v45 = v13;
    v46 = objc_claimAutoreleasedReturnValue();

    v12 = v39;
    v33 = obja;
    v47 = dispatch_queue_create("com.apple.photosUICore.PXPeopleDetailsContext.fetching-queue", v46);
    fetchingQueue = v37->_fetchingQueue;
    v37->_fetchingQueue = (OS_dispatch_queue *)v47;

    -[PXPeopleDetailsContext _updateKeyFaceAssetFetchResult](v37, "_updateKeyFaceAssetFetchResult");
    v13 = v45;
    v23 = v44;
    v32 = v43;
    v34 = v42;
    v38 = v63;

  }
  self = v37;

  v20 = self;
  v18 = v65;
  v15 = v66;
  v19 = v64;
  v49 = v62;
LABEL_17:

  return v20;
}

- (void)didPerformChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXPeopleDetailsContext;
  -[PXPeopleDetailsContext didPerformChanges](&v10, sel_didPerformChanges);
  -[PXPeopleDetailsContext socialGroup](self, "socialGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXPeopleDetailsContext socialGroup](self, "socialGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_title");
  }
  else
  {
    -[PXPhotosDetailsContext people](self, "people");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDetailsContext _displayTitleForPeople:](self, "_displayTitleForPeople:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDetailsContext displayTitleInfo](self, "displayTitleInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PXPeopleDetailsContext_didPerformChanges__block_invoke;
  v8[3] = &unk_1E513F010;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performChanges:", v8);

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleDetailsContext;
  -[PXPhotosDetailsContext performChanges:](&v3, sel_performChanges_, a3);
}

- (BOOL)shouldUseKeyFace
{
  void *v2;
  BOOL v3;

  -[PXPhotosDetailsContext people](self, "people");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 1;

  return v3;
}

- (void)setKeyFaceAssetFetchResult:(id)a3
{
  PHFetchResult *v5;
  char v6;
  PHFetchResult *v7;

  v7 = (PHFetchResult *)a3;
  v5 = self->_keyFaceAssetFetchResult;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PHFetchResult isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_keyFaceAssetFetchResult, a3);
      -[PXPeopleDetailsContext signalChange:](self, "signalChange:", 0x100000);
    }
  }

}

- (void)_updateKeyFaceAssetFetchResult
{
  void *v3;
  void *v4;
  NSObject *fetchingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  -[PXPhotosDetailsContext people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  fetchingQueue = self->_fetchingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(fetchingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_fetchKeyFaceAssetFetchResultFromPerson:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD1570];
  v4 = a3;
  objc_msgSend(v3, "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v6);

  objc_msgSend(v5, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x1E0CD1528], "px_fetchKeyFaceForPerson:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_standardLibrarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setIncludeHiddenAssets:", 0);
    v11 = (void *)MEMORY[0x1E0CD1390];
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchAssetsForFaces:options:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_displayTitleForPeople:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities slideshowTitleStringForPeople:](PXPeopleUtilities, "slideshowTitleStringForPeople:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E50B3470, "defaultHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForDisplayableText:titleCategory:options:", v4, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__251819;
  v16 = __Block_byref_object_dispose__251820;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__PXPeopleDetailsContext_prepareForPhotoLibraryChange___block_invoke;
  v11[3] = &unk_1E5148AA8;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(MEMORY[0x1E0C80D38], v11);
  objc_msgSend(v4, "changeDetailsForFetchResult:", v13[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "fetchResultAfterChanges");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (id)v13[5];
  }
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13[5], CFSTR("preparedForCurrentPeopleFetchResult"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("preparedPeopleFetchResult"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("preparedChangeDetails"));

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[PXPhotosDetailsContext people](self, "people");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedForCurrentPeopleFetchResult"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedPeopleFetchResult"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "changeDetailsForFetchResult:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "fetchResultAfterChanges");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v8;
    }
    v13 = v12;

  }
  if (v13 != v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__PXPeopleDetailsContext_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke;
    v14[3] = &unk_1E513EFE8;
    v15 = v13;
    -[PXPeopleDetailsContext performChanges:](self, "performChanges:", v14);
    -[PXPeopleDetailsContext _updateKeyFaceAssetFetchResult](self, "_updateKeyFaceAssetFetchResult");

  }
}

- (PHFetchResult)keyFaceAssetFetchResult
{
  return self->_keyFaceAssetFetchResult;
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_keyFaceAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_fetchingQueue, 0);
}

uint64_t __76__PXPeopleDetailsContext_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPeople:", *(_QWORD *)(a1 + 32));
}

void __55__PXPeopleDetailsContext_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "people");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_fetchKeyFaceAssetFetchResultFromPerson:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke_2;
    v6[3] = &unk_1E5148D08;
    v6[4] = v3;
    v7 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke_3;
  v2[3] = &unk_1E513EFE8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performChanges:", v2);

}

uint64_t __56__PXPeopleDetailsContext__updateKeyFaceAssetFetchResult__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setKeyFaceAssetFetchResult:", *(_QWORD *)(a1 + 32));
}

uint64_t __43__PXPeopleDetailsContext_didPerformChanges__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitle:", *(_QWORD *)(a1 + 32));
}

id __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPeople:", v2);
  objc_msgSend(v3, "setViewSourceOrigin:", 6);

}

uint64_t __118__PXPeopleDetailsContext_initWithPeople_orSocialGroup_parentContext_assetCollectionsFetch_ignoreSharedLibraryFilters___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 viewSourceOrigin:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleDetailsContext.m"), 35, CFSTR("%s is not available as initializer"), "+[PXPeopleDetailsContext photosDetailsContextForAssetCollection:assets:viewSourceOrigin:]");

  abort();
}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5 enableCuration:(BOOL)a6 enableKeyAssets:(BOOL)a7 viewSourceOrigin:(int64_t)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleDetailsContext.m"), 39, CFSTR("%s is not available as initializer"), "+[PXPeopleDetailsContext photosDetailsContextForAssetCollection:assets:keyAssets:enableCuration:enableKeyAssets:viewSourceOrigin:]");

  abort();
}

+ (id)photosDetailsContextForAsset:(id)a3 parentContext:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleDetailsContext.m"), 43, CFSTR("%s is not available as initializer"), "+[PXPeopleDetailsContext photosDetailsContextForAsset:parentContext:]");

  abort();
}

@end
