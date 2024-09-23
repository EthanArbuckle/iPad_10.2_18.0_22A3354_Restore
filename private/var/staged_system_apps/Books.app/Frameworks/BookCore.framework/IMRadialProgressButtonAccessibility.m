@implementation IMRadialProgressButtonAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("IMRadialProgressButton");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return IMAXLocString(CFSTR("download.progress.label"));
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v2;
  objc_super v4;

  v2 = UIAccessibilityTraitUpdatesFrequently;
  v4.receiver = self;
  v4.super_class = (Class)IMRadialProgressButtonAccessibility;
  return -[IMRadialProgressButtonAccessibility accessibilityTraits](&v4, "accessibilityTraits") | v2;
}

- (id)accessibilityHint
{
  __CFString *v2;
  id v3;

  if (-[IMRadialProgressButtonAccessibility isSelected](self, "isSelected"))
    v2 = CFSTR("tap.to.resume.hint.iOS");
  else
    v2 = CFSTR("tap.to.resume.pause.iOS");
  v3 = IMAXLocString(v2);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  float v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButtonAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("superview")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMRadialProgressButtonAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_progress")));
    objc_msgSend(v4, "floatValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:](NSNumberFormatter, "imaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 0, v5));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
