@implementation UICollectionViewCell(AccessibilityBridging)

- (uint64_t)_accessibilityScrollToVisible
{
  NSClassFromString(CFSTR("_UICalendarDateViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "ttriAccessibilityAdjustScrollOffsetForFocus");
  else
    return objc_msgSend(a1, "_accessibilityBaseScrollToVisible");
}

- (uint64_t)ttriAccessibilityAdjustScrollOffsetForFocus
{
  void *v2;
  void *v3;
  BOOL v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a1, "ttriAccessibilityAXOutermostContainingViewOfType:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ttriAccessibilityAXOutermostContainingViewOfType:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    objc_msgSend(a1, "bounds");
    objc_msgSend(a1, "convertPoint:toView:", v3);
    v6 = v5;
    objc_msgSend(v2, "contentOffset");
    v8 = v7;
    objc_msgSend(v3, "frame");
    v10 = v6 + v9;
    objc_msgSend(v2, "adjustedContentInset");
    objc_msgSend(v2, "setContentOffset:animated:", 1, v8, v10 - v11);
  }

  return 0;
}

- (id)ttriAccessibilityAXOutermostContainingViewOfType:()AccessibilityBridging
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    do
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v2;

        v3 = v4;
      }
      objc_msgSend(v2, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
