@implementation UIAccessibilityCustomAction(Private)

- (id)_shortName
{
  return objc_getAssociatedObject(a1, &__UIAccessibilityCustomAction___shortName);
}

- (uint64_t)_setShortName:()Private
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)_accessibilityInternalCustomActionIdentifier
{
  return objc_getAssociatedObject(a1, &__UIAccessibilityCustomAction___accessibilityInternalCustomActionIdentifier);
}

- (uint64_t)_accessibilitySetInternalCustomActionIdentifier:()Private
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)shouldSuppressActionHint
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)setShouldSuppressActionHint:()Private
{
  return __UIAccessibilitySetAssociatedBool();
}

- (uint64_t)ignoreWhenVoiceOverTouches
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)setIgnoreWhenVoiceOverTouches:()Private
{
  return __UIAccessibilitySetAssociatedBool();
}

- (id)localizedActionRotorCategory
{
  return objc_getAssociatedObject(a1, &__UIAccessibilityCustomAction__localizedActionRotorCategory);
}

- (uint64_t)setLocalizedActionRotorCategory:()Private
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)sortPriority
{
  return __UIAccessibilityGetAssociatedUnsignedInteger();
}

- (uint64_t)setSortPriority:()Private
{
  return __UIAccessibilitySetAssociatedUnsignedInteger();
}

- (uint64_t)activationPoint
{
  return __UIAccessibilityGetAssociatedCGPoint();
}

- (uint64_t)setActivationPoint:()Private
{
  return __UIAccessibilitySetAssociatedCGPoint();
}

- (uint64_t)shouldPersistActionMenu
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)setShouldPersistActionMenu:()Private
{
  return __UIAccessibilitySetAssociatedBool();
}

- (id)_accessibilityCustomActionIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_accessibilityInternalCustomActionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "_accessibilityInternalCustomActionIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "_accessibilityAXAttributedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector((SEL)objc_msgSend(a1, "selector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Name:%@\nTarget:%p\nSelector:%@"), v5, v6, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (uint64_t)_accessibilityMatchesCustomActionIdentifier:()Private
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_accessibilityCustomActionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (id)_accessibilityAXAttributedName
{
  objc_class *v2;
  char *v3;
  Method InstanceMethod;
  objc_class *v5;
  Method v6;
  BOOL v7;
  char *v8;
  void (*v9)(void *, char *);
  void *v10;
  void (*v11)(void *, char *);
  uint64_t v12;

  if (_accessibilityAXAttributedName_onceToken_0 != -1)
    dispatch_once(&_accessibilityAXAttributedName_onceToken_0, &__block_literal_global_2);
  v2 = (objc_class *)objc_opt_class();
  v3 = sel_name;
  InstanceMethod = class_getInstanceMethod(v2, sel_name);
  v5 = (objc_class *)objc_opt_class();
  v6 = class_getInstanceMethod(v5, sel_attributedName);
  v7 = InstanceMethod != (Method)_accessibilityAXAttributedName_baseNameMethod_0
    && v6 == (Method)_accessibilityAXAttributedName_baseAttributedNameMethod_0;
  if (v7)
    v8 = sel_name;
  else
    v8 = sel_attributedName;
  if (v7)
    v3 = sel_attributedName;
  v9 = (void (*)(void *, char *))objc_msgSend(a1, "impOrNullForSelector:", v8);
  if (!v9 || (v9(a1, v8), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = (void (*)(void *, char *))objc_msgSend(a1, "impOrNullForSelector:", v3);
    if (v11)
    {
      v11(a1, v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v10);

    v10 = (void *)v12;
  }
  return v10;
}

@end
