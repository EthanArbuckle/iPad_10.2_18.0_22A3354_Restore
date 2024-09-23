@implementation THChapterBrowserControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THChapterBrowserController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_thaxShouldOutputCurrentChapterForPageThumbnailsScrollStatus
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A20);
}

- (void)_thaxSetShouldOutputCurrentChapterForPageThumbnailsScrollStatus:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A20, a3);
}

- (BOOL)_thaxShouldOutputCurrentChapterForPageChange
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A21);
}

- (void)_thaxSetShouldOutputCurrentChapterForPageChange:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A21, a3);
}

- (BOOL)_thaxIsShowingContent
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A22);
}

- (void)_thaxSetShowingContent:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A22, a3);
}

- (id)thaxDelegate
{
  return -[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
}

- (void)thaxFollowLink:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_25E0F8;
  v3[3] = &unk_426E28;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (void)setBackgroundScrollView:(id)a3
{
  objc_super v5;
  _QWORD v6[7];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_25E194;
  v6[3] = &unk_426F18;
  v6[4] = -[THChapterBrowserControllerAccessibility _thaxBackgroundScrollView](self, "_thaxBackgroundScrollView");
  v6[5] = a3;
  v6[6] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v5.receiver = self;
  v5.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility setBackgroundScrollView:](&v5, "setBackgroundScrollView:", a3);
}

- (void)setPagesScrollView:(id)a3
{
  id v5;
  objc_super v6;
  _QWORD v7[6];
  _QWORD v8[5];

  v5 = -[THChapterBrowserControllerAccessibility _thaxPagesScrollView](self, "_thaxPagesScrollView");
  objc_msgSend(a3, "setAccessibilityContainerType:", 0);
  objc_msgSend(a3, "setAccessibilityLabel:", 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_25E2E0;
  v8[3] = &unk_426DD0;
  v8[4] = v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
    goto LABEL_4;
  objc_msgSend(a3, "setAccessibilityContainerType:", 4);
  objc_msgSend(a3, "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("page.thumbnails")));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_25E31C;
  v7[3] = &unk_426E28;
  v7[4] = a3;
  v7[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
LABEL_4:
    abort();
  v6.receiver = self;
  v6.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility setPagesScrollView:](&v6, "setPagesScrollView:", a3);
}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility viewDidLoad](&v4, "viewDidLoad");
  v3 = -[THChapterBrowserControllerAccessibility _thaxChapterPageControl](self, "_thaxChapterPageControl");
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "thaxSetDelegate:", self);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[THChapterBrowserControllerAccessibility _axRefreshShowingContentFlag](self, "_axRefreshShowingContentFlag");
}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_25E454;
  v3[3] = &unk_427268;
  v4 = a3;
  v3[4] = self;
  -[THChapterBrowserControllerAccessibility _axPerformBlockAffectingMediaControllerState:](self, "_axPerformBlockAffectingMediaControllerState:", v3);
}

- (void)willTransitionFromChapterIndex:(unsigned int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility willTransitionFromChapterIndex:](&v4, "willTransitionFromChapterIndex:", *(_QWORD *)&a3);
  -[THChapterBrowserControllerAccessibility _axRefreshShowingContentFlag](self, "_axRefreshShowingContentFlag");
}

- (void)setChapterIndex:(unsigned int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility setChapterIndex:](&v4, "setChapterIndex:", *(_QWORD *)&a3);
  -[THChapterBrowserControllerAccessibility _axRefreshShowingContentFlag](self, "_axRefreshShowingContentFlag");
}

- (void)setIntroMediaViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility setIntroMediaViewController:](&v4, "setIntroMediaViewController:", a3);
  -[THChapterBrowserControllerAccessibility _axRefreshShowingContentFlag](self, "_axRefreshShowingContentFlag");
}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility setIntroMediaViewController:showIt:](&v6, "setIntroMediaViewController:showIt:", a3);
  if (v4)
    -[THChapterBrowserControllerAccessibility _axHideToolbar](self, "_axHideToolbar");
  -[THChapterBrowserControllerAccessibility _axRefreshShowingContentFlag](self, "_axRefreshShowingContentFlag");
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility introMediaControllerShouldAdvancePast:](&v4, "introMediaControllerShouldAdvancePast:", a3);
  -[THChapterBrowserControllerAccessibility _axRefreshShowingContentFlag](self, "_axRefreshShowingContentFlag");
  -[THChapterBrowserControllerAccessibility _thaxSetShouldOutputCurrentChapterForPageChange:](self, "_thaxSetShouldOutputCurrentChapterForPageChange:", 1);
}

