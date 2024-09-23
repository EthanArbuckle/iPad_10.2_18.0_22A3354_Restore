@implementation NSConcreteAttributedStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSConcreteAttributedString");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSConcreteAttributedStringAccessibility)initWithString:(id)a3
{
  id v4;
  NSConcreteAttributedStringAccessibility *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteAttributedStringAccessibility;
  v5 = -[NSConcreteAttributedStringAccessibility initWithString:](&v9, sel_initWithString_, v4);
  if (v5)
  {
    objc_msgSend(v4, "_accessibilityAttributedLocalizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[NSConcreteAttributedStringAccessibility _setAccessibilityAttributedLocalizedString:](v5, "_setAccessibilityAttributedLocalizedString:", v7);
  }

  return v5;
}

- (NSConcreteAttributedStringAccessibility)initWithAttributedString:(id)a3
{
  id v4;
  NSConcreteAttributedStringAccessibility *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteAttributedStringAccessibility;
  v5 = -[NSConcreteAttributedStringAccessibility initWithAttributedString:](&v9, sel_initWithAttributedString_, v4);
  if (v5)
  {
    objc_msgSend(v4, "_accessibilityAttributedLocalizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[NSConcreteAttributedStringAccessibility _setAccessibilityAttributedLocalizedString:](v5, "_setAccessibilityAttributedLocalizedString:", v7);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSConcreteAttributedStringAccessibility;
  v5 = -[NSConcreteAttributedStringAccessibility copyWithZone:](&v10, sel_copyWithZone_);
  -[NSConcreteAttributedStringAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "_setAccessibilityAttributedLocalizedString:", v8);

  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSConcreteAttributedStringAccessibility;
  v5 = -[NSConcreteAttributedStringAccessibility mutableCopyWithZone:](&v10, sel_mutableCopyWithZone_);
  -[NSConcreteAttributedStringAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "_setAccessibilityAttributedLocalizedString:", v8);

  }
  return v5;
}

- (id)string
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSConcreteAttributedStringAccessibility;
  -[NSConcreteAttributedStringAccessibility string](&v7, sel_string);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSConcreteAttributedStringAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
    objc_msgSend(v3, "_setAccessibilityAttributedLocalizedString:", v5);

  return v3;
}

@end
