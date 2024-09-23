@implementation PXPhotosDetailsPurger

void __38___PXPhotosDetailsPurger_sharedPurger__block_invoke()
{
  _PXPhotosDetailsPurger *v0;
  void *v1;

  v0 = objc_alloc_init(_PXPhotosDetailsPurger);
  v1 = (void *)sharedPurger_sharedPurger;
  sharedPurger_sharedPurger = (uint64_t)v0;

}

@end
