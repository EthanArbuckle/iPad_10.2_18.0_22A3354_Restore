@implementation PXPhotoKitCollectionsDataSourceManagerConfiguration

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)init
{
  return -[PXPhotoKitCollectionsDataSourceManagerConfiguration initWithCollectionList:collectionsFetchResult:](self, "initWithCollectionList:collectionsFetchResult:", 0, 0);
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)initWithCollectionList:(id)a3
{
  return -[PXPhotoKitCollectionsDataSourceManagerConfiguration initWithCollectionList:collectionsFetchResult:](self, "initWithCollectionList:collectionsFetchResult:", a3, 0);
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)initWithCollectionsFetchResult:(id)a3
{
  return -[PXPhotoKitCollectionsDataSourceManagerConfiguration initWithCollectionList:collectionsFetchResult:](self, "initWithCollectionList:collectionsFetchResult:", 0, a3);
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)initWithCollectionList:(id)a3 collectionsFetchResult:(id)a4
{
  id v7;
  id v8;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v9;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotoKitCollectionsDataSourceManagerConfiguration;
  v9 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_assetTypesToInclude = -1;
    v9->_collectionTypesToInclude = -1;
    objc_storeStrong((id *)&v9->_collectionList, a3);
    objc_storeStrong((id *)&v10->_collectionsFetchResult, a4);
  }

  return v10;
}

- (PHFetchResult)collectionsFetchResult
{
  PHFetchResult *collectionsFetchResult;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PHFetchResult *v9;
  PHFetchResult *v10;

  collectionsFetchResult = self->_collectionsFetchResult;
  if (!collectionsFetchResult)
  {
    -[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionList](self, "collectionList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_standardLibrarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setIncludePlacesSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 6) & 1);
    objc_msgSend(v6, "setIncludeDuplicatesAlbums:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 16) & 1);
    objc_msgSend(v6, "setIncludeUserSmartAlbums:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 22) & 1);
    objc_msgSend(v6, "setIncludeAllPhotosSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 2) & 1);
    objc_msgSend(v6, "setIncludeRecentlyEditedSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 12) & 1);
    objc_msgSend(v6, "setIncludeScreenRecordingsSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 7) & 1);
    objc_msgSend(v6, "setIncludeProResSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 7) & 1);
    v7 = (void *)MEMORY[0x1E0CD14D8];
    -[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionList](self, "collectionList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchCollectionsInCollectionList:options:", v8, v6);
    v9 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v10 = self->_collectionsFetchResult;
    self->_collectionsFetchResult = v9;

    collectionsFetchResult = self->_collectionsFetchResult;
  }
  return collectionsFetchResult;
}

- (id)customFetchOptionsForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_standardLibrarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration _shouldSupportSyndicatedAssetFetches:](self, "_shouldSupportSyndicatedAssetFetches:", v4);
  objc_msgSend(v6, "setIncludeGuestAssets:", v7);
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration assetsFilterPredicate](self, "assetsFilterPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_generatePredicateForAssetTypesToInclude:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration assetTypesToInclude](self, "assetTypesToInclude"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v6, "setInternalPredicate:", v11);
  return v6;
}

- (BOOL)_shouldSupportSyndicatedAssetFetches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  char ShouldShowUnsavedAssetsInGridForAssetCollection;

  v4 = a3;
  if (-[PXPhotoKitCollectionsDataSourceManagerConfiguration skipSyndicatedAssetFetches](self, "skipSyndicatedAssetFetches")|| (objc_msgSend(v4, "photoLibrary"), v5 = (void *)objc_claimAutoreleasedReturnValue(), +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v5), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "showUnsavedSyndicatedContentInPhotosGrids"), v6, v5, !v7))
  {
    ShouldShowUnsavedAssetsInGridForAssetCollection = 0;
  }
  else if (objc_msgSend(v4, "canContainAssets"))
  {
    ShouldShowUnsavedAssetsInGridForAssetCollection = PXContentSyndicationShouldShowUnsavedAssetsInGridForAssetCollection(v4);
  }
  else
  {
    ShouldShowUnsavedAssetsInGridForAssetCollection = 1;
  }

  return ShouldShowUnsavedAssetsInGridForAssetCollection;
}

- (id)newConfigurationWithCollectionList:(id)a3
{
  return -[PXPhotoKitCollectionsDataSourceManagerConfiguration _newConfigurationWithCollectionList:collectionsFetchResult:](self, "_newConfigurationWithCollectionList:collectionsFetchResult:", a3, 0);
}

- (id)newConfigurationWithCollectionsFetchResult:(id)a3
{
  return -[PXPhotoKitCollectionsDataSourceManagerConfiguration _newConfigurationWithCollectionList:collectionsFetchResult:](self, "_newConfigurationWithCollectionList:collectionsFetchResult:", 0, a3);
}

- (id)_newConfigurationWithCollectionList:(id)a3 collectionsFetchResult:(id)a4
{
  id v6;
  id v7;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration initWithCollectionList:collectionsFetchResult:]([PXPhotoKitCollectionsDataSourceManagerConfiguration alloc], "initWithCollectionList:collectionsFetchResult:", v7, v6);

  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSeparateSectionsForSmartAndUserCollections:](v8, "setSeparateSectionsForSmartAndUserCollections:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration separateSectionsForSmartAndUserCollections](self, "separateSectionsForSmartAndUserCollections"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setIncludePeopleAlbum:](v8, "setIncludePeopleAlbum:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration includePeopleAlbum](self, "includePeopleAlbum"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setAssetTypesToInclude:](v8, "setAssetTypesToInclude:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration assetTypesToInclude](self, "assetTypesToInclude"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration assetsFilterPredicate](self, "assetsFilterPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setAssetsFilterPredicate:](v8, "setAssetsFilterPredicate:", v9);

  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setCollectionTypesToInclude:](v8, "setCollectionTypesToInclude:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setShouldExcludePrivacySensitiveAlbums:](v8, "setShouldExcludePrivacySensitiveAlbums:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration shouldExcludePrivacySensitiveAlbums](self, "shouldExcludePrivacySensitiveAlbums"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setShouldIgnoreLibraryChanges:](v8, "setShouldIgnoreLibraryChanges:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration shouldIgnoreLibraryChanges](self, "shouldIgnoreLibraryChanges"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipKeyAssetFetches:](v8, "setSkipKeyAssetFetches:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration skipKeyAssetFetches](self, "skipKeyAssetFetches"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipKeyAssetFetchesForSmartAlbums:](v8, "setSkipKeyAssetFetchesForSmartAlbums:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration skipKeyAssetFetchesForSmartAlbums](self, "skipKeyAssetFetchesForSmartAlbums"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipAssetFetches:](v8, "setSkipAssetFetches:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration skipAssetFetches](self, "skipAssetFetches"));
  -[PXPhotoKitCollectionsDataSourceManagerConfiguration setSkipSyndicatedAssetFetches:](v8, "setSkipSyndicatedAssetFetches:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration skipSyndicatedAssetFetches](self, "skipSyndicatedAssetFetches"));
  return v8;
}

