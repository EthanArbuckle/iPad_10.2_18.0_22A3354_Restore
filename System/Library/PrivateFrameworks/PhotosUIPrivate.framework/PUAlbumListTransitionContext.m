@implementation PUAlbumListTransitionContext

- (PLAssetContainer)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (PHCollection)phCollection
{
  return self->_phCollection;
}

- (void)setPhCollection:(id)a3
{
  objc_storeStrong((id *)&self->_phCollection, a3);
}

- (NSIndexPath)keyItemIndexPath
{
  return self->_keyItemIndexPath;
}

- (void)setKeyItemIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_keyItemIndexPath, a3);
}

- (PUPhotoDecoration)photoDecoration
{
  return self->_photoDecoration;
}

- (void)setPhotoDecoration:(id)a3
{
  objc_storeStrong((id *)&self->_photoDecoration, a3);
}

- (BOOL)usesContentOffsetAutoAdjust
{
  return self->_usesContentOffsetAutoAdjust;
}

- (void)setUsesContentOffsetAutoAdjust:(BOOL)a3
{
  self->_usesContentOffsetAutoAdjust = a3;
}

- (UICollectionViewTransitionLayout)transitionLayout
{
  return self->_transitionLayout;
}

- (void)setTransitionLayout:(id)a3
{
  objc_storeStrong((id *)&self->_transitionLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionLayout, 0);
  objc_storeStrong((id *)&self->_photoDecoration, 0);
  objc_storeStrong((id *)&self->_keyItemIndexPath, 0);
  objc_storeStrong((id *)&self->_phCollection, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
