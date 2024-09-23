@implementation BKUIButtonAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)accessibilityLabel
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudDownloadButton"));

  if (v4)
  {
    v5 = sub_10009A13C(CFSTR("download.icloud.button"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BKUIButtonAccessibility;
    v7 = -[BKUIButtonAccessibility accessibilityLabel](&v9, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  return v6;
}

@end
