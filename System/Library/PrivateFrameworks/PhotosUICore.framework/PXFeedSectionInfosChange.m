@implementation PXFeedSectionInfosChange

- (BOOL)shouldReload
{
  return self->_shouldReload;
}

- (void)setShouldReload:(BOOL)a3
{
  self->_shouldReload = a3;
}

- (NSIndexSet)deletedIndexes
{
  return self->_deletedIndexes;
}

- (void)setDeletedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_deletedIndexes, a3);
}

- (NSIndexSet)insertedIndexes
{
  return self->_insertedIndexes;
}

- (void)setInsertedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_insertedIndexes, a3);
}

- (NSIndexSet)updatedIndexes
{
  return self->_updatedIndexes;
}

- (void)setUpdatedIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_updatedIndexes, a3);
}

- (NSSet)sectionInfosWithCommentChanges
{
  return self->_sectionInfosWithCommentChanges;
}

- (void)setSectionInfosWithCommentChanges:(id)a3
{
  objc_storeStrong((id *)&self->_sectionInfosWithCommentChanges, a3);
}

- (NSSet)updatedAssets
{
  return self->_updatedAssets;
}

- (void)setUpdatedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_updatedAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAssets, 0);
  objc_storeStrong((id *)&self->_sectionInfosWithCommentChanges, 0);
  objc_storeStrong((id *)&self->_updatedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
}

@end
