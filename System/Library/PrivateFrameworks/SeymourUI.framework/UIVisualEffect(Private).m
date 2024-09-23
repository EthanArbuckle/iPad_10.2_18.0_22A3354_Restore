@implementation UIVisualEffect(Private)

+ (uint64_t)sessionColorDark
{
  return objc_msgSend(MEMORY[0x24BEBD4C0], "sessionColorEffectDark");
}

+ (uint64_t)sessionColorLight
{
  return objc_msgSend(MEMORY[0x24BEBD4C0], "sessionColorEffectLight");
}

@end
