@implementation MSApplication

- (id)preferredContentSizeCategory
{
  id v2;
  NSString *v3;
  UIContentSizeCategory v4;
  NSString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSApplication;
  v2 = -[MSApplication preferredContentSizeCategory](&v7, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(v2);
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    v4 = UIContentSizeCategoryExtraExtraExtraLarge;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

@end
