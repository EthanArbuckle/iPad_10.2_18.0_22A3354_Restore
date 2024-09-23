@implementation UIAccessibilityCustomRotor(AXPrivate)

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

  if (_accessibilityAXAttributedName_onceToken != -1)
    dispatch_once(&_accessibilityAXAttributedName_onceToken, &__block_literal_global_1);
  v2 = (objc_class *)objc_opt_class();
  v3 = sel_name;
  InstanceMethod = class_getInstanceMethod(v2, sel_name);
  v5 = (objc_class *)objc_opt_class();
  v6 = class_getInstanceMethod(v5, sel_attributedName);
  v7 = InstanceMethod != (Method)_accessibilityAXAttributedName_baseNameMethod
    && v6 == (Method)_accessibilityAXAttributedName_baseAttributedNameMethod;
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