- (void)relinquishIntroMediaViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility relinquishIntroMediaViewController](&v3, "relinquishIntroMediaViewController");
  -[THChapterBrowserControllerAccessibility _axRefreshShowingContentFlag](self, "_axRefreshShowingContentFlag");
}

- (void)takeChapterIndexFrom:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility takeChapterIndexFrom:](&v4, "takeChapterIndexFrom:", a3);
  -[THChapterBrowserControllerAccessibility _axDidChangePageUsingChapterPageControl:](self, "_axDidChangePageUsingChapterPageControl:", 1);
}

- (void)p_backgroundScrollingDidEnd
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility p_backgroundScrollingDidEnd](&v3, "p_backgroundScrollingDidEnd");
  -[THChapterBrowserControllerAccessibility _axDidChangePageUsingChapterPageControl:](self, "_axDidChangePageUsingChapterPageControl:", 0);
}

- (void)p_releaseOutlets
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility p_releaseOutlets](&v3, "p_releaseOutlets");
  -[THChapterBrowserControllerAccessibility _axRefreshShowingContentFlag](self, "_axRefreshShowingContentFlag");
}

- (void)p_pageThumbScrollingDidEnd
{
  unsigned __int8 v3;
  objc_super v4;

  v3 = -[THChapterBrowserControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("mPullThroughInProgress"));
  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility p_pageThumbScrollingDidEnd](&v4, "p_pageThumbScrollingDidEnd");
  if ((v3 & 1) == 0
    && -[THChapterBrowserControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("mPullThroughInProgress")))
  {
    -[THChapterBrowserControllerAccessibility _axDidInitiatePullThrough](self, "_axDidInitiatePullThrough");
  }
  -[THChapterBrowserControllerAccessibility _axRefreshShowingContentFlag](self, "_axRefreshShowingContentFlag");
}

- (void)p_thumbnailAnimationDidStopWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility p_thumbnailAnimationDidStopWithContext:](&v4, "p_thumbnailAnimationDidStopWithContext:", a3);
  if (UIAccessibilityIsVoiceOverRunning())
    -[THChapterBrowserControllerAccessibility _axShowToolbar](self, "_axShowToolbar");
}

- (void)p_updatePageThumbnails:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility p_updatePageThumbnails:](&v3, "p_updatePageThumbnails:", a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  unsigned __int8 v7;
  objc_super v8;

  v4 = a4;
  if (-[THChapterBrowserControllerAccessibility _thaxPagesScrollView](self, "_thaxPagesScrollView") == a3)
  {
    v7 = -[THChapterBrowserControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("mPullThroughInProgress"));
    v8.receiver = self;
    v8.super_class = (Class)THChapterBrowserControllerAccessibility;
    -[THChapterBrowserControllerAccessibility scrollViewDidEndDragging:willDecelerate:](&v8, "scrollViewDidEndDragging:willDecelerate:", a3, v4);
    if ((v7 & 1) == 0)
    {
      if (-[THChapterBrowserControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("mPullThroughInProgress")))-[THChapterBrowserControllerAccessibility _axDidInitiatePullThrough](self, "_axDidInitiatePullThrough");
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THChapterBrowserControllerAccessibility;
    -[THChapterBrowserControllerAccessibility scrollViewDidEndDragging:willDecelerate:](&v8, "scrollViewDidEndDragging:willDecelerate:", a3, v4);
  }
}

- (BOOL)introMediaControllerIsActive
{
  THChapterBrowserControllerAccessibility *v3;
  BOOL result;
  objc_super v5;

  v3 = (THChapterBrowserControllerAccessibility *)objc_msgSend(-[THChapterBrowserControllerAccessibility thaxDelegate](self, "thaxDelegate"), "tsaxValueForKey:", CFSTR("visibleViewController"));
  v5.receiver = self;
  v5.super_class = (Class)THChapterBrowserControllerAccessibility;
  result = -[THChapterBrowserControllerAccessibility introMediaControllerIsActive](&v5, "introMediaControllerIsActive");
  if (v3 != self)
    return 0;
  return result;
}

- (void)viewWillUnload
{
  objc_super v3;

  -[THChapterBrowserControllerAccessibility _axClearWeakReferencesToSelf](self, "_axClearWeakReferencesToSelf");
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility viewWillUnload](&v3, "viewWillUnload");
}

