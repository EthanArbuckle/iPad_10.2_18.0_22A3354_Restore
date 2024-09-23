@implementation THNoteCardsControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNoteCardsController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)thaxGotoNextCard
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_256FFC;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)thaxGotoPreviousCard
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_257064;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (BOOL)thaxIsShowingEmptyStudyCard
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
  v4[2] = sub_257120;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)thaxCanFlipTopCard
{
  return -[THNoteCardsControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("canFlipTopCard"));
}

- (THAccessibilityNoteCardInfo)thaxInfoForTopCard
{
  id v2;
  int ShouldCrashOnValidationErrorAfterLaunch;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = -[THNoteCardsControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("p_topNoteCardInfo"));
  if ((objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___THAccessibilityNoteCardInfo) & 1) == 0)
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      v4 = (objc_class *)objc_opt_class(v2);
      v5 = NSStringFromClass(v4);
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Info does not conform to the THAccessibilityNoteCardInfo: %@"), v6, v7, v8, v9, v10, (uint64_t)v5))abort();
    }
    return 0;
  }
  return (THAccessibilityNoteCardInfo *)v2;
}

- (THNoteCardLayerAccessibility)thaxTopCard
{
  void *v3;
  THNoteCardLayerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THNoteCardLayerAccessibility);
  result = (THNoteCardLayerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THNoteCardsControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("p_topNoteCard")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIView)thaxNoteCardsView
{
  objc_class *v3;
  UIView *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THNoteCardsControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_noteCardsView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)p_noteCardsForInfos:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THNoteCardsControllerAccessibility;
  v4 = -[THNoteCardsControllerAccessibility p_noteCardsForInfos:](&v6, "p_noteCardsForInfos:", a3);
  -[UIView setAccessibilityElements:](-[THNoteCardsControllerAccessibility thaxNoteCardsView](self, "thaxNoteCardsView"), "setAccessibilityElements:", v4);
  return v4;
}

- (void)detachFromView:(id)a3
{
  objc_super v5;

  -[UIView setAccessibilityElements:](-[THNoteCardsControllerAccessibility thaxNoteCardsView](self, "thaxNoteCardsView"), "setAccessibilityElements:", 0);
  v5.receiver = self;
  v5.super_class = (Class)THNoteCardsControllerAccessibility;
  -[THNoteCardsControllerAccessibility detachFromView:](&v5, "detachFromView:", a3);
}

- (void)p_handleDelayedCardUpdate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNoteCardsControllerAccessibility;
  -[THNoteCardsControllerAccessibility p_handleDelayedCardUpdate](&v3, "p_handleDelayedCardUpdate");
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, -[THNoteCardsControllerAccessibility thaxTopCard](self, "thaxTopCard"));
}

@end
