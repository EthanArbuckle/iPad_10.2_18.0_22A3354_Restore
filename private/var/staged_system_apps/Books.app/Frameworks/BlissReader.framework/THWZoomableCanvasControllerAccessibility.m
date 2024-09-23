@implementation THWZoomableCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWZoomableCanvasController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxDelegate
{
  return -[THWZoomableCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
}

@end