- (void)dealloc
{
  objc_super v3;

  -[THChapterBrowserControllerAccessibility _axClearWeakReferencesToSelf](self, "_axClearWeakReferencesToSelf");
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserControllerAccessibility;
  -[THChapterBrowserControllerAccessibility dealloc](&v3, "dealloc");
}

- (id)thaxTitleForPageIndex:(unint64_t)a3 numberOfPages:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  int64_t v9;
  NSString *v10;
  NSString *v11;
  NSString *v13;
  uint64_t v14;
  NSString *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (-[THChapterBrowserControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("hasIntroPage")))
  {
    if (!a3)
      return THAccessibilityLocalizedString((uint64_t)CFSTR("introduction.media"));
    --a3;
    --a4;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = objc_msgSend(-[THChapterBrowserControllerAccessibility _axSectionIdentifierOfChapterAtIndex:](self, "_axSectionIdentifierOfChapterAtIndex:", a3), "integerValue");
  if ((uint64_t)v7 < 1)
  {
    v13 = 0;
  }
  else
  {
    v8 = (uint64_t)v7;
    v9 = -[THChapterBrowserControllerAccessibility _axNumberOfRegularChapters](self, "_axNumberOfRegularChapters");
    if (v8 <= v9)
    {
      v14 = v9;
      v15 = THAccessibilityLocalizedString((uint64_t)CFSTR("chapter.number.of.number %@ %@"));
      v16 = TSAccessibilityLocalizedUnsignedInteger(v8);
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16, TSAccessibilityLocalizedUnsignedInteger(v14));
    }
    else
    {
      v10 = THAccessibilityLocalizedString((uint64_t)CFSTR("chapter.number %@"));
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, TSAccessibilityLocalizedUnsignedInteger(v8), v24);
    }
    v13 = v11;
  }
  v17 = -[THChapterBrowserControllerAccessibility _axTitleOfChapterAtIndex:](self, "_axTitleOfChapterAtIndex:", a3);
  return __TSAccessibilityStringForVariables(1, v13, v18, v19, v20, v21, v22, v23, (uint64_t)v17);
}

- (void)_axRefreshShowingContentFlag
{
  -[THChapterBrowserControllerAccessibility _thaxSetShowingContent:](self, "_thaxSetShowingContent:", -[THChapterBrowserControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("introMediaControllerIsActive")) ^ 1);
}

- (void)_axDidChangePageUsingChapterPageControl:(BOOL)a3
{
  unsigned int v5;
  unsigned int v6;
  id v7;
  _QWORD v8[5];

  v5 = -[THChapterBrowserControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("hasIntroPage"));
  v6 = -[THChapterBrowserControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("introMediaControllerIsActive"));
  if (-[THChapterBrowserControllerAccessibility _thaxShouldOutputCurrentChapterForPageChange](self, "_thaxShouldOutputCurrentChapterForPageChange"))
  {
    UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, objc_msgSend(-[THChapterBrowserControllerAccessibility _thaxChapterPageControl](self, "_thaxChapterPageControl"), "accessibilityValue"));
    -[THChapterBrowserControllerAccessibility _thaxSetShouldOutputCurrentChapterForPageChange:](self, "_thaxSetShouldOutputCurrentChapterForPageChange:", 0);
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if ((v5 & v6) == 1)
      -[THChapterBrowserControllerAccessibility _axHideToolbar](self, "_axHideToolbar");
    else
      -[THChapterBrowserControllerAccessibility _axShowToolbar](self, "_axShowToolbar");
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  if (v5)
  {
    if (((-[THChapterBrowserControllerAccessibility _thaxIsShowingContent](self, "_thaxIsShowingContent") | v6) & 1) == 0
      && !a3)
    {
      v7 = objc_msgSend(-[THChapterBrowserControllerAccessibility thaxDelegate](self, "thaxDelegate"), "tsaxValueForKey:", CFSTR("closeButton"));
      UIAccessibilityPostNotification(TSAccessibilityMoveToElementNotification, v7);
    }
    -[THChapterBrowserControllerAccessibility _thaxSetShowingContent:](self, "_thaxSetShowingContent:", v6 ^ 1);
  }
  objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("previousChapterViewController")), "tsaxValueForKey:", CFSTR("interactiveCanvasController")), "tsaxValueForKey:", CFSTR("canvasView")), "tsaxInvalidateChildrenEventually");
  objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("chapterViewController")), "tsaxValueForKey:", CFSTR("interactiveCanvasController")), "tsaxValueForKey:", CFSTR("canvasView")), "tsaxInvalidateChildrenEventually");
  objc_msgSend(objc_msgSend(objc_msgSend(-[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("nextChapterViewController")), "tsaxValueForKey:", CFSTR("interactiveCanvasController")), "tsaxValueForKey:", CFSTR("canvasView")), "tsaxInvalidateChildrenEventually");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_25ED60;
  v8[3] = &unk_426DD0;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
    abort();
}

