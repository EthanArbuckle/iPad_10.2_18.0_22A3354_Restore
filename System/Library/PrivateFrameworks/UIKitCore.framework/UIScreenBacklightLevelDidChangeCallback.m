@implementation UIScreenBacklightLevelDidChangeCallback

void ___UIScreenBacklightLevelDidChangeCallback_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(*(id *)(a1 + 32), "_postBrightnessDidChangeNotificationIfAppropriate");
  objc_autoreleasePoolPop(v2);
}

@end
