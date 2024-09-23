@implementation PUPhotosSharingTransitionContext

- (PHAssetCollectionDataSource)assetCollectionsDataSource
{
  return self->_assetCollectionsDataSource;
}

- (void)setAssetCollectionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionsDataSource, a3);
}

- (NSIndexPath)keyAssetIndexPath
{
  return self->_keyAssetIndexPath;
}

- (void)setKeyAssetIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetIndexPath, 0);
  objc_storeStrong((id *)&self->_assetCollectionsDataSource, 0);
}

@end
