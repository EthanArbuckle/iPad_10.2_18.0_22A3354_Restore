@implementation THGlossaryViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THGlossaryViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)_thaxActiveEntryViewControllerBeingLoaded
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A18);
}

- (void)_thaxSetActiveEntryViewControllerBeingLoaded:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A18, a3);
}

- (void)_axDefinitionsScrollViewPositionDidChange
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_25900C;
  v2[3] = &unk_426DD0;
  v2[4] = objc_msgSend(objc_msgSend(-[THGlossaryViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("definitionsViewController")), "tsaxValueForKey:", CFSTR("mEntryViewControllers")), "tsaxValueForKey:", CFSTR("valueEnumerator"));
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)_axDidSwitchToEntryViewController:(id)a3 shouldWaitForEntryToBeLoaded:(BOOL *)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if ((objc_msgSend(a3, "tsaxBoolValueForKey:", CFSTR("loading")) & 1) == 0)
  {
    v6 = objc_msgSend(a3, "tsaxValueForKey:", CFSTR("mInfo"));
    v7 = objc_msgSend(a3, "tsaxValueForKey:", CFSTR("mICC"));
    v8 = objc_msgSend(v6, "tsaxValueForKey:", CFSTR("headerInfo"));
    if (v8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_259294;
      v9[3] = &unk_427D90;
      v9[4] = v7;
      v9[5] = v8;
      v9[6] = &v10;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v9))
        abort();
    }
  }
  if (a4)
    *a4 = *((_BYTE *)v11 + 24) ^ 1;
  _Block_object_dispose(&v10, 8);
}

- (void)didScrollToEntry:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THGlossaryViewControllerAccessibility;
  -[THGlossaryViewControllerAccessibility didScrollToEntry:](&v4, "didScrollToEntry:", a3);
  -[THGlossaryViewControllerAccessibility _axDefinitionsScrollViewPositionDidChange](self, "_axDefinitionsScrollViewPositionDidChange");
}

- (BOOL)followGlossaryAnchor:(id)a3
{
  BOOL v4;
  id v5;
  uint64_t v6;
  char v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)THGlossaryViewControllerAccessibility;
  v4 = -[THGlossaryViewControllerAccessibility followGlossaryAnchor:](&v16, "followGlossaryAnchor:", a3);
  -[THGlossaryViewControllerAccessibility _axDefinitionsScrollViewPositionDidChange](self, "_axDefinitionsScrollViewPositionDidChange");
  v5 = -[THGlossaryViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("definitionsViewController"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_2594A8;
  v14 = sub_2594B8;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2594C4;
  v9[3] = &unk_428E60;
  v9[4] = objc_msgSend(v5, "tsaxValueForKey:", CFSTR("mEntryViewControllers"));
  v9[5] = &v10;
  v9[6] = objc_msgSend(v5, "tsaxIntegerValueForKey:", CFSTR("p_currentEntryIndex"));
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v9))
    abort();
  v6 = v11[5];
  if (v6)
  {
    v8 = 1;
    -[THGlossaryViewControllerAccessibility _axDidSwitchToEntryViewController:shouldWaitForEntryToBeLoaded:](self, "_axDidSwitchToEntryViewController:shouldWaitForEntryToBeLoaded:", v6, &v8);
    if (v8)
      -[THGlossaryViewControllerAccessibility _thaxSetActiveEntryViewControllerBeingLoaded:](self, "_thaxSetActiveEntryViewControllerBeingLoaded:", v11[5]);
  }
  else
  {
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)_axGlossaryDefinitionsViewController:(id)a3 entryDidLoad:(id)a4
{
  id v6;
  char v7;

  v6 = -[THGlossaryViewControllerAccessibility _thaxActiveEntryViewControllerBeingLoaded](self, "_thaxActiveEntryViewControllerBeingLoaded", a3);
  if (v6 && v6 == a4)
  {
    v7 = 1;
    -[THGlossaryViewControllerAccessibility _axDidSwitchToEntryViewController:shouldWaitForEntryToBeLoaded:](self, "_axDidSwitchToEntryViewController:shouldWaitForEntryToBeLoaded:", a4, &v7);
    if (!v7)
      -[THGlossaryViewControllerAccessibility _thaxSetActiveEntryViewControllerBeingLoaded:](self, "_thaxSetActiveEntryViewControllerBeingLoaded:", 0);
  }
}

@end
