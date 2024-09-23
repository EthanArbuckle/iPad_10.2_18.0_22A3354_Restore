@implementation NSObject(UIAccessibilityCustomRotor)

- (void)setAccessibilityCustomRotors:()UIAccessibilityCustomRotor
{
  objc_setAssociatedObject(a1, &AXCustomRotors, a3, (void *)1);
}

- (id)accessibilityCustomRotors
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 40);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  else
    objc_getAssociatedObject(a1, &AXCustomRotors);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)setAccessibilityCustomRotorsBlock:()UIAccessibilityCustomRotor
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 40);
}

@end
