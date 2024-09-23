@implementation UIScrollView(Bridge)

- (uint64_t)ts_isScrolling
{
  if ((objc_msgSend(a1, "isDragging") & 1) != 0
    || (objc_msgSend(a1, "isDecelerating") & 1) != 0
    || (objc_msgSend(a1, "_isAnimatingScrollTest") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "_isAnimatingScroll");
  }
}

- (uint64_t)ts_scrollToTop:()Bridge
{
  uint64_t v5;
  uint64_t v6;
  double v7;

  v5 = objc_msgSend(a1, "scrollsToTop");
  objc_msgSend(a1, "setScrollsToTop:", 1);
  v6 = objc_msgSend(a1, "_scrollToTopIfPossible:", a3);
  objc_msgSend(a1, "setScrollsToTop:", v5);
  if ((v6 & 1) == 0)
  {
    objc_msgSend(a1, "adjustedContentInset");
    objc_msgSend(a1, "setContentOffset:animated:", a3, 0.0, -v7);
  }
  return v6;
}

- (uint64_t)ts_scrollToTop:()Bridge dismissKeyboard:
{
  char v7;
  void *v8;

  if (objc_msgSend(MEMORY[0x1E0DC3938], "isOnScreen"))
  {
    v7 = objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode");
    if (a4)
    {
      if ((v7 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sendAction:to:from:forEvent:", sel_resignFirstResponder, 0, 0, 0);

      }
    }
  }
  return objc_msgSend(a1, "ts_scrollToTop:", a3);
}

- (uint64_t)ts_setIndicatorInsetAdjustmentBehaviorNever
{
  return objc_msgSend(a1, "_setIndicatorInsetAdjustmentBehavior:", 2);
}

- (uint64_t)ts_setIndicatorInsetAdjustmentBehaviorAutomatic
{
  return objc_msgSend(a1, "_setIndicatorInsetAdjustmentBehavior:", 0);
}

- (uint64_t)ts_setIndicatorInsetAdjustmentBehaviorAlways
{
  return objc_msgSend(a1, "_setIndicatorInsetAdjustmentBehavior:", 1);
}

@end
