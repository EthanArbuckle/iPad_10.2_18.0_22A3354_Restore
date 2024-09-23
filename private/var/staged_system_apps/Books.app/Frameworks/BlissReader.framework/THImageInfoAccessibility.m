@implementation THImageInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THImageInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxPopUpInfo
{
  return -[THImageInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("popUpInfo"));
}

@end
