@implementation TSKAVPlayerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSKAVPlayerController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)tsaxIsPlaying
{
  return -[TSKAVPlayerControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isPlaying"));
}

@end
