@implementation PXSharedLibraryDataSource

- (id)sharedLibraryAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryDataSource.m"), 35, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXSharedLibraryDataSource sharedLibraryAtItemIndexPath:]", v7);

  abort();
}

@end
