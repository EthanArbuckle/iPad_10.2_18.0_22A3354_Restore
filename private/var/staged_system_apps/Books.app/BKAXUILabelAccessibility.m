@implementation BKAXUILabelAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UILabel");
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAXUILabelAccessibility imaxIdentification](self, "imaxIdentification"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PageCountLabel"));

  if (v4)
  {
    v5 = sub_10009A13C(CFSTR("page.number.label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BKAXUILabelAccessibility;
    v7 = -[BKAXUILabelAccessibility accessibilityLabel](&v9, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  unsigned int v4;
  char **v5;
  BKAXUILabelAccessibility **v6;
  id v7;
  BKAXUILabelAccessibility *v9;
  BKAXUILabelAccessibility *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAXUILabelAccessibility imaxIdentification](self, "imaxIdentification"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PageCountLabel"));

  if (v4)
  {
    v10 = self;
    v5 = &selRef_accessibilityLabel;
    v6 = &v10;
  }
  else
  {
    v9 = self;
    v5 = &selRef_accessibilityValue;
    v6 = &v9;
  }
  v6[1] = (BKAXUILabelAccessibility *)BKAXUILabelAccessibility;
  v7 = objc_msgSendSuper2((objc_super *)v6, *v5, v9);
  return (id)objc_claimAutoreleasedReturnValue(v7);
}

@end
