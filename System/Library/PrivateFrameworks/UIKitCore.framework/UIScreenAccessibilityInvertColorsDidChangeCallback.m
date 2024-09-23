@implementation UIScreenAccessibilityInvertColorsDidChangeCallback

void ___UIScreenAccessibilityInvertColorsDidChangeCallback_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(*(id *)(a1 + 32), "_softwareDimmingWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateOverlayColor");

  objc_autoreleasePoolPop(v2);
}

@end
