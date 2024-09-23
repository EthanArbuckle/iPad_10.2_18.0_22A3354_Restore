@implementation UIButton(Bridge)

+ (uint64_t)largeButton
{
  return objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 126);
}

@end
