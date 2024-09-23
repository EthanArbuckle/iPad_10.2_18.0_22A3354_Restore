@implementation BKUIPickerComponentAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UIAccessibilityPickerComponent");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (NSString)bkaxAccessibilityValueOverride
{
  return (NSString *)__IMAccessibilityGetAssociatedObject(self, &unk_1009F4E00);
}

- (void)setBKAXAccessibilityValueOverride:(id)a3
{
  __IMAccessibilitySetAssociatedObject(self, &unk_1009F4E00, a3);
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = AXRequestingClient(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKUIPickerComponentAccessibility bkaxAccessibilityValueOverride](self, "bkaxAccessibilityValueOverride"));

  if (!v4 || v3 == 7 || v3 == 2)
  {
    v8.receiver = self;
    v8.super_class = (Class)BKUIPickerComponentAccessibility;
    v6 = -[BKUIPickerComponentAccessibility accessibilityValue](&v8, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKUIPickerComponentAccessibility bkaxAccessibilityValueOverride](self, "bkaxAccessibilityValueOverride"));
  }
  return v5;
}

- (void)setAccessibilityValue:(id)a3
{
  -[BKUIPickerComponentAccessibility setBKAXAccessibilityValueOverride:](self, "setBKAXAccessibilityValueOverride:", a3);
}

@end
