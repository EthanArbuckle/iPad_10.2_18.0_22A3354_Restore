@implementation NSObject(UIAccessibilityContainer)

- (void)setAccessibilityElements:()UIAccessibilityContainer
{
  objc_setAssociatedObject(a1, &AXAccessibilityElementsIdentifier, a3, (void *)1);
}

- (id)accessibilityElements
{
  return objc_getAssociatedObject(a1, &AXAccessibilityElementsIdentifier);
}

- (void)setAccessibilityContainerType:()UIAccessibilityContainer
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &AXContainerTypeIdentifier, v2, (void *)1);

}

- (uint64_t)accessibilityElementCount
{
  return 0;
}

- (uint64_t)accessibilityElementAtIndex:()UIAccessibilityContainer
{
  return 0;
}

- (uint64_t)indexOfAccessibilityElement:()UIAccessibilityContainer
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)automationElements
{
  return objc_getAssociatedObject(a1, &AXAutomationElementsIdentifier);
}

- (void)setAutomationElements:()UIAccessibilityContainer
{
  objc_setAssociatedObject(a1, &AXAutomationElementsIdentifier, a3, (void *)1);
}

- (id)storedAccessibilityContainerType
{
  return objc_getAssociatedObject(a1, &AXContainerTypeIdentifier);
}

- (uint64_t)accessibilityContainerType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "storedAccessibilityContainerType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

@end
