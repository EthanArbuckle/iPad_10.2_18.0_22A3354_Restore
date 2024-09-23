@implementation PXPeoplePickerDataSource

- (PXPeoplePickerDataSource)initWithFetchResult:(id)a3 disabledLocalIdentifiers:(id)a4 allSelectedLocalIdentifiers:(id)a5 newlySelectedObjectIDs:(id)a6 newlyDeselectedObjectIDs:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PXPeoplePickerDataSource *v18;
  PXPeoplePickerDataSource *v19;
  uint64_t v20;
  NSArray *disabledLocalIdentifiers;
  uint64_t v22;
  NSArray *allSelectedLocalIdentifiers;
  uint64_t v24;
  NSOrderedSet *newlySelectedObjectIDs;
  uint64_t v26;
  NSOrderedSet *newlyDeselectedObjectIDs;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PXPeoplePickerDataSource;
  v18 = -[PXPeoplePickerDataSource init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->__fetchResult, a3);
    v20 = objc_msgSend(v14, "copy");
    disabledLocalIdentifiers = v19->_disabledLocalIdentifiers;
    v19->_disabledLocalIdentifiers = (NSArray *)v20;

    v22 = objc_msgSend(v15, "copy");
    allSelectedLocalIdentifiers = v19->_allSelectedLocalIdentifiers;
    v19->_allSelectedLocalIdentifiers = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    newlySelectedObjectIDs = v19->_newlySelectedObjectIDs;
    v19->_newlySelectedObjectIDs = (NSOrderedSet *)v24;

    v26 = objc_msgSend(v17, "copy");
    newlyDeselectedObjectIDs = v19->_newlyDeselectedObjectIDs;
    v19->_newlyDeselectedObjectIDs = (NSOrderedSet *)v26;

  }
  return v19;
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
  -[PXPeoplePickerDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 48, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self objectAtIndexPath:indexPath]"), v10);
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 48, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self objectAtIndexPath:indexPath]"), v10, v12);

    goto LABEL_6;
  }
  return v6;
}

- (BOOL)isItemDisabledAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;
  _OWORD v17[2];

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPeoplePickerDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

  }
  v9 = *(_OWORD *)&a3->item;
  v17[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v17[1] = v9;
  -[PXPeoplePickerDataSource personAtItemIndexPath:](self, "personAtItemIndexPath:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerDataSource disabledLocalIdentifiers](self, "disabledLocalIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  return v13;
}

- (id)dataSourceUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  PXPeoplePickerDataSource *v16;
  void *v17;
  id v18;
  PXPeoplePickerDataSource *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v6 = a3;
  -[PXPeoplePickerDataSource _fetchResult](self, "_fetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeDetailsForFetchResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v19 = self;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v8, "fetchResultAfterChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerDataSource allSelectedLocalIdentifiers](self, "allSelectedLocalIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __70__PXPeoplePickerDataSource_dataSourceUpdatedWithChange_changeDetails___block_invoke;
  v24 = &unk_1E5119AC8;
  v25 = v12;
  v26 = v13;
  v14 = v13;
  v15 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v21);
  v16 = [PXPeoplePickerDataSource alloc];
  -[PXPeoplePickerDataSource disabledLocalIdentifiers](self, "disabledLocalIdentifiers", v21, v22, v23, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v19 = -[PXPeoplePickerDataSource initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:](v16, "initWithFetchResult:disabledLocalIdentifiers:allSelectedLocalIdentifiers:newlySelectedObjectIDs:newlyDeselectedObjectIDs:", v9, v17, v15, v18, v14);

  if (a4)
  {
LABEL_3:
    objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:

  return v19;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PXPeoplePickerDataSource _fetchResult](self, "_fetchResult", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPeoplePickerDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

  }
  -[PXPeoplePickerDataSource _fetchResult](self, "_fetchResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3->item);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  PXSimpleIndexPath *result;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference"));

    v27 = 0u;
    v28 = 0u;
    v9 = *(_QWORD *)off_1E50B7E98;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(objectReference.indexPath)"));

    goto LABEL_10;
  }
  objc_msgSend(v7, "indexPath");
  v9 = *(_QWORD *)off_1E50B7E98;
  if ((_QWORD)v27 == *(_QWORD *)off_1E50B7E98
    || (_QWORD)v28 == 0x7FFFFFFFFFFFFFFFLL
    || *((_QWORD *)&v28 + 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_18;
  }
LABEL_10:
  v25 = 0u;
  v26 = 0u;
  v24.receiver = self;
  v24.super_class = (Class)PXPeoplePickerDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v24, sel_indexPathForObjectReference_, v8);
  if ((_QWORD)v25 != v9)
    goto LABEL_16;
  objc_msgSend(v8, "itemObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 113, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v21);
LABEL_21:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPeoplePickerDataSourceManager.m"), 113, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v21, v23);

    goto LABEL_21;
  }
LABEL_13:
  -[PXPeoplePickerDataSource _fetchResult](self, "_fetchResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfObject:", v12);

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = (unint64_t)-[PXPeoplePickerDataSource identifier](self, "identifier");
    *(_QWORD *)&v26 = v14;
    *((_QWORD *)&v26 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_16:
  v15 = v26;
  *(_OWORD *)&retstr->dataSourceIdentifier = v25;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (NSArray)disabledLocalIdentifiers
{
  return self->_disabledLocalIdentifiers;
}

- (NSArray)allSelectedLocalIdentifiers
{
  return self->_allSelectedLocalIdentifiers;
}

- (NSOrderedSet)newlySelectedObjectIDs
{
  return self->_newlySelectedObjectIDs;
}

- (NSOrderedSet)newlyDeselectedObjectIDs
{
  return self->_newlyDeselectedObjectIDs;
}

- (PHFetchResult)_fetchResult
{
  return self->__fetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fetchResult, 0);
  objc_storeStrong((id *)&self->_newlyDeselectedObjectIDs, 0);
  objc_storeStrong((id *)&self->_newlySelectedObjectIDs, 0);
  objc_storeStrong((id *)&self->_allSelectedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_disabledLocalIdentifiers, 0);
}

void __70__PXPeoplePickerDataSource_dataSourceUpdatedWithChange_changeDetails___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "objectID");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
}

@end
