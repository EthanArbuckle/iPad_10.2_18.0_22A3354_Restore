@implementation THBookViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THBookViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_thaxIsGlossaryOpenedFromPopover
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A13);
}

- (void)_thaxSetGlossaryOpenedFromPopover:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A13, a3);
}

- (id)_thaxFullscreenNotesViewOriginatingButton
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A14);
}

- (void)_thaxSetFullscreenNotesViewOriginatingButton:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A14, a3);
}

- (THDocumentViewControllerAccessibility)thaxDocumentViewController
{
  void *v3;
  THDocumentViewControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THDocumentViewControllerAccessibility);
  result = (THDocumentViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("documentViewController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THToolbarControllerAccessibility)thaxToolbarController
{
  void *v3;
  THToolbarControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THToolbarControllerAccessibility);
  result = (THToolbarControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("toolbarController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)thaxPerformBlock:(id)a3 allowsToolbarHideRequest:(BOOL)a4
{
  THDocumentViewControllerAccessibility *v5;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  if (a4)
  {
    v5 = -[THBookViewControllerAccessibility thaxDocumentViewController](self, "thaxDocumentViewController");
    if (v5)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_253304;
      v6[3] = &unk_43C390;
      v6[4] = v5;
      v6[5] = a3;
      v6[6] = &v7;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
        abort();
    }
  }
  if (!*((_BYTE *)v8 + 24))
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  _Block_object_dispose(&v7, 8);
}

- (void)_axShowToolbarIfAppropriate
{
  _QWORD v3[5];

  if (-[THBookViewControllerAccessibility _thaxShouldPreventToolbarNavbarHiding](self, "_thaxShouldPreventToolbarNavbarHiding"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_2533A8;
    v3[3] = &unk_426DD0;
    v3[4] = self;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
      abort();
  }
}

- (id)thaxChapterBrowserController:(id)a3 tocTileModelAtIndex:(unint64_t)a4
{
  uint64_t v4;
  void *v5;
  id result;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_2534A0;
  v12 = sub_2534B0;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2534BC;
  v7[3] = &unk_43BE10;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = &v8;
  v7[7] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  LOBYTE(v8) = 0;
  v5 = (void *)objc_opt_class(THTOCTileModelAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v5, v4, 1, &v8);
  if ((_BYTE)v8)
    abort();
  return result;
}

- (BOOL)thaxIsTOCVisible
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2535A0;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[THToolbarControllerAccessibility thaxForceSetToolbarHidden:](-[THBookViewControllerAccessibility thaxToolbarController](self, "thaxToolbarController"), "thaxForceSetToolbarHidden:", 1);
  v5.receiver = self;
  v5.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility viewWillAppear:](&v5, "viewWillAppear:", v3);
  -[THBookViewControllerAccessibility _thaxApplyAccessibilityInfo](self, "_thaxApplyAccessibilityInfo");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)shouldAutohideNavigationBar
{
  objc_super v4;

  if (-[THBookViewControllerAccessibility _thaxShouldPreventToolbarNavbarHiding](self, "_thaxShouldPreventToolbarNavbarHiding"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THBookViewControllerAccessibility;
  return -[THBookViewControllerAccessibility shouldAutohideNavigationBar](&v4, "shouldAutohideNavigationBar");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[THBookViewControllerAccessibility _axShowToolbarIfAppropriate](self, "_axShowToolbarIfAppropriate");
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)showTOC
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility showTOC](&v3, "showTOC");
  -[THBookViewControllerAccessibility _thaxHideDVCElements](self, "_thaxHideDVCElements");
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)removeTOC
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_2537C0;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__IMAccessibilityPerformSafeBlock(v2, a2))
    abort();
}

- (void)donePressedFromToolbar:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_253850;
  v3[3] = &unk_426E28;
  v3[4] = a3;
  v3[5] = self;
  if (__IMAccessibilityPerformSafeBlock(v3, a2))
    abort();
}

- (void)showToolbarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!-[THTOCViewControllerAccessibility thaxIntroMediaControllerIsActive](-[THBookViewControllerAccessibility _thaxSelectedTOCViewController](self, "_thaxSelectedTOCViewController"), "thaxIntroMediaControllerIsActive")|| !-[THBookViewControllerAccessibility _thaxShouldPreventToolbarNavbarHiding](self, "_thaxShouldPreventToolbarNavbarHiding"))
  {
    v5.receiver = self;
    v5.super_class = (Class)THBookViewControllerAccessibility;
    -[THBookViewControllerAccessibility showToolbarAnimated:](&v5, "showToolbarAnimated:", v3);
  }
}

