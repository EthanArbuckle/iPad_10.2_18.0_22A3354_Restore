@implementation TSAImageChooserViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSAImageChooserView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityElements
{
  return objc_msgSend(-[TSAImageChooserViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mImagesLayer")), "tsaxValueForKey:", CFSTR("sublayers"));
}

@end
