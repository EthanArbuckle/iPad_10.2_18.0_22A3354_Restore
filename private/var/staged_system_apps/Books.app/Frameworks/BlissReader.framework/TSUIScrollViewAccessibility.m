@implementation TSUIScrollViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)accessibilityScrollLeftPage
{
  id v3;
  uint64_t v4;
  objc_super v6;

  if (objc_msgSend(-[TSUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"), "isEqual:", CFSTR("nestedVScrollView")))
  {
    v3 = -[TSUIScrollViewAccessibility superview](self, "superview");
    v4 = objc_opt_class(UIScrollView);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
      && (objc_msgSend(v3, "accessibilityScrollLeftPage") & 1) != 0)
    {
      return 1;
    }
  }
  if (-[TSUIScrollViewAccessibility _accessibilityIsInTHBookView](self, "_accessibilityIsInTHBookView"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)TSUIScrollViewAccessibility;
  return -[TSUIScrollViewAccessibility accessibilityScrollLeftPage](&v6, "accessibilityScrollLeftPage");
}

- (BOOL)accessibilityScrollRightPage
{
  id v3;
  uint64_t v4;
  objc_super v6;

  if (objc_msgSend(-[TSUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"), "isEqual:", CFSTR("nestedVScrollView")))
  {
    v3 = -[TSUIScrollViewAccessibility superview](self, "superview");
    v4 = objc_opt_class(UIScrollView);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
      && (objc_msgSend(v3, "accessibilityScrollRightPage") & 1) != 0)
    {
      return 1;
    }
  }
  if (-[TSUIScrollViewAccessibility _accessibilityIsInTHBookView](self, "_accessibilityIsInTHBookView"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)TSUIScrollViewAccessibility;
  return -[TSUIScrollViewAccessibility accessibilityScrollRightPage](&v6, "accessibilityScrollRightPage");
}

- (BOOL)_tsaxShouldSendScrollStatusUponAnimationEnded
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  id v3;
  Class v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id result;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if ((-[TSUIScrollViewAccessibility tsaxShouldIgnoreSiblingPageControl](self, "tsaxShouldIgnoreSiblingPageControl") & 1) == 0)
  {
    v3 = objc_msgSend(-[TSUIScrollViewAccessibility superview](self, "superview"), "subviews");
    v4 = NSClassFromString(CFSTR("TSKPageControl"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass(v9, v4) & 1) != 0)
          break;
        if (v6 == (id)++v8)
        {
          v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
      result = objc_msgSend(v9, "accessibilityValue");
      if (result)
        return result;
    }
  }
LABEL_12:
  v11.receiver = self;
  v11.super_class = (Class)TSUIScrollViewAccessibility;
  return -[TSUIScrollViewAccessibility _accessibilityScrollStatus](&v11, "_accessibilityScrollStatus");
}

- (id)_accessibilityScrollStatusFormatString
{
  id result;
  objc_super v4;

  result = -[TSUIScrollViewAccessibility tsaxScrollStatusFormatString](self, "tsaxScrollStatusFormatString");
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)TSUIScrollViewAccessibility;
    return -[TSUIScrollViewAccessibility _accessibilityScrollStatusFormatString](&v4, "_accessibilityScrollStatusFormatString");
  }
  return result;
}

- (double)_accessibilityScrollAnimationDurationDelay
{
  double result;
  objc_super v4;

  -[TSUIScrollViewAccessibility tsaxScrollAnnouncementDelay](self, "tsaxScrollAnnouncementDelay");
  if (result <= 0.0)
  {
    v4.receiver = self;
    v4.super_class = (Class)TSUIScrollViewAccessibility;
    -[TSUIScrollViewAccessibility _accessibilityScrollAnimationDurationDelay](&v4, "_accessibilityScrollAnimationDurationDelay");
  }
  return result;
}

- (BOOL)_accessibilityUseContentInset
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSUIScrollViewAccessibility;
  if (-[TSUIScrollViewAccessibility _accessibilityUseContentInset](&v4, "_accessibilityUseContentInset"))
    return 1;
  else
    return -[TSUIScrollViewAccessibility tsaxUseContentInset](self, "tsaxUseContentInset");
}

- (BOOL)_accessibilityScrollingEnabled
{
  _BOOL4 v3;
  objc_super v5;

  if ((-[TSUIScrollViewAccessibility tsaxIsScrollingDisabled](self, "tsaxIsScrollingDisabled") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSUIScrollViewAccessibility;
    v3 = -[TSUIScrollViewAccessibility _accessibilityScrollingEnabled](&v5, "_accessibilityScrollingEnabled");
    if (v3)
      LOBYTE(v3) = -[TSUIScrollViewAccessibility tsaxViewAncestorOfType:](self, "tsaxViewAncestorOfType:", NSClassFromString(CFSTR("TSDMultiColumnTableViewCell"))) == 0;
  }
  return v3;
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  double y;
  double x;
  id v9;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)TSUIScrollViewAccessibility;
  -[TSUIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animated:](&v10, "accessibilityApplyScrollContent:sendScrollStatus:animated:", a4);
  if (!a5)
  {
    v9 = -[TSUIScrollViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
    if ((objc_opt_respondsToSelector(v9, "tsaxScrollView:didScrollToContentOffsetWithoutAnimation:") & 1) != 0)
      objc_msgSend(v9, "tsaxScrollView:didScrollToContentOffsetWithoutAnimation:", self, x, y);
  }
}

- (BOOL)_accessibilityScrollStatusPrefersVertical
{
  objc_super v4;

  if ((-[TSUIScrollViewAccessibility tsaxScrollStatusPrefersHorizontal](self, "tsaxScrollStatusPrefersHorizontal") & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSUIScrollViewAccessibility;
  return -[TSUIScrollViewAccessibility _accessibilityScrollStatusPrefersVertical](&v4, "_accessibilityScrollStatusPrefersVertical");
}

- (BOOL)_accessibilityIsInTHBookView
{
  return -[TSUIScrollViewAccessibility tsaxAncestorOfType:](self, "tsaxAncestorOfType:", NSClassFromString(CFSTR("THBookView"))) != 0;
}

@end
