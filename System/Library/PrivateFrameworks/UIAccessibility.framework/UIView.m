@implementation UIView

uint64_t __113__UIView_UIAccessibilityElementTraversal___accessibilityElementsAndContainersDescendingFromViews_options_sorted___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityAdditionalElementOrderedLast");
}

uint64_t __113__UIView_UIAccessibilityElementTraversal___accessibilityElementsAndContainersDescendingFromViews_options_sorted___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityAdditionalElementOrderedLast") ^ 1;
}

uint64_t __105__UIView_UIAccessibilityPrivate___accessibilityViewIsVisibleIgnoringAXOverrides_stoppingBeforeContainer___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  double v6;
  uint64_t v7;

  v5 = a2;
  if (*(id *)(a1 + 32) == v5)
  {
    v7 = 0;
    *a3 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((objc_msgSend(v5, "alpha"), v6 <= 0.0) || objc_msgSend(v5, "isHidden")))
    {
      v7 = objc_msgSend(v5, "_accessibilityOverridesInvisibility") ^ 1;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

@end
