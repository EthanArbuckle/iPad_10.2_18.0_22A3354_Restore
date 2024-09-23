@implementation PXPhotosDetailsContext

- (PXPhotosDetailsContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsContext.m"), 167, CFSTR("%s is not available as initializer"), "-[PXPhotosDetailsContext init]");

  abort();
}

- (PXPhotosDetailsContext)initWithPhotosDataSource:(id)a3 displayTitleInfo:(id)a4 parentContext:(id)a5 keyAssetsFetchResult:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXPhotosDetailsContext *v15;
  PXPhotosDetailsContext *v16;
  PXDisplayTitleInfo *v17;
  void *displayTitleInfo;
  PXDisplayTitleInfo *v19;
  PXDisplayTitleInfo *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PXPhotosDetailsContext;
  v15 = -[PXPhotosDetailsContext init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photosDataSource, a3);
    -[PXPhotosDataSource registerChangeObserver:](v16->_photosDataSource, "registerChangeObserver:", v16);
    if (v12)
    {
      v17 = (PXDisplayTitleInfo *)v12;
      displayTitleInfo = v16->_displayTitleInfo;
      v16->_displayTitleInfo = v17;
    }
    else
    {
      objc_msgSend(v11, "firstAssetCollection");
      displayTitleInfo = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PXDisplayTitleInfo initWithAssetCollection:useVerboseSmartDescription:]([PXDisplayTitleInfo alloc], "initWithAssetCollection:useVerboseSmartDescription:", displayTitleInfo, 0);
      v20 = v16->_displayTitleInfo;
      v16->_displayTitleInfo = v19;

    }
    -[PXDisplayTitleInfo registerChangeObserver:context:](v16->_displayTitleInfo, "registerChangeObserver:context:", v16, PXDisplayTitleInfoObservationContext);
    objc_storeWeak((id *)&v16->_parentContext, v13);
    objc_storeStrong((id *)&v16->_keyAssetsFetchResult, a6);
    v16->_viewSourceOrigin = 0;
    v16->_contextHierarchyDepth = objc_msgSend(v13, "contextHierarchyDepth") + 1;
    -[PXPhotosDetailsContext _updatePropertiesDerivedFromPhotosDataSource](v16, "_updatePropertiesDerivedFromPhotosDataSource");
    -[PXPhotosDetailsContext _updatePropertiesDerivedFromDisplayTitleInfo](v16, "_updatePropertiesDerivedFromDisplayTitleInfo");
  }

  return v16;
}

- (void)_updatePropertiesDerivedFromPhotosDataSource
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  PXPhotosDetailsContext *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  -[PXPhotosDetailsContext photosDataSource](self, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionListFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchResultsByAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "includeOthersInSocialGroupAssets");
  if (-[PXPhotosDetailsContext shouldUseKeyFace](self, "shouldUseKeyFace"))
  {
    v7 = self;
    -[PXPhotosDetailsContext keyFaceAssetFetchResult](v7, "keyFaceAssetFetchResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v3, "numberOfSections") <= 0)
      -[PXPhotosDetailsContext keyAssetsFetchResult](self, "keyAssetsFetchResult");
    else
      objc_msgSend(v3, "keyAssetsInSection:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PXPhotosDetailsContext__updatePropertiesDerivedFromPhotosDataSource__block_invoke;
  v12[3] = &unk_1E512D970;
  v13 = v4;
  v14 = v5;
  v15 = v8;
  v16 = v6;
  v9 = v8;
  v10 = v5;
  v11 = v4;
  -[PXPhotosDetailsContext performChanges:](self, "performChanges:", v12);

}

- (void)_updatePropertiesDerivedFromDisplayTitleInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  -[PXPhotosDetailsContext displayTitleInfo](self, "displayTitleInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PXPhotosDetailsContext__updatePropertiesDerivedFromDisplayTitleInfo__block_invoke;
  v10[3] = &unk_1E512D998;
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = v4;
  -[PXPhotosDetailsContext performChanges:](self, "performChanges:", v10);

}

- (BOOL)shouldShowHeaderTitle
{
  return 1;
}

- (PHAsset)firstAsset
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPhotosDetailsContext photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForFirstAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "assetAtIndexPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (PHAsset *)v4;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsContext;
  -[PXPhotosDetailsContext performChanges:](&v3, sel_performChanges_, a3);
}

- (void)toggleIncludeOthersInSocialGroupAssets
{
  id v2;

  -[PXPhotosDetailsContext photosDataSource](self, "photosDataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeOthersInSocialGroupAssets:", objc_msgSend(v2, "includeOthersInSocialGroupAssets") ^ 1);

}

- (void)setAssetCollections:(id)a3
{
  PHFetchResult *v5;
  char v6;
  PHFetchResult *v7;

  v7 = (PHFetchResult *)a3;
  v5 = self->_assetCollections;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PHFetchResult isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetCollections, a3);
      -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setAssetsByCollection:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *assetsByCollection;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_assetsByCollection;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      assetsByCollection = self->_assetsByCollection;
      self->_assetsByCollection = v6;

      -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setKeyAssetsFetchResult:(id)a3
{
  PHFetchResult *v4;
  char v5;
  PHFetchResult *v6;
  PHFetchResult *keyAssetsFetchResult;
  PHFetchResult *v8;

  v8 = (PHFetchResult *)a3;
  v4 = self->_keyAssetsFetchResult;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PHFetchResult isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (PHFetchResult *)-[PHFetchResult copy](v8, "copy");
      keyAssetsFetchResult = self->_keyAssetsFetchResult;
      self->_keyAssetsFetchResult = v6;

      -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setPeople:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult *v6;

  v5 = (PHFetchResult *)a3;
  if (self->_people != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_people, a3);
    -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 8);
    v5 = v6;
  }

}

