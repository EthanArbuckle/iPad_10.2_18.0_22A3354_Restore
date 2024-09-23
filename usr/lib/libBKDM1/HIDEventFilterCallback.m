@implementation HIDEventFilterCallback

void ____HIDEventFilterCallback_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BD27898]();
  objc_msgSend(*(id *)(a1 + 32), "homeButtonPressed");
  objc_autoreleasePoolPop(v2);
}

@end
