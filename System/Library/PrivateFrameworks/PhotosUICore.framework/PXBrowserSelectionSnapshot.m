@implementation PXBrowserSelectionSnapshot

- (int64_t)estimatedAssetCount
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 120, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBrowserSelectionSnapshot estimatedAssetCount]", v6);

  abort();
}

- (int64_t)assetCount
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 124, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBrowserSelectionSnapshot assetCount]", v6);

  abort();
}

- (int64_t)mediaType
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 128, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBrowserSelectionSnapshot mediaType]", v6);

  abort();
}

- (id)assetReferenceAtIndex:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 132, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBrowserSelectionSnapshot assetReferenceAtIndex:]", v7);

  abort();
}

- (id)displayAssetAtIndex:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 136, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBrowserSelectionSnapshot displayAssetAtIndex:]", v7);

  abort();
}

- (int64_t)indexOfAssetReference:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 140, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBrowserSelectionSnapshot indexOfAssetReference:]", v8);

  abort();
}

- (int64_t)estimatedModelObjectsCount
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 144, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBrowserSelectionSnapshot estimatedModelObjectsCount]", v6);

  abort();
}

- (NSArray)modelObjects
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 148, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBrowserSelectionSnapshot modelObjects]", v6);

  abort();
}

+ (id)selectionWithIndexPaths:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  _PXBrowserDataSourceSelection *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_PXBrowserDataSourceSelection initWithIndexPaths:dataSource:]([_PXBrowserDataSourceSelection alloc], "initWithIndexPaths:dataSource:", v6, v5);

  return v7;
}

@end
