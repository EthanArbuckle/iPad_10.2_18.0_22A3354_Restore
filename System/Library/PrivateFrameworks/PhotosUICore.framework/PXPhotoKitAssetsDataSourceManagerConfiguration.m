@implementation PXPhotoKitAssetsDataSourceManagerConfiguration

- (PHFetchResult)existingAssetsFetchResult
{
  return self->_existingAssetsFetchResult;
}

- (void)setExistingAssetsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_existingAssetsFetchResult, a3);
}

- (PHFetchResult)existingKeyAssetsFetchResult
{
  return self->_existingKeyAssetsFetchResult;
}

- (void)setExistingKeyAssetsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_existingKeyAssetsFetchResult, a3);
}

- (NSArray)fetchPropertySets
{
  return self->_fetchPropertySets;
}

- (void)setFetchPropertySets:(id)a3
{
  objc_storeStrong((id *)&self->_fetchPropertySets, a3);
}

- (NSPredicate)basePredicate
{
  return self->_basePredicate;
}

- (void)setBasePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_basePredicate, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (BOOL)ignoreSharedLibraryFilters
{
  return self->_ignoreSharedLibraryFilters;
}

- (void)setIgnoreSharedLibraryFilters:(BOOL)a3
{
  self->_ignoreSharedLibraryFilters = a3;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (void)setReverseSortOrder:(BOOL)a3
{
  self->_reverseSortOrder = a3;
}

- (BOOL)canIncludeUnsavedSyndicatedAssets
{
  return self->_canIncludeUnsavedSyndicatedAssets;
}

- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  self->_canIncludeUnsavedSyndicatedAssets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePredicate, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_existingKeyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_existingAssetsFetchResult, 0);
}

@end
