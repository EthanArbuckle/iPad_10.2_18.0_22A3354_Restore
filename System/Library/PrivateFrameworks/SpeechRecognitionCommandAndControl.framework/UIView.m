@implementation UIView

uint64_t __38__UIView_CACUIAdditions__cac_snapshot__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "bounds");
  return objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

@end
