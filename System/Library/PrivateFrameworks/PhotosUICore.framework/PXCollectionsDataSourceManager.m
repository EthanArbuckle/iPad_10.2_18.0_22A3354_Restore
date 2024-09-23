@implementation PXCollectionsDataSourceManager

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCollectionsDataSourceManager;
  -[PXSectionedDataSourceManager registerChangeObserver:context:](&v4, sel_registerChangeObserver_context_, a3, a4);
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCollectionsDataSourceManager;
  -[PXSectionedDataSourceManager unregisterChangeObserver:context:](&v4, sel_unregisterChangeObserver_context_, a3, a4);
}

@end
