@implementation UILayoutGuide(SearchUIAutoLayout)

- (uint64_t)searchui_view
{
  return 0;
}

- (uint64_t)searchui_isContainedByItem:()SearchUIAutoLayout
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "owningView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchui_view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isDescendantOfView:", v6);
  return v7;
}

@end
