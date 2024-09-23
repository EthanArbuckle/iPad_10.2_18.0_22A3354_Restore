@implementation UIAccessibilityConvertPathToScreenCoordinatesWithFallback

uint64_t __UIAccessibilityConvertPathToScreenCoordinatesWithFallback_block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  uint64_t result;

  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "window");
  result = objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", v6, a2, a3);
  if (v6)
    return objc_msgSend(v6, "convertPoint:toWindow:", 0);
  return result;
}

@end
