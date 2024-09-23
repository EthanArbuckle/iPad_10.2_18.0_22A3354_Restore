@implementation IMSkipBackButtonAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("IMSkipBackButton");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  void *v2;
  double v3;
  double v4;
  NSDateComponentsFormatter *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMSkipBackButtonAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_timeInterval")));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  if (v4 == 0.0)
    v4 = 30.0;
  v5 = objc_opt_new(NSDateComponentsFormatter);
  -[NSDateComponentsFormatter setUnitsStyle:](v5, "setUnitsStyle:", 3);
  -[NSDateComponentsFormatter setAllowedUnits:](v5, "setAllowedUnits:", 128);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromTimeInterval:](v5, "stringFromTimeInterval:", v4));
  v7 = IMAXLocString(CFSTR("skip.back %@"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6));

  return v9;
}

@end
