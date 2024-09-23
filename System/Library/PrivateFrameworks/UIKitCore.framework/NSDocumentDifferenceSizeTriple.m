@implementation NSDocumentDifferenceSizeTriple

- (NSDocumentDifferenceSizeTriple)init
{
  NSDocumentDifferenceSizeTriple *v2;
  NSDocumentDifferenceSize *v3;
  NSDocumentDifferenceSize *dueToRecentChangesBeforeSaving;
  NSDocumentDifferenceSize *v5;
  NSDocumentDifferenceSize *betweenPreservingPreviousVersionAndSaving;
  NSDocumentDifferenceSize *v7;
  NSDocumentDifferenceSize *betweenPreviousSavingAndSaving;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSDocumentDifferenceSizeTriple;
  v2 = -[NSDocumentDifferenceSizeTriple init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NSDocumentDifferenceSize);
    dueToRecentChangesBeforeSaving = v2->_dueToRecentChangesBeforeSaving;
    v2->_dueToRecentChangesBeforeSaving = v3;

    v5 = objc_alloc_init(NSDocumentDifferenceSize);
    betweenPreservingPreviousVersionAndSaving = v2->_betweenPreservingPreviousVersionAndSaving;
    v2->_betweenPreservingPreviousVersionAndSaving = v5;

    v7 = objc_alloc_init(NSDocumentDifferenceSize);
    betweenPreviousSavingAndSaving = v2->_betweenPreviousSavingAndSaving;
    v2->_betweenPreviousSavingAndSaving = v7;

  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_dueToRecentChangesBeforeSaving=%@\n_betweenPreservingPreviousVersionAndSaving=%@\n_betweenPreviousSavingAndSaving=%@\n"), self->_dueToRecentChangesBeforeSaving, self->_betweenPreservingPreviousVersionAndSaving, self->_betweenPreviousSavingAndSaving);
}

- (NSDocumentDifferenceSize)dueToRecentChangesBeforeSaving
{
  return self->_dueToRecentChangesBeforeSaving;
}

- (NSDocumentDifferenceSize)betweenPreservingPreviousVersionAndSaving
{
  return self->_betweenPreservingPreviousVersionAndSaving;
}

- (NSDocumentDifferenceSize)betweenPreviousSavingAndSaving
{
  return self->_betweenPreviousSavingAndSaving;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betweenPreviousSavingAndSaving, 0);
  objc_storeStrong((id *)&self->_betweenPreservingPreviousVersionAndSaving, 0);
  objc_storeStrong((id *)&self->_dueToRecentChangesBeforeSaving, 0);
}

@end