- (PHCollectionList)collectionList
{
  return (PHCollectionList *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)separateSectionsForSmartAndUserCollections
{
  return self->_separateSectionsForSmartAndUserCollections;
}

- (void)setSeparateSectionsForSmartAndUserCollections:(BOOL)a3
{
  self->_separateSectionsForSmartAndUserCollections = a3;
}

- (BOOL)includePeopleAlbum
{
  return self->_includePeopleAlbum;
}

- (void)setIncludePeopleAlbum:(BOOL)a3
{
  self->_includePeopleAlbum = a3;
}

- (BOOL)skipKeyAssetFetches
{
  return self->_skipKeyAssetFetches;
}

- (void)setSkipKeyAssetFetches:(BOOL)a3
{
  self->_skipKeyAssetFetches = a3;
}

- (BOOL)skipKeyAssetFetchesForSmartAlbums
{
  return self->_skipKeyAssetFetchesForSmartAlbums;
}

- (void)setSkipKeyAssetFetchesForSmartAlbums:(BOOL)a3
{
  self->_skipKeyAssetFetchesForSmartAlbums = a3;
}

- (BOOL)skipAssetFetches
{
  return self->_skipAssetFetches;
}

- (void)setSkipAssetFetches:(BOOL)a3
{
  self->_skipAssetFetches = a3;
}

- (BOOL)skipSyndicatedAssetFetches
{
  return self->_skipSyndicatedAssetFetches;
}

- (void)setSkipSyndicatedAssetFetches:(BOOL)a3
{
  self->_skipSyndicatedAssetFetches = a3;
}

- (BOOL)updateKeyAssetFetchesInBackground
{
  return self->_updateKeyAssetFetchesInBackground;
}

- (void)setUpdateKeyAssetFetchesInBackground:(BOOL)a3
{
  self->_updateKeyAssetFetchesInBackground = a3;
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (void)setAssetsFilterPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_assetsFilterPredicate, a3);
}

- (unint64_t)assetTypesToInclude
{
  return self->_assetTypesToInclude;
}

- (void)setAssetTypesToInclude:(unint64_t)a3
{
  self->_assetTypesToInclude = a3;
}

- (unint64_t)collectionTypesToInclude
{
  return self->_collectionTypesToInclude;
}

- (void)setCollectionTypesToInclude:(unint64_t)a3
{
  self->_collectionTypesToInclude = a3;
}

- (BOOL)shouldExcludePrivacySensitiveAlbums
{
  return self->_shouldExcludePrivacySensitiveAlbums;
}

- (void)setShouldExcludePrivacySensitiveAlbums:(BOOL)a3
{
  self->_shouldExcludePrivacySensitiveAlbums = a3;
}

- (BOOL)simulateNonIncrementalChanges
{
  return self->_simulateNonIncrementalChanges;
}

- (void)setSimulateNonIncrementalChanges:(BOOL)a3
{
  self->_simulateNonIncrementalChanges = a3;
}

- (int64_t)pausedChangeDetailsBufferLength
{
  return self->_pausedChangeDetailsBufferLength;
}

- (void)setPausedChangeDetailsBufferLength:(int64_t)a3
{
  self->_pausedChangeDetailsBufferLength = a3;
}

- (BOOL)shouldIgnoreLibraryChanges
{
  return self->_shouldIgnoreLibraryChanges;
}

- (void)setShouldIgnoreLibraryChanges:(BOOL)a3
{
  self->_shouldIgnoreLibraryChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_collectionsFetchResult, 0);
}

+ (id)_generatePredicateForAssetTypesToInclude:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
    return 0;
  v3 = a3;
  if ((~(_BYTE)a3 & 3) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(kind) == %d OR noindex:(kind) == %d"), 0, 1);
LABEL_4:
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(kindSubtype) != %d"), 100);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      v7 = (void *)MEMORY[0x1E0CB3528];
      v11[0] = v4;
      v11[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v9;
    }
    else
    {
      v4 = v5;
    }

    return v4;
  }
  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(kind) == %d OR noindex:(playbackStyle) == %d"), 1, 5);
      goto LABEL_4;
    }
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(kind) == %d AND noindex:(playbackStyle) != %d"), 0, 5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((v3 & 2) != 0)
    goto LABEL_5;
  return v4;
}

@end
