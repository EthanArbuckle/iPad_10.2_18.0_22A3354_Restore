@implementation THGlossaryDefinitionsViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THGlossaryDefinitionsViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_axClearWeakReferencesToSelf
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_258094;
  v2[3] = &unk_426DD0;
  v2[4] = -[THGlossaryDefinitionsViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mScrollView"));
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)dealloc
{
  objc_super v3;

  -[THGlossaryDefinitionsViewControllerAccessibility _axClearWeakReferencesToSelf](self, "_axClearWeakReferencesToSelf");
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewControllerAccessibility;
  -[THGlossaryDefinitionsViewControllerAccessibility dealloc](&v3, "dealloc");
}

- (void)loadView
{
  _QWORD v3[6];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THGlossaryDefinitionsViewControllerAccessibility;
  -[THGlossaryDefinitionsViewControllerAccessibility loadView](&v4, "loadView");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_258198;
  v3[3] = &unk_426E28;
  v3[4] = -[THGlossaryDefinitionsViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mScrollView"));
  v3[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (void)viewWillUnload
{
  objc_super v3;

  -[THGlossaryDefinitionsViewControllerAccessibility _axClearWeakReferencesToSelf](self, "_axClearWeakReferencesToSelf");
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewControllerAccessibility;
  -[THGlossaryDefinitionsViewControllerAccessibility viewWillUnload](&v3, "viewWillUnload");
}

- (id)thaxSuffixOfScrollStatusStringForScrollView:(id)a3
{
  return objc_msgSend(-[THGlossaryDefinitionsViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("displayedEntry")), "tsaxValueForKey:", CFSTR("term"));
}

- (void)p_entryDidLoad:(id)a3
{
  id v5;

  v5 = -[THGlossaryDefinitionsViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("glossaryViewController"));
  if ((objc_opt_respondsToSelector(v5, "_axGlossaryDefinitionsViewController:entryDidLoad:") & 1) != 0)
    objc_msgSend(v5, "_axGlossaryDefinitionsViewController:entryDidLoad:", self, a3);
}

@end
