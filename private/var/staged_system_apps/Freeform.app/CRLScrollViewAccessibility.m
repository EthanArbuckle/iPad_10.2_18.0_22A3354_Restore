@implementation CRLScrollViewAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLScrollView");
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
  objc_opt_class(CRLScrollViewAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)_crlaxAssistiveTechnologyPerformingScroll
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415AA3);
}

- (void)_crlaxSetAssistiveTechnologyPerformingScroll:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415AA3, a3);
}

- (void)_accessibilityScrollPageInDirection:(int)a3
{
  uint64_t v3;
  _BOOL8 v5;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  v5 = -[CRLScrollViewAccessibility _crlaxAssistiveTechnologyPerformingScroll](self, "_crlaxAssistiveTechnologyPerformingScroll");
  -[CRLScrollViewAccessibility _crlaxSetAssistiveTechnologyPerformingScroll:](self, "_crlaxSetAssistiveTechnologyPerformingScroll:", 1);
  v6.receiver = self;
  v6.super_class = (Class)CRLScrollViewAccessibility;
  -[CRLScrollViewAccessibility _accessibilityScrollPageInDirection:](&v6, "_accessibilityScrollPageInDirection:", v3);
  -[CRLScrollViewAccessibility _crlaxSetAssistiveTechnologyPerformingScroll:](self, "_crlaxSetAssistiveTechnologyPerformingScroll:", v5);
}

- (void)_setContentOffset:(CGPoint)a3 duration:(double)a4 animationCurve:(int)a5
{
  uint64_t v5;
  double y;
  double x;
  unsigned int v10;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  Protocol *v19;
  void *v20;
  char v21;
  objc_super v22;

  v5 = *(_QWORD *)&a5;
  y = a3.y;
  x = a3.x;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v10 = -[CRLScrollViewAccessibility _crlaxAssistiveTechnologyPerformingScroll](self, "_crlaxAssistiveTechnologyPerformingScroll");
    if (a4 > 0.0 && v10 != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollViewAccessibility crlaxTarget](self, "crlaxTarget"));
      objc_msgSend(v12, "contentOffset");
      v14 = v13;
      v16 = v15;

      if (x != v14 || y != v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollViewAccessibility crlaxTarget](self, "crlaxTarget"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));

        v19 = NSProtocolFromString(CFSTR("CRLScrollViewDelegate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if (objc_msgSend(v18, "conformsToProtocol:", v20))
        {
          v21 = objc_opt_respondsToSelector(v18, "scrollView:willAnimateToContentOffset:");

          if ((v21 & 1) != 0)
            objc_msgSend(v18, "scrollView:willAnimateToContentOffset:", self, x, y);
        }
        else
        {

        }
      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)CRLScrollViewAccessibility;
  -[CRLScrollViewAccessibility _setContentOffset:duration:animationCurve:](&v22, "_setContentOffset:duration:animationCurve:", v5, x, y, a4);
}

@end
