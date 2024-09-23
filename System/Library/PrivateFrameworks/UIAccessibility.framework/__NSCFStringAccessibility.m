@implementation __NSCFStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("__NSCFString");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)appendString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)__NSCFStringAccessibility;
  v4 = a3;
  -[__NSCFStringAccessibility appendString:](&v9, sel_appendString_, v4);
  objc_msgSend(v4, "_accessibilityAttributedLocalizedString", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[__NSCFStringAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "appendAXAttributedString:", v5);
    }
    else
    {
      v8 = (void *)objc_msgSend(v5, "copy");
      -[__NSCFStringAccessibility _setAccessibilityAttributedLocalizedString:](self, "_setAccessibilityAttributedLocalizedString:", v8);

    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)__NSCFStringAccessibility;
  v5 = -[__NSCFStringAccessibility copyWithZone:](&v10, sel_copyWithZone_);
  -[__NSCFStringAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
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
  v10.super_class = (Class)__NSCFStringAccessibility;
  v5 = -[__NSCFStringAccessibility mutableCopyWithZone:](&v10, sel_mutableCopyWithZone_);
  -[__NSCFStringAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "_setAccessibilityAttributedLocalizedString:", v8);

  }
  return v5;
}

@end
