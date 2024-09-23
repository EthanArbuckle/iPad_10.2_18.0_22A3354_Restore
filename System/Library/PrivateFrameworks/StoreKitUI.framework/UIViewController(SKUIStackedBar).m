@implementation UIViewController(SKUIStackedBar)

- (uint64_t)SKUIStackedBar
{
  return 0;
}

- (double)SKUIStackedBarSplit
{
  void *v1;
  float v2;
  double v3;

  objc_getAssociatedObject(a1, "com.apple.StoreKitUI.stackedBarSplit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)setSKUIStackedBarSplit:()SKUIStackedBar
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "com.apple.StoreKitUI.stackedBarSplit", v2, (void *)1);

}

@end
