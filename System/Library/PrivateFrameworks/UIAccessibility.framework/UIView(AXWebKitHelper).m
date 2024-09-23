@implementation UIView(AXWebKitHelper)

- (double)accessibilityConvertPointFromSceneReferenceCoordinates:()AXWebKitHelper
{
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend(a1, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = AXConvertFromDisplayPointToWindowPoint(v6, a2, a3);
  v9 = v8;

  objc_msgSend(a1, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convertPoint:fromView:", v10, v7, v9);
  v12 = v11;

  return v12;
}

- (uint64_t)accessibilityConvertRectToSceneReferenceCoordinates:()AXWebKitHelper
{
  CGRect v7;

  v7 = UIAccessibilityConvertFrameToScreenCoordinates(*(CGRect *)&a2, a1);
  return -[UIView _accessibilityConvertSystemBoundedScreenRectToContextSpace:](a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

@end
