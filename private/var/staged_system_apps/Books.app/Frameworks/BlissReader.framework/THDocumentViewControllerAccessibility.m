@implementation THDocumentViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THDocumentViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_thaxAllowsToolbarHideRequests
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A15);
}

- (void)_thaxSetAllowsToolbarHideRequests:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A15, a3);
}

- (unint64_t)_thaxLastSeenAbsolutePaginatedPageIndex
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_543A16);
}

- (void)_thaxSetLastSeenAbsolutePaginatedPageIndex:(unint64_t)a3
{
  __TSAccessibilitySetAssociatedUnsignedInteger(self, &unk_543A16, (id)a3);
}

- (THScrollViewAccessibility)thaxCanvasScrollView
{
  void *v3;
  THScrollViewAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THScrollViewAccessibility);
  result = (THScrollViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasScrollView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)thaxInFlowMode
{
  return -[THDocumentViewControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("inFlowMode"));
}

- (unint64_t)thaxCurrentChapter
{
  return (unint64_t)-[THDocumentViewControllerAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("currentChapter"));
}

- (unint64_t)thaxChapterCount
{
  return -[NSArray count](-[THTOCModelAccessibility thaxTiles](-[THDocumentRootAccessibility thaxTOCModel](-[THDocumentViewControllerAccessibility thaxDocumentRoot](self, "thaxDocumentRoot"), "thaxTOCModel"), "thaxTiles"), "count");
}

- (THDocumentRootAccessibility)thaxDocumentRoot
{
  void *v3;
  THDocumentRootAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THDocumentRootAccessibility);
  result = (THDocumentRootAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("documentRoot")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)thaxPerformActionAllowingToolbarHideRequestsWithBlock:(id)a3
{
  if (-[THDocumentViewControllerAccessibility _thaxAllowsToolbarHideRequests](self, "_thaxAllowsToolbarHideRequests"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    -[THDocumentViewControllerAccessibility _thaxSetAllowsToolbarHideRequests:](self, "_thaxSetAllowsToolbarHideRequests:", 1);
    (*((void (**)(id))a3 + 2))(a3);
    -[THDocumentViewControllerAccessibility _thaxSetAllowsToolbarHideRequests:](self, "_thaxSetAllowsToolbarHideRequests:", 0);
  }
}

- (void)thaxPresentRepExpanded:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_254A94;
  v3[3] = &unk_426E28;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (void)thaxDismissExpandedViewController
{
  -[THWiOSExpandedViewControllerAccessibility thaxDismiss](-[THDocumentViewControllerAccessibility thaxExpandedViewController](self, "thaxExpandedViewController"), "thaxDismiss");
}

- (void)viewWillUnload
{
  objc_super v3;

  -[THDocumentViewControllerAccessibility _axClearWeakReferencesToSelf](self, "_axClearWeakReferencesToSelf");
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  -[THDocumentViewControllerAccessibility viewWillUnload](&v3, "viewWillUnload");
}

- (void)dealloc
{
  objc_super v3;

  -[THDocumentViewControllerAccessibility _axClearWeakReferencesToSelf](self, "_axClearWeakReferencesToSelf");
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  -[THDocumentViewControllerAccessibility dealloc](&v3, "dealloc");
}

- (void)p_voiceOverStatusDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  -[THDocumentViewControllerAccessibility p_voiceOverStatusDidChange](&v3, "p_voiceOverStatusDidChange");
  if (-[TSAccessibility needsAccessibilityElements](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "needsAccessibilityElements"))
  {
    -[THDocumentViewControllerAccessibility _thaxShowToolbar](self, "_thaxShowToolbar");
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  -[THDocumentViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[THDocumentViewControllerAccessibility _thaxApplyAccessibilityScrollingInfo](self, "_thaxApplyAccessibilityScrollingInfo");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewControllerAccessibility;
  -[THDocumentViewControllerAccessibility viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[THDocumentViewControllerAccessibility _thaxSetLastSeenAbsolutePaginatedPageIndex:](self, "_thaxSetLastSeenAbsolutePaginatedPageIndex:", -[THDocumentViewControllerAccessibility thaxCurrentAbsolutePageIndex](self, "thaxCurrentAbsolutePageIndex"));
  if (!-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode"))
    -[THDocumentViewControllerAccessibility _tsaxDidUpdateCurrentPage](self, "_tsaxDidUpdateCurrentPage");
}

- (void)expandedViewControllerDidDismiss:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewControllerAccessibility;
  -[THDocumentViewControllerAccessibility expandedViewControllerDidDismiss:](&v4, "expandedViewControllerDidDismiss:", a3);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  if (UIAccessibilityIsVoiceOverRunning() && (objc_opt_respondsToSelector(self, "showToolbarAnimated:") & 1) != 0)
    -[THDocumentViewControllerAccessibility showToolbarAnimated:](self, "showToolbarAnimated:", 0);
}

- (void)hideToolbarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning()
    || -[THDocumentViewControllerAccessibility _thaxAllowsToolbarHideRequests](self, "_thaxAllowsToolbarHideRequests"))
  {
    v5.receiver = self;
    v5.super_class = (Class)THDocumentViewControllerAccessibility;
    -[THDocumentViewControllerAccessibility hideToolbarAnimated:](&v5, "hideToolbarAnimated:", v3);
  }
}

- (BOOL)followLink:(id)a3
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THDocumentViewControllerAccessibility;
  v3 = -[THDocumentViewControllerAccessibility followLink:](&v5, "followLink:", a3);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  return v3;
}

