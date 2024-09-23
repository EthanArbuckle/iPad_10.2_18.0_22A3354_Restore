@implementation NSObject(UIAccessibilityAction)

- (void)setAccessibilityCustomActions:()UIAccessibilityAction
{
  objc_setAssociatedObject(a1, &AXCustomActionsIdentifier, a3, (void *)1);
}

- (id)accessibilityCustomActions
{
  return objc_getAssociatedObject(a1, &AXCustomActionsIdentifier);
}

- (uint64_t)accessibilityZoomInAtPoint:()UIAccessibilityAction
{
  return 0;
}

- (uint64_t)accessibilityZoomOutAtPoint:()UIAccessibilityAction
{
  return 0;
}

- (uint64_t)accessibilityScroll:()UIAccessibilityAction
{
  return 0;
}

- (uint64_t)accessibilityPerformEscape
{
  return 0;
}

- (uint64_t)accessibilityPerformMagicTap
{
  return 0;
}

- (uint64_t)accessibilityActivate
{
  if (accessibilityActivate_onceToken != -1)
    dispatch_once(&accessibilityActivate_onceToken, &__block_literal_global_301);
  return 0;
}

@end
