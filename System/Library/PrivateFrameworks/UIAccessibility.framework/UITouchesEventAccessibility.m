@implementation UITouchesEventAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITouchesEvent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTestStartsAtElement
{
  return objc_getAssociatedObject(self, &AXHitTestStartsAtElement);
}

- (void)_setAccessibilityHitTestStartsAtElement:(id)a3
{
  objc_setAssociatedObject(self, &AXHitTestStartsAtElement, a3, (void *)1);
}

- (void)_setAccessibilityAutomationHitTest:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = &unk_1E3E10928;
  else
    v3 = &unk_1E3E10940;
  objc_setAssociatedObject(self, &AXHitTestMode, v3, (void *)1);
}

- (BOOL)_accessibilityAutomationHitTest
{
  void *v2;
  BOOL v3;

  objc_getAssociatedObject(self, &AXHitTestMode);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longValue") == 2;

  return v3;
}

- (unsigned)_accessibilityHitTestType
{
  void *v2;
  unsigned __int16 v3;

  objc_getAssociatedObject(self, &AXHitTestMode);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longValue");

  return v3;
}

- (void)_setAccessibilityHitTestType:(unsigned __int16)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &AXHitTestMode, v4, (void *)1);

}

- (id)_accessibilityHitTestOptions
{
  return objc_getAssociatedObject(self, &__UITouchesEventAccessibility___accessibilityHitTestOptions);
}

- (void)_setAccessibilityHitTestOptions:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

@end
