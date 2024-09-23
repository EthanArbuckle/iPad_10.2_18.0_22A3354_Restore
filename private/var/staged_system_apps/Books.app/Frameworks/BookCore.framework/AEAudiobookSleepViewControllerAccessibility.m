@implementation AEAudiobookSleepViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AEAudiobookSleepViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (BOOL)accessibilityPerformEscape
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (objc_class *)objc_opt_class(UIViewController);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v8)
    abort();
  v6 = v5;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  return 1;
}

@end
