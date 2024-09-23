@implementation NSStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSString");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSStringAccessibility)initWithString:(id)a3
{
  id v3;
  NSStringAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSStringAccessibility;
  v3 = a3;
  v4 = -[NSStringAccessibility initWithString:](&v6, sel_initWithString_, v3);
  AXApplyAttributedLocalizedStringToCopy(v3, v4);

  return v4;
}

- (id)lowercaseStringWithLocale:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSStringAccessibility;
  -[NSStringAccessibility lowercaseStringWithLocale:](&v6, sel_lowercaseStringWithLocale_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXApplyAttributedLocalizedStringToCopy(self, v4);
  return v4;
}

- (id)stringByReplacingOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSStringAccessibility;
  -[NSStringAccessibility stringByReplacingOccurrencesOfString:withString:options:range:](&v9, sel_stringByReplacingOccurrencesOfString_withString_options_range_, a3, a4, a5, a6.location, a6.length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXApplyAttributedLocalizedStringToCopy(self, v7);
  return v7;
}

- (id)uppercaseStringWithLocale:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSStringAccessibility;
  -[NSStringAccessibility uppercaseStringWithLocale:](&v6, sel_uppercaseStringWithLocale_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXApplyAttributedLocalizedStringToCopy(self, v4);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSStringAccessibility;
  v4 = -[NSStringAccessibility copyWithZone:](&v6, sel_copyWithZone_, a3);
  AXApplyAttributedLocalizedStringToCopy(self, v4);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSStringAccessibility;
  v4 = -[NSStringAccessibility mutableCopyWithZone:](&v6, sel_mutableCopyWithZone_, a3);
  AXApplyAttributedLocalizedStringToCopy(self, v4);
  return v4;
}

@end
