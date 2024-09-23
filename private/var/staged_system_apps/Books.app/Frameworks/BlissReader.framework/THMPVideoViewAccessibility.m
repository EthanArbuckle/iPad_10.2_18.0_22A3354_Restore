@implementation THMPVideoViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("MPVideoView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

@end