- (void)p_updateVisibleInfosWithPaddingOptions:(int)a3 force:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THDocumentViewControllerAccessibility;
  -[THDocumentViewControllerAccessibility p_updateVisibleInfosWithPaddingOptions:force:](&v5, "p_updateVisibleInfosWithPaddingOptions:force:", *(_QWORD *)&a3, a4);
  -[THTSDCanvasViewAccessibility tsaxInvalidateChildrenEventually](-[THDocumentViewControllerAccessibility _thaxCanvasView](self, "_thaxCanvasView"), "tsaxInvalidateChildrenEventually");
}

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THDocumentViewControllerAccessibility;
  -[THDocumentViewControllerAccessibility interactiveCanvasControllerDidStopScrolling:](&v5, "interactiveCanvasControllerDidStopScrolling:", a3);
  v4 = -[THDocumentViewControllerAccessibility thaxCurrentAbsolutePageIndex](self, "thaxCurrentAbsolutePageIndex");
  if (v4 != (void *)-[THDocumentViewControllerAccessibility _thaxLastSeenAbsolutePaginatedPageIndex](self, "_thaxLastSeenAbsolutePaginatedPageIndex"))
  {
    -[THDocumentViewControllerAccessibility _thaxSetLastSeenAbsolutePaginatedPageIndex:](self, "_thaxSetLastSeenAbsolutePaginatedPageIndex:", v4);
    if (!-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode"))
      -[THDocumentViewControllerAccessibility _tsaxDidUpdateCurrentPage](self, "_tsaxDidUpdateCurrentPage");
  }
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewControllerAccessibility;
  -[THDocumentViewControllerAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[THDocumentViewControllerAccessibility _thaxApplyAccessibilityScrollingInfo](self, "_thaxApplyAccessibilityScrollingInfo");
  -[THDocumentViewControllerAccessibility _thaxShowToolbar](self, "_thaxShowToolbar");
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THDocumentViewControllerAccessibility;
  if (-[THDocumentViewControllerAccessibility accessibilityScroll:](&v6, "accessibilityScroll:"))
    return 1;
  if (a3 == 5)
  {
    if (-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode"))
      return -[THDocumentViewControllerAccessibility accessibilityScrollDownPage](self, "accessibilityScrollDownPage");
    else
      return -[THDocumentViewControllerAccessibility accessibilityScrollLeftPage](self, "accessibilityScrollLeftPage");
  }
  else if (a3 == 6)
  {
    if (-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode"))
      return -[THDocumentViewControllerAccessibility accessibilityScrollUpPage](self, "accessibilityScrollUpPage");
    else
      return -[THDocumentViewControllerAccessibility accessibilityScrollRightPage](self, "accessibilityScrollRightPage");
  }
  else
  {
    return 0;
  }
}

- (BOOL)accessibilityScrollLeftPage
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_254FA0;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
  return 1;
}

- (BOOL)accessibilityScrollRightPage
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_255004;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
  return 1;
}

- (BOOL)accessibilityScrollDownPage
{
  return -[THDocumentViewControllerAccessibility _thaxOverscrollToNextChapter](self, "_thaxOverscrollToNextChapter");
}

- (BOOL)accessibilityScrollUpPage
{
  return -[THDocumentViewControllerAccessibility _thaxOverscrollToPreviousChapter](self, "_thaxOverscrollToPreviousChapter");
}

- (BOOL)accessibilityScrollRightPageSupported
{
  return !-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode");
}

- (BOOL)accessibilityScrollLeftPageSupported
{
  return !-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode");
}

- (void)_thaxHorizontalOverscrollPreviousChapter
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_2550A4;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)_thaxHorizontalOverscrollNextChapter
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_255104;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)_thaxVerticalOverscrollPreviousChapter
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_255164;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)_thaxVerticalOverscrollNextChapter
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_2551C4;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (BOOL)_thaxOverscrollToPreviousChapter
{
  unint64_t v3;
  _QWORD v5[5];

  v3 = -[THDocumentViewControllerAccessibility thaxCurrentChapter](self, "thaxCurrentChapter");
  if (v3)
  {
    if (-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode"))
      -[THDocumentViewControllerAccessibility _thaxVerticalOverscrollPreviousChapter](self, "_thaxVerticalOverscrollPreviousChapter");
    else
      -[THDocumentViewControllerAccessibility _thaxHorizontalOverscrollPreviousChapter](self, "_thaxHorizontalOverscrollPreviousChapter");
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_255260;
    v5[3] = &unk_426DD0;
    v5[4] = self;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v5, 1.0);
  }
  return v3 != 0;
}

