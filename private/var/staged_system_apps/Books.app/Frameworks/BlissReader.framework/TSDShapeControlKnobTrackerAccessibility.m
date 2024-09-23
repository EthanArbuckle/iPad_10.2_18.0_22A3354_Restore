@implementation TSDShapeControlKnobTrackerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDShapeControlKnobTracker");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)p_updateHUDAtPoint:(CGPoint)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDShapeControlKnobTrackerAccessibility;
  -[TSDShapeControlKnobTrackerAccessibility p_updateHUDAtPoint:](&v4, "p_updateHUDAtPoint:", a3.x, a3.y);
  v3 = objc_msgSend(-[objc_class tsaxValueForKey:](NSClassFromString(CFSTR("TSDHUDViewController")), "tsaxValueForKey:", CFSTR("sharedHUDViewController")), "tsaxValueForKey:", CFSTR("mLastStringSet"));
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v3);
}

@end
