@implementation PresentActivityPrototypeRowAction

uint64_t ___PresentActivityPrototypeRowAction_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  PXSharedAlbumsActivityEntryViewController *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(PXSharedAlbumsActivityEntryViewController);
  objc_msgSend(v3, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pushViewController:animated:", v4, 1);
  return 1;
}

@end
