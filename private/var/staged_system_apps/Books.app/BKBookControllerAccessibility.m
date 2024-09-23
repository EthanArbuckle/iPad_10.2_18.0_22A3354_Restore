@implementation BKBookControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKBookController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)scrubValueChanged:(id)a3
{
  id v3;
  Class v4;
  char isKindOfClass;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKBookControllerAccessibility;
  v3 = a3;
  -[BKBookControllerAccessibility scrubValueChanged:](&v8, "scrubValueChanged:", v3);
  v4 = NSClassFromString(CFSTR("BKScrubberControl"));
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) == 0)
  {
    if (IMAccessibilityShouldPerformValidationChecks(v6, v7))
      +[NSException raise:format:](NSException, "raise:format:", CFSTR("Accessibility"), CFSTR("sender is not a BKScrubber"), v8.receiver, v8.super_class);
  }
}

@end
