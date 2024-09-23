@implementation CRLCanvasResizeKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLResizeKnobTracker");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLCanvasKnobTrackerAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLCanvasResizeKnobTrackerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)crlaxHUDDisplayString
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasResizeKnobTrackerAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (objc_class *)objc_opt_class(CRLResizeKnobTracker, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v10);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v10)
    abort();
  v7 = (void *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxHudLabelText"));
  return v8;
}

- (void)p_updateHUD
{
  objc_super v3;

  if (!-[CRLCanvasKnobTrackerAccessibility crlaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD](self, "crlaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD"))
  {
    v3.receiver = self;
    v3.super_class = (Class)CRLCanvasResizeKnobTrackerAccessibility;
    -[CRLCanvasResizeKnobTrackerAccessibility p_updateHUD](&v3, "p_updateHUD");
  }
}

@end
