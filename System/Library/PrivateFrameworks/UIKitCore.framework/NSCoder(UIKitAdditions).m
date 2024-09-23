@implementation NSCoder(UIKitAdditions)

- (uint64_t)_ui_isInterprocess
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (uint64_t)_ui_decodeBoolForKey:()UIKitAdditions defaultValue:
{
  id v6;

  v6 = a3;
  if (objc_msgSend(a1, "containsValueForKey:", v6))
    a4 = objc_msgSend(a1, "decodeBoolForKey:", v6);

  return a4;
}

- (void)_ui_encodeTextAttributes:()UIKitAdditions forKey:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3498];
    v7 = a4;
    v8 = a3;
    v9 = (id)objc_msgSend([v6 alloc], "initWithString:attributes:", CFSTR(" "), v8);

    objc_msgSend(a1, "encodeObject:forKey:", v9, v7);
  }
}

- (id)_ui_decodeTextAttributesForKey:()UIKitAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributesAtIndex:effectiveRange:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
