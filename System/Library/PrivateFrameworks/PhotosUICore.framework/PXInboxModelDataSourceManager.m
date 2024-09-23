@implementation PXInboxModelDataSourceManager

- (PXInboxProviderSource)providerSource
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXInboxModelDataSourceManager.m"), 20, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXInboxModelDataSourceManager providerSource]", v6);

  abort();
}

@end
