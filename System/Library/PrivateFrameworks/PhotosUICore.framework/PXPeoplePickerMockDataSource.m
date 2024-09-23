@implementation PXPeoplePickerMockDataSource

- (PXPeoplePickerMockDataSource)initWithMocks:(id)a3
{
  id v6;
  PXPeoplePickerMockDataSource *v7;
  PXPeoplePickerMockDataSource *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mocks"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXPeoplePickerMockDataSource;
  v7 = -[PXPeoplePickerMockDataSource init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_mocks, a3);

  return v8;
}

- (id)personAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v5;
  void *v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _OWORD v13[2];

  v5 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v5;
  -[PXPeoplePickerMockDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 29, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self objectAtIndexPath:indexPath]"), v10);
LABEL_6:

    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 29, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self objectAtIndexPath:indexPath]"), v10, v12);

    goto LABEL_6;
  }
  return v6;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return -[NSArray count](self->_mocks, "count", a3);
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v10;
  void *v11;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPeoplePickerMockDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

  }
  return -[NSArray objectAtIndexedSubscript:](self->_mocks, "objectAtIndexedSubscript:");
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7;
  void *v8;
  void *v11;
  int64_t v12;
  PXSimpleIndexPath *result;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference"));

LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(objectReference.indexPath)"));

    goto LABEL_10;
  }
  objc_msgSend(v7, "indexPath");
  if (v22 == *(_QWORD *)off_1E50B7E98 || v23 == 0x7FFFFFFFFFFFFFFFLL || v24 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_16;
LABEL_10:
  objc_msgSend(v8, "itemObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 56, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v18, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 56, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v18);
  }

LABEL_12:
  v12 = -[NSArray indexOfObject:](self->_mocks, "indexOfObject:", v11);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPeoplePickerMockDataSourceManager.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != NSNotFound"));

  }
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  retstr->dataSourceIdentifier = -[PXPeoplePickerMockDataSource identifier](self, "identifier");
  retstr->section = 0;
  retstr->item = v12;
  retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mocks, 0);
}

@end