- (void)p_showDVC
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility p_showDVC](&v3, "p_showDVC");
  -[THBookViewControllerAccessibility _thaxShowDVCElements](self, "_thaxShowDVCElements");
}

- (void)p_showDVCAnimated:(BOOL)a3 withLink:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility p_showDVCAnimated:withLink:](&v5, "p_showDVCAnimated:withLink:", a3, a4);
  -[THBookViewControllerAccessibility _thaxShowDVCElements](self, "_thaxShowDVCElements");
}

- (id)__accessibilityImageNameForButton:(id)a3
{
  return objc_msgSend(objc_msgSend(a3, "tsaxValueForKey:", CFSTR("_accessibilityImagePath")), "lastPathComponent");
}

- (void)p_applyAccessibilityLabelForButton:(id)a3 withImageNamed:(id)a4
{
  const __CFString *v6;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (objc_msgSend(a4, "hasPrefix:", CFSTR("list.bullet")))
  {
    v6 = CFSTR("toc.and.glossary.button");
LABEL_11:
    objc_msgSend(a3, "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)v6));
    return;
  }
  if (objc_msgSend(a4, "hasPrefix:", CFSTR("rectangle")))
  {
    v6 = CFSTR("annotation.button");
    goto LABEL_11;
  }
  if (objc_msgSend(a4, "hasPrefix:", CFSTR("sun.max")))
  {
    v6 = CFSTR("brightness.button");
    goto LABEL_11;
  }
  if (objc_msgSend(a4, "hasPrefix:", CFSTR("textformat.size")))
  {
    v6 = CFSTR("font.size.and.brightness.button");
    goto LABEL_11;
  }
  if (objc_msgSend(a4, "hasPrefix:", CFSTR("magnifyingglass")))
  {
    v6 = CFSTR("search.button");
    goto LABEL_11;
  }
  if (objc_msgSend(a4, "hasPrefix:", CFSTR("bookmark")))
  {
    objc_msgSend(a3, "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("bookmark.button")));
    objc_msgSend(a3, "setAccessibilityHint:", THAccessibilityLocalizedString((uint64_t)CFSTR("bookmark.button.hint.iOS")));
  }
  else
  {
    if (objc_msgSend(a4, "hasPrefix:", CFSTR("chevron.backward")))
    {
      v6 = CFSTR("library.button");
      goto LABEL_11;
    }
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("No label found for image named: %@"), v8, v9, v10, v11, v12, (uint64_t)a4))abort();
    }
  }
}

- (void)updateBookmarkButton
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility updateBookmarkButton](&v6, "updateBookmarkButton");
  v3 = -[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("bookmarkToolbarButton"));
  v4 = objc_opt_class(UIButton);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    if (objc_msgSend(v3, "isSelected"))
    {
      objc_msgSend(v3, "setAccessibilityValue:", THAccessibilityLocalizedString((uint64_t)CFSTR("bookmark.button.is.bookmarked")));
      v5 = (unint64_t)objc_msgSend(v3, "accessibilityTraits");
      objc_msgSend(v3, "setAccessibilityTraits:", v5 & ~UIAccessibilityTraitSelected);
    }
    else
    {
      objc_msgSend(v3, "setAccessibilityValue:", 0);
    }
  }
}

