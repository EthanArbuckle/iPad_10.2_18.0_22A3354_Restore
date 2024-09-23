@implementation UIView(CACZoomExtras)

- (double)zw_boundsCenter
{
  double MidX;
  CGRect v4;
  CGRect v5;

  objc_msgSend(a1, "bounds");
  MidX = CGRectGetMidX(v4);
  objc_msgSend(a1, "bounds");
  CGRectGetMidY(v5);
  return MidX;
}

- (double)zw_convertRectToScreenCoordinates:()CACZoomExtras
{
  void *v10;
  void *v11;
  double v12;

  objc_msgSend(a1, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "convertRect:fromView:", a1, a2, a3, a4, a5);
    objc_msgSend(v11, "_convertRectToSceneReferenceSpace:");
    a2 = v12;
  }

  return a2;
}

- (double)zw_convertRectFromScreenCoordinates:()CACZoomExtras
{
  void *v10;
  void *v11;
  double v12;

  objc_msgSend(a1, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_convertRectFromSceneReferenceSpace:", a2, a3, a4, a5);
    objc_msgSend(v11, "convertRect:toView:", a1);
    a2 = v12;
  }

  return a2;
}

- (double)zw_convertPointToScreenCoordinates:()CACZoomExtras
{
  void *v6;
  void *v7;
  double v8;

  objc_msgSend(a1, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "convertPoint:fromView:", a1, a2, a3);
    objc_msgSend(v7, "_convertPointToSceneReferenceSpace:");
    a2 = v8;
  }

  return a2;
}

- (double)zw_convertPointFromScreenCoordinates:()CACZoomExtras
{
  void *v6;
  void *v7;
  double v8;

  objc_msgSend(a1, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_convertPointFromSceneReferenceSpace:", a2, a3);
    objc_msgSend(v7, "convertPoint:toView:", a1);
    a2 = v8;
  }

  return a2;
}

- (uint64_t)zw_convertBoundsToScreenCoordinates
{
  objc_msgSend(a1, "bounds");
  return objc_msgSend(a1, "zw_convertRectToScreenCoordinates:");
}

@end
