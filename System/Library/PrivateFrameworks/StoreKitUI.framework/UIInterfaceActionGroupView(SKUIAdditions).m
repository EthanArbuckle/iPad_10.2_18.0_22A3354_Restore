@implementation UIInterfaceActionGroupView(SKUIAdditions)

- (uint64_t)newActionSeparatorView
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupViewState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "newActionSeparatorViewForGroupViewState:", v4);

  return v5;
}

@end
