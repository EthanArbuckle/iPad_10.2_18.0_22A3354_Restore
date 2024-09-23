@implementation UIView(TSAAdditions)

- (uint64_t)p_translateToView:()TSAAdditions above:siblingView:shouldScale:
{
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;

  objc_msgSend(a1, "center");
  objc_msgSend((id)objc_msgSend(a1, "superview"), "convertPoint:toView:", a3, v11, v12);
  objc_msgSend(a1, "setCenter:");
  if (a6)
  {
    objc_msgSend((id)objc_msgSend(a1, "superview"), "convertRect:toView:", a3, 0.0, 0.0, 1.0, 1.0);
    v14 = v13;
    v16 = v15;
    if (a1)
      objc_msgSend(a1, "transform");
    else
      memset(&v19, 0, sizeof(v19));
    CGAffineTransformScale(&v20, &v19, v14, v16);
    v18 = v20;
    objc_msgSend(a1, "setTransform:", &v18);
  }
  if (!a5)
    return objc_msgSend(a3, "addSubview:", a1);
  if (a4)
    return objc_msgSend(a3, "insertSubview:aboveSubview:", a1, a5);
  return objc_msgSend(a3, "insertSubview:belowSubview:", a1, a5);
}

- (uint64_t)translateAndScaleToView:()TSAAdditions
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 0, 0, 1);
}

- (uint64_t)translateAndScaleToView:()TSAAdditions aboveSubview:
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 1, a4, 1);
}

- (uint64_t)translateAndScaleToView:()TSAAdditions belowSubview:
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 0, a4, 1);
}

- (uint64_t)translateToView:()TSAAdditions
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 0, 0, 0);
}

- (uint64_t)translateToView:()TSAAdditions aboveSubview:
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 1, a4, 0);
}

- (uint64_t)translateToView:()TSAAdditions belowSubview:
{
  return objc_msgSend(a1, "p_translateToView:above:siblingView:shouldScale:", a3, 0, a4, 0);
}

- (void)childAtPoint:()TSAAdditions
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGPoint v18;
  CGRect v19;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_msgSend(a1, "subviews", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    objc_msgSend(v10, "frame");
    v18.x = a2;
    v18.y = a3;
    if (CGRectContainsPoint(v19, v18))
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

@end
