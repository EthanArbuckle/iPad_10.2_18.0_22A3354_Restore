@implementation PXFetchResultDataSource

- (PXFetchResultDataSource)initWithFetchResult:(id)a3
{
  id v5;
  PXFetchResultDataSource *v6;
  PXFetchResultDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFetchResultDataSource;
  v6 = -[PXFetchResultDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fetchResult, a3);

  return v7;
}

- (PXFetchResultDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultDataSource.m"), 27, CFSTR("%s is not available as initializer"), "-[PXFetchResultDataSource init]");

  abort();
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  int64_t v5;
  void *v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultDataSource.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == 0"));

  }
  -[PXFetchResultDataSource fetchResult](self, "fetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t item;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultDataSource.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

    dataSourceIdentifier = a3->dataSourceIdentifier;
  }
  if (dataSourceIdentifier != -[PXFetchResultDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultDataSource.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->section)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultDataSource.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.section == 0"));

  }
  item = a3->item;
  -[PXFetchResultDataSource fetchResult](self, "fetchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", item);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v10;
  void *v11;
  void *v12;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultDataSource.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsSection(indexPath)"));

    dataSourceIdentifier = a3->dataSourceIdentifier;
  }
  if (dataSourceIdentifier != -[PXFetchResultDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultDataSource.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->section)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFetchResultDataSource.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.section == 0"));

  }
  return -[PXFetchResultDataSource fetchResult](self, "fetchResult");
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
