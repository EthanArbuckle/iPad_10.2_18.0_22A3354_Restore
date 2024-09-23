@implementation UIImage(Private)

+ (uint64_t)smm_systemImageNamed:()Private withConfiguration:
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:");
}

+ (uint64_t)smm_systemImageNamed:()Private
{
  return objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:");
}

@end
