@implementation PXCNRecipientSearchDataSource

- (PXCNRecipientSearchDataSource)initWithSearchResults:(id)a3
{
  id v4;
  PXCNRecipientSearchDataSource *v5;
  uint64_t v6;
  NSArray *searchResults;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCNRecipientSearchDataSource;
  v5 = -[PXCNRecipientSearchDataSource init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    searchResults = v5->_searchResults;
    v5->_searchResults = (NSArray *)v6;

  }
  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return -[NSArray count](self->_searchResults, "count", a3);
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXCNRecipientSearchDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCNRecipientSearchDataSourceManager.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == [self identifier]"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)&a3->dataSourceIdentifier;
    v14 = *(_OWORD *)&a3->item;
    PXSimpleIndexPathDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCNRecipientSearchDataSourceManager.m"), 65, CFSTR("%@ invalid indexPath:%@"), self, v12, v13, v14);

    abort();
  }
  return -[NSArray objectAtIndexedSubscript:](self->_searchResults, "objectAtIndexedSubscript:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end
