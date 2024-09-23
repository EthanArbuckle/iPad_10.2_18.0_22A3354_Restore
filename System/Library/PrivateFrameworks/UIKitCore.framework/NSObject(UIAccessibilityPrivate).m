@implementation NSObject(UIAccessibilityPrivate)

- (void)accessibilitySetIdentification:()UIAccessibilityPrivate
{
  objc_setAssociatedObject(a1, &AXIdentificationIdentifier, a3, (void *)3);
}

+ (uint64_t)__accessibilityGuidedAccessStateEnabled
{
  return 0;
}

- (id)accessibilityIdentification
{
  return objc_getAssociatedObject(a1, &AXIdentificationIdentifier);
}

+ (uint64_t)__accessibilityGuidedAccessRestrictionStateForIdentifier:()UIAccessibilityPrivate
{
  return 0;
}

+ (void)__accessibilityRequestGuidedAccessSession:()UIAccessibilityPrivate completion:
{
  _QWORD block[5];

  if (a4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__NSObject_UIAccessibilityPrivate____accessibilityRequestGuidedAccessSession_completion___block_invoke;
    block[3] = &unk_1E16B16F0;
    block[4] = a4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

@end
