@implementation UIAccessibilityElement(Private)

- (id)accessibilityDelegate
{
  void *v1;
  void *v2;

  objc_getAssociatedObject(a1, &AXDelegateKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setAccessibilityDelegate:()Private
{
  id v4;
  UIAccessibilityElementWeakDelegateContainer *value;

  v4 = a3;
  value = objc_alloc_init(UIAccessibilityElementWeakDelegateContainer);
  -[UIAccessibilityElementWeakDelegateContainer setDelegate:](value, "setDelegate:", v4);

  objc_setAssociatedObject(a1, &AXDelegateKey, value, (void *)1);
}

- (uint64_t)_accessibilityViewIsVisible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accessibilityParentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_accessibilityViewIsVisible");

  return v2;
}

- (void)setDelegate:()Private forAttribute:withSelector:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("UIAXDelegateSpecific"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
    objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:");
  }
  v9 = (void *)MEMORY[0x1E0C99D80];
  NSStringFromSelector(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v8, CFSTR("UIAXDelegate"), v10, CFSTR("selector"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v11, v12);

}

- (void)delegateSpecificsForAttribute:()Private delegate:selector:
{
  void *v8;
  void *v9;
  NSString *v10;
  id v11;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("UIAXDelegateSpecific"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", CFSTR("UIAXDelegate"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("selector"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    *a5 = NSSelectorFromString(v10);

  }
}

- (void)setBounds:()Private
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", v2, CFSTR("AXElementBounds"), 0);

}

- (double)bounds
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXElementBounds"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "rectValue");
    v4 = v3;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
  }

  return v4;
}

@end
