@implementation BKScrubberControlAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKScrubberControl");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)bkaxTarget
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v7;

  v7 = 0;
  v3 = objc_opt_class(BKScrubberControl);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
    abort();
  return v5;
}

- (id)bkaxDelegate
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v11;

  v11 = 0;
  *(_QWORD *)&v3 = objc_opt_class(NSObject).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxTarget](self, "bkaxTarget", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bkAccessibilityDelegate"));
  v8 = __IMAccessibilityCastAsClass(v5, v7, 1, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v11)
    abort();
  return v9;
}

- (int64_t)bkaxPageNumber
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxTarget](self, "bkaxTarget"));
  v3 = objc_msgSend(v2, "pageNumber");

  return (int64_t)v3;
}

- (double)bkaxProgress
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxTarget](self, "bkaxTarget"));
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (id)bkaxThumb
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxTarget](self, "bkaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "thumb"));

  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  BKScrubberControlAccessibility *v17;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxTarget](self, "bkaxTarget", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "track"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  v19.x = x;
  v19.y = y;
  if (CGRectContainsPoint(v20, v19))
    v17 = self;
  else
    v17 = 0;
  return v17;
}

- (void)_axTurnPage:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxDelegate](self, "bkaxDelegate"));
  if (v5)
  {
    v17 = v5;
    if ((objc_opt_respondsToSelector(v5, "hasSpreadPages") & 1) != 0)
      v6 = objc_msgSend(v17, "hasSpreadPages");
    else
      v6 = 0;
    objc_opt_class(BKPictureBookViewController);
    if (((v6 | objc_opt_isKindOfClass(v17, v7)) & 1) != 0)
      v8 = 2;
    else
      v8 = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxTarget](self, "bkaxTarget"));
    v10 = objc_opt_respondsToSelector(v9, "pageCount");

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxTarget](self, "bkaxTarget"));
      v12 = objc_msgSend(v11, "pageCount");

    }
    else
    {
      v12 = 0;
    }
    v13 = -[BKScrubberControlAccessibility bkaxPageNumber](self, "bkaxPageNumber");
    if (v3)
      v14 = v8;
    else
      v14 = -v8;
    v15 = v13 + v14;
    if (v15 >= (uint64_t)v12)
      v15 = (uint64_t)v12;
    if (v15 <= 1)
      v16 = 1;
    else
      v16 = v15;
    -[BKScrubberControlAccessibility sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1);
    if ((objc_opt_respondsToSelector(self, "setPageNumber:") & 1) != 0)
      -[BKScrubberControlAccessibility setPageNumber:](self, "setPageNumber:", v16);
    if ((objc_opt_respondsToSelector(self, "setValue:") & 1) != 0)
      -[BKScrubberControlAccessibility setValue:](self, "setValue:", (double)(v16 - 1) / (double)((unint64_t)v12 - 1));
    -[BKScrubberControlAccessibility sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    -[BKScrubberControlAccessibility sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
    v5 = v17;
  }

}

- (BOOL)_accessibilityIsRTL
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxTarget](self, "bkaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "track"));
  v4 = objc_msgSend(v3, "layoutDirection") == (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxDelegate](self, "bkaxDelegate"));
  v3 = v2 != 0;

  return v3;
}

- (void)accessibilityIncrement
{
  void *v3;

  v3 = -[BKScrubberControlAccessibility bkaxPageNumber](self, "bkaxPageNumber");
  -[BKScrubberControlAccessibility _axTurnPage:](self, "_axTurnPage:", 1);
  if (v3 != (void *)-[BKScrubberControlAccessibility bkaxPageNumber](self, "bkaxPageNumber"))
  {
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, kAXAnnouncementTypeScrollSound);
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
}

- (void)accessibilityDecrement
{
  void *v3;

  v3 = -[BKScrubberControlAccessibility bkaxPageNumber](self, "bkaxPageNumber");
  -[BKScrubberControlAccessibility _axTurnPage:](self, "_axTurnPage:", 0);
  if (v3 != (void *)-[BKScrubberControlAccessibility bkaxPageNumber](self, "bkaxPageNumber"))
  {
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, kAXAnnouncementTypeScrollSound);
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxThumb](self, "bkaxThumb"));
  if (v3)
  {
    v25.receiver = self;
    v25.super_class = (Class)BKScrubberControlAccessibility;
    -[BKScrubberControlAccessibility accessibilityFrame](&v25, "accessibilityFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "accessibilityFrame");
    v29.origin.x = v12;
    v29.origin.y = v13;
    v29.size.width = v14;
    v29.size.height = v15;
    v26.origin.x = v5;
    v26.origin.y = v7;
    v26.size.width = v9;
    v26.size.height = v11;
    v27 = CGRectUnion(v26, v29);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)BKScrubberControlAccessibility;
    -[BKScrubberControlAccessibility accessibilityFrame](&v24, "accessibilityFrame");
  }
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_axIsLoading
{
  double v2;

  -[BKScrubberControlAccessibility bkaxProgress](self, "bkaxProgress");
  return v2 < 1.0;
}

- (unint64_t)accessibilityTraits
{
  unsigned int v2;
  unint64_t *v3;

  v2 = -[BKScrubberControlAccessibility _axIsLoading](self, "_axIsLoading");
  v3 = &UIAccessibilityTraitUpdatesFrequently;
  if (!v2)
    v3 = &UIAccessibilityTraitAdjustable;
  return *v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxThumb](self, "bkaxThumb"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)BKScrubberControlAccessibility;
    -[BKScrubberControlAccessibility accessibilityActivationPoint](&v11, "accessibilityActivationPoint");
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  unsigned int v5;
  __CFString *v6;
  id v7;

  if (-[BKScrubberControlAccessibility _axIsLoading](self, "_axIsLoading"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControlAccessibility bkaxTarget](self, "bkaxTarget"));
    v5 = objc_msgSend(v4, "orientation");

    if (v5)
      v6 = CFSTR("page.control.hint.vertical");
    else
      v6 = CFSTR("page.control.hint");
    v7 = AEAXLocString(v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  return v3;
}

- (id)accessibilityValue
{
  int64_t v3;
  int64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[BKScrubberControlAccessibility _axIsLoading](self, "_axIsLoading"))
    return 0;
  v3 = -[BKScrubberControlAccessibility bkaxPageNumber](self, "bkaxPageNumber");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = v3;
  v6 = AEAXLocString(CFSTR("page.num %@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));

  return v9;
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[BKScrubberControlAccessibility _axIsLoading](self, "_axIsLoading"))
  {
    v3 = AEAXLocString(CFSTR("book.load.progress %@"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    -[BKScrubberControlAccessibility bkaxProgress](self, "bkaxProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:](NSNumberFormatter, "imaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5));

  }
  else
  {
    v7 = AEAXLocString(CFSTR("page.control.type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  return v6;
}

@end
