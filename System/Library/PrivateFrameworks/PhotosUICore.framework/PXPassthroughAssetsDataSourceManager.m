@implementation PXPassthroughAssetsDataSourceManager

- (PXPassthroughAssetsDataSourceManager)initWithDataSource:(id)a3
{
  id v4;
  PXPassthroughAssetsDataSourceManager *v5;
  PXPassthroughAssetsDataSourceManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPassthroughAssetsDataSourceManager;
  v5 = -[PXSectionedDataSourceManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PXPassthroughAssetsDataSourceManager setDataSource:changeDetails:](v5, "setDataSource:changeDetails:", v4, 0);

  return v6;
}

- (PXPassthroughAssetsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPassthroughAssetsDataSourceManager.m"), 23, CFSTR("%s is not available as initializer"), "-[PXPassthroughAssetsDataSourceManager init]");

  abort();
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a4, a3);
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPassthroughAssetsDataSourceManager;
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](&v4, sel_setDataSource_changeDetails_, a3, a4);
}

@end