- (void)setLocalizedTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *localizedTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_localizedTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      localizedTitle = self->_localizedTitle;
      self->_localizedTitle = v6;

      -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 16);
    }
  }

}

- (void)setLocalizedSubtitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *localizedSubtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_localizedSubtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      localizedSubtitle = self->_localizedSubtitle;
      self->_localizedSubtitle = v6;

      -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setTitleFontName:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *titleFontName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_titleFontName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      titleFontName = self->_titleFontName;
      self->_titleFontName = v6;

      -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 64);
    }
  }

}

- (void)setShouldShowMovieHeader:(BOOL)a3
{
  if (self->_shouldShowMovieHeader != a3)
  {
    self->_shouldShowMovieHeader = a3;
    -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 128);
  }
}

- (void)setHasLocation:(BOOL)a3
{
  if (self->_hasLocation != a3)
  {
    self->_hasLocation = a3;
    -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 512);
  }
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  if (self->_includeOthersInSocialGroupAssets != a3)
  {
    self->_includeOthersInSocialGroupAssets = a3;
    -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 0x2000);
  }
}

- (void)setVisualLookupData:(id)a3
{
  PXPhotosDetailsVisualLookupData *v5;
  BOOL v6;
  PXPhotosDetailsVisualLookupData *v7;

  v7 = (PXPhotosDetailsVisualLookupData *)a3;
  v5 = self->_visualLookupData;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXPhotosDetailsVisualLookupData isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_visualLookupData, a3);
      -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 2048);
    }
  }

}

- (void)setContainingAlbum:(id)a3
{
  PHAssetCollection *v5;
  char v6;
  PHAssetCollection *v7;

  v7 = (PHAssetCollection *)a3;
  v5 = self->_containingAlbum;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PHAssetCollection isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_containingAlbum, a3);
      -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 4096);
    }
  }

}

- (void)setViewSourceOrigin:(int64_t)a3
{
  self->_viewSourceOrigin = a3;
}

- (void)setViewModel:(id)a3
{
  PXPhotosDetailsViewModel *v5;
  PXPhotosDetailsViewModel *v6;

  v5 = (PXPhotosDetailsViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 256);
    v5 = v6;
  }

}