- (BOOL)_thaxOverscrollToNextChapter
{
  unint64_t v3;
  char *v4;
  _QWORD v6[5];

  v3 = -[THDocumentViewControllerAccessibility thaxCurrentChapter](self, "thaxCurrentChapter");
  v4 = (char *)-[THDocumentViewControllerAccessibility thaxChapterCount](self, "thaxChapterCount") - 1;
  if (v3 < (unint64_t)v4)
  {
    if (-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode"))
      -[THDocumentViewControllerAccessibility _thaxVerticalOverscrollNextChapter](self, "_thaxVerticalOverscrollNextChapter");
    else
      -[THDocumentViewControllerAccessibility _thaxHorizontalOverscrollNextChapter](self, "_thaxHorizontalOverscrollNextChapter");
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_255324;
    v6[3] = &unk_426DD0;
    v6[4] = self;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v6, 1.0);
  }
  return v3 < (unint64_t)v4;
}

- (void)_axClearWeakReferencesToSelf
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_255394;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)_thaxShowToolbar
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_255418;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
  TSAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return !-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode", a3);
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return !-[THDocumentViewControllerAccessibility thaxInFlowMode](self, "thaxInFlowMode", a3);
}

- (THWiOSExpandedViewControllerAccessibility)thaxExpandedViewController
{
  void *v3;
  THWiOSExpandedViewControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWiOSExpandedViewControllerAccessibility);
  result = (THWiOSExpandedViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("expandedViewController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)_tsaxDidUpdateCurrentPage
{
  id v3;
  Class v4;
  _QWORD v5[4];

  if (-[TSDCanvasViewAccessibility tsaxCanMoveAXFocusIntoContent](-[THDocumentViewControllerAccessibility _thaxCanvasView](self, "_thaxCanvasView"), "tsaxCanMoveAXFocusIntoContent"))
  {
    v3 = -[TSAccessibility currentlyFocusedElement](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "currentlyFocusedElement");
    v4 = NSClassFromString(CFSTR("THWPRep"));
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0 && objc_msgSend(v3, "thaxIsPageNumberTextRep"))
    {
      UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
    }
    else
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_25558C;
      v5[3] = &unk_426DD0;
      -[THTSDCanvasViewAccessibility tsaxInvalidateChildrenEventuallyWithCompletion:](-[THDocumentViewControllerAccessibility _thaxCanvasView](self, "_thaxCanvasView"), "tsaxInvalidateChildrenEventuallyWithCompletion:", v5);
    }
  }
}

