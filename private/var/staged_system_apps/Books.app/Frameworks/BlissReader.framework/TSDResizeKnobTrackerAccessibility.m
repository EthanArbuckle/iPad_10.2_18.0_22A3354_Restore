@implementation TSDResizeKnobTrackerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDResizeKnobTracker");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDKnobTrackerAccessibility, a2);
}

- (id)tsaxHUDDisplayString
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDResizeKnobTrackerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("hudLabelText")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)p_updateHUD
{
  objc_super v3;

  if (!-[TSDKnobTrackerAccessibility tsaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD](self, "tsaxIsPerformingBlockWhilePreventingDisplayOfCurrentValueHUD"))
  {
    v3.receiver = self;
    v3.super_class = (Class)TSDResizeKnobTrackerAccessibility;
    -[TSDResizeKnobTrackerAccessibility p_updateHUD](&v3, "p_updateHUD");
  }
}

@end
