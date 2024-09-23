@implementation THWScrollableCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWScrollableCanvasController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxScrollView
{
  return -[THWScrollableCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("scrollView"));
}

- (id)thaxDelegate
{
  return -[THWScrollableCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return 1;
}

@end
