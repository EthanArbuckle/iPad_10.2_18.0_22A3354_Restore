@implementation NSObject(UIAccessibility_Dragging)

- (void)setAccessibilityDragSourceDescriptors:()UIAccessibility_Dragging
{
  objc_setAssociatedObject(a1, &AXDragSourceDescriptorsIdentifier, a3, (void *)0x303);
}

- (id)accessibilityDragSourceDescriptors
{
  return objc_getAssociatedObject(a1, &AXDragSourceDescriptorsIdentifier);
}

- (void)setAccessibilityDropPointDescriptors:()UIAccessibility_Dragging
{
  objc_setAssociatedObject(a1, &AXDropPointDescriptorsIdentifier, a3, (void *)0x303);
}

- (id)accessibilityDropPointDescriptors
{
  return objc_getAssociatedObject(a1, &AXDropPointDescriptorsIdentifier);
}

@end