- (void)_axDidInitiatePullThrough
{
  -[THChapterBrowserControllerAccessibility _thaxSetShouldOutputCurrentChapterForPageThumbnailsScrollStatus:](self, "_thaxSetShouldOutputCurrentChapterForPageThumbnailsScrollStatus:", 1);
}

- (id)_axTileModelOfChapterAtIndex:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  v5 = -[THChapterBrowserControllerAccessibility thaxDelegate](self, "thaxDelegate");
  if ((objc_opt_respondsToSelector(v5, "chapterBrowserController:tocTileModelAtIndex:") & 1) != 0)
    return objc_msgSend(v5, "chapterBrowserController:tocTileModelAtIndex:", self, v3);
  else
    return 0;
}

- (id)_axTitleOfChapterAtIndex:(unsigned int)a3
{
  return objc_msgSend(-[THChapterBrowserControllerAccessibility _axTileModelOfChapterAtIndex:](self, "_axTileModelOfChapterAtIndex:", *(_QWORD *)&a3), "tsaxValueForKey:", CFSTR("frontTitleText"));
}

- (id)_axSectionIdentifierOfChapterAtIndex:(unsigned int)a3
{
  void *v3;
  _QWORD v5[6];
  unsigned int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_25EEBC;
  v11 = sub_25EECC;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_25EED8;
  v5[3] = &unk_43C490;
  v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (unint64_t)_axNumberOfRegularChapters
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  id v8;

  v3 = -[THChapterBrowserControllerAccessibility thaxDelegate](self, "thaxDelegate");
  if ((objc_opt_respondsToSelector(v3, "chapterCountForChapterBrowserController:") & 1) == 0)
    return 0;
  v4 = objc_msgSend(v3, "chapterCountForChapterBrowserController:", self);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = objc_msgSend(-[THChapterBrowserControllerAccessibility _axSectionIdentifierOfChapterAtIndex:](self, "_axSectionIdentifierOfChapterAtIndex:", v7), "integerValue");
    if ((id)(v6 + 1) != v8)
    {
      if (v6)
        return v6;
      v8 = 0;
    }
    v7 = (v7 + 1);
    v6 = (unint64_t)v8;
  }
  while (v5 != (_DWORD)v7);
  return v6;
}

- (void)_axClearWeakReferencesToSelf
{
  objc_msgSend(-[THChapterBrowserControllerAccessibility _thaxChapterPageControl](self, "_thaxChapterPageControl"), "thaxSetDelegate:", 0);
  objc_msgSend(-[THChapterBrowserControllerAccessibility _thaxPagesScrollView](self, "_thaxPagesScrollView"), "thaxSetScrollingDelegate:", 0);
  objc_msgSend(-[THChapterBrowserControllerAccessibility _thaxBackgroundScrollView](self, "_thaxBackgroundScrollView"), "thaxSetScrollingDelegate:", 0);
}

