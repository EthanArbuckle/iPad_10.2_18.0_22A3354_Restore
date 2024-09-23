@implementation THUIScrollViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSUIScrollViewAccessibility, a2);
}

- (THUIScrollViewAccessibilityDelegate)thaxScrollingDelegate
{
  return (THUIScrollViewAccessibilityDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_543A40);
}

- (void)thaxSetScrollingDelegate:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543A40, a3);
}

- (BOOL)thaxIsVerticalScrollingDisabled
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A41);
}

- (void)thaxSetVerticalScrollingDisabled:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A41, a3);
}

- (void)_accessibilitySendScrollStatus
{
  objc_super v3;

  if ((objc_opt_respondsToSelector(-[THUIScrollViewAccessibility thaxScrollingDelegate](self, "thaxScrollingDelegate"), "thaxShouldPreventPageScrolledNotificationForScrollView:") & 1) != 0&& -[THUIScrollViewAccessibilityDelegate thaxShouldPreventPageScrolledNotificationForScrollView:](-[THUIScrollViewAccessibility thaxScrollingDelegate](self, "thaxScrollingDelegate"), "thaxShouldPreventPageScrolledNotificationForScrollView:", self))
  {
    TSAccessibilityPostAnnouncementNotification((uint64_t)self, (uint64_t)-[THUIScrollViewAccessibility _accessibilityScrollStatus](self, "_accessibilityScrollStatus"));
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)THUIScrollViewAccessibility;
    -[THUIScrollViewAccessibility _accessibilitySendScrollStatus](&v3, "_accessibilitySendScrollStatus");
  }
}

- (id)_accessibilityScrollStatus
{
  THUIScrollViewAccessibilityDelegate *v3;
  id result;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  objc_super v14;

  v3 = -[THUIScrollViewAccessibility thaxScrollingDelegate](self, "thaxScrollingDelegate");
  if ((objc_opt_respondsToSelector(v3, "thaxScrollStatusStringForScrollView:") & 1) == 0
    || (result = -[THUIScrollViewAccessibilityDelegate thaxScrollStatusStringForScrollView:](v3, "thaxScrollStatusStringForScrollView:", self)) == 0)
  {
    if ((objc_opt_respondsToSelector(v3, "thaxSuffixOfScrollStatusStringForScrollView:") & 1) == 0
      || (v14.receiver = self,
          v14.super_class = (Class)THUIScrollViewAccessibility,
          v5 = -[TSUIScrollViewAccessibility _accessibilityScrollStatus](&v14, "_accessibilityScrollStatus"),
          v6 = -[THUIScrollViewAccessibilityDelegate thaxSuffixOfScrollStatusStringForScrollView:](v3, "thaxSuffixOfScrollStatusStringForScrollView:", self), (result = __TSAccessibilityStringForVariables(1, v5, v7, v8, v9, v10, v11, v12, (uint64_t)v6)) == 0))
    {
      v13.receiver = self;
      v13.super_class = (Class)THUIScrollViewAccessibility;
      return -[TSUIScrollViewAccessibility _accessibilityScrollStatus](&v13, "_accessibilityScrollStatus");
    }
  }
  return result;
}