- (void)setPhotosDataSource:(id)a3
{
  PXPhotosDataSource *v5;
  PXPhotosDataSource *photosDataSource;
  PXPhotosDataSource *v7;

  v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  if (photosDataSource != v5)
  {
    v7 = v5;
    -[PXPhotosDataSource unregisterChangeObserver:](photosDataSource, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    -[PXPhotosDataSource registerChangeObserver:](self->_photosDataSource, "registerChangeObserver:", self);
    -[PXPhotosDetailsContext _updatePropertiesDerivedFromPhotosDataSource](self, "_updatePropertiesDerivedFromPhotosDataSource");
    -[PXPhotosDetailsContext signalChange:](self, "signalChange:", 1024);
    v5 = v7;
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if ((void *)PXDisplayTitleInfoObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsContext.m"), 401, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXPhotosDetailsContext _updatePropertiesDerivedFromDisplayTitleInfo](self, "_updatePropertiesDerivedFromDisplayTitleInfo");

}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (PXDisplayTitleInfo)displayTitleInfo
{
  return self->_displayTitleInfo;
}

- (PXPhotosDetailsContext)parentContext
{
  return (PXPhotosDetailsContext *)objc_loadWeakRetained((id *)&self->_parentContext);
}

- (PHFetchResult)keyAssetsFetchResult
{
  return self->_keyAssetsFetchResult;
}

- (int64_t)viewSourceOrigin
{
  return self->_viewSourceOrigin;
}

- (PXPhotosDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (unint64_t)contextHierarchyDepth
{
  return self->_contextHierarchyDepth;
}

- (PXPhotosDetailsVisualLookupData)visualLookupData
{
  return self->_visualLookupData;
}

- (PHAssetCollection)containingAlbum
{
  return self->_containingAlbum;
}

- (PHFetchResult)assetCollections
{
  return self->_assetCollections;
}

- (NSDictionary)assetsByCollection
{
  return self->_assetsByCollection;
}

- (PHFetchResult)people
{
  return self->_people;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (BOOL)shouldShowMovieHeader
{
  return self->_shouldShowMovieHeader;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (BOOL)shouldUseKeyFace
{
  return self->_shouldUseKeyFace;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (void)setUnlockDeviceStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_assetsByCollection, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
  objc_storeStrong((id *)&self->_containingAlbum, 0);
  objc_storeStrong((id *)&self->_visualLookupData, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_keyAssetsFetchResult, 0);
  objc_destroyWeak((id *)&self->_parentContext);
  objc_storeStrong((id *)&self->_displayTitleInfo, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
}

void __70__PXPhotosDetailsContext__updatePropertiesDerivedFromDisplayTitleInfo__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setLocalizedTitle:", v3);
  objc_msgSend(v4, "setLocalizedSubtitle:", a1[5]);
  objc_msgSend(v4, "setTitleFontName:", a1[6]);

}

void __70__PXPhotosDetailsContext__updatePropertiesDerivedFromPhotosDataSource__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAssetCollections:", v3);
  objc_msgSend(v4, "setAssetsByCollection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setKeyAssetsFetchResult:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setIncludeOthersInSocialGroupAssets:", *(unsigned __int8 *)(a1 + 56));

}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 viewSourceOrigin:(int64_t)a5
{
  return (id)objc_msgSend(a1, "photosDetailsContextForAssetCollection:assets:keyAssets:enableCuration:enableKeyAssets:useVerboseSmartDescription:viewSourceOrigin:", a3, a4, 0, 0, 0, 0, a5);
}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5 enableCuration:(BOOL)a6 enableKeyAssets:(BOOL)a7 useVerboseSmartDescription:(BOOL)a8 viewSourceOrigin:(int64_t)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return (id)objc_msgSend(a1, "photosDetailsContextForAssetCollection:assets:keyAssets:enableCuration:enableKeyAssets:useVerboseSmartDescription:viewSourceOrigin:ignoreSharedLibraryFilters:", a3, a4, a5, a6, a7, a8, 0, v10);
}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5 enableCuration:(BOOL)a6 enableKeyAssets:(BOOL)a7 useVerboseSmartDescription:(BOOL)a8 viewSourceOrigin:(int64_t)a9 ignoreSharedLibraryFilters:(BOOL)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PXPhotosDataSourceConfiguration *v26;
  PXPhotosDataSourceConfiguration *v27;
  void *v28;
  void *v29;
  PXPhotosDataSource *v30;
  PXDisplayTitleInfo *v31;
  PXPhotosDetailsContext *v32;
  NSObject *v33;
  _BOOL4 v35;
  _QWORD v36[5];
  uint8_t buf[4];
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  _QWORD v43[2];

  v35 = a8;
  v10 = a7;
  v11 = a6;
  v43[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = 16;
  if (!v11)
    v16 = 0;
  if (v10)
    v17 = v16 | 0x20;
  else
    v17 = v16;
  v18 = (void *)MEMORY[0x1E0CD1570];
  v19 = a5;
  objc_msgSend(v18, "fetchOptionsWithPhotoLibrary:orObject:", 0, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIncludePendingMemories:", 1);
  v43[0] = *MEMORY[0x1E0CD1D28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFetchPropertySets:", v21);

  v22 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v14, "localIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fetchAssetCollectionsWithLocalIdentifiers:options:", v24, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v25, v17);
  v27 = v26;
  if (a10)
  {
    -[PXPhotosDataSourceConfiguration setLibraryFilterState:](v26, "setLibraryFilterState:", 0);
    -[PXPhotosDataSourceConfiguration setLibraryFilter:](v27, "setLibraryFilter:", 0);
  }
  if (v15)
  {
    v40 = v14;
    v41 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setExistingAssetCollectionFetchResults:](v27, "setExistingAssetCollectionFetchResults:", v28);

  }
  -[PXPhotosDataSourceConfiguration setHideHiddenAssets:](v27, "setHideHiddenAssets:", 1);
  v39 = *MEMORY[0x1E0CD1958];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v27, "setFetchPropertySets:", v29);

  v30 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v27);
  v31 = -[PXDisplayTitleInfo initWithAssetCollection:useVerboseSmartDescription:]([PXDisplayTitleInfo alloc], "initWithAssetCollection:useVerboseSmartDescription:", v14, v35);
  v32 = -[PXPhotosDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]([PXPhotosDetailsContext alloc], "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:", v30, v31, 0, v19);

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __184__PXPhotosDetailsContext_photosDetailsContextForAssetCollection_assets_keyAssets_enableCuration_enableKeyAssets_useVerboseSmartDescription_viewSourceOrigin_ignoreSharedLibraryFilters___block_invoke;
  v36[3] = &__block_descriptor_40_e41_v16__0___PXMutablePhotosDetailsContext__8l;
  v36[4] = a9;
  -[PXPhotosDetailsContext performChanges:](v32, "performChanges:", v36);
  if (!objc_msgSend(v25, "count"))
  {
    PLUIGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v14;
      _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_ERROR, "Could not find any matching collections for the given asset collection: %@", buf, 0xCu);
    }

  }
  return v32;
}

