@implementation PXNavigationListDataSectionConfiguration

- (PXNavigationListDataSectionConfiguration)initWithCollectionList:(id)a3
{
  id v5;
  PXNavigationListDataSectionConfiguration *v6;
  PXNavigationListDataSectionConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListDataSectionConfiguration;
  v6 = -[PXNavigationListDataSectionConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collectionList, a3);

  return v7;
}

- (PXNavigationListDataSectionConfiguration)initWithCollectionsFetchResult:(id)a3
{
  id v5;
  PXNavigationListDataSectionConfiguration *v6;
  PXNavigationListDataSectionConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListDataSectionConfiguration;
  v6 = -[PXNavigationListDataSectionConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collectionsFetchResult, a3);

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PHCollectionList localizedTitle](self->_collectionList, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (PHFetchResult)collectionsFetchResult
{
  return self->_collectionsFetchResult;
}

- (BOOL)emptyCollectionsHidden
{
  return self->_emptyCollectionsHidden;
}

- (void)setEmptyCollectionsHidden:(BOOL)a3
{
  self->_emptyCollectionsHidden = a3;
}

- (BOOL)showSyncedFromMacAlbums
{
  return self->_showSyncedFromMacAlbums;
}

- (void)setShowSyncedFromMacAlbums:(BOOL)a3
{
  self->_showSyncedFromMacAlbums = a3;
}

- (BOOL)includeKeyAssetFetches
{
  return self->_includeKeyAssetFetches;
}

- (void)setIncludeKeyAssetFetches:(BOOL)a3
{
  self->_includeKeyAssetFetches = a3;
}

- (BOOL)includeUserSmartAlbums
{
  return self->_includeUserSmartAlbums;
}

- (void)setIncludeUserSmartAlbums:(BOOL)a3
{
  self->_includeUserSmartAlbums = a3;
}

- (BOOL)hideHiddenAlbum
{
  return self->_hideHiddenAlbum;
}

- (void)setHideHiddenAlbum:(BOOL)a3
{
  self->_hideHiddenAlbum = a3;
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

- (BOOL)skipAssetCountFetches
{
  return self->_skipAssetCountFetches;
}

- (void)setSkipAssetCountFetches:(BOOL)a3
{
  self->_skipAssetCountFetches = a3;
}

- (BOOL)skipSyndicatedAssetFetches
{
  return self->_skipSyndicatedAssetFetches;
}

- (void)setSkipSyndicatedAssetFetches:(BOOL)a3
{
  self->_skipSyndicatedAssetFetches = a3;
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (void)setAssetsFilterPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_collectionsFetchResult, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
}

+ (id)configurationWithCollectionList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionList:", v4);

  return v5;
}

+ (id)configurationWithCollectionsFetchResult:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionsFetchResult:", v4);

  return v5;
}

@end