- (UIEdgeInsets)_accessibilityContentInset
{
  __int128 v3;
  THUIScrollViewAccessibilityDelegate *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  UIEdgeInsets result;

  v3 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  v10 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v11 = v3;
  v4 = -[THUIScrollViewAccessibility thaxScrollingDelegate](self, "thaxScrollingDelegate");
  if ((objc_opt_respondsToSelector(v4, "thaxScrollView:shouldOverrideAccessibilityContentInsetWithValue:") & 1) != 0
    && -[THUIScrollViewAccessibilityDelegate thaxScrollView:shouldOverrideAccessibilityContentInsetWithValue:](v4, "thaxScrollView:shouldOverrideAccessibilityContentInsetWithValue:", self, &v10))
  {
    v6 = *((double *)&v10 + 1);
    v5 = *(double *)&v10;
    v8 = *((double *)&v11 + 1);
    v7 = *(double *)&v11;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THUIScrollViewAccessibility;
    -[THUIScrollViewAccessibility _accessibilityContentInset](&v9, "_accessibilityContentInset");
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  objc_super v4;

  if (-[THUIScrollViewAccessibility thaxIsVerticalScrollingDisabled](self, "thaxIsVerticalScrollingDisabled"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  return -[THUIScrollViewAccessibility accessibilityScrollDownPageSupported](&v4, "accessibilityScrollDownPageSupported");
}

- (BOOL)accessibilityScrollUpPageSupported
{
  objc_super v4;

  if (-[THUIScrollViewAccessibility thaxIsVerticalScrollingDisabled](self, "thaxIsVerticalScrollingDisabled"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  return -[THUIScrollViewAccessibility accessibilityScrollUpPageSupported](&v4, "accessibilityScrollUpPageSupported");
}

- (BOOL)accessibilityScrollLeftPage
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  if (-[TSUIScrollViewAccessibility accessibilityScrollLeftPage](&v4, "accessibilityScrollLeftPage"))
    return 1;
  else
    return -[THUIScrollViewAccessibilityDelegate accessibilityScrollLeftPage](-[THUIScrollViewAccessibility thaxScrollingDelegate](self, "thaxScrollingDelegate"), "accessibilityScrollLeftPage");
}

- (BOOL)accessibilityScrollRightPage
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  if (-[TSUIScrollViewAccessibility accessibilityScrollRightPage](&v4, "accessibilityScrollRightPage"))
    return 1;
  else
    return -[THUIScrollViewAccessibilityDelegate accessibilityScrollRightPage](-[THUIScrollViewAccessibility thaxScrollingDelegate](self, "thaxScrollingDelegate"), "accessibilityScrollRightPage");
}

- (BOOL)accessibilityScrollUpPage
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THUIScrollViewAccessibility;
  if (-[THUIScrollViewAccessibility accessibilityScrollUpPage](&v4, "accessibilityScrollUpPage"))
    return 1;
  else
    return -[THUIScrollViewAccessibilityDelegate accessibilityScrollUpPage](-[THUIScrollViewAccessibility thaxScrollingDelegate](self, "thaxScrollingDelegate"), "accessibilityScrollUpPage");
}

- (BOOL)accessibilityScrollDownPage
{
  objc_class *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL result;
  objc_super v12;
  objc_super v13;
  char v14;
  CGRect v15;

  v14 = 0;
  v3 = (objc_class *)objc_opt_class(UIScrollView);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v14);
  if (v14)
    abort();
  v5 = v4;
  objc_msgSend(v4, "contentSize");
  v7 = v6;
  objc_msgSend(v5, "bounds");
  v8 = v7 - CGRectGetMaxY(v15);
  objc_msgSend(v5, "bounds");
  v10 = v9 * 0.5;
  if (v8 > v9 * 0.5)
  {
    v13.receiver = self;
    v13.super_class = (Class)THUIScrollViewAccessibility;
    if (-[THUIScrollViewAccessibility accessibilityScrollDownPage](&v13, "accessibilityScrollDownPage"))
      return 1;
  }
  result = -[THUIScrollViewAccessibilityDelegate accessibilityScrollDownPage](-[THUIScrollViewAccessibility thaxScrollingDelegate](self, "thaxScrollingDelegate"), "accessibilityScrollDownPage");
  if (v8 <= v10 && !result)
  {
    v12.receiver = self;
    v12.super_class = (Class)THUIScrollViewAccessibility;
    return -[THUIScrollViewAccessibility accessibilityScrollDownPage](&v12, "accessibilityScrollDownPage");
  }
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  THUIScrollViewAccessibilityDelegate *v5;
  THUIScrollViewAccessibilityDelegate *v6;
  dispatch_time_t v7;
  objc_super v9;

  v5 = -[THUIScrollViewAccessibility thaxScrollingDelegate](self, "thaxScrollingDelegate");
  if (v5)
  {
    v6 = v5;
    switch(a3)
    {
      case 1:
      case 6:
        if (-[THUIScrollViewAccessibilityDelegate tsaxBoolValueForKey:](v5, "tsaxBoolValueForKey:", CFSTR("accessibilityScrollRightPageSupported")))
        {
          if (-[THUIScrollViewAccessibility accessibilityScrollRightPage](self, "accessibilityScrollRightPage")
            || (-[THUIScrollViewAccessibilityDelegate accessibilityScrollRightPage](v6, "accessibilityScrollRightPage") & 1) != 0)
          {
            goto LABEL_20;
          }
          goto LABEL_21;
        }
        LODWORD(v5) = -[THUIScrollViewAccessibilityDelegate tsaxBoolValueForKey:](v6, "tsaxBoolValueForKey:", CFSTR("accessibilityScrollUpPageSupported"));
        if ((_DWORD)v5)
        {
          if (-[THUIScrollViewAccessibility accessibilityScrollUpPage](self, "accessibilityScrollUpPage")
            || (-[THUIScrollViewAccessibilityDelegate accessibilityScrollUpPage](v6, "accessibilityScrollUpPage") & 1) != 0)
          {
            goto LABEL_20;
          }
          goto LABEL_21;
        }
        return (char)v5;
      case 2:
      case 5:
        if (-[THUIScrollViewAccessibilityDelegate tsaxBoolValueForKey:](v5, "tsaxBoolValueForKey:", CFSTR("accessibilityScrollLeftPageSupported")))
        {
          if (-[THUIScrollViewAccessibility accessibilityScrollLeftPage](self, "accessibilityScrollLeftPage")
            || (-[THUIScrollViewAccessibilityDelegate accessibilityScrollLeftPage](v6, "accessibilityScrollLeftPage") & 1) != 0)
          {
            goto LABEL_20;
          }
LABEL_21:
          LOBYTE(v5) = 0;
          return (char)v5;
        }
        LODWORD(v5) = -[THUIScrollViewAccessibilityDelegate tsaxBoolValueForKey:](v6, "tsaxBoolValueForKey:", CFSTR("accessibilityScrollDownPageSupported"));
        if ((_DWORD)v5)
        {
          if (-[THUIScrollViewAccessibility accessibilityScrollDownPage](self, "accessibilityScrollDownPage")
            || (-[THUIScrollViewAccessibilityDelegate accessibilityScrollDownPage](v6, "accessibilityScrollDownPage") & 1) != 0)
          {
            goto LABEL_20;
          }
          goto LABEL_21;
        }
        break;
      default:
        v9.receiver = self;
        v9.super_class = (Class)THUIScrollViewAccessibility;
        LODWORD(v5) = -[THUIScrollViewAccessibility accessibilityScroll:](&v9, "accessibilityScroll:", a3);
        if ((_DWORD)v5)
        {
LABEL_20:
          v7 = dispatch_time(0, 250000000);
          dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_43C910);
          LOBYTE(v5) = 1;
        }
        return (char)v5;
    }
  }
  return (char)v5;
}

@end
