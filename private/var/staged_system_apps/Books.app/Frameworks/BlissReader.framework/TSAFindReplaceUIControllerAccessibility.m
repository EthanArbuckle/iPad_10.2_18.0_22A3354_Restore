@implementation TSAFindReplaceUIControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSAFindReplaceUIController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSWPEditingControllerAccessibility)tsaxTextEditingController
{
  void *v3;

  if (!-[TSAccessibility supportsAdvancedTextSearchExperience](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "supportsAdvancedTextSearchExperience"))return 0;
  v3 = (void *)objc_opt_class(TSWPEditingControllerAccessibility);
  return (TSWPEditingControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_documentViewController")), "tsaxValueForKey:", CFSTR("interactiveCanvasController")), "tsaxValueForKey:", CFSTR("editorController")), "tsaxValueForKey:", CFSTR("textInputEditor")), 0, 0);
}

- (id)tsaxExitFind
{
  TSWPSelectionAccessibility *v3;
  _QWORD v5[5];

  v3 = -[TSAFindReplaceUIControllerAccessibility _tsaxActiveTextFindResultSelection](self, "_tsaxActiveTextFindResultSelection");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_235FE0;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  return v3;
}

- (TSAFindReplaceControllerAccessibility)_tsaxFindReplaceController
{
  void *v3;
  TSAFindReplaceControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSAFindReplaceControllerAccessibility);
  result = (TSAFindReplaceControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("findReplaceController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSWPSelectionAccessibility)_tsaxActiveTextFindResultSelection
{
  return -[TSAFindReplaceControllerAccessibility tsaxActiveTextFindResultSelection](-[TSAFindReplaceUIControllerAccessibility _tsaxFindReplaceController](self, "_tsaxFindReplaceController"), "tsaxActiveTextFindResultSelection");
}

- (void)_tsaxClearWeakReferences
{
  objc_class *v3;
  void *v4;
  void *v5;
  char v6;

  v6 = 0;
  v3 = (objc_class *)objc_opt_class(UIViewController);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v6);
  if (v6)
    abort();
  v5 = v4;
  if (objc_msgSend(v4, "isViewLoaded"))
    objc_msgSend(objc_msgSend(v5, "view"), "tsaxSetParentFindReplaceController:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[TSAFindReplaceUIControllerAccessibility _tsaxClearWeakReferences](self, "_tsaxClearWeakReferences");
  v3.receiver = self;
  v3.super_class = (Class)TSAFindReplaceUIControllerAccessibility;
  -[TSAFindReplaceUIControllerAccessibility dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  objc_class *v3;
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSAFindReplaceUIControllerAccessibility;
  -[TSAFindReplaceUIControllerAccessibility viewDidLoad](&v6, "viewDidLoad");
  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIViewController);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v5);
  if (v5)
    abort();
  objc_msgSend(objc_msgSend(v4, "view"), "tsaxSetParentFindReplaceController:", self);
  objc_msgSend(-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_findField")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("find.field")));
  objc_msgSend(-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_nextButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("next.findreplace")));
  objc_msgSend(-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_previousButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("previous.findreplace")));
  objc_msgSend(-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_replaceWithField")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("replace.field")));
  objc_msgSend(-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_gearButton")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("options.button")));
}

- (void)viewWillUnload
{
  objc_super v3;

  -[TSAFindReplaceUIControllerAccessibility _tsaxClearWeakReferences](self, "_tsaxClearWeakReferences");
  v3.receiver = self;
  v3.super_class = (Class)TSAFindReplaceUIControllerAccessibility;
  -[TSAFindReplaceUIControllerAccessibility viewWillUnload](&v3, "viewWillUnload");
}

- (void)p_findNextResultInDirection:(unint64_t)a3 alertingIfNotFound:(BOOL)a4
{
  _BOOL8 v4;
  TSWPEditingControllerAccessibility *v7;
  void *v8;
  Class v9;
  char v10;
  objc_super v11;
  _QWORD v12[6];
  BOOL v13;

  v4 = a4;
  v7 = -[TSAFindReplaceUIControllerAccessibility tsaxTextEditingController](self, "tsaxTextEditingController");
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_2363B4;
    v12[3] = &unk_43BC70;
    v13 = v4;
    v12[4] = self;
    v12[5] = a3;
    -[TSWPEditingControllerAccessibility tsaxPerformBlockAffectingTextSelection:](v7, "tsaxPerformBlockAffectingTextSelection:", v12);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TSAFindReplaceUIControllerAccessibility;
    -[TSAFindReplaceUIControllerAccessibility p_findNextResultInDirection:alertingIfNotFound:](&v11, "p_findNextResultInDirection:alertingIfNotFound:", a3, v4);
  }
  v10 = 0;
  v8 = (void *)objc_opt_class(TSWPInteractiveCanvasControllerAccessibility);
  v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)objc_msgSend(-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_documentViewController")), "tsaxValueForKey:", CFSTR("interactiveCanvasController")), 1, &v10);
  if (v10)
    abort();
  -[TSAFindReplaceControllerAccessibility tsaxDidChangeActiveFindResultInInteractiveCanvasController:window:](-[TSAFindReplaceUIControllerAccessibility _tsaxFindReplaceController](self, "_tsaxFindReplaceController"), "tsaxDidChangeActiveFindResultInInteractiveCanvasController:window:", v9, 0);
}

@end
