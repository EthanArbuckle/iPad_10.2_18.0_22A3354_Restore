@implementation WFComposeViewSizing

+ (double)moduleWidthForViewSize:(CGSize)a3 maximumContentWidth:(double)a4 maximumModuleWidth:(double)a5 traitCollection:(id)a6 safeAreaInsets:(UIEdgeInsets)a7
{
  double width;
  double v10;
  double v11;
  double v12;

  if (a4 <= 0.0 || a3.width <= a4)
    width = a3.width;
  else
    width = a4;
  objc_msgSend(a1, "moduleHorizontalInsetWithTraitCollection:safeAreaInsets:", a6, a7.top, a7.left, a7.bottom, a7.right);
  v12 = width - v10 - v11;
  if (v12 > a5 && a5 > 0.0)
    v12 = a5;
  return fmax(v12, 0.0);
}

+ (UIEdgeInsets)moduleHorizontalInsetWithTraitCollection:(id)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = a4.left + 20.0;
  v5 = a4.right + 20.0;
  v6 = 0.0;
  v7 = 0.0;
  result.right = v5;
  result.bottom = v7;
  result.left = v4;
  result.top = v6;
  return result;
}

+ (double)constrainMaximumContentWidth:(double)a3 toSize:(CGSize)a4 traitCollection:(id)a5
{
  double width;
  id v7;
  uint64_t v8;
  uint64_t v9;

  width = a4.width;
  v7 = a5;
  v8 = objc_msgSend(v7, "userInterfaceIdiom");
  if (width >= 1300.0)
  {
    v9 = v8;
    if (objc_msgSend(v7, "horizontalSizeClass") == 2)
      a3 = width * dbl_2268AB370[v9 == 1];
  }

  return a3;
}

+ (CGSize)drawerSizeFromParentSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 traitCollection:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a1, "sizeForRequestType:parentSize:safeAreaInsets:traitCollection:", 0, a5, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGSize)workflowViewSizeFromParentSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 traitCollection:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a1, "sizeForRequestType:parentSize:safeAreaInsets:traitCollection:", 1, a5, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGSize)sizeForRequestType:(unint64_t)a3 parentSize:(CGSize)a4 safeAreaInsets:(UIEdgeInsets)a5 traitCollection:(id)a6
{
  double right;
  double left;
  double height;
  double width;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  right = a5.right;
  left = a5.left;
  height = a4.height;
  width = a4.width;
  v11 = a4.width - a5.left - a5.right;
  v12 = a6;
  v13 = dbl_2268AB380[objc_msgSend(v12, "userInterfaceIdiom") == 1];
  v14 = 320.0;
  if (v11 < 700.0)
    v15 = 0.0;
  else
    v15 = 320.0;
  if (v11 >= 1000.0)
    v14 = 360.0;
  if (v11 >= 1300.0)
    v14 = 389.0;
  v16 = ceil(v11 * v13);
  if (v16 >= v14)
    v16 = v14;
  if (v16 >= v15)
    v17 = v16;
  else
    v17 = v15;
  v18 = objc_msgSend(v12, "horizontalSizeClass");

  if (v18 == 1)
    v19 = width;
  else
    v19 = v17;
  if (a3)
  {
    v20 = v11 - v17;
    if (v18 == 1)
      v20 = width;
    if (a3 == 1)
      v19 = v20;
    else
      v19 = 0.0;
  }
  if (v19 < width)
  {
    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "shouldReverseLayoutDirection");

    if (v22)
      v23 = left;
    else
      v23 = right;
    v19 = v19 + v23;
  }
  if (v19 <= 0.0)
    v24 = 0.0;
  else
    v24 = height;
  v25 = v19;
  result.height = v24;
  result.width = v25;
  return result;
}

@end