+ (id)_fetchPropertySets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD1958];
  v7[0] = *MEMORY[0x1E0CD1980];
  v7[1] = v2;
  v3 = *MEMORY[0x1E0CD1950];
  v7[2] = *MEMORY[0x1E0CD1978];
  v7[3] = v3;
  v4 = *MEMORY[0x1E0CD1A08];
  v7[4] = *MEMORY[0x1E0CD1A28];
  v7[5] = v4;
  v5 = *MEMORY[0x1E0CD1A70];
  v7[6] = *MEMORY[0x1E0CD1940];
  v7[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_assetFetchResultForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_fetchPropertySets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setFetchPropertySets:](v7, "setFetchPropertySets:", v8);

    -[NSObject setIncludeGuestAssets:](v7, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "localIdentifier", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v9, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "Invalid operation. Cannot obtain a fetch result for 0 assets", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

+ (id)photosDetailsContextForMemory:(id)a3
{
  return (id)objc_msgSend(a1, "photosDetailsContextForMemory:enableCuration:enableKeyAssets:", a3, 0, 0);
}

+ (id)photosDetailsContextForMemory:(id)a3 enableCuration:(BOOL)a4 enableKeyAssets:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v8 = (void *)MEMORY[0x1E0CD1390];
  v9 = a3;
  objc_msgSend(v8, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "photosDetailsContextForAssetCollection:assets:keyAssets:enableCuration:enableKeyAssets:useVerboseSmartDescription:viewSourceOrigin:", v9, 0, v10, v6, v5, 0, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)photosDetailsContextPreheatForAssets:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a1, "_assetFetchResultForAssets:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_146573);

}

+ (NSCache)preheatedAssets
{
  if (preheatedAssets_onceToken != -1)
    dispatch_once(&preheatedAssets_onceToken, &__block_literal_global_141_146571);
  return (NSCache *)(id)preheatedAssets_assetsCache;
}

+ (id)_preheatedFetchResultForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PXPhotosDetailsContext preheatedAssets](PXPhotosDetailsContext, "preheatedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CD1620]);
    v18[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a1, "_fetchPropertySets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v8, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v9, v10, v11, v14, 0, 0);

  }
  else
  {
    v17 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_assetFetchResultForAssets:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)photosDetailsContextForAsset:(id)a3 parentContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXPhotosDataSourceConfiguration *v15;
  void *v16;
  PXPhotosDataSource *v17;
  PXPhotosDetailsContext *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_preheatedFetchResultForAsset:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CD14E0];
  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transientCollectionListWithCollections:title:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CD14E0];
  objc_msgSend(v7, "fetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchCollectionsInCollectionList:options:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v14, 0);
  objc_msgSend(a1, "_fetchPropertySets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v15, "setFetchPropertySets:", v16);

  v17 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v15);
  v18 = -[PXPhotosDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]([PXPhotosDetailsContext alloc], "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:", v17, 0, v6, 0);

  return v18;
}

uint64_t __41__PXPhotosDetailsContext_preheatedAssets__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)preheatedAssets_assetsCache;
  preheatedAssets_assetsCache = (uint64_t)v0;

  return objc_msgSend((id)preheatedAssets_assetsCache, "setCountLimit:", 20);
}

void __63__PXPhotosDetailsContext_photosDetailsContextPreheatForAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  +[PXPhotosDetailsContext preheatedAssets](PXPhotosDetailsContext, "preheatedAssets");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

uint64_t __184__PXPhotosDetailsContext_photosDetailsContextForAssetCollection_assets_keyAssets_enableCuration_enableKeyAssets_useVerboseSmartDescription_viewSourceOrigin_ignoreSharedLibraryFilters___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setViewSourceOrigin:", *(_QWORD *)(a1 + 32));
}

@end
