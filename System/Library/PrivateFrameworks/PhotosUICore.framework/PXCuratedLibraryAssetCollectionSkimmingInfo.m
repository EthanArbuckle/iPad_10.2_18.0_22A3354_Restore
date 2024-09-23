@implementation PXCuratedLibraryAssetCollectionSkimmingInfo

- (BOOL)slideshowStarted
{
  return self->_slideshowStarted;
}

- (void)setSlideshowStarted:(BOOL)a3
{
  self->_slideshowStarted = a3;
}

- (BOOL)touchInteractionStarted
{
  return self->_touchInteractionStarted;
}

- (void)setTouchInteractionStarted:(BOOL)a3
{
  self->_touchInteractionStarted = a3;
}

- (PXDisplayCollection)parentAssetCollection
{
  return self->_parentAssetCollection;
}

- (void)setParentAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_parentAssetCollection, a3);
}

- (int64_t)childCollectionsZoomLevel
{
  return self->_childCollectionsZoomLevel;
}

- (void)setChildCollectionsZoomLevel:(int64_t)a3
{
  self->_childCollectionsZoomLevel = a3;
}

- (PXIndexPathSet)childCollectionsIndexes
{
  return self->_childCollectionsIndexes;
}

- (void)setChildCollectionsIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_childCollectionsIndexes, a3);
}

- (PXSimpleIndexPath)currentChildCollectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[1].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setCurrentChildCollectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_currentChildCollectionIndexPath.item = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_currentChildCollectionIndexPath.dataSourceIdentifier = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childCollectionsIndexes, 0);
  objc_storeStrong((id *)&self->_parentAssetCollection, 0);
}

@end
