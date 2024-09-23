@implementation PXImportConcurrentActionManager

void __50___PXImportConcurrentActionManager_sharedInstance__block_invoke()
{
  _PXImportConcurrentActionManager *v0;
  void *v1;

  v0 = objc_alloc_init(_PXImportConcurrentActionManager);
  v1 = (void *)sharedInstance_sharedInstance_36281;
  sharedInstance_sharedInstance_36281 = (uint64_t)v0;

}

@end
