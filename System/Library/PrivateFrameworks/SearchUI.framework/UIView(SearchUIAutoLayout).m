@implementation UIView(SearchUIAutoLayout)

- (BOOL)searchui_isContainedByItem:()SearchUIAutoLayout
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "searchui_view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "isDescendantOfView:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layoutMarginsGuide");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v8 == v4;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

@end
