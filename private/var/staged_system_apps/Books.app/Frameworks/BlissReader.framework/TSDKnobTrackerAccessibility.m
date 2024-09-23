@implementation TSDKnobTrackerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDKnobTracker");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_tsaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543852);
}

- (void)_tsaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543852, a3);
}

+ (id)tsaxKnobTrackerWithRep:(id)a3 knob:(id)a4
{
  void *v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_22ED00;
  v11 = sub_22ED10;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_22ED1C;
  v6[3] = &unk_43B9F0;
  v6[4] = a1;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (TSDKnobAccessibility)tsaxKnob
{
  void *v3;
  TSDKnobAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDKnobAccessibility);
  result = (TSDKnobAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDKnobTrackerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("knob")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (CGRect)tsaxCurrentBoundsForStandardKnobs
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDKnobTrackerAccessibility tsaxCGRectValueForKey:](self, "tsaxCGRectValueForKey:", CFSTR("currentBoundsForStandardKnobs"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)tsaxHUDDisplayString
{
  return 0;
}

- (void)tsaxPerformBlockWhilePreventingDisplayOfCurrentValueHUD:(id)a3
{
  TSDKnobTrackerAccessibility *v4;

  if (-[TSDKnobTrackerAccessibility _tsaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD](self, "_tsaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    v4 = self;
    -[TSDKnobTrackerAccessibility _tsaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:](self, "_tsaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:", 1);
    (*((void (**)(id))a3 + 2))(a3);
    -[TSDKnobTrackerAccessibility _tsaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:](self, "_tsaxSetIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD:", 0);

  }
}

@end
