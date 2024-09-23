@implementation NSKeyedArchiverAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSKeyedArchiver");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NSKeyedArchiverAccessibility;
  v7 = a3;
  -[NSKeyedArchiverAccessibility encodeObject:forKey:](&v10, sel_encodeObject_forKey_, v7, v6);
  objc_msgSend(v7, "_accessibilityAttributedLocalizedString", v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("_delocalized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSKeyedArchiverAccessibility encodeObject:forKey:](self, "encodeObject:forKey:", v8, v9);

  }
}

- (id)decodeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSKeyedArchiverAccessibility;
  v4 = a3;
  -[NSKeyedArchiverAccessibility decodeObjectForKey:](&v9, sel_decodeObjectForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("_delocalized"), v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSKeyedArchiverAccessibility decodeObjectForKey:](self, "decodeObjectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "_setAccessibilityAttributedLocalizedString:", v7);

  return v5;
}

@end