- (void)p_showGlossary
{
  objc_super v3;

  if (objc_msgSend(-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mTOCGlossaryPopover")), "tsaxBoolValueForKey:", CFSTR("isPopoverVisible")))-[THBookViewControllerAccessibility _thaxSetGlossaryOpenedFromPopover:](self, "_thaxSetGlossaryOpenedFromPopover:", 1);
  v3.receiver = self;
  v3.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility p_showGlossary](&v3, "p_showGlossary");
  -[THBookViewControllerAccessibility _thaxHideDVCElements](self, "_thaxHideDVCElements");
  -[TSAccessibility setFirstElementForUpcomingScreenChange:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "setFirstElementForUpcomingScreenChange:", 0);
}

- (void)hideGlossaryWithDestinationViewController:(id)a3
{
  unsigned int v5;
  objc_super v6;

  v5 = -[THBookViewControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isGlossaryVisible"));
  v6.receiver = self;
  v6.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility hideGlossaryWithDestinationViewController:](&v6, "hideGlossaryWithDestinationViewController:", a3);
  if (v5)
  {
    if (-[THBookViewControllerAccessibility _thaxIsGlossaryOpenedFromPopover](self, "_thaxIsGlossaryOpenedFromPopover"))
      -[TSAccessibility setFirstElementForUpcomingScreenChange:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "setFirstElementForUpcomingScreenChange:", -[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tocGlossaryButton")));
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  }
  -[THBookViewControllerAccessibility _thaxSetGlossaryOpenedFromPopover:](self, "_thaxSetGlossaryOpenedFromPopover:", 0);
}

- (void)showFullscreenNotesView:(id)a3
{
  objc_super v5;

  -[THBookViewControllerAccessibility _thaxSetFullscreenNotesViewOriginatingButton:](self, "_thaxSetFullscreenNotesViewOriginatingButton:", -[TSAccessibility currentlyFocusedElement](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "currentlyFocusedElement"));
  v5.receiver = self;
  v5.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility showFullscreenNotesView:](&v5, "showFullscreenNotesView:", a3);
  -[THBookViewControllerAccessibility _thaxHideDVCElements](self, "_thaxHideDVCElements");
}

- (void)hideFullscreenNotesView:(id)a3 andSearchForText:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility hideFullscreenNotesView:andSearchForText:animated:completion:](&v7, "hideFullscreenNotesView:andSearchForText:animated:completion:", a3, a4, a5, a6);
  -[THBookViewControllerAccessibility _axShowToolbarIfAppropriate](self, "_axShowToolbarIfAppropriate");
  -[TSAccessibility setFirstElementForUpcomingScreenChange:](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "setFirstElementForUpcomingScreenChange:", -[THBookViewControllerAccessibility _thaxFullscreenNotesViewOriginatingButton](self, "_thaxFullscreenNotesViewOriginatingButton"));
  -[THBookViewControllerAccessibility _thaxSetFullscreenNotesViewOriginatingButton:](self, "_thaxSetFullscreenNotesViewOriginatingButton:", 0);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (id)childViewControllerForStatusBarHidden
{
  THDocumentViewControllerAccessibility *v3;
  objc_super v5;

  v3 = -[THBookViewControllerAccessibility thaxDocumentViewController](self, "thaxDocumentViewController");
  if (!UIAccessibilityIsVoiceOverRunning()
    || !-[THDocumentViewControllerAccessibility thaxExpandedViewController](v3, "thaxExpandedViewController"))
  {
    v5.receiver = self;
    v5.super_class = (Class)THBookViewControllerAccessibility;
    return -[THBookViewControllerAccessibility childViewControllerForStatusBarHidden](&v5, "childViewControllerForStatusBarHidden");
  }
  return v3;
}

- (id)p_popoverPassthroughViews
{
  objc_super v4;

  if (-[TSAccessibility needsAccessibilityElements](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "needsAccessibilityElements"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THBookViewControllerAccessibility;
  return -[THBookViewControllerAccessibility p_popoverPassthroughViews](&v4, "p_popoverPassthroughViews");
}

- (void)applyAppearanceStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility applyAppearanceStyle:](&v4, "applyAppearanceStyle:", a3);
  -[THBookViewControllerAccessibility _thaxUpdateSpeakScreenColorsForCurrentTheme](self, "_thaxUpdateSpeakScreenColorsForCurrentTheme");
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THBookViewControllerAccessibility;
  -[THBookViewControllerAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[THBookViewControllerAccessibility _thaxApplyAccessibilityInfo](self, "_thaxApplyAccessibilityInfo");
}

- (UIButton)_thaxBookmarkToolbarButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("bookmarkToolbarButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_thaxDisplaySettingsToolbarButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("displaySettingsToolbarButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_thaxSearchToolbarButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("searchToolbarButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_thaxNotesToolbarButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("notesToolbarButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_thaxTocGlossaryButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tocGlossaryButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIBarButtonItem)_thaxBuyButtonItem
{
  objc_class *v3;
  UIBarButtonItem *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIBarButtonItem);
  result = (UIBarButtonItem *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("buyButtonItem")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_thaxCloseButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("closeButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIBarButtonItem)_thaxCloseButtonItem
{
  objc_class *v3;
  UIBarButtonItem *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIBarButtonItem);
  result = (UIBarButtonItem *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("closeButtonItem")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_thaxCloseTOCButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("closeTOCButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THTOCViewControllerAccessibility)_thaxSelectedTOCViewController
{
  void *v3;
  uint64_t v4;
  THTOCViewControllerAccessibility *result;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  char v13;

  v13 = 0;
  v3 = (void *)objc_opt_class(THTOCViewControllerAccessibility);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_2534A0;
  v11 = sub_2534B0;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2543FC;
  v6[3] = &unk_42BF18;
  v6[4] = self;
  v6[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  result = (THTOCViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, v4, 1, &v13);
  if (v13)
    abort();
  return result;
}

- (IMTheme)_thaxTheme
{
  objc_class *v3;
  IMTheme *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(IMTheme);
  result = (IMTheme *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THBookViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("theme")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)_thaxApplyAccessibilityInfo
{
  -[UIBarButtonItem setAccessibilityLabel:](-[THBookViewControllerAccessibility _thaxCloseButtonItem](self, "_thaxCloseButtonItem"), "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("library.button")));
  -[UIButton setAccessibilityLabel:](-[THBookViewControllerAccessibility _thaxBookmarkToolbarButton](self, "_thaxBookmarkToolbarButton"), "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("bookmark.button")));
  -[UIButton setAccessibilityHint:](-[THBookViewControllerAccessibility _thaxBookmarkToolbarButton](self, "_thaxBookmarkToolbarButton"), "setAccessibilityHint:", THAccessibilityLocalizedString((uint64_t)CFSTR("bookmark.button.hint.iOS")));
  -[UIButton setAccessibilityLabel:](-[THBookViewControllerAccessibility _thaxDisplaySettingsToolbarButton](self, "_thaxDisplaySettingsToolbarButton"), "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("font.size.and.brightness.button")));
  -[UIButton setAccessibilityLabel:](-[THBookViewControllerAccessibility _thaxSearchToolbarButton](self, "_thaxSearchToolbarButton"), "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("search.button")));
  -[UIButton setAccessibilityLabel:](-[THBookViewControllerAccessibility _thaxNotesToolbarButton](self, "_thaxNotesToolbarButton"), "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("annotation.button")));
  -[UIButton setAccessibilityLabel:](-[THBookViewControllerAccessibility _thaxTocGlossaryButton](self, "_thaxTocGlossaryButton"), "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("toc.and.glossary.button")));
  -[UIBarButtonItem setAccessibilityLabel:](-[THBookViewControllerAccessibility _thaxBuyButtonItem](self, "_thaxBuyButtonItem"), "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("buy.button")));
  -[THBookViewControllerAccessibility _thaxUpdateSpeakScreenColorsForCurrentTheme](self, "_thaxUpdateSpeakScreenColorsForCurrentTheme");
}

- (void)_thaxShowDVCElements
{
  objc_class *v3;
  void *v4;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THDocumentViewControllerAccessibility tsaxValueForKey:](-[THBookViewControllerAccessibility thaxDocumentViewController](self, "thaxDocumentViewController"), "tsaxValueForKey:", CFSTR("view")), 1, &v5);
  if (v5)
    abort();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", 0);
  -[THBookViewControllerAccessibility _axShowToolbarIfAppropriate](self, "_axShowToolbarIfAppropriate");
}

- (void)_thaxHideDVCElements
{
  objc_class *v3;
  void *v4;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THDocumentViewControllerAccessibility tsaxValueForKey:](-[THBookViewControllerAccessibility thaxDocumentViewController](self, "thaxDocumentViewController"), "tsaxValueForKey:", CFSTR("view")), 1, &v5);
  if (v5)
    abort();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", 1);
}

- (void)_thaxUpdateSpeakScreenColorsForCurrentTheme
{
  IMTheme *v2;

  v2 = -[THBookViewControllerAccessibility _thaxTheme](self, "_thaxTheme");
  -[IMCommonCoreAccessibility setPreferredSpeakScreenHighlightColor:](+[IMCommonCoreAccessibility sharedInstance](IMCommonCoreAccessibility, "sharedInstance"), "setPreferredSpeakScreenHighlightColor:", -[IMTheme speakScreenHighlightColor](v2, "speakScreenHighlightColor"));
  -[IMCommonCoreAccessibility setPreferredSpeakScreenUnderlineColor:](+[IMCommonCoreAccessibility sharedInstance](IMCommonCoreAccessibility, "sharedInstance"), "setPreferredSpeakScreenUnderlineColor:", -[IMTheme speakScreenUnderlineColor](v2, "speakScreenUnderlineColor"));
}

- (BOOL)_thaxShouldPreventToolbarNavbarHiding
{
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSCommandAndControlEnabled())
  {
    return 1;
  }
  else
  {
    return THAccessibilityIsFKAEnabledWithKeyboardAttached();
  }
}

@end
