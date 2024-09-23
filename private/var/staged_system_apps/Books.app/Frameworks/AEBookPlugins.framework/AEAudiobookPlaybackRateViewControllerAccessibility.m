@implementation AEAudiobookPlaybackRateViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AEAudiobookPlaybackRateViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (BOOL)accessibilityPerformEscape
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_A9BBC;
  v3[3] = &unk_1BEA38;
  v3[4] = self;
  if (__IMAccessibilityPerformSafeBlock(v3, a2))
    abort();
  return 1;
}

@end