- (THTSDCanvasViewAccessibility)_thaxCanvasView
{
  id v2;
  void *v3;
  THTSDCanvasViewAccessibility *result;
  char v5;

  v2 = objc_msgSend(-[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasViewController")), "tsaxValueForKey:", CFSTR("canvasView"));
  v5 = 0;
  v3 = (void *)objc_opt_class(THTSDCanvasViewAccessibility);
  result = (THTSDCanvasViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)thaxCurrentPageNumberUsingPhysicalBookFormatString:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t v6;
  const __CFString *v7;
  NSString *v8;

  v3 = a3;
  v4 = -[THDocumentViewControllerAccessibility thaxCurrentAbsolutePageIndex](self, "thaxCurrentAbsolutePageIndex");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v6 = v4;
  if (v3)
    v7 = CFSTR("page.number.in.physical.book %@");
  else
    v7 = CFSTR("page.number %@");
  v8 = THAccessibilityLocalizedString((uint64_t)v7);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, TSAccessibilityLocalizedUnsignedInteger(v6 + 1));
}

- (unint64_t)thaxCurrentAbsolutePageIndex
{
  return (unint64_t)-[THDocumentViewControllerAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("currentAbsolutePageIndex"));
}

- (id)thaxScrollStatusStringForScrollView:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  if (-[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasScrollView")) != a3)
    return 0;
  v5 = -[THDocumentViewControllerAccessibility thaxCurrentPageNumberUsingPhysicalBookFormatString:](self, "thaxCurrentPageNumberUsingPhysicalBookFormatString:", 0);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", kCFBooleanTrue, CFSTR("AXPageScrollShouldSpeakElement"), 0);
  v8 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v6, v7);

  return v8;
}

- (id)thaxSuffixOfScrollStatusStringForScrollView:(id)a3
{
  if (-[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasScrollView")) == a3)
    return -[THDocumentViewControllerAccessibility thaxCurrentPageNumberUsingPhysicalBookFormatString:](self, "thaxCurrentPageNumberUsingPhysicalBookFormatString:", 1);
  else
    return 0;
}

- (BOOL)thaxScrollView:(id)a3 shouldOverrideAccessibilityContentInsetWithValue:(UIEdgeInsets *)a4
{
  uint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  id v16;
  id v17;
  CGRect v19;
  CGRect v20;

  if (-[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasScrollView")) != a3
    || (v7 = objc_opt_class(UIScrollView), (objc_opt_isKindOfClass(a3, v7) & 1) == 0))
  {
    LOBYTE(v17) = 0;
    return (char)v17;
  }
  objc_msgSend(a3, "contentInset");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("leftOverscrollView"));
  if (v16)
  {
    objc_msgSend(v16, "bounds");
    v11 = v11 + CGRectGetWidth(v19);
    v17 = -[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("rightOverscrollView"));
    if (!v17)
      goto LABEL_10;
  }
  else
  {
    v17 = -[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("rightOverscrollView"));
    if (!v17)
      return (char)v17;
  }
  objc_msgSend(v17, "bounds");
  v15 = v15 + CGRectGetWidth(v20);
LABEL_10:
  a4->top = v9;
  a4->left = v11;
  LOBYTE(v17) = 1;
  a4->bottom = v13;
  a4->right = v15;
  return (char)v17;
}

- (void)_thaxApplyAccessibilityScrollingInfo
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2559A4;
  v3[3] = &unk_426E28;
  v3[4] = -[THDocumentViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasScrollView"));
  v3[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

@end
