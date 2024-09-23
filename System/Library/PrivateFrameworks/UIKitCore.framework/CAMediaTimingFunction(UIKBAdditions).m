@implementation CAMediaTimingFunction(UIKBAdditions)

+ (uint64_t)_kbTimingFunction
{
  return objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
}

@end
