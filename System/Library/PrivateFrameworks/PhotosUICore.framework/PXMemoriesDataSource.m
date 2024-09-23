@implementation PXMemoriesDataSource

- (id)sectionedObjectReferenceForMemoryUUID:(id)a3
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesDataSource.m"), 25, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMemoriesDataSource sectionedObjectReferenceForMemoryUUID:]", v8);

  abort();
}

@end
