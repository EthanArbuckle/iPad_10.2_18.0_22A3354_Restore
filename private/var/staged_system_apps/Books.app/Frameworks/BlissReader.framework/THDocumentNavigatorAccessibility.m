@implementation THDocumentNavigatorAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THDocumentNavigator");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (unint64_t)thaxCurrentAbsolutePageIndex
{
  return (unint64_t)-[THDocumentNavigatorAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("currentAbsolutePageIndex"));
}

- (unint64_t)thaxAbsolutePageIndexForBeginningOfSection
{
  return (unint64_t)-[THDocumentNavigatorAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("absolutePageIndexForBeginningOfSection"));
}

- (THInteractiveCanvasControllerAccessibility)thaxInteractiveCanvasController
{
  void *v3;
  THInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THInteractiveCanvasControllerAccessibility);
  result = (THInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THDocumentNavigatorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("interactiveCanvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)p_jumpToStorageAnchor:(id)a3 pulse:(BOOL)a4
{
  void *v6;
  Class v7;
  Class v8;
  THPresentationTypeAccessibility *v9;
  id v10;
  _QWORD v11[10];
  char v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THDocumentNavigatorAccessibility;
  -[THDocumentNavigatorAccessibility p_jumpToStorageAnchor:pulse:](&v13, "p_jumpToStorageAnchor:pulse:", a3, a4);
  if (-[TSDCanvasViewAccessibility tsaxCanMoveAXFocusIntoContent](-[THTSDInteractiveCanvasControllerAccessibility thaxCanvasView](-[THDocumentNavigatorAccessibility thaxInteractiveCanvasController](self, "thaxInteractiveCanvasController"), "thaxCanvasView"), "tsaxCanMoveAXFocusIntoContent"))
  {
    v12 = 0;
    v6 = (void *)objc_opt_class(THModelContentNodeAccessibility);
    v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)objc_msgSend(a3, "contentNode"), 1, &v12);
    if (v12)
      abort();
    v8 = v7;
    v9 = -[THSectionControllerAccessibility thaxPresentationType](-[THDocumentNavigatorAccessibility _thaxSectionController](self, "_thaxSectionController"), "thaxPresentationType");
    v10 = -[objc_class thaxBodyStorageForPresentationType:](v8, "thaxBodyStorageForPresentationType:", v9);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_26B848;
    v11[3] = &unk_43C8A0;
    v11[4] = -[objc_class thaxNodeUniqueIDForInfo:](v8, "thaxNodeUniqueIDForInfo:", v10);
    v11[5] = a3;
    v11[6] = self;
    v11[7] = v10;
    v11[8] = v8;
    v11[9] = v9;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v11, 1.0);
  }
}

- (THSectionControllerAccessibility)_thaxSectionController
{
  void *v3;
  THSectionControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THSectionControllerAccessibility);
  result = (THSectionControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THDocumentNavigatorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("sectionController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
