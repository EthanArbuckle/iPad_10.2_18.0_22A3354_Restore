@implementation PXStackedDataSource

- (PXStackedDataSource)initWithDataSections:(id)a3
{
  id v5;
  PXStackedDataSource *v6;
  PXStackedDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStackedDataSource;
  v6 = -[PXStackedDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSections, a3);

  return v7;
}

- (PXStackedDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStackedDataSource.m"), 25, CFSTR("%s is not available as initializer"), "-[PXStackedDataSource init]");

  abort();
}

- (id)changeDetailsToDataSource:(id)a3 sectionChanges:(id)a4 itemChanges:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a4)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    v11 = objc_alloc((Class)off_1E50B4A18);
    v12 = -[PXStackedDataSource identifier](self, "identifier");
    v13 = objc_msgSend(v10, "identifier");

    v14 = (void *)objc_msgSend(v11, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v12, v13, v9, v8, 0);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXStackedDataSource dataSections](self, "dataSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PXStackedDataSource dataSections](self, "dataSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v6;
  void *v7;
  uint64_t v9;
  void *v11;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;

  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[PXStackedDataSource dataSections](self, "dataSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3->section);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
    goto LABEL_17;
  if (a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL && v6 != 0)
    {
      objc_msgSend(v6, "objectAtIndex:");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_OWORD *)&a3->dataSourceIdentifier;
    v16 = *(_OWORD *)&a3->item;
    PXSimpleIndexPathDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStackedDataSource.m"), 64, CFSTR("%@ unsupported indexPath:%@"), self, v14, v15, v16);

    abort();
  }
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL || v6 == 0)
    goto LABEL_17;
  objc_msgSend(v6, "outlineObject");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v11 = (void *)v9;

  return v11;
}

- (NSArray)dataSections
{
  return self->_dataSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSections, 0);
}

@end
