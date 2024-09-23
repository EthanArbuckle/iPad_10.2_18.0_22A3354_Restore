@implementation PXCollectionsDataSource

- (id)indexPathForCollection:(id)a3
{
  return 0;
}

- (id)collectionAtIndexPath:(id)a3
{
  return 0;
}

- (id)collectionListForSection:(int64_t)a3
{
  return 0;
}

- (int64_t)countForCollection:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (id)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_content, 0);
}

@end
