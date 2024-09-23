@implementation CRLCanvasKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCanvasKnobTracker");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLCanvasKnobTrackerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)_crlaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415858);
}

- (void)_crlaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415858, a3);
}

+ (id)crlaxKnobTrackerWithRep:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10040100C;
  v21 = sub_10040101C;
  v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100401024;
  v12[3] = &unk_10124EFC8;
  v15 = &v17;
  v16 = a1;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v12))
    abort();

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (CRLCanvasKnobAccessibility)crlaxKnob
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTrackerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "knob"));

  objc_opt_class(CRLCanvasKnobAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasKnobAccessibility *)v8;
}

- (CGRect)crlaxCurrentBoundsForStandardKnobs
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTrackerAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "currentBoundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)crlaxHUDDisplayString
{
  return 0;
}

- (BOOL)crlaxShouldAnnounceValueUponEndMovingKnob
{
  return 0;
}

- (void)crlaxPerformBlockWhilePreventingDisplayOfCurrentValueHUD:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[CRLCanvasKnobTrackerAccessibility _crlaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD](self, "_crlaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD"))
  {
    v4[2]();
  }
  else
  {
    -[CRLCanvasKnobTrackerAccessibility _crlaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:](self, "_crlaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:", 1);
    v4[2]();
    -[CRLCanvasKnobTrackerAccessibility _crlaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:](self, "_crlaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:", 0);
  }

}

- (void)crlaxAnnounceString:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    CRLAccessibilityPostAnnouncementNotification(0, v3);

}

- (void)endMovingKnob
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasKnobTrackerAccessibility;
  -[CRLCanvasKnobTrackerAccessibility endMovingKnob](&v5, "endMovingKnob");
  if (-[CRLCanvasKnobTrackerAccessibility crlaxShouldAnnounceValueUponEndMovingKnob](self, "crlaxShouldAnnounceValueUponEndMovingKnob"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTrackerAccessibility crlaxKnob](self, "crlaxKnob"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxValue"));
    -[CRLCanvasKnobTrackerAccessibility crlaxAnnounceString:](self, "crlaxAnnounceString:", v4);

  }
}

@end
