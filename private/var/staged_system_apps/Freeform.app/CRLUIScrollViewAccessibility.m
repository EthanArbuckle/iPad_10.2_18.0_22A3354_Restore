@implementation CRLUIScrollViewAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLUIScrollViewAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)accessibilityScrollLeftPage
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("nestedVScrollView"));

  if (v4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLUIScrollViewAccessibility superview](self, "superview"));
    objc_opt_class(UIScrollView, v5);
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    {
      objc_msgSend(v7, "accessibilityScrollLeftPage");

      return;
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)CRLUIScrollViewAccessibility;
  -[CRLUIScrollViewAccessibility accessibilityScrollLeftPage](&v8, "accessibilityScrollLeftPage");
}

- (void)accessibilityScrollRightPage
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("nestedVScrollView"));

  if (v4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLUIScrollViewAccessibility superview](self, "superview"));
    objc_opt_class(UIScrollView, v5);
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    {
      objc_msgSend(v7, "accessibilityScrollRightPage");

      return;
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)CRLUIScrollViewAccessibility;
  -[CRLUIScrollViewAccessibility accessibilityScrollRightPage](&v8, "accessibilityScrollRightPage");
}

- (BOOL)_crlaxShouldSendScrollStatusUponAnimationEnded
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  CRLUIScrollViewAccessibility *v3;
  void *v4;
  void *v5;
  Class v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if ((-[CRLUIScrollViewAccessibility crlaxShouldIgnoreSiblingPageControl](self, "crlaxShouldIgnoreSiblingPageControl") & 1) != 0)goto LABEL_13;
  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIScrollViewAccessibility superview](v3, "superview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));

  v6 = NSClassFromString(CFSTR("CRLPageControl"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v12, v6) & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessibilityValue"));
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  if (!v13)
  {
LABEL_13:
    v16.receiver = self;
    v16.super_class = (Class)CRLUIScrollViewAccessibility;
    v14 = -[CRLUIScrollViewAccessibility _accessibilityScrollStatus](&v16, "_accessibilityScrollStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  return v13;
}

- (id)_accessibilityScrollStatusFormatString
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIScrollViewAccessibility crlaxScrollStatusFormatString](self, "crlaxScrollStatusFormatString"));
  if (!v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLUIScrollViewAccessibility;
    v4 = -[CRLUIScrollViewAccessibility _accessibilityScrollStatusFormatString](&v6, "_accessibilityScrollStatusFormatString");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return v3;
}

- (double)_accessibilityScrollAnimationDurationDelay
{
  double result;
  objc_super v4;

  -[CRLUIScrollViewAccessibility crlaxScrollAnnouncementDelay](self, "crlaxScrollAnnouncementDelay");
  if (result <= 0.0)
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLUIScrollViewAccessibility;
    -[CRLUIScrollViewAccessibility _accessibilityScrollAnimationDurationDelay](&v4, "_accessibilityScrollAnimationDurationDelay");
  }
  return result;
}

- (BOOL)_accessibilityUseContentInset
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLUIScrollViewAccessibility;
  if (-[CRLUIScrollViewAccessibility _accessibilityUseContentInset](&v4, "_accessibilityUseContentInset"))
    return 1;
  else
    return -[CRLUIScrollViewAccessibility crlaxUseContentInset](self, "crlaxUseContentInset");
}

- (BOOL)_accessibilityScrollingEnabled
{
  objc_super v4;

  if ((-[CRLUIScrollViewAccessibility crlaxIsScrollingDisabled](self, "crlaxIsScrollingDisabled") & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLUIScrollViewAccessibility;
  return -[CRLUIScrollViewAccessibility _accessibilityScrollingEnabled](&v4, "_accessibilityScrollingEnabled");
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double y;
  double x;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  objc_super v14;

  v5 = a5;
  v6 = a4;
  y = a3.y;
  x = a3.x;
  if (a4
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier")),
        v11 = objc_msgSend(&off_1012CAD38, "containsObject:", v10),
        v10,
        v11))
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLUIScrollViewAccessibility;
    -[CRLUIScrollViewAccessibility accessibilityApplyScrollContent:sendScrollStatus:animated:](&v14, "accessibilityApplyScrollContent:sendScrollStatus:animated:", v6, v5, x, y);
  }
  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIScrollViewAccessibility crlaxTarget](self, "crlaxTarget"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));

    if ((objc_opt_respondsToSelector(v13, "crlaxScrollView:didScrollToContentOffsetWithoutAnimation:") & 1) != 0)
      objc_msgSend(v13, "crlaxScrollView:didScrollToContentOffsetWithoutAnimation:", self, x, y);

  }
}

- (BOOL)_accessibilityScrollStatusPrefersVertical
{
  objc_super v4;

  if ((-[CRLUIScrollViewAccessibility crlaxScrollStatusPrefersHorizontal](self, "crlaxScrollStatusPrefersHorizontal") & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLUIScrollViewAccessibility;
  return -[CRLUIScrollViewAccessibility _accessibilityScrollStatusPrefersVertical](&v4, "_accessibilityScrollStatusPrefersVertical");
}

- (BOOL)accessibilityShouldEnableScrollIndicator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility iOSBoardViewControllerScrollViewIdentifier](CRLAccessibility, "iOSBoardViewControllerScrollViewIdentifier"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLUIScrollViewAccessibility;
    v8 = -[CRLUIScrollViewAccessibility accessibilityShouldEnableScrollIndicator:](&v10, "accessibilityShouldEnableScrollIndicator:", v4);
  }

  return v8;
}

@end
