@implementation AEAudioNoHitPinningViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AEAudioNoHitPinningView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end
