@implementation UIScrollView(PKUIUtilities)

- (void)pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:()PKUIUtilities
{
  double v4;
  double v5;
  double v6;
  id v7;

  if (a3)
  {
    v7 = a3;
    objc_msgSend(a1, "adjustedContentInset");
    v5 = v4;
    objc_msgSend(a1, "contentOffset");
    objc_msgSend(v7, "_setManualScrollEdgeAppearanceProgress:", fmin(fmax((v5 + v6) * 0.125, 0.0), 1.0));

  }
}

- (double)pkui_naturalRestingBounds
{
  double v2;
  double v3;

  objc_msgSend(a1, "adjustedContentInset");
  v3 = -v2;
  objc_msgSend(a1, "bounds");
  return v3;
}

@end
