@implementation UIScrollView(IC)

- (uint64_t)ic_shouldOptimizeForScrolling
{
  if ((objc_msgSend(a1, "isDragging") & 1) != 0 || (objc_msgSend(a1, "isDecelerating") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_isAnimatingScrollTest");
}

- (uint64_t)ic_scrollRectToVisible:()IC animated:consideringInsets:
{
  uint64_t result;
  CGRect v15;
  CGRect v16;

  if (!a8)
    return objc_msgSend(a1, "scrollRectToVisible:animated:", a7, a2, a3, a4, a5);
  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "verticalScrollIndicatorInsets");
  objc_msgSend(a1, "adjustedContentInset");
  UIEdgeInsetsMax();
  objc_msgSend(a1, "ic_visibleRectConsideringInsets:", 1);
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  result = CGRectContainsRect(v15, v16);
  if ((result & 1) == 0)
  {
    objc_msgSend(a1, "contentOffset");
    return objc_msgSend(a1, "setContentOffset:animated:", a7);
  }
  return result;
}

- (double)ic_visibleRectConsideringInsets:()IC
{
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "contentOffset");
  v6 = v5;
  objc_msgSend(a1, "bounds");
  if (a3)
  {
    objc_msgSend(a1, "verticalScrollIndicatorInsets");
    objc_msgSend(a1, "adjustedContentInset");
    UIEdgeInsetsMax();
    return v6 + v7;
  }
  return v6;
}

@end