- (id)thaxScrollStatusStringForScrollView:(id)a3
{
  NSMutableString *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  Class v23;
  uint64_t v24;
  void *v26;
  Class v27;
  Class v28;
  void *v29;
  Class v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  CGRect v44;
  CGRect v45;

  if (-[THChapterBrowserControllerAccessibility _thaxPagesScrollView](self, "_thaxPagesScrollView") == a3)
  {
    objc_msgSend(a3, "frame");
    v7 = v6;
    v9 = v8;
    objc_msgSend(a3, "contentOffset");
    v11 = v10;
    v12 = objc_msgSend(a3, "subviews");
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v18, "frame");
          v45.origin.x = v19;
          v45.origin.y = v20;
          v45.size.width = v21;
          v45.size.height = v22;
          v44.origin.y = 0.0;
          v44.origin.x = v11;
          v44.size.width = v7;
          v44.size.height = v9;
          if (CGRectIntersectsRect(v44, v45))
          {
            v23 = NSClassFromString(CFSTR("THPageThumbnailView"));
            if ((objc_opt_isKindOfClass(v18, v23) & 1) != 0)
            {
              if (!v15)
                v15 = (void *)objc_opt_new(NSMutableArray, v24);
              objc_msgSend(v15, "addObject:", v18);
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }
    if ((unint64_t)objc_msgSend(v15, "count") < 2)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v15, "sortUsingSelector:", NSSelectorFromString(CFSTR("accessibilityCompareGeometry:")));
      v38 = 0;
      v26 = (void *)objc_opt_class(THPageThumbnailViewAccessibility);
      v27 = __TSAccessibilityCastAsSafeCategory(v26, (uint64_t)objc_msgSend(v15, "firstObject"), 1, &v38);
      if (v38
        || (v28 = v27,
            v38 = 0,
            v29 = (void *)objc_opt_class(THPageThumbnailViewAccessibility),
            v30 = __TSAccessibilityCastAsSafeCategory(v29, (uint64_t)objc_msgSend(v15, "lastObject"), 1, &v38),
            v38))
      {
        abort();
      }
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("thumbnails.number.to.number %@ %@")), -[objc_class thaxLocalizedPageNumber](v28, "thaxLocalizedPageNumber"), -[objc_class thaxLocalizedPageNumber](v30, "thaxLocalizedPageNumber"));
    }

    if (-[THChapterBrowserControllerAccessibility _thaxShouldOutputCurrentChapterForPageThumbnailsScrollStatus](self, "_thaxShouldOutputCurrentChapterForPageThumbnailsScrollStatus"))
    {
      v31 = objc_msgSend(-[THChapterBrowserControllerAccessibility _thaxChapterPageControl](self, "_thaxChapterPageControl"), "accessibilityValue");
      v5 = __TSAccessibilityStringForVariables(1, v31, v32, v33, v34, v35, v36, v37, (uint64_t)v5);
      -[THChapterBrowserControllerAccessibility _thaxSetShouldOutputCurrentChapterForPageThumbnailsScrollStatus:](self, "_thaxSetShouldOutputCurrentChapterForPageThumbnailsScrollStatus:", 0);
    }
  }
  else
  {
    if (-[THChapterBrowserControllerAccessibility _thaxBackgroundScrollView](self, "_thaxBackgroundScrollView") == a3)
      return objc_msgSend(-[THChapterBrowserControllerAccessibility _thaxChapterPageControl](self, "_thaxChapterPageControl"), "accessibilityValue");
    return 0;
  }
  return v5;
}

