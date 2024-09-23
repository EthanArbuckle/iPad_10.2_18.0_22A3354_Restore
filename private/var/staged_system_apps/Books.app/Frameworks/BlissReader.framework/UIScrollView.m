@implementation UIScrollView

- (BOOL)isAncestorScrollViewDragging
{
  if (-[UIScrollView isDragging](self, "isDragging"))
    return 1;
  else
    return objc_msgSend(-[UIScrollView superview](self, "superview"), "isAncestorScrollViewDragging");
}

- (BOOL)isSettledOnFirstOrLastPage
{
  unsigned int v3;
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;

  if (-[UIScrollView isTracking](self, "isTracking"))
    LOBYTE(v3) = 0;
  else
    v3 = !-[UIScrollView isDecelerating](self, "isDecelerating");
  if (-[UIScrollView isPagingEnabled](self, "isPagingEnabled"))
  {
    -[UIScrollView contentOffset](self, "contentOffset");
    if (fabs(v4) >= 0.00999999978)
    {
      -[UIScrollView contentOffset](self, "contentOffset");
      v7 = v6;
      -[UIScrollView contentSize](self, "contentSize");
      v9 = v8;
      -[UIScrollView bounds](self, "bounds");
      v5 = vabdd_f64(v7, v9 - CGRectGetWidth(v11)) < 0.00999999978;
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
  return v3 & v5;
}

- (unint64_t)pageCount
{
  double v3;
  double v4;
  CGRect v6;

  if (!-[UIScrollView isPagingEnabled](self, "isPagingEnabled"))
    return 0;
  -[UIScrollView contentSize](self, "contentSize");
  v4 = v3;
  -[UIScrollView bounds](self, "bounds");
  return (unint64_t)(v4 / CGRectGetWidth(v6));
}

- (BOOL)canScroll
{
  double v3;
  double v4;
  double v6;
  double v7;
  CGRect v8;
  CGRect v9;

  -[UIScrollView contentSize](self, "contentSize");
  v4 = v3;
  -[UIScrollView bounds](self, "bounds");
  if (v4 > CGRectGetWidth(v8))
    return 1;
  -[UIScrollView contentSize](self, "contentSize");
  v7 = v6;
  -[UIScrollView bounds](self, "bounds");
  return v7 > CGRectGetHeight(v9);
}

- (void)th_killPans
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = -[UIScrollView gestureRecognizers](self, "gestureRecognizers", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(UIPanGestureRecognizer, v4);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && (unint64_t)objc_msgSend(v8, "state") <= 2)
          objc_msgSend(v8, "setState:", 4);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
}

- (CGPoint)spi_pageDecelerationTarget
{
  double v2;
  double v3;
  CGPoint result;

  -[UIScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget");
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSString)tsaxScrollStatusFormatString
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_54388B);
}

- (void)tsaxSetScrollStatusFormatString:(id)a3
{
  __TSAccessibilitySetAssociatedCopiedObject(self, &unk_54388B, a3);
}

- (BOOL)tsaxUseContentInset
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_54388C);
}

- (void)tsaxSetUseContentInset:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_54388C, a3);
}

- (double)tsaxScrollAnnouncementDelay
{
  double result;

  __TSAccessibilityGetAssociatedTimeInterval(self, &unk_54388D);
  return result;
}

- (void)tsaxSetScrollAnnouncementDelay:(double)a3
{
  __TSAccessibilitySetAssociatedTimeInterval(self, &unk_54388D, a3);
}

- (BOOL)tsaxScrollStatusPrefersHorizontal
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_54388E);
}

- (void)tsaxSetScrollStatusPrefersHorizontal:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_54388E, a3);
}

- (BOOL)tsaxShouldIgnoreSiblingPageControl
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_54388F);
}

- (void)tsaxSetShouldIgnoreSiblingPageControl:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_54388F, a3);
}

- (BOOL)tsaxIsScrollingDisabled
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543890);
}

- (void)tsaxSetScrollingDisabled:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543890, a3);
}

- (BOOL)tsaxAnimationEndedShouldHandleDelegateCallbacks
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543891);
}

- (void)tsaxSetAnimationEndedShouldHandleDelegateCallbacks:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543891, a3);
}

- (BOOL)tsaxContentOffsetWasChanged
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543892);
}

- (void)tsaxSetContentOffsetWasChanged:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543892, a3);
}

@end
