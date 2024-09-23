@implementation PXSharedLibraryPhotoKitDataSource

- (PXSharedLibraryPhotoKitDataSource)initWithFetchResult:(id)a3
{
  id v6;
  PXSharedLibraryPhotoKitDataSource *v7;
  PXSharedLibraryPhotoKitDataSource *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryPhotoKitDataSource;
  v7 = -[PXSharedLibraryPhotoKitDataSource init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_fetchResult, a3);

  return v8;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return -[PHFetchResult count](self->_fetchResult, "count", a3);
}

- (id)sharedLibraryAtItemIndexPath:(PXSimpleIndexPath *)a3
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
  -[PXSharedLibraryPhotoKitDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 64, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self objectAtIndexPath:indexPath]"), v10);
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 64, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self objectAtIndexPath:indexPath]"), v10, v12);

    goto LABEL_6;
  }
  return v6;
}

- (id)dataSourceUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  PXSharedLibraryPhotoKitDataSource *v8;

  objc_msgSend(a3, "changeDetailsForFetchResult:", self->_fetchResult);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "fetchResultAfterChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXSharedLibraryPhotoKitDataSource initWithFetchResult:]([PXSharedLibraryPhotoKitDataSource alloc], "initWithFetchResult:", v7);

    if (a4 && v8)
    {
      objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v9;
  PXSharedLibraryPhotoKit *v10;
  void *v12;
  void *v13;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXSharedLibraryPhotoKitDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

  }
  -[PHFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXSharedLibraryPhotoKit initWithLibraryScope:]([PXSharedLibraryPhotoKit alloc], "initWithLibraryScope:", v9);

  return v10;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  __int128 v16;
  PXSimpleIndexPath *result;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference"));

    v28 = 0u;
    v29 = 0u;
    v9 = *(_QWORD *)off_1E50B7E98;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(objectReference.indexPath)"));

    goto LABEL_10;
  }
  objc_msgSend(v7, "indexPath");
  v9 = *(_QWORD *)off_1E50B7E98;
  if ((_QWORD)v28 == *(_QWORD *)off_1E50B7E98
    || (_QWORD)v29 == 0x7FFFFFFFFFFFFFFFLL
    || *((_QWORD *)&v29 + 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_18;
  }
LABEL_10:
  v26 = 0u;
  v27 = 0u;
  v25.receiver = self;
  v25.super_class = (Class)PXSharedLibraryPhotoKitDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v25, sel_indexPathForObjectReference_, v8);
  if ((_QWORD)v26 != v9)
    goto LABEL_16;
  objc_msgSend(v8, "itemObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 109, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v22);
LABEL_21:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 109, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v22, v24);

    goto LABEL_21;
  }
LABEL_13:
  objc_msgSend(v12, "libraryScope");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PHFetchResult indexOfObject:](self->_fetchResult, "indexOfObject:", v13);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v14;
    v26 = (unint64_t)-[PXSharedLibraryPhotoKitDataSource identifier](self, "identifier");
    *(_QWORD *)&v27 = v15;
    *((_QWORD *)&v27 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_16:
  v16 = v27;
  *(_OWORD *)&retstr->dataSourceIdentifier = v26;
  *(_OWORD *)&retstr->item = v16;

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