- (void)thaxScrollView:(id)a3 scrollElementToVisible:(id)a4
{
  Class v7;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  NSArray *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSArray *v27;
  unsigned int v28;
  char *v29;
  uint64_t *v30;
  char *v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  CGFloat MinX;
  void *v40;
  uint64_t v41;
  double v45;
  CGFloat MaxX;
  _QWORD v47[7];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  uint64_t v57;
  _QWORD v58[2];
  NSArray *(*v59)(uint64_t);
  void *v60;
  id v61;
  uint64_t *v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  const char *v68;
  CGPoint v69;
  CGRect v70;
  CGRect v71;

  if (-[THChapterBrowserControllerAccessibility _thaxPagesScrollView](self, "_thaxPagesScrollView") == a3)
  {
    v7 = NSClassFromString(CFSTR("THPageThumbnailView"));
    if ((objc_opt_isKindOfClass(a4, v7) & 1) != 0)
    {
      if (TSAccessibilityShouldPerformValidationChecks())
      {
        if (objc_msgSend(a4, "accessibilityElementIsFocused"))
        {
          ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("%@ was supposed to receive the accessibilityScrollToVisible message before becoming the focused element."), v9, v10, v11, v12, v13, (uint64_t)a4))abort();
        }
      }
      objc_msgSend(a3, "frame");
      v15 = v14;
      v65 = 0;
      v66 = (double *)&v65;
      v67 = 0x3010000000;
      v68 = "";
      v69 = CGPointZero;
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v59 = sub_25F784;
      v60 = &unk_43C4D8;
      v61 = a3;
      v62 = &v65;
      v63 = v14;
      v64 = v16;
      v17 = sub_25F784((uint64_t)v58);
      v18 = -[NSArray indexOfObject:](v17, "indexOfObject:", a4);
      if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_7;
      v19 = -[NSArray count](v17, "count");
      if ((unint64_t)v19 >= 3
        && (unint64_t)v18 <= 1
        && objc_msgSend(-[NSArray objectAtIndex:](v17, "objectAtIndex:", v18 + 1), "accessibilityElementIsFocused")&& (objc_msgSend(-[NSArray objectAtIndex:](v17, "objectAtIndex:", 0), "frame"), CGRectGetMinX(v70) < v66[4]))
      {
        v20 = 0;
        v21 = -1.0;
        v22 = 1;
      }
      else
      {
        if ((unint64_t)v19 < 3
          || v18 < v19 - 2
          || !objc_msgSend(-[NSArray objectAtIndex:](v17, "objectAtIndex:", v18 - 1), "accessibilityElementIsFocused")|| (objc_msgSend(-[NSArray lastObject](v17, "lastObject"), "frame"), CGRectGetMaxX(v71) <= v15 + v66[4]))
        {
LABEL_7:
          _Block_object_dispose(&v65, 8);
          return;
        }
        v22 = 0;
        v21 = 1.0;
        v20 = 2;
      }
      objc_msgSend(a3, "contentOffset");
      v24 = v23;
      v26 = v25 + v21 * (v15 * 0.4);
      objc_msgSend(a3, "setContentOffset:animated:", 0, v26, v23);
      v27 = v59((uint64_t)v58);
      v28 = objc_msgSend(a4, "tsaxUnsignedIntValueForKey:", CFSTR("chapterIndex"));
      v52 = 0;
      v53 = &v52;
      v29 = (char *)v28;
      v54 = 0x3052000000;
      v55 = sub_25EEBC;
      v56 = sub_25EECC;
      v57 = 0;
      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v51 = 0;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_25F9E0;
      v47[3] = &unk_43C500;
      v47[5] = &v48;
      v47[6] = v28;
      v47[4] = &v52;
      -[NSArray enumerateObjectsWithOptions:usingBlock:](v27, "enumerateObjectsWithOptions:usingBlock:", v20, v47);
      v30 = v49;
      if (*((_BYTE *)v49 + 24))
        goto LABEL_29;
      if (v28)
      {
        v31 = (char *)objc_msgSend(-[THChapterBrowserControllerAccessibility _thaxChapterPageControl](self, "_thaxChapterPageControl"), "thaxNumberOfPages");
        v32 = -[THChapterBrowserControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("hasIntroPage"));
        if (v31)
          v33 = v32;
        else
          v33 = 0;
        v30 = v49;
        *((_BYTE *)v49 + 24) = &v31[-v33 - 1] == v29;
        if (&v31[-v33 - 1] == v29)
          goto LABEL_29;
        v34 = (void *)v53[5];
        if (!v34)
          goto LABEL_29;
        objc_msgSend(v34, "frame");
        if (v22)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v35);
          v30 = v49;
          if (MinX <= v26)
            goto LABEL_29;
          goto LABEL_28;
        }
        MaxX = CGRectGetMaxX(*(CGRect *)&v35);
        v30 = v49;
        if (MaxX >= v15 + v26)
        {
LABEL_29:
          if (*((_BYTE *)v30 + 24))
          {
            v40 = (void *)v53[5];
            if (v40)
            {
              objc_msgSend(v40, "frame");
              if (v22)
                v45 = CGRectGetMinX(*(CGRect *)&v41);
              else
                v45 = CGRectGetMaxX(*(CGRect *)&v41) - v15;
              objc_msgSend(a3, "setContentOffset:animated:", 0, v45, v24);
            }
          }
          _Block_object_dispose(&v48, 8);
          _Block_object_dispose(&v52, 8);
          goto LABEL_7;
        }
      }
LABEL_28:
      *((_BYTE *)v30 + 24) = 1;
      goto LABEL_29;
    }
  }
}

- (id)_thaxChapterPageControl
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THChapterBrowserScrubbablePageControlAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("chapterPageControl")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_thaxPagesScrollView
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THUIScrollViewAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("pagesScrollView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_thaxBackgroundScrollView
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THUIScrollViewAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THChapterBrowserControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("backgroundScrollView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
