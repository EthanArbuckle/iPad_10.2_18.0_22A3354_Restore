@implementation PXTransientCollectionsDataSource

- (PXTransientCollectionsDataSource)initWithFetchResult:(id)a3
{
  id v5;
  PXTransientCollectionsDataSource *v6;
  PXTransientCollectionsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXTransientCollectionsDataSource;
  v6 = -[PXTransientCollectionsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fetchResult, a3);

  return v7;
}

- (PXTransientCollectionsDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTransientCollectionsDataSource.m"), 32, CFSTR("%s is not available as initializer"), "-[PXTransientCollectionsDataSource init]");

  abort();
}

- (id)indexPathForCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[PXTransientCollectionsDataSource fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
}

- (id)collectionAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (objc_msgSend(v5, "section"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTransientCollectionsDataSource.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.section == 0"));

  }
  -[PXTransientCollectionsDataSource fetchResult](self, "fetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)collectionListForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v10;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTransientCollectionsDataSource.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == 0"));

  }
  v4 = (void *)MEMORY[0x1E0CD14E0];
  -[PXTransientCollectionsDataSource fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientCollectionListWithCollections:title:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PXTransientCollectionsDataSource fetchResult](self, "fetchResult", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;
  PXSimpleIndexPath v7;

  v7 = *a3;
  PXIndexPathFromSimpleIndexPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTransientCollectionsDataSource collectionAtIndexPath:](self, "collectionAtIndexPath:", v4, *(_OWORD *)&v7.dataSourceIdentifier, *(_OWORD *)&v7.item);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t section;
  void *v11;
  void *v12;
  PXSimpleIndexPath v13;

  section = a3->section;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL
    || section != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *a3;
    PXSimpleIndexPathDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTransientCollectionsDataSource.m"), 75, CFSTR("%@ invalid indexPath:%@"), self, v12, *(_OWORD *)&v13.dataSourceIdentifier, *(_OWORD *)&v13.item);

    abort();
  }
  return -[PXTransientCollectionsDataSource fetchResult](self, "fetchResult");
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
