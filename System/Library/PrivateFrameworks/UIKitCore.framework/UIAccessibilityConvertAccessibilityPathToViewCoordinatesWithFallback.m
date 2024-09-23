@implementation UIAccessibilityConvertAccessibilityPathToViewCoordinatesWithFallback

uint64_t __UIAccessibilityConvertAccessibilityPathToViewCoordinatesWithFallback_block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;

  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "window");
  objc_msgSend(v6, "convertPoint:fromWindow:", 0, a2, a3);
  return objc_msgSend(*(id *)(a1 + 32), "convertPoint:fromView:", v6);
}

@end
