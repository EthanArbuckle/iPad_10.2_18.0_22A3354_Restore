@implementation NSConcreteMutableAttributedStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSConcreteMutableAttributedString");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSConcreteMutableAttributedStringAccessibility)initWithAttributedString:(id)a3
{
  id v4;
  NSConcreteMutableAttributedStringAccessibility *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  v5 = -[NSConcreteMutableAttributedStringAccessibility initWithAttributedString:](&v9, sel_initWithAttributedString_, v4);
  if (v5)
  {
    objc_msgSend(v4, "_accessibilityAttributedLocalizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[NSConcreteMutableAttributedStringAccessibility _setAccessibilityAttributedLocalizedString:](v5, "_setAccessibilityAttributedLocalizedString:", v7);
  }

  return v5;
}

- (NSConcreteMutableAttributedStringAccessibility)initWithString:(id)a3
{
  id v4;
  NSConcreteMutableAttributedStringAccessibility *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  v5 = -[NSConcreteMutableAttributedStringAccessibility initWithString:](&v9, sel_initWithString_, v4);
  if (v5)
  {
    objc_msgSend(v4, "_accessibilityAttributedLocalizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[NSConcreteMutableAttributedStringAccessibility _setAccessibilityAttributedLocalizedString:](v5, "_setAccessibilityAttributedLocalizedString:", v7);
  }

  return v5;
}

- (NSConcreteMutableAttributedStringAccessibility)initWithString:(id)a3 attributes:(id)a4
{
  id v6;
  NSConcreteMutableAttributedStringAccessibility *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  v7 = -[NSConcreteMutableAttributedStringAccessibility initWithString:attributes:](&v11, sel_initWithString_attributes_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "_accessibilityAttributedLocalizedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    -[NSConcreteMutableAttributedStringAccessibility _setAccessibilityAttributedLocalizedString:](v7, "_setAccessibilityAttributedLocalizedString:", v9);
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  v4 = -[NSConcreteMutableAttributedStringAccessibility mutableCopyWithZone:](&v8, sel_mutableCopyWithZone_, a3);
  if (v4)
  {
    -[NSConcreteMutableAttributedStringAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v4, "_setAccessibilityAttributedLocalizedString:", v6);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  v4 = -[NSConcreteMutableAttributedStringAccessibility copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    -[NSConcreteMutableAttributedStringAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v4, "_setAccessibilityAttributedLocalizedString:", v6);
  }
  return v4;
}

- (id)string
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSConcreteMutableAttributedStringAccessibility;
  -[NSConcreteMutableAttributedStringAccessibility string](&v7, sel_string);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSConcreteMutableAttributedStringAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
    objc_msgSend(v3, "_setAccessibilityAttributedLocalizedString:", v5);

  return v3;
}

@end
