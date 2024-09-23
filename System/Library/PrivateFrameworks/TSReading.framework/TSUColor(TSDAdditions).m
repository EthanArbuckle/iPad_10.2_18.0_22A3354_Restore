@implementation TSUColor(TSDAdditions)

+ (uint64_t)highContrastBackgroundColorForPreset:()TSDAdditions
{
  return objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.5, 1.0);
}

@end
